# docker-github-actions-runner

* running on ubuntu

## how to

```bash
$ docker run --rm -it \
    --env REPOSITORY_URL=https://github.com/f4bio/abc.rs \
    --env REPOSITORY_TOKEN=DEF \
    f4bio/docker-github-actions-runner:ubuntu
```
