#!/bin/bash

images_list='
registry.aliyuncs.com/google_containers/kube-apiserver:v1.21.5
registry.aliyuncs.com/google_containers/kube-controller-manager:v1.21.5
registry.aliyuncs.com/google_containers/kube-scheduler:v1.21.5
registry.aliyuncs.com/google_containers/kube-proxy:v1.21.5
registry.aliyuncs.com/google_containers/pause:3.4.1
registry.aliyuncs.com/google_containers/etcd:3.4.13-0
registry.aliyuncs.com/google_containers/coredns:v1.8.0
'

for i in $images_list
do
    docker pull $i
done