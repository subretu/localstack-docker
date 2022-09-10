# localstack-docker

## 注意事項
- `make clean`と`make zip`はLinux環境、もしくはWSL2等を用いて行うこと。
  - Windowsに初期で存在しないコマンドを含んでいるため。
- localstack上にLambda関数作成後の実行例。
  ```powershell
  aws --endpoint-url=http://localhost:4566 lambda invoke --function-name hello_lambda --cli-binary-format raw-in-base64-out ./result/response.json
  ```