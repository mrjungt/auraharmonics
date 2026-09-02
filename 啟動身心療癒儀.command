#!/bin/bash
DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$DIR"

# 如果 Port 8000 沒被佔用，就自動啟動 Ruby 伺服器
if ! lsof -i :8000 >/dev/null 2>&1; then
    ruby server.rb >/dev/null 2>&1 &
    sleep 1
fi

# 自動用預設瀏覽器打開首頁
open "http://localhost:8000/index.html"

# 自動關閉啟動的終端機視窗
osascript -e 'tell application "Terminal" to close first window' &
exit 0
