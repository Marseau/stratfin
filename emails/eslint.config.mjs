import globals from "globals";
import pluginJs from "@eslint/js";
import tseslint from "@typescript-eslint/eslint-plugin";
import tsParser from "@typescript-eslint/parser";
import pluginReact from "eslint-plugin-react";

export default [
  {
    // Arquivos que serão verificados
    files: ["**/*.{js,mjs,cjs,ts,jsx,tsx}"],

    // Configurações de ambiente
    languageOptions: {
      globals: globals.browser,
      parserOptions: {
        ecmaVersion: 12,   // ECMAScript 2021
        sourceType: "module",  // Suporte para ESModules
        project: './tsconfig.json',  // (se necessário, para projetos TypeScript)
      },
      parser: tsParser,  // Usar o parser TypeScript do ESLint
    },

    // Ambiente: Habilitar Node.js e CommonJS
    env: {
      node: true,
      es2021: true,
      commonjs: true,  // Permitir CommonJS
    },

    // Estender configurações recomendadas
    extends: [
      "eslint:recommended",
      "plugin:@typescript-eslint/recommended",
      "plugin:react/recommended",  // Para React
    ],

    // Regras específicas para ajustar o comportamento do ESLint
    rules: {
      "@typescript-eslint/no-require-imports": "off",  // Permitir require()
      "no-undef": "off",  // Remover erro de 'require', 'exports' e 'module' não definidos
    },
  },
];
