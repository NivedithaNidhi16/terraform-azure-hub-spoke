
# Azure Hub-and-Spoke Infrastructure with Terraform

Infrastructure-as-Code project demonstrating the design and deployment of a secure **Azure Hub-and-Spoke network architecture using Terraform**.

The project focuses on Azure networking, centralized security, private connectivity, identity, and automated infrastructure deployment through GitHub Actions.

---

## 🏗️ Architecture

```text
                         Internet
                            │
                            ▼
                    ┌───────────────┐
                    │ Azure Firewall│
                    └───────┬───────┘
                            │
                    Hub VNet
                 ┌──────────┴──────────┐
                 │                     │
            Azure Bastion         Private DNS
                 │
                 │ VNet Peering
                 ▼
             Spoke VNet
        ┌────────┴─────────┐
        │                  │
     Linux VM        Private Endpoints
                           │
                    ┌──────┴──────┐
                    ▼             ▼
                 Key Vault      Storage
```

---

## 🎯 Project Objectives

- Implement Azure Hub-and-Spoke networking using Terraform
- Centralize Internet traffic through Azure Firewall
- Provide secure administrative access using Azure Bastion
- Implement VNet peering between Hub and Spoke
- Use UDRs for controlled traffic routing
- Secure workloads using Network Security Groups
- Implement Private Endpoints for Azure services
- Configure Private DNS for private service resolution
- Use Managed Identity and Azure RBAC
- Automate Terraform using GitHub Actions and Azure OIDC

---

## 🔹 Hub-and-Spoke Architecture

The **Hub VNet** acts as the centralized networking and security layer.

It contains shared services such as:

- Azure Firewall
- Azure Bastion
- Private DNS

The **Spoke VNet** contains workload resources and is connected to the Hub using VNet Peering.

This architecture provides:

- Workload isolation
- Centralized security
- Controlled connectivity
- Reusable networking infrastructure
- Easier scalability for additional Spokes

---

## 🔧 Azure Resources

| Resource | Purpose |
|---|---|
| Hub VNet | Central networking layer |
| Spoke VNet | Workload network |
| VNet Peering | Hub ↔ Spoke connectivity |
| Azure Firewall | Centralized traffic inspection |
| Azure Bastion | Secure VM administration |
| Route Table / UDR | Controls traffic paths |
| NSG | Network traffic filtering |
| Linux VM | Workload / testing resource |
| Key Vault | Secure secret storage |
| Storage Account | Blob storage |
| Private Endpoints | Private Azure service connectivity |
| Private DNS Zones | Private name resolution |
| Managed Identity | Passwordless Azure authentication |
| RBAC | Access control |

---

## 🚦 Traffic Flow

### Spoke → Internet

```text
Spoke VM
   │
   ▼
UDR: 0.0.0.0/0
   │
   ▼
Azure Firewall
   │
   ▼
Internet
```

Internet-bound traffic from the Spoke is routed through Azure Firewall for centralized inspection.

### Spoke → Private Endpoint

```text
Spoke VM
   │
   ▼
Private DNS
   │
   ▼
Private Endpoint IP
   │
   ▼
Azure Service
```

Private Endpoint traffic uses the private path. More-specific routes to the Private Endpoint take precedence over the default Internet route.

### Administrator → VM

```text
Administrator
      │
      ▼
Azure Bastion
      │
      ▼
Spoke VM
```

Bastion provides administrative access without requiring a public IP on the VM.

---

## 🔐 Security

The project implements multiple security layers:

- Azure Firewall for centralized network inspection
- NSGs for subnet-level traffic filtering
- Private Endpoints for private Azure service connectivity
- Private DNS for internal service resolution
- Azure Bastion for secure VM access
- Managed Identity instead of application credentials
- Azure RBAC for resource/data access
- GitHub OIDC instead of long-lived Azure credentials

---

## 📁 Terraform Structure

```text
terraform-azure-hub-spoke/
│
├── environments/
│   └── dev/
│       ├── main.tf
│       ├── variables.tf
│       ├── outputs.tf
│       ├── providers.tf
│       └── dev.tfvars
│
├── modules/
│   ├── hub/
│   └── spoke/
│
└── .github/
    └── workflows/
        └── terraform.yml
```

Terraform modules separate reusable infrastructure components from environment-specific configuration.

---

## ⚙️ Terraform Workflow

```text
Terraform
   │
   ├── Init
   ├── Validate
   ├── Plan
   └── Apply
```

Example:

```bash
terraform init
terraform validate
terraform plan -var-file="dev.tfvars"
terraform apply -var-file="dev.tfvars"
```

To safely review resources before deletion:

```bash
terraform plan -destroy -var-file="dev.tfvars"
```

---

## 🔄 CI/CD

GitHub Actions is used to automate Terraform deployment.

The pipeline performs:

```text
Git Push
   ↓
Terraform Init
   ↓
Format Check
   ↓
Validate
   ↓
Plan
   ↓
Apply
```

Authentication between GitHub Actions and Azure uses **OIDC with a User Assigned Managed Identity**, avoiding long-lived Azure client secrets.

