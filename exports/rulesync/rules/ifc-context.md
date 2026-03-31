---
description: "iFundCities company and technology context for agents working on IFC projects"
globs: ["**/*"]
---

# iFundCities (IFC) Context

Real estate lending company. Founded 2018. Scot Hastings is CTO (started March 2026).

## Technology Landscape

**Legacy — Microsoft Dynamics (since 2019):**
- Entire business runs on Dynamics — custom entities, automations, screens, Power Apps, Power Automate
- ~7 years of tech debt. Organization frustrated with pace of change.
- Dynamics team: 4 developers (Suyog, Aditi, Dhanesh, Dinesh) all report to Scot
- Scalability cracks — analytical data doesn't belong in the operational DB

**Greenfield — Azure Cloud-Native:**
- Microsoft shop -> Azure. Blank slate, designing for agentic engineering.
- **Gruntweave:** Custom CI/CD platform (repo: gw-system-live)
- **Portal:** Customer-facing loan application (first major app on Gruntweave, .NET Core)
- **Data Platform:** Azure Databricks (EDH/ALH), replacing analytical workloads from Dynamics
- **Dev Methodology:** Spec-Driven Development (SDD), Azure DevOps Agile

## Engineering Team

- **Nathan Toups:** Architect/SRE/DevOps/platform, 28hr/wk contractor, ex-Flyr. Pragmatic.
- **Alex Javakhishvili:** Full-stack .NET Core dev (Toptal), 20hr/wk. Portal.
- **Innocent (Inno) Musanzikwa:** Data engineer (Toptal), full-time. Databricks.
- **India team:** ~52 employees focused on operations (document processing)

## AI Strategy

- AI reading from Dynamics OK; writing requires human oversight
- Pilot projects: budget translation (Draws), inspection report grading, payoff demand letters
- Weekly AI Office Hours for hands-on exploration
