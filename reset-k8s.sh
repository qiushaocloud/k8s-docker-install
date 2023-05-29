docker ps -a|grep Exited|awk '{print $1}'|(xargs docker rm -f || true)

echo "kubeadm reset -f"
kubeadm reset -f

ipvsadm --clear
rm -rf ~/.kube
rm -rf /etc/kubernetes/manifests
rm -rf /var/lib/kubelet
rm -rf /etc/kubernetes/pki