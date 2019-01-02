cfn-create-or-update:
	# Used to allow idempotent CFN creation/update
	npm install cfn-create-or-update

deploy: cfn-create-or-update
	#aws cloudformation create-stack  # switched to cfn-create-or-update to allow idempotent
	npx cfn-create-or-update \
		--region ap-southeast-2 \
		--stack-name test-tf-codebuild \
		--template-body file://cfn/pipeline.yml \
		--parameters \
			ParameterKey=GithubOauthToken,ParameterValue=98594fb96ff68cc1fb5950ed8fcc9dc288793f2b \
			ParameterKey=GithubRepoOwner,ParameterValue=rdkls \
			ParameterKey=GithubRepoName,ParameterValue=terraform-codebuild-demo \
			ParameterKey=GithubRepoBranch,ParameterValue=master \
		--capabilities CAPABILITY_IAM

