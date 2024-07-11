#!/usr/bin/env bash

set -eu

cd $(dirname $0)/..

server=$1
username=$2
password=$3
database=$4

mkdir -p exports

# テーブル一覧を取得する SQL クエリ
table_query="SET NOCOUNT ON; SELECT QUOTENAME(TABLE_SCHEMA) + '.' + QUOTENAME(TABLE_NAME) AS TableName FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE' AND TABLE_NAME NOT IN ('DatabaseLog', 'sysdiagrams', 'AdventureWorksDWBuildVersion');"

# sqlcmd で SQL クエリを実行し、テーブル一覧を取得
table_names=$(sqlcmd -S "$server" -d "$database" -U "$username" -P "$password" -Q "$table_query" -h -1 -y 0 | tr -d '\r')

# 各テーブルに対して JSON 出力
for table_name in $table_names; do
  echo $table_name
  query="SET NOCOUNT ON; SELECT * FROM $table_name FOR JSON PATH, INCLUDE_NULL_VALUES;"
  result=$(sqlcmd -S "$server" -d "$database" -U "$username" -P "$password" -Q "$query" -W -h -1 -y 0 | tr -d '\r\n')

  # JSON 出力を整形する場合 (jq コマンドを使用)
  file_name=$(echo $table_name | sed -e 's/\[.*\]\.//g' | tr -d '[]')
  echo "$result" | jq -c '.[]' >"exports/$file_name.jsonl"
done
