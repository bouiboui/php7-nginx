# php7-nginx

Minimal Docker image with PHP7 and NGINX. Currently under 20MB uncompressed, based on Alpine. 

There are currently zero PHP extensions included, though that might change in the future. I just couldn't find an image on DockerHub with a minimal enough configuration to get started quickly.

## Usage

The container serves its content from `/data/web/`. 

Map your local volume to this, for example:

```bash
-v /home/bouiboui/website/:/data/web/
```

===

I created a [server.sh](https://github.com/bouiboui/php7-nginx/blob/master/server.sh) script for convenience, here are the main actions you may want to use:

- **./server.sh mount [PATH]**

`mount` takes one argument, the directory you want to serve. It creates a symbolic link to this directory, that will be mapped to the container.
```bash
ln -s $2 ${PWD}/web
```

- **./server.sh start**

Starts the server. Runs a new container from the image.
```bash
docker run --name php7-nginx -v ${PWD}/web:/data/web -d bouiboui/php7-nginx
```

- **./server.sh stop**

Stops the server. Removes the container, which is brutal but doesn't leave any ghost containers behind. Will change in the future.
```bash
docker rm -f php7-nginx
```
