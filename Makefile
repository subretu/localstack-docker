zip:
	poetry export -f requirements.txt --output requirements.txt
	poetry run pip install -r requirements.txt --target ./deploy-packages
	cd ./deploy-packages && zip -r ../src/lambda_function.zip *
	zip -g ./src/lambda_function.zip lambda_function.py

zip2:
	cp ./lambda_function.py ./upload
	cd ./upload && zip -r ./deployment-package.zip lambda_function.py

create:
	aws lambda create-function \
	--endpoint-url=http://localhost:4566 \
	--function-name hello_lambda \
	--runtime python3.8 \
	--zip-file fileb://C:\Workspace\github\localstack-docker\upload\deployment-package.zip \
	--role test-role \
	--handler lambda_function.lambda_handler

list:
	aws lambda list-functions \
	--endpoint-url=http://localhost:4566

delete:
	aws lambda delete-function \
	--endpoint-url=http://localhost:4566 \
	--function-name hello_lambda