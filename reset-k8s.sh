crictl ps -a|grep Exited|awk '{print $1}'|(xargs crictl rm -f || true)

# if [ -f "kubeadm-config.yml" ]; then
    # echo "kubeadm reset -f --kubeconfig $PWD/kubeadm-config.yml --cri-socket unix:///var/run/docker.sock"
    # kubeadm reset -f --kubeconfig $PWD/kubeadm-config.yml --cri-socket unix:///var/run/docker.sock
# else
echo "kubeadm reset -f --cri-socket unix:///var/run/docker.sock"
kubeadm reset -f --cri-socket unix:///var/run/docker.sock 
# fi

ipvsadm --clear
rm -rf ~/.kube
rm -rf /etc/kubernetes/manifests
rm -rf /var/lib/kubelet
rm -rf /etc/kubernetes/pki