all:
	@docker-compose --file docker-compose.dev.yml up --build

run:
	@docker run --push 80:8080 fazenda/nds-telegram-bot

build:
	@docker buildx build --platform linux/amd64,linux/arm/v7,linux/arm/v6,linux/arm64/v8,linux/ppc64le,linux/s390x,linux/386 --push --tag fazenda/nds-telegram-bot .

debug:
	@docker pull fazenda/nds-telegram-bot && \
	docker run \
	--rm \
	-it \
	--workdir /test \
	--volume ${PWD}:/test \
	--volume /etc/passwd:/etc/passwd \
	--volume /etc/group:/etc/group \
	--volume /home/$(whoami):/home/$(whoami) \
	--user $(id -g):$(id -g) \
	fazenda/nds-telegram-bot \
	/bin/sh
