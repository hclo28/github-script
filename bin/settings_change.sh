#!/bin/bash

set -e

repo_root=$(git rev-parse --show-toplevel)

# 引数からOWNERとREPO_NAMEを取得
if [ "$#" -ne 2 ]; then
  echo "Error: Invalid number of arguments. Expected 2, got $#"
  exit 1
fi
script=$1
repo_list_path=$2
repositories=($(cat ${repo_root}/${repo_list_path} | jq -r '.[]'))


# 各リポジトリの設定を変更
for repository in "${repositories[@]}"
do
  echo "exec ${repo_root}/${script} ${repository}"
  bash ${repo_root}/${script} ${repository}
done

