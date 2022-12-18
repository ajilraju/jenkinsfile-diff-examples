pipeline {
	agent any
	environment {
	    PREFIX_PATH = '/var/www'
	}
	stages {
		stage('SCM') {
			steps {
				git branch: 'master', url: 'https://github.com/git/git.git'
			}
		}
		stage('Configure') {
			steps {
				sh 'make configure'
			}
		}
		stage('Setup Configure') {
			steps {
				sh './configure --prefix=${PREFIX_PATH}'
			}
		}
		stage('Make Install') {
			steps {
				sh 'make install'
			}
		}
	}
}
