# localstack-docker

## Lambda関数の作成
- `make clean`と`make zip`はLinux環境、もしくはWSL2等を用いて行うこと。
  - Windowsに初期で存在しないコマンドを含んでいるため。
- localstack上にLambda関数作成後の実行例は下記コマンドを参照。
  ```powershell
  aws --endpoint-url=http://localhost:4566 lambda invoke --function-name hello_lambda --cli-binary-format raw-in-base64-out ./result/response.json
  ```

## API GatwewayとLambda関数の連携
- 実行例は下記コマンドを参照。

  ```powershell
  aws apigateway create-rest-api --name 'My Rest API Gateway' --endpoint-url=http://localhost:4566

  aws apigateway get-resources --rest-api-id XXXXXX --endpoint-url=http://localhost:4566

  aws apigateway create-resource --rest-api-id XXXXXX --parent-id YYYYY --path-part hogehoge --endpoint-url=http://localhost:4566

  aws apigateway put-method --rest-api-id XXXXXX --resource-id ZZZZZ --http-method ANY --authorization-type "NONE" --endpoint-url=http://localhost:4566

  aws apigateway put-integration --rest-api-id XXXXXX --resource-id ZZZZZ --http-method ANY --type AWS_PROXY --integration-http-method POST --uri arn:aws:apigateway:us-east-1:lambda:path/2015-03-31/functions/arn:aws:lambda:ap-northeast-1:000000000000:function:hello_lambda/invocations --endpoint-url=http://localhost:4566

  aws apigateway create-deployment --rest-api-id XXXXXX --stage-name test --endpoint-url=http://localhost:4566

  curl http://localhost:4566/restapis/XXXXXX/test/_user_request_/hogehge
  ```