#/bin/bash
# 
kube_image_repo=k8s.gcr.io
docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWD

for list in `cat k8s.list|grep -v ^$|grep -v ^#`; do
  rel_list=`echo $list | sed 's/\//./g'`
  docker pull $kube_image_repo/$list
  docker tag $kube_image_repo/$list $DOCKERHUB_USERNAME/$rel_list
  docker push $DOCKERHUB_USERNAME/$rel_list
done
