# acm-gitops-policies

# bootstrap

Install ACM + GitOps Operators in `open-cluster-management-global-set` namespace.

```bash
./bootstrap-acm-global-gitops/install.sh
```

## applications

Overlays and environment specific features are expected to be exposed as ArgoCD `Applications` or `ApplicationSets`, this includes the use of Kustomize, Helm Chart and PolicyGenerator apps.


## policies

Organized to follow NIST and upstream `stolostron/policy-collection` in the `policices` folder.

See [NIST Special Publication 800-53 (Rev. 4)](https://nvd.nist.gov/800-53/Rev4/control/SI-1) for a description of the System and Information Integrity security control. View the following table list of the stable policies that are supported by [Red Hat Advanced Cluster Management for Kubernetes](https://access.redhat.com/documentation/en-us/red_hat_advanced_cluster_management_for_kubernetes/2.7/html-single/governance/index#kubernetes-configuration-policy-controller):

[SC-System-and-Communications-Protection](https://github.com/stolostron/policy-collection/tree/main/stable/SC-System-and-Communications-Protection)

[AC-Access-Control](https://github.com/stolostron/policy-collection/tree/main/stable/AC-Access-Control)

[CA-Security-Assessment-and-Authorization](https://github.com/stolostron/policy-collection/tree/main/stable/CA-Security-Assessment-and-Authorization)

[CM-Configuration-Management](https://github.com/stolostron/policy-collection/tree/main/stable/CM-Configuration-Management)

[SI-System-and-Information-Integrity](https://github.com/stolostron/policy-collection/tree/main/stable/SI-System-and-Information-Integrity)

Overlays and environment specific features are expected to be exposed as ArgoCD `Applications` or `ApplicationSets`, this includes the use of Kustomize, Helm Chart and PolicyGenerator apps.