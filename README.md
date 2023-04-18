# Docker-compose for the personal Joplin server

[Joplin](https://joplinapp.org/) is a free, open source note taking and to-do application, which can handle a large number of notes organised into notebooks. The notes are searchable, can be copied, tagged and modified either from the applications directly or from your own text editor. The notes are in **Markdown** format.

This is the configuration for the personal Joplin server I use myself, and it might work for you too. I think it's the perfect way to store personal notes and bookmarks for those who care about privacy and want to control personal data.

## Installation

* Create a new virtual machine. I use Debian on [DigitalOcean](https://m.do.co/c/b237082bad0e) for example;
* Install [Docker](https://docs.docker.com/engine/install/) and [docker-compose](https://docs.docker.com/compose/install/other/);
* Install and configure Nginx for your domain (let's say [j.example.com](etc/nginx/sites-available/j.example.com));
* Configure environment variables in `docker-compose.yaml` and run `docker-compose up -d`;
* If you have configured everything correctly, you should see the login page on your site;
* Default email **admin@localhost** and password **admin**;
* Don't forget to confugure [End-to-end encryption](https://joplinapp.org/e2ee/);

## Help

* Mobile application you can find [here](https://joplinapp.org/help/#mobile-applications);
