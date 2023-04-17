#!/bin/bash

# Required
# GITHUB_TOKEN: admin権限必須

if [ -z "$GITHUB_TOKEN" ]; then
  echo "Error: Environment variable GITHUB_TOKEN is not set"
  exit 1
fi

# 引数からOWNERとREPO_NAMEを取得
if [ "$#" -ne 1 ]; then
  echo "Error: Invalid number of arguments. Expected 2, got $#"
  exit 1
fi

IFS='/' read -ra parts <<< "$1"
owner="${parts[0]}"
repo="${parts[1]}"

# リポジトリの設定を変更
response=$(
  curl -s -o /dev/null -w %{http_code} -X PATCH \
  -H "Authorization: token $GITHUB_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"delete_branch_on_merge": true}' \
  "https://api.github.com/repos/${owner}/${repo}"
)

if [ $response -ne 200 ]; then
  echo "Error: HTTP status code is $response"
  exit 1
fi
