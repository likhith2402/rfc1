#!/bin/bash
# Render build script for user-web

echo "Installing dependencies..."
npm install

echo "Building user-web application..."
npm run build

echo "Build completed successfully!" 