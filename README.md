# github-script

## script一覧

### リポジトリの設定の一括変更

```
bash ./bin/settings_change.sh <実行スクリプト.sh> <対象リポジトリ.json>

bash ./bin/settings_change.sh repo_setting/enable_delete_branch_on_merge.sh config/repository_list.json
```

対象リポジトリ.jsonは対象とするリポジトリの配列を想定

```
[
  "owner/repoA",
  "owner/repoB"
]
```
