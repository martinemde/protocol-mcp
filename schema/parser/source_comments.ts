import * as ts from 'typescript';

export function extractWithComment(fileNames: string[], options: ts.CompilerOptions): any[] {
  const program = ts.createProgram(fileNames, options);
  const checker: ts.TypeChecker = program.getTypeChecker();
  const results: any[] = [];

  for (const sourceFile of program.getSourceFiles()) {
    if (!sourceFile.isDeclarationFile) {
      ts.forEachChild(sourceFile, visit);
    }
  }

  function visit(node: ts.Node) {
    // Visit children first
    const count = node.getChildCount();
    if (count > 0) {
      ts.forEachChild(node, visit);
    }

    // Check for type aliases
    if (ts.isTypeAliasDeclaration(node) && node.name) {
      const symbol = checker.getSymbolAtLocation(node.name);
      if (symbol) {
        const result = serializeSymbol(symbol, node);
        if (result) {
          results.push(result);
        }
      }
    }

    // Check for interfaces
    if (ts.isInterfaceDeclaration(node) && node.name) {
      const symbol = checker.getSymbolAtLocation(node.name);
      if (symbol) {
        const result = serializeSymbol(symbol, node);
        if (result) {
          results.push(result);
        }
      }
    }

    // Check for property assignments (keeping the original functionality)
    if (ts.isPropertyAssignment(node) && node.name) {
      const symbol = checker.getSymbolAtLocation(node.name);
      if (symbol) {
        const result = serializeSymbol(symbol, node);
        if (result) {
          results.push(result);
        }
      }
    }
  }

  function serializeSymbol(symbol: ts.Symbol, node: ts.Node) {
    const name = symbol.getName();
    const comment = ts.displayPartsToString(symbol.getDocumentationComment(checker));
    const type = checker.typeToString(
      checker.getTypeOfSymbolAtLocation(symbol, symbol.valueDeclaration!)
    );

    // Get the full text of the node
    const nodeText = node.getText();

    // Get a simplified AST structure
    const astStructure = getSimplifiedNodeStructure(node);

    return {
      name,
      comment,
      type,
      nodeText,
      astStructure
    };
  }

  function getSimplifiedNodeStructure(node: ts.Node): any {
    // For type aliases
    if (ts.isTypeAliasDeclaration(node)) {
      return {
        kind: 'TypeAlias',
        name: node.name.text,
        type: node.type.getText(),
        typeNode: processTypeNode(node.type)
      };
    }

    // For interfaces
    if (ts.isInterfaceDeclaration(node)) {
      return {
        kind: 'Interface',
        name: node.name.text,
        extends: node.heritageClauses ?
          node.heritageClauses
            .filter(clause => clause.token === ts.SyntaxKind.ExtendsKeyword)
            .flatMap(clause => clause.types.map(type => type.expression.getText())) :
          [],
        members: node.members.map(member => processInterfaceMember(member)).filter(Boolean)
      };
    }

    // For property assignments
    if (ts.isPropertyAssignment(node) && node.name) {
      return {
        kind: 'Property',
        name: node.name.getText(),
        value: node.initializer ? node.initializer.getText() : undefined,
        typeNode: node.initializer ? processTypeNode(node.initializer) : undefined
      };
    }

    // Default case
    return {
      kind: ts.SyntaxKind[node.kind]
    };
  }

  function processInterfaceMember(member: ts.TypeElement): any {
    if (ts.isPropertySignature(member) && member.name) {
      const name = member.name.getText();
      const type = member.type ? member.type.getText() : 'any';
      const optional = !!member.questionToken;

      // Get the comment and tags object for this member
      const { comment, comment_tags } = extractJSDocComment(member);

      return {
        name,
        type,
        optional,
        comment,
        comment_tags,
        typeNode: member.type ? processTypeNode(member.type) : undefined
      };
    }

    if (ts.isMethodSignature(member) && member.name) {
      const name = member.name.getText();
      const returnType = member.type ? member.type.getText() : 'any';
      const optional = !!member.questionToken;

      // Get the comment and tags object for this member
      const { comment, comment_tags } = extractJSDocComment(member);

      return {
        kind: 'Method',
        name,
        returnType,
        optional,
        comment,
        comment_tags,
        parameters: member.parameters.map(param => ({
          name: param.name.getText(),
          type: param.type ? param.type.getText() : 'any',
          optional: !!param.questionToken
        }))
      };
    }

    return null;
  }

  function processTypeNode(node: ts.Node): any {
    if (ts.isTypeLiteralNode(node)) {
      return {
        kind: 'TypeLiteral',
        members: node.members.map(member => {
          if (ts.isPropertySignature(member) && member.name) {
            const name = member.name.getText();
            const type = member.type ? member.type.getText() : 'any';
            const optional = !!member.questionToken;
            const { comment, comment_tags } = extractJSDocComment(member);

            return {
              name,
              type,
              optional,
              comment,
              comment_tags,
              typeNode: member.type ? processTypeNode(member.type) : undefined
            };
          }
          return null;
        }).filter(Boolean)
      };
    }

    if (ts.isUnionTypeNode(node)) {
      return {
        kind: 'UnionType',
        types: node.types.map(type => processTypeNode(type))
      };
    }

    if (ts.isIntersectionTypeNode(node)) {
      return {
        kind: 'IntersectionType',
        types: node.types.map(type => processTypeNode(type))
      };
    }

    if (ts.isArrayTypeNode(node)) {
      return {
        kind: 'ArrayType',
        elementType: processTypeNode(node.elementType)
      };
    }

    if (ts.isTypeReferenceNode(node)) {
      return {
        kind: 'TypeReference',
        typeName: node.typeName.getText(),
        typeArguments: node.typeArguments ? node.typeArguments.map(arg => processTypeNode(arg)) : []
      };
    }

    if (ts.isLiteralTypeNode(node)) {
      return {
        kind: 'LiteralType',
        literal: node.literal.getText()
      };
    }

    if (ts.isIndexSignatureDeclaration(node)) {
      return {
        kind: 'IndexSignature',
        keyType: node.parameters[0].type ? node.parameters[0].type.getText() : 'any',
        valueType: node.type ? node.type.getText() : 'any'
      };
    }

    // For simple types (string, number, etc.)
    return {
      kind: 'SimpleType',
      text: node.getText()
    };
  }

  // Helper function to extract JSDoc comments from a node
  function extractJSDocComment(node: ts.Node): { comment: string, comment_tags: { tag: string, comment: string }[] } {
    if (ts.isPropertySignature(node) && node.name) {
      const jsDocs = ts.getJSDocCommentsAndTags(node)
        .filter(ts.isJSDoc); // just doc blocks, not tags

      if (jsDocs.length > 0) {
        const mainDoc = jsDocs[0]; // usually only one
        const comment = mainDoc.comment?.toString() ?? '';

        const comment_tags = mainDoc.tags?.map(tag => ({
          tag: tag.tagName.escapedText.toString(),
          comment: tag.comment?.toString() ?? ''
        })) ?? [];

        return { comment, comment_tags }
      }
    }

    return { comment: '', comment_tags: [] };
  }

  return results;
}
