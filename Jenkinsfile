pipeline{
    agent any 
    tools {
        "org.jenkinsci.plugins.terraform.TerraformInstallation" "terraform"
    }
    environment {
        TF_HOME = tool("terraform")
        TF_IN_AUTOMATION = "true"
        PATH = "$TF_HOME:$PATH"
    }
    stages {
    
        stage("Terraform Init"){
            
            steps {
                    ansiColor("xterm") {
                    withCredentials([azureServicePrincipal(
                    credentialsId: "Jenkins",
                    subscriptionIdVariable: "3396e8f8-8f03-4798-8309-97dd81951437",
                    clientIdVariable: "415c03d3-724b-41dc-b8f5-baad1d3d44ce",
                    clientSecretVariable: "password***",
                    tenantIdVariable: "0d46e439-2b93-4889-bfff-17f7009e1376"
                ), string(credentialsId: "access_key", variable: "df343bd3-655b-4602-9396-308f09360e2b")]) {
                        
                        sh """
                                
                        echo "Initialising Terraform"
                        terraform init -backend-config="access_key=$ARM_ACCESS_KEY"
                        """
                           }
                    }
             }
        }

        stage('Terraform Validate'){
            
            steps {
                    ansiColor('xterm') {
                    withCredentials([azureServicePrincipal(
                    credentialsId: 'Jenkins',
                    subscriptionIdVariable: 'ARM_SUBSCRIPTION_ID',
                    clientIdVariable: '415c03d3-724b-41dc-b8f5-baad1d3d44ce',
                    clientSecretVariable: 'password***',
                    tenantIdVariable: '0d46e439-2b93-4889-bfff-17f7009e1376'
                ), string(credentialsId: 'access_key', variable: 'df343bd3-655b-4602-9396-308f09360e2b')]) {
                        
                        sh """
                                
                        terraform validate
                        """
                           }
                    }
             }
        }

        stage('Terraform Plan'){
            steps {

                    ansiColor('xterm') {
                    withCredentials([azureServicePrincipal(
                    credentialsId: 'Jenkins',
                    subscriptionIdVariable: 'ARM_SUBSCRIPTION_ID',
                    clientIdVariable: '415c03d3-724b-41dc-b8f5-baad1d3d44ce',
                    clientSecretVariable: 'password***',
                    tenantIdVariable: '0d46e439-2b93-4889-bfff-17f7009e1376'
                ), string(credentialsId: 'access_key', variable: 'df343bd3-655b-4602-9396-308f09360e2b')]) {
                        
                        sh """
                        
                        echo "Creating Terraform Plan"
                        terraform plan -var "client_id=$ARM_CLIENT_ID" -var "client_secret=$ARM_CLIENT_SECRET" -var "subscription_id=$ARM_SUBSCRIPTION_ID" -var "tenant_id=$ARM_TENANT_ID"
                        """
                        }
                }
            }
        }

        stage('Waiting for Approval'){
            steps {
                timeout(time: 10, unit: 'MINUTES') {
                    input (message: "Deploy the infrastructure?")
                }
            }
        
        }
    

        stage('Terraform Apply'){
            steps {
                    ansiColor('xterm') {
                    withCredentials([azureServicePrincipal(
                    credentialsId: 'Jenkins',
                    subscriptionIdVariable: 'ARM_SUBSCRIPTION_ID',
                    clientIdVariable: '415c03d3-724b-41dc-b8f5-baad1d3d44ce',
                    clientSecretVariable: 'password***',
                    tenantIdVariable: '0d46e439-2b93-4889-bfff-17f7009e1376'
                ), string(credentialsId: 'access_key', variable: 'df343bd3-655b-4602-9396-308f09360e2b')]) {

                        sh """
                        echo "Applying the plan"
                        terraform apply -auto-approve -var "client_id=$ARM_CLIENT_ID" -var "client_secret=$ARM_CLIENT_SECRET" -var "subscription_id=$ARM_SUBSCRIPTION_ID" -var "tenant_id=$ARM_TENANT_ID"
                        """
                                }
                }
            }
        }

    }
}