#!/bin/bash

cp -r ../html/. emilan-website-testing/content
cd emilan-website-testing
hugo
htmlproofer --extension .html ./public
npx percy snapshot ./public
