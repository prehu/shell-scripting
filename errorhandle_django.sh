#!/bin/bash

<<task
Deploy django code and handle the code with for error
task

create_clone(){
	echo "creating clone of django notes app"
	git clone https://github.com/prehu/django-notes-app.git
}

install_requirements(){
	echo "Installing dependencies"
	sudo apt-get update
	sudo apt-get install docker.io nginx -y docker-compose
}
required_restarts(){
	sudo chown $USER /var/run/docker.sock
	#sudo systemctl enable docker
	#sudo systemctl enable nginx
	#sudo systemctl restart docker
}
deploy(){
	docker build -t notes-app .
	#docker run -d -p 8000:8000 notes-app:latest
	docker-compose up -d
}
echo "##################### Deployment Started ##################"
if ! create_clone;then 
	cd django-notes-app
fi
if ! install_requirements;then 
	echo "Required installation failed "
	exit 1
fi
if ! required_restarts;then 
	echo "Restart process failed"
	exit 1
fi
if ! deploy;then
	echo "Deployement Failed"
	exit 1
fi
echo "##################### Deployment Ended ##################"
