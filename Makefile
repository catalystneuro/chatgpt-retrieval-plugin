# Heroku
# make heroku-login
# make heroku-push

HEROKU_APP = catalystneuro-chatbot

heroku-push:
	docker build --platform linux/amd64 -t ${HEROKU_APP} .
	docker tag ${HEROKU_APP} registry.heroku.com/${HEROKU_APP}/web
	docker push registry.heroku.com/${HEROKU_APP}/web
	heroku container:release web -a ${HEROKU_APP}

heroku-login:
	heroku container:login
