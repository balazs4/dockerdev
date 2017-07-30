#! /bin/sh
docker run --rm -it \
  -v /etc/localtime:/etc/localtime:ro \
  -v $HOME/Src:/home/dev/host \
  -v $HOME/.gitconfig:/home/dev/.gitconfig:ro \
  -v $HOME/.ssh/:/home/dev/.ssh:ro \
  --user 1000 \
  dockerdev
