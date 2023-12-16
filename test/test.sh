#!/bin/bash

cd frontend/
htmlproofer .
npx percy snapshot .
