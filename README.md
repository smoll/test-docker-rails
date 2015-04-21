# Docker Rails Seed

Following [Docker's Quickstart guide](https://docs.docker.com/compose/rails/) and ["Rails on Docker"](https://robots.thoughtbot.com/rails-on-docker)

## How I use this

Basic idea from [GitHub](https://help.github.com/articles/duplicating-a-repository/)

```
cd ~/workspace
git clone --bare https://github.com/smoll/docker-rails-seed.git
cd docker-rails-seed.git
make
rm .dockerignore && rm -rf bootstrap

# Make some basic modifications to the skeleton by hand here

git add .
git commit -m "Initialize dockerized app"
git push --mirror https://github.com/smoll/NEW_RAILS_PROJECT_HERE.git
cd ..
rm -rf docker-rails-seed.git
```

## General Usage

0. Generate the Rails skeleton app (WARNING: this generates a lot of files in this directory!)

    ```
    $ make
    ```

0. Boot the app with

    ```
    $ docker-compose up
    ```

0. Create the database with

    ```
    $ docker-compose run web rake db:create
    ```

    (Don't think this is necessary because `rails new` invoked by `make` automatically does this)

0. Rebuild the docker image (NOTE: only if you make changes to the Dockerfile or Gemfile!) with

    ```
    $ docker-compose build
    ```

## View the site in your browser

If using boot2docker, app will be running on http://192.168.59.103:3000 or if you're on a Linux host machine the container should be reachable on http://localhost:3000

## Troubleshooting

0. If something goes wrong with the above, you can always remove the web container and try again

    ```
    $ docker ps
    CONTAINER ID        IMAGE               COMMAND                CREATED             STATUS              PORTS                     NAMES
    083680fae997        postgres:latest     "/docker-entrypoint.   7 days ago          Up 39 minutes       0.0.0.0:49153->5432/tcp   dockerrailsseed_db_1
    $ docker rm -f 083680fae997
    $ make
    ```

0. If you must, you can remove the image completely (not recommended)

    ```
    $ docker images
    REPOSITORY                    TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
    dockerrailsseed_web           latest              26c4e3a5f9de        10 days ago         956.9 MB
    $ docker rmi 26c4e3a5f9de
    ```
