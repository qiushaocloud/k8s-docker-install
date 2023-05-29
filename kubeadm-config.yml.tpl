apiVersion: kubeadm.k8s.io/v1beta2
kind: InitConfiguration
bootstrapTokens:
- groups:
  - system:bootstrappers:kubeadm:default-node-token
  # 指定token
  token: <K8S_TOKEN>
  ttl: 24h0m0s
  usages:
  - signing
  - authentication
localAPIEndpoint:
  # 修改为主节点IP地址
  advertiseAddress: <ADVERTISE_ADDRESS>
  bindPort: <BIND_PORT>
nodeRegistration:
  # 修改为 containerd
  criSocket: unix:///var/run/docker.sock
  imagePullPolicy: IfNotPresent
  # 节点名改成主节点的主机名
  name: <MY_HOSTNAME>
  #taints:
  #- effect: NoSchedule
  #  key: node-role.kubernetes.io/control-plane
---
apiVersion: kubeadm.k8s.io/v1beta2
kind: ClusterConfiguration
# 修改版本号 必须对应
kubernetesVersion: 1.21.5
# 换成国内的源
imageRepository: registry.aliyuncs.com/google_containers
apiServer:
  timeoutForControlPlane: 4m0s
certificatesDir: /etc/kubernetes/pki
clusterName: kubernetes
# 虚拟IP和haproxy端口
controlPlaneEndpoint: "<CONTROL_PLANE_ENDPOINT>"
controllerManager: {}
dns: {}
etcd:
  local:
    dataDir: /var/lib/etcd
networking:
  # 新增该配置 固定为 10.244.0.0/16，用于后续 Calico网络插件
  podSubnet: 10.244.0.0/16
  dnsDomain: cluster.local
  # 固定svc 网段
  serviceSubnet: 10.1.0.0/16
scheduler: {}

---
apiVersion: kubeproxy.config.k8s.io/v1alpha1
kind: KubeProxyConfiguration
mode: ipvs