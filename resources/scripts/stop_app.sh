#!/bin/bash
set -e
pkill -f node || true
pkill -f "npm start" || true