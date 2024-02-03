pipeline {
	agent any

	tools {
        jdk 'jdk17'
        nodejs 'node18'
    }

    environment {
        SCANNER_HOME = tool 'sonar-scanner'
    }

    stages {
        stage('clean workspace') {
            steps {
                cleanWs()
            }
        }

		stage('Checkout') {
			steps {
				checkout scm
			}
    	}

		stage('Unit Tests - npm test:ci') {
			steps {
				dir('googleservice') {
					sh "npm install && npm run test:ci"
				}
			}
		}

		// stage('Mutation Tests - PIT') {
		// 	steps {
		// 		sh "mvn org.pitest:pitest-maven:mutationCoverage"
		// 	}
		// }

		stage('SonarQube - SAST') {
			steps {
				withSonarQubeEnv('sonar-server') {
                    sh ''' $SCANNER_HOME/bin/sonar-scanner -Dsonar.projectName=googleservice \
                    -Dsonar.projectKey=googleservice '''
                }
				timeout(time: 30, unit: 'MINUTES') {
          			script {
            			waitForQualityGate abortPipeline: true, credentialsId: 'Sonar-token'
          			}
        		}
            }
		}

		stage('Vulnerability Scan - Docker') {
			steps {
				dir('googleservice') {
					parallel(
						"Dependency Scan": {
							dependencyCheck additionalArguments: '--scan ./ --disableYarnAudit --disableNodeAudit', odcInstallation: 'DP-Check'
						},
						"Trivy Scan": {
							sh "trivy fs . > trivyfs.txt"
						},
						"OPA Conftest": {
							sh 'docker run --rm -v $(pwd):/project openpolicyagent/conftest test --policy opa-docker-security.rego Dockerfile'
						}
					)
				}
			}
    	}
	}
	
}