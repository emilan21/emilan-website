#!/bin/bash

hugo
htmlproofer --extension .html ./public
npx percy snapshot ./public
