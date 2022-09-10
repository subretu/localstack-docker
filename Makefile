clean:
	find ./tmp/ -type f | grep -v -E '.gitignore' | xargs rm -rf ./tmp/*
	find ./upload/package/ -type f | grep -v -E '.gitignore' | xargs rm -rf ./upload/package/*

zip:
	cd ./tmp && git clone https://github.com/jkehler/awslambda-psycopg2.git
	mv ./tmp/awslambda-psycopg2/psycopg2-3.8 ./upload/package/psycopg2
	cd ./upload/package/ && zip -r ../my-deployment-package.zip .
	cp ./lambda_function.py ./upload
	cd ./upload && zip -r ./my-deployment-package.zip lambda_function.py\

create:
	aws lambda create-function \
	--endpoint-url=http://localhost:4566 \
	--function-name hello_lambda \
	--runtime python3.8 \
	--zip-file fileb://C:\Workspace\github\localstack-docker\upload\my-deployment-package.zip \
	--role test-role \
	--handler lambda_function.lambda_handler

list:
	aws lambda list-functions \
	--endpoint-url=http://localhost:4566

delete:
	aws lambda delete-function \
	--endpoint-url=http://localhost:4566 \
	--function-name hello_lambda