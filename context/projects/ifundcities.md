# iFundCities (IFC)

Real estate lending company. Founded 2018. Scot is CTO as of 2026-03-01.

---

## Company Overview

- **Industry:** Real estate lending (bridge loans, DSCR loans)
- **Founded:** 2018
- **Key leadership:** Bryan Ziegenfuse (CEO/President), Harry Murray (head of bridge underwriting), Ryan (business stakeholder, involved in portal/data decisions)
- **Headcount:** ~52 employees in India (operational/document processing), plus US-based team
- **Operating model:** Microsoft shop — O365, Teams, Dynamics 365, SharePoint

## Legacy Platform: Microsoft Dynamics

- **In use since 2019** (~7 years of accumulated tech debt and vestigial artifacts)
- Far beyond a CRM — entire business runs on it: custom entities, automations, screens, Power Apps, Power Automate flows, Dataverse
- **Dynamics team:** 4 developers (all report to Scot) — Suyog, Dhanesh, Dinesh, Aditi
  - Suyog: Dynamics team lead
  - Aditi: CRM development, Power Apps/Dataverse architecture
  - Dhanesh: Dynamics developer
  - Dinesh: Dynamics developer (servicing email automation, daily reports)
- Organization widely frustrated with pace of change
- Scalability cracks emerging — analytical data pumped into operational database
- No formal ticketing or prioritization — work gets done based on who asks loudest (Scot introducing structure)
- Power Platform / Power Automate not amenable to AI-assisted development
- Nothing on fire yet, but growing pain

## Greenfield Platform: Azure Cloud-Native

- Microsoft shop → Azure is the obvious choice
- Essentially a blank slate — designing for agentic engineering from the outset
- **Gruntweave:** Custom CI/CD platform Scot built during prior consulting. Repo at `~/workspaces/gw-system-live`
- **Spec-Driven Development (SDD):** Scot's development methodology for the new platform
- **Azure DevOps:** Agile template for work tracking, introduced in week 3

### Key Apps In Progress

- **Portal:** Customer-facing loan application portal (first major app on Gruntweave)
  - Alex (contractor) is primary developer — .NET Core
  - Bryan and Ryan are key business stakeholders
  - MVP scoping done week 2; document upload identified as critical for MVP
- **Data Platform (EDH/ALH):** Azure Databricks-based analytics
  - Nathan and Inno building it out
  - Data source onboarding tracker, SFTP pipelines, Zillow FIPS mapping
  - Intended to replace analytical workloads currently straining Dynamics
  - Servicing data integration a few weeks out (as of late March 2026)

## Engineering Team

### Cloud-Native / New Platform Team (contractors)
- **Nathan Toups:** Architect/SRE/DevOps/platform — ex-Flyr colleague of Scot's. 28 hrs/week contractor. Pragmatic counterbalance to Scot's idealism. Intent to hire FT eventually.
- **Aleksandre (Alex) Javakhishvili:** Full-stack .NET Core dev (Toptal). 20 hrs/week. Focused on the portal.
- **Innocent (Inno) Musanzikwa:** Data engineer (Toptal). Full-time. Building data platform on Azure Databricks with Nathan. Onboarded March 5, 2026.

### India Operations Team
- ~52 employees focused on operational work (document processing, etc.)
- Prior dev resources from India were ineffective and already exiting when Scot arrived
- Sushanth: India operations (loan processing, post-closing)
- Nikhil Gupta: India team (QC, compliance)

### Key Business Stakeholders (non-engineering)
- **Bryan Ziegenfuse:** CEO/President — portal and data app stakeholder, runs Level 10 meetings
- **Ryan:** Business stakeholder — portal, data, AI tooling strategy
- **Harry Murray:** Bridge underwriting lead — AI credit memo vision, document vault concept
- **Brittany Croce:** Servicing/asset management — CRM pain, BSI data needs
- **Max Herlan:** Draws/inspections — AI pilot champion (budget translation, inspection grading), Sitewire integration
- **Allison (Ali) Ladley:** Late payment collections, servicing automation
- **Matthew Volk:** DSCR underwriting — loan locking is #1 pain point
- **Jack Davis:** Capital markets — DSCR pricing, rate sheet ingestion
- **Mike Mendenhall:** AM/processing, CRM development process
- **Chris:** Operations/compliance
- **Erik Eichinger:** Business operations
- **Tina Elmer:** Marketing
- **Cody Creason:** Draws team — slow draw workflows

## AI Strategy

- Scot leading AI adoption across the business
- **Ground rule:** AI is nondeterministic — reading from Dynamics OK, writing requires human oversight
- **AI Office Hours:** Weekly open session (Thursdays) for hands-on AI exploration
- **Pilot projects identified:**
  - Budget translation/review (Draws) — translate borrower budgets into standard Excel template
  - Inspection report grading (Draws) — score 1-10, classify construction stage
  - Payoff demand letters (AL/AM)
  - Loan modification checklists (AL/AM)
  - Credit memo automation (Underwriting, longer-term)
- **Approach:** Rich text instruction docs in SharePoint (portable across AI providers), iterative prompt engineering
- **Sitewire API integration:** Upcoming — may change draws data entry landscape

## CTO Priorities (first 90 days, as of 2026-03-30)

1. **Credibility:** Take control of legacy Dynamics, demonstrate competence, introduce ticketing/prioritization
2. **Ship:** Deliver portal MVP and data apps on the new platform (Gruntweave/Azure)
3. **Strategy:** Short/medium/long-term roadmap to support business' ambitious growth goals
4. **AI adoption:** Prove value with pilot projects, educate org on AI capabilities/limitations
5. **Org (lower priority):** Team structure needs to support the above but isn't the first focus

## External Vendors / Integrations

- **Sitewire:** Inspection platform — API integration upcoming, handles ~65% of inspections
- **BSI:** Loan servicing system — data needed by servicing team
- **JourneyTEAM:** Microsoft licensing partner
- **Toptal:** Staffing agency for Alex and Inno
- **Homara:** Vendor/partner (meeting on March 16)
- **Elementix:** Vendor (meeting on March 10)

## Key Risks / Issues Identified

- $600K phishing near-miss on wire security (flagged by Max, week 2)
- CRM field inconsistency — data scattered across disconnected tables
- No formal CRM development prioritization process (being addressed)
- Dynamics not suited for analytical workloads (data platform addresses this)
- Power Platform resistance to AI-assisted development
