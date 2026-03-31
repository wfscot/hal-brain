---
name: domain-ifc-context
description: "iFundCities company context — tech landscape, team, AI strategy. USE WHEN IFC, iFundCities, portal, data platform, Gruntweave, Dynamics, underwriting, servicing, draws."
---

# iFundCities (IFC) — Domain Context

Real estate lending company. Founded 2018. Scot Hastings is CTO (started March 2026).

## Technology Landscape

**Legacy — Microsoft Dynamics (since 2019):**
- Entire business runs on Dynamics — custom entities, automations, screens, Power Apps, Power Automate
- ~7 years of tech debt. Organization frustrated with pace of change.
- Dynamics team: Suyog (lead), Aditi, Dhanesh, Dinesh — all report to Scot
- Scalability cracks — analytical data doesn't belong in the operational DB

**Greenfield — Azure Cloud-Native:**
- Microsoft shop -> Azure. Blank slate, designing for agentic engineering.
- Dev methodology: Spec-Driven Development (SDD), Azure DevOps Agile

## Team

**Cloud-Native (contractors):**
- Nathan Toups — Architect/SRE/Platform, 28hr/wk, ex-Flyr. Pragmatic. Intent to hire FT.
- Alex Javakhishvili — .NET Core dev (Toptal), 20hr/wk. Portal.
- Innocent (Inno) Musanzikwa — Data engineer (Toptal), full-time. Databricks.

**Key Stakeholders:**
- Bryan Ziegenfuse — CEO/President
- Ryan — Business stakeholder (portal, data, AI)
- Harry Murray — Bridge underwriting lead
- Brittany Croce — Servicing/asset management
- Max Herlan — Draws/inspections, AI pilot champion
- Matthew Volk — DSCR underwriting
- Jack Davis — Capital markets

## AI Strategy

- AI reading from Dynamics OK; writing requires human oversight
- Pilot projects: budget translation (Draws), inspection report grading, payoff demand letters
- Weekly AI Office Hours for hands-on exploration

## Projects

See project-specific context files in this skill directory for details:
- **Portal** — Customer-facing loan application (`project-portal.md`)
- **Data Platform** — Azure Databricks analytics (`project-data-platform.md`)
- **Gruntweave** — Custom CI/CD platform (`project-gruntweave.md`)
