#!/usr/bin/env bash

usage="$(basename "$0") [-h] [-s n] -- script to start a docker compose file 

where:
    -h  show this help text
    -c  set the compose path"

while getopts ':hc:' option; do
  case "$option" in
    h) echo "$usage"
       exit
       ;;
    c) project_path=$OPTARG
       ;;
    :) printf "missing argument for -%s\n" "$OPTARG" >&2
       echo "$usage" >&2
       exit 1
       ;;
   \?) printf "illegal option: -%s\n" "$OPTARG" >&2
       echo "$usage" >&2
       exit 1
       ;;
  esac
done


cd /mnt/d/docker/$project_path && nerdctl compose down && nerdctl compose up &