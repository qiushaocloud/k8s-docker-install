MY_HOSTNAME=`hostname`

kubectl taint nodes $MY_HOSTNAME node-role.kubernetes.io/control-master=:NoExecute
