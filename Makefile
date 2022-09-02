zip:
	poetry export -f requirements.txt --output requirements.txt
	poetry run pip install -r requirements.txt --target ./deploy-packages
	cd ./deploy-packages && zip -r ../src/lambda.zip *
	zip -g ./src/lambda.zip lambda_function.py