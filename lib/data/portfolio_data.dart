class PortfolioData {
  static const String name = "Yalagala Nukaiah";
  static const String title = "DevOps Engineer";
  static const String location = "Hyderabad, India";
  static const String email = "yalagalanukaiah14@gmail.com";
  static const String phone = "+91 89785 11783";
  static const String linkedin =
      "https://www.linkedin.com/in/yalagala-nukaiah-6a5557323/";
  static const String github = "https://github.com/Nukaiah04";
  static const String profileImage = "assets/me.jpeg";
  static const String summary =
      "DevOps Engineer experienced in designing and shipping fully automated CI/CD pipelines on Google Cloud Platform (GCP) — connecting GitHub, Cloud Build, Trivy security scanning, and Artifact Registry to push Dockerized applications onto Compute Engine VMs and Google Kubernetes Engine (GKE) with zero manual intervention. Built reusable Terraform modules that provision GCP infrastructure in minutes instead of days, and rolled out highly available microservices on Kubernetes with Ingress, ConfigMaps, Secrets, and Horizontal Pod Autoscaling. Reduced incident detection time by 50% through a Prometheus, Grafana, and Alertmanager observability stack, while gating code and container security with SonarQube and Trivy before every release. Skilled at troubleshooting IAM, networking, and deployment issues to keep delivery fast, secure, and reliable.";

  static const Map<String, List<String>> skills = {
    "Cloud (GCP)": [
      "Google Cloud Platform",
      "Compute Engine",
      "Google Kubernetes Engine (GKE)",
      "Cloud Build",
      "Cloud Run",
      "Artifact Registry",
      "Secret Manager",
      "IAM",
      "VPC",
      "Cloud Monitoring",
      "Cloud Logging",
    ],
    "Infrastructure as Code": ["Terraform"],
    "Containers & Orchestration": [
      "Docker",
      "Docker Compose",
      "Docker Hub",
      "Kubernetes",
      "Helm",
    ],
    "CI/CD": ["Google Cloud Build", "GitHub Actions", "Jenkins"],
    "Version Control": ["Git", "GitHub", "Branching & Pull-Request Workflows"],
    "Operating Systems & Scripting": [
      "Linux (Ubuntu)",
      "Bash Scripting",
      "systemd",
      "UFW Firewall",
    ],
    "Code Quality & Security": ["SonarQube", "Trivy"],
    "Monitoring & Observability": ["Prometheus", "Grafana", "Alertmanager"],
    "Web & Databases": ["Nginx", "PostgreSQL"],
    "Networking": [
      "TCP/IP",
      "DNS",
      "HTTP/HTTPS",
      "SSH",
      "SSL/TLS",
      "OSI Model",
      "VPC",
      "Subnets",
      "CIDR",
      "Routing",
      "Firewall Rules",
      "NAT",
      "Load Balancing",
      "Reverse Proxy (Nginx)",
      "Ports & Protocols",
      "Kubernetes Networking",
      "Network Security",
    ],
    "Development Tools": ["VS Code", "Postman"],
  };

  static const List<Map<String, dynamic>> experience = [
    {
      "company": "Blue Cloud Softech Solutions",
      "location": "Hyderabad",
      "role": "DevOps Engineer",
      "duration": "Apr 2026 – Present",
      "bullets": [
        "Architected end-to-end CI/CD pipelines for 5+ applications using GitHub Actions and Jenkins, cutting average deployment cycle time by 40%.",
        "Automated infrastructure provisioning on GCP using reusable Terraform modules, reducing environment setup time from 2 days to under 30 minutes.",
        "Managed production microservices across Kubernetes clusters, configuring Deployments, Services, Ingress, ConfigMaps, Secrets, and Persistent Volumes to achieve 99.9% uptime.",
        "Oversaw the full container lifecycle — build, scan, push, and promote Docker images across development, staging, and production Artifact Registry repositories — eliminating critical CVEs before release.",
        "Established an observability stack with Prometheus alerting rules and Grafana dashboards, reducing mean time to detection (MTTD) for incidents by 50%.",
        "Diagnosed and resolved production incidents affecting 3+ services, improving deployment reliability by 35%.",
        "Enforced security best practices across all pipelines, including OWASP guidelines, Trivy vulnerability scanning, and IAM least privilege policies, achieving zero critical findings in quarterly audits.",
      ],
    },
    {
      "company": "Blue Cloud Softech Solutions",
      "location": "Hyderabad",
      "role": "DevOps Engineer Intern",
      "duration": "Sep 2025 – Mar 2026",
      "bullets": [
        "Created CI/CD pipelines using GitHub Actions and Jenkins, automating build, test, and deployment workflows across 3+ environments and cutting manual release effort by 60%.",
        "Maintained source code repositories and applied GitFlow branching strategy, streamlining collaborative development for a 5-person engineering team.",
        "Embedded SonarQube and Trivy into CI pipelines to enforce code quality gates and container security standards on every pull request.",
        "Published container images to Docker Hub, supporting Kubernetes deployments and rolling updates across 3+ microservices.",
        "Supported GCP infrastructure operations, provisioning Compute Engine instances, Cloud Storage buckets, VPC networking, and IAM roles under senior engineer guidance.",
        "Built Prometheus and Grafana dashboards to monitor 10+ infrastructure and application metrics, enabling proactive incident detection.",
      ],
    },
  ];

  static const List<Map<String, dynamic>> projects = [
    {
      "name": "Blutact-MDM | DevOps Engineer",
      "duration": "",
      "tags": [
        "Docker",
        "GitHub Actions",
        "Docker Compose",
        "Linux",
        "CI/CD",
        "PostgreSQL",
      ],
      "description":
          "Built and automated a Docker-based deployment platform for the Blutact MDM application on a Linux server.",
      "bullets": [
        "Developed a CI/CD pipeline covering automated Docker image builds, Trivy security scanning, SonarQube code-quality analysis, image publishing, deployment, health checks, and rollback.",
        "Deployed the HMDM application and PostgreSQL via Docker Compose with persistent volumes, health checks, service dependencies, and automatic container restart policies.",
        "Configured Linux server SSH access, UFW firewall rules, and production networking with application and MQTT port mappings (8083→8080, 31001→31000).",
        "Implemented automatic application recovery after server reboot using Docker restart policies and systemd, and worked toward a Blue-Green deployment strategy for safer, lower-downtime releases.",
        "Managed Git branching and pull-request workflows across main (production) and Testing_mdm (development) branches, troubleshooting SSH, PostgreSQL recovery, and deployment failures along the way.",
      ],
      "link": "http://103.211.36.242:8083",
    },
    {
      "name": "End-to-End CI/CD Deployment Pipeline on Google Cloud Platform",
      "duration": "Live: http://35.244.52.86:8000",
      "tags": ["GCP", "CI/CD", "Cloud Build", "Artifact Registry", "Docker"],
      "description":
          "Designed and implemented a fully automated CI/CD pipeline that ships a Dockerized application from GitHub to a Compute Engine VM using Cloud Build, Artifact Registry, and a custom deployment script.",
      "bullets": [
        "Configured a Cloud Build trigger on the main branch to automatically run tests, execute a Trivy security scan, compile the Docker image, and publish it to Artifact Registry on every commit.",
        "Authored a deploy-container.sh script to authenticate Docker, pull the latest image, stop and remove the active instance, and start the updated version on the VM with zero manual intervention.",
        "Granted Artifact Registry Reader IAM role to the VM's service account and opened a VPC firewall rule, enabling secure image pulls and public application access on port 8000.",
        "Resolved 6 distinct release issues — including permission errors, IAM authentication scopes, repository misconfiguration, and port mismatches — achieving a 100% success rate on subsequent deployments.",
      ],
      "link": "https://github.com/Nukaiah04",
    },
    {
      "name": "Kubernetes Application Deployment on GKE",
      "duration": "Live: http://34.93.104.243:80",
      "tags": ["Kubernetes", "GKE", "CI/CD", "GCP"],
      "description":
          "Extended the CI/CD pipeline to Google Kubernetes Engine (GKE) in under a day, moving the same containerized application from a single Compute Engine VM to a managed container cluster on GKE.",
      "bullets": [
        "Ran 3+ production-grade microservices on Kubernetes with multi-replica Deployments, ensuring high availability and automatic failover across nodes.",
        "Set up Ingress controllers, ClusterIP Services, ConfigMaps, and Kubernetes Secrets across 3+ workloads to securely manage routing, configuration, and sensitive credentials.",
        "Rolled out Horizontal Pod Autoscaling (HPA) and zero-downtime update strategies, supporting 3x traffic spikes without service interruption.",
        "Exposed the application on port 80 through a LoadBalancer/Ingress Service on GKE for public access.",
      ],
      "link": "http://34.93.104.243:80",
    },
    {
      "name": "CI/CD Pipeline with Multi-Environment Testing",
      "duration": "",
      "tags": ["Cloud Build", "GitHub Actions", "Jenkins", "CI/CD", "Docker"],
      "description":
          "Assembled a multi-stage pipeline with Google Cloud Build, GitHub Actions, and Jenkins spanning compilation, automated testing, security scanning, containerization, and deployment across 3 environments, cutting release time by 50%.",
      "bullets": [
        "Integrated static code analysis and container security gates into every pull request, blocking merges on any critical finding and reducing escaped vulnerabilities to zero.",
        "Standardized Docker image tagging and versioning conventions across the registry, reducing rollback time to under 5 minutes whenever a release needed to be reverted.",
        "Instrumented pipeline stages and application health checks with 20+ custom metrics, feeding a shared team dashboard for release visibility.",
      ],
      "link": "https://github.com/Nukaiah04",
    },
  ];

  static const Map<String, String> education = {
    "institution": "Avanthi Institute of Engineering and Technology",
    "location": "Hyderabad",
    "degree": "Bachelor of Technology (B.Tech)",
    "duration": "2025",
  };

  static const List<String> certifications = [
    "AWS Cloud Practitioner Essentials — AWS Training & Certification (Aug 2026)",
    "Networking Basics — Cisco Networking Academy (Aug 2026)",
  ];
}
