import * as ts from 'typescript';
import { extractWithComment } from './source_comments';
import * as fs from 'fs';

// Get file path from command line arguments
const filePath = process.argv[2];

if (!filePath) {
  process.stderr.write('Error: Please provide a TypeScript file path as an argument\n');
  process.stderr.write('Usage: npm run extract -- <file-path>\n');
  process.exit(1);
}

// Example usage
const fileNames = [filePath]; // Use the file path from command line arguments
const options = {
  target: ts.ScriptTarget.ES2020,
  module: ts.ModuleKind.Node16,
  esModuleInterop: true,
  allowJs: true,
  checkJs: true,
  declaration: true,
  sourceMap: true,
  outDir: './dist',
  strict: true,
  noImplicitAny: true,
  strictNullChecks: true,
  strictFunctionTypes: true,
  strictBindCallApply: true,
  strictPropertyInitialization: true,
  noImplicitThis: true,
  alwaysStrict: true,
  noUnusedLocals: true,
  noUnusedParameters: true,
  noImplicitReturns: true,
  noFallthroughCasesInSwitch: true,
  moduleResolution: ts.ModuleResolutionKind.Node16,
  baseUrl: './',
  paths: {
    '*': ['node_modules/*']
  }
};

// Call the function and get results
const results = extractWithComment(fileNames, options);

// Check if output file is specified
const outputFile = process.argv[3];
if (outputFile) {
  // Write to file if output file is specified
  fs.writeFileSync(outputFile, JSON.stringify(results, null, 2));
} else {
  // Output to stdout (no console.log prefix)
  process.stdout.write(JSON.stringify(results, null, 2));
}
