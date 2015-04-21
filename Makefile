# Using as a guide https://github.com/phusion/baseimage-docker/blob/master/Makefile
.PHONY: all new

all: new

new:
	cp bootstrap/Gemfile Gemfile
	docker-compose run web rails new . --force --database=postgresql --skip-bundle
	cp bootstrap/database.yml config/database.yml
	docker-compose build
