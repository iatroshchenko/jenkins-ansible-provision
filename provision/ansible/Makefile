provision:
	ansible-playbook -i hosts provision.yml

certificates-renew:
	ansible-playbook -i hosts tasks/renew_certificates.yml

authorize:
	ansible-playbook -i hosts authorize.yml

authorize-deploy:
	ansible-playbook -i hosts authorize_deploy.yml

upgrade:
	ansible-playbook -i hosts upgrade.yml

password-remote:
	ansible -i hosts prod -m shell -a 'cd /home/deploy/jenkins && docker-compose exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword'

generate-deploy-key:
	ssh-keygen -q -t rsa -N '' -f files/deploy_rsa
