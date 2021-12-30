---
marp: true
---

<!-- _class: invert -->

## Amazon EKS

* Amazon Elastic Kubernetes Service (Amazon EKS) is a managed container service
  to run and scale Kubernetes applications in the cloud or on-premises.

* Amazon EKS is certified Kubernetes-conformant, so existing applications that
    run on upstream Kubernetes are compatible with Amazon EKS.

* Amazon EKS automatically manages the availability and scalability of the
  Kubernetes control plane nodes responsible for scheduling containers, managing
  application availability, storing cluster data, and other key tasks.

---

## Amazon EKS - EC2 + Fargate

* Amazon EKS lets you run your Kubernetes applications on both

  * Amazon Elastic Compute Cloud (Amazon EC2) and

  * AWS Fargate.

* With Amazon EKS, you take advantage of all the performance, scale,
  reliability, and availability of AWS infrastructure, as well as integrations
  with AWS networking and security, such as application load balancers (ALBs)
  for load distribution, AWS Identity and Access Management (IAM) integration
  with role-based access control (RBAC), and AWS Virtual Private Cloud (VPC)
  support for pod networking.

---

## Amazon EKS - Managed Control Plane

* Amazon EKS provides a scalable and highly-available Kubernetes control plane
  running across multiple AWS Availability Zones (AZs). Amazon EKS automatically
  manages availability and scalability of Kubernetes API servers and etcd
  persistence layer. Amazon EKS runs the Kubernetes control plane across three
  AZs to ensure high availability, and automatically detects and replaces
  unhealthy control plane nodes.

* EKS add-ons are common operational software for extending the Kubernetes
  operational functionality. You can use EKS to install and keep the add-on
  software up-to-date. When you start an Amazon EKS cluster, select the add-ons
  you would like to run in the cluster, including Kubernetes tools for
  observability, networking, auto-scaling, and AWS service integrations.

---

## Amazon EKS - Managed Node Groups

* Amazon EKS lets you create, update, scale, and terminate nodes for your
  cluster with a single command. These nodes can also leverage Amazon EC2 Spot
  Instances to reduce costs. Managed node groups run Amazon EC2 instances using
  the latest EKS-optimized or custom Amazon Machine Images (AMIs) in your AWS
  account, while updates and terminations gracefully drain nodes to ensure your
  applications remain available.

* Windows Support

  * EKS supports running Windows worker nodes alongside Linux worker nodes,
    allowing you to use the same cluster for managing applications on either
    operating system.

---

<!-- _class: invert -->

## eksctl

* Amazon EKS lets you create, update, scale, and terminate nodes for your
  cluster with a single command. These nodes can also leverage Amazon EC2 Spot
  Instances to reduce costs. Managed node groups run Amazon EC2 instances using
  the latest EKS-optimized or custom Amazon Machine Images (AMIs) in your AWS
  account, while updates and terminations gracefully drain nodes to ensure your
  applications remain available.

* Simply run an "eksctl create cluster" command to create your EKS cluster. You
  can use eksctl to simplify cluster management and operations including
  managing nodes and add ons.

--- 

<!-- _class: invert -->

## eksctl create cluster

```
eksctl create cluster --name EKSCTL --nodes 3 --region eu-central-1
```

```
... [ℹ]  eksctl version 0.77.0
... [ℹ]  using region eu-central-1
... [ℹ]  setting availability zones to [eu-central-1b eu-central-1a eu-central-1c]
... [ℹ]  subnets for eu-central-1b - public:192.168.0.0/19 private:192.168.96.0/19
... [ℹ]  subnets for eu-central-1a - public:192.168.32.0/19 private:192.168.128.0/19
... [ℹ]  subnets for eu-central-1c - public:192.168.64.0/19 private:192.168.160.0/19
... [ℹ]  nodegroup "ng-ccd35643" will use "" [AmazonLinux2/1.21]
... [ℹ]  using Kubernetes version 1.21
<<< ... lines intentionally omitted ... >>>
```

---

<!-- _class: invert -->

## eksctl create cluster (II)

```
2021-12-14 10:04:26 [ℹ]
2 sequential tasks: { create cluster control plane "EKSCTL",
    2 sequential sub-tasks: {
        wait for control plane to become ready,
        create managed nodegroup "ng-ccd35643",
    }
}
2021-12-14 10:04:26 [ℹ]  building cluster stack "eksctl-EKSCTL-cluster"
2021-12-14 10:04:26 [ℹ]  deploying stack "eksctl-EKSCTL-cluster"
2021-12-14 10:04:56 [ℹ]  waiting for CloudFormation stack "eksctl-EKSCTL-cluster"
<<< ... lines intentionally omitted ... >>>
2021-12-14 10:19:28 [ℹ]  building managed nodegroup stack "eksctl-EKSCTL-nodegroup-ng-ccd35643"
2021-12-14 10:19:28 [ℹ]  deploying stack "eksctl-EKSCTL-nodegroup-ng-ccd35643"
2021-12-14 10:19:28 [ℹ]  waiting for CloudFormation stack "eksctl-EKSCTL-nodegroup-ng-ccd35643"
<<< ... lines intentionally omitted ... >>>
2021-12-14 10:23:02 [ℹ]  waiting for the control plane availability...
2021-12-14 10:23:03 [✔]  saved kubeconfig as "/Users/lothar/.kube/config"
2021-12-14 10:23:03 [ℹ]  no tasks
2021-12-14 10:23:03 [✔]  all EKS cluster resources for "EKSCTL" have been created
2021-12-14 10:23:03 [ℹ]  nodegroup "ng-ccd35643" has 3 node(s)
<<< ... lines intentionally omitted ... >>>
2021-12-14 10:23:03 [✔]  EKS cluster "EKSCTL" in "eu-central-1" region is ready
```
