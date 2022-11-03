#!/usr/bin/env bash

echo "Ingrese el nombre de tu nuevo proyecto: "; read argumento

pnpm create vite --template react $argumento

cd "$argumento"

pnpm install

pnpm install tailwindcss postcss autoprefixer

npx tailwindcss init -p

pnpm install @chakra-ui/react @emotion/react @emotion/styled framer-motion @chakra-ui/icons

rm -rf ./src/main.jsx

echo 'import { ChakraProvider } from "@chakra-ui/react";' >> ./src/main.jsx
echo 'import React from "react";' >> ./src/main.jsx
echo 'import ReactDOM from "react-dom/client";' >> ./src/main.jsx
echo 'import App from "./App";' >> ./src/main.jsx
echo 'import "./index.css";' >> ./src/main.jsx
echo 'ReactDOM.createRoot(document.getElementById("root")).render(' >> ./src/main.jsx
echo   '<React.StrictMode>' >> ./src/main.jsx
echo     '<ChakraProvider>' >> ./src/main.jsx
echo       '<App />' >> ./src/main.jsx
echo     '</ChakraProvider>' >> ./src/main.jsx
echo   '</React.StrictMode>' >> ./src/main.jsx
echo ');' >> ./src/main.jsx


rm -rf tailwind.config.cjs

echo "/** @type {import('tailwindcss').Config} */" >> tailwind.config.cjs

echo "module.exports = {" >> tailwind.config.cjs

echo "  content: [" >> tailwind.config.cjs

echo '    "./index.html",' >> tailwind.config.cjs

echo '    "./src/**/*.{js,ts,jsx,tsx}",' >> tailwind.config.cjs

echo "  ]," >> tailwind.config.cjs

echo "  theme: {" >> tailwind.config.cjs

echo "    extend: {}," >> tailwind.config.cjs

echo "  }," >> tailwind.config.cjs

echo "  plugins: []," >> tailwind.config.cjs

echo "}" >> tailwind.config.cjs

rm -rf src/index.css

echo "@tailwind base;" >> src/index.css
echo "@tailwind components;" >> src/index.css
echo "@tailwind utilities;" >> src/index.css

code .

exit
