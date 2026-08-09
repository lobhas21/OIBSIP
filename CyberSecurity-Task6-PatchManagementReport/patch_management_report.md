The Importance of Patch Management
Author: Lobhas Anand Patil 
Track: Cyber Security — Security Analyst Intern 
Program: Oasis Infobyte SIP (OIBSIP) 
Task: Cyber Security Task 6 — Research Report: The Importance of Patch Management

1. Introduction
Patch management is basically the process of finding, prioritizing, testing, and installing updates to your software, OS, and firmware. It sounds boring, but it's one of the most important things in cybersecurity. NIST (in SP 800-40 Rev. 4) frames it simply: patching is how an organization responds to the risk that comes with running software in the first place. And here's the thing — if you don't patch, you're not avoiding the risk, you're just accepting it by default.
Patching sits right in the middle of the vulnerability lifecycle: a flaw gets discovered, it gets disclosed, it gets catalogued, and if nobody fixes it, someone eventually exploits it. How fast and reliably an organization moves through that cycle is usually what decides whether a known bug turns into a routine update or a full-blown breach.

2. Why Patches Matter
Vulnerabilities get discovered by researchers, vendors, or sometimes attackers themselves. Once found, they get logged as CVEs (Common Vulnerabilities and Exposures) — basically a unique ID for every publicly known flaw, maintained by MITRE. Once a CVE is out there, it's a race. Defenders try to patch before attackers can reverse-engineer the fix and build an exploit out of it. Two real incidents show exactly what happens when that race is lost.

Case Study 1 — WannaCry / EternalBlue (2017)

In March 2017, Microsoft patched a critical SMBv1 flaw (MS17-010). A month later, a leaked NSA exploit toolkit — including one built specifically for that flaw, called EternalBlue — went public. In May 2017, the WannaCry ransomware worm used EternalBlue to spread itself across unpatched Windows machines, encrypting files and demanding Bitcoin. It hit 200,000+ systems in 150 countries within days, crippled parts of the UK's NHS (hospitals had to redirect emergency patients), and disrupted manufacturing and logistics companies worldwide. The patch had been out for two months already. This whole thing was avoidable.

Case Study 2 — Equifax Breach (2017)

Apache disclosed and patched a critical RCE flaw in Apache Struts 2 (CVE-2017-5638) on March 7, 2017. Two days later, Equifax's own security team told employees to patch it. It never got applied to their online dispute portal. Attackers found the still-vulnerable system in mid-May and sat inside Equifax's network undetected for about 76 days, pulling out personal data — SSNs, birth dates, addresses, driver's license numbers — for around 147–148 million people. One missed patch, on a system that had already been flagged internally, led to a $700 million settlement and the CEO, CIO, and CSO all leaving.
Both cases have the same story underneath: the vulnerability was known, a fix already existed, and the damage came purely from not applying it in time.

3. Consequences of Not Patching
Skipping patches consistently, or letting them pile up, opens the door to:
 1) Data breaches — unpatched systems are the #1 way attackers get in (see: Equifax).
 2) Ransomware attacks — worms like WannaCry and NotPetya spread specifically by hunting for known, unpatched flaws.
 3) Compliance violations — PCI DSS, ISO 27001, HIPAA all require timely patching. You can get fined for this even if you never actually get breached.
 4) Financial and legal fallout — lawsuits, settlements ($700M for Equifax), stock drops (Equifax fell ~30% after they announced it).
 5) Loss of trust — this one lasts the longest. People remember the breach long after it's technically "fixed."

4. The Patch Management Lifecycle
NIST breaks this down into five phases, and honestly it's a pretty clean way to think about it:
 1) Discovery — Know what you actually have. You can't patch something you don't know exists. Keep an eye on vendor advisories, the CVE database, and vulnerability scanners.
 2) Assessment — Figure out how serious each new vulnerability is, usually with CVSS (Common Vulnerability Scoring System), and decide what to do about it: accept it, patch it, transfer the risk, or avoid it entirely.
 3) Testing — Before you roll a patch out everywhere, test it in a staging environment first. This step gets skipped a lot when people are in a hurry, and that's exactly how patches end up breaking things.
 4) Deployment — Push the patch out, starting with critical/internet-facing systems, following whatever change-management process the org has.
 5) Verification — Actually confirm the patch went through and is working. This is exactly where Equifax messed up — their scan was supposed to catch the unpatched system and it didn't. Verification isn't a one-time thing, it needs to be ongoing.

5. Best Practices — A 7-Step Checklist
 1) Keep a real, up-to-date asset inventory — every device, OS, app, and firmware, including third-party stuff like Apache Struts and any shadow IT you don't officially "know" about.
 2) Follow vulnerability feeds — CVE/NVD, vendor bulletins, and CISA's Known Exploited Vulnerabilities (KEV) list, so you hear about new patches fast.
 3) Prioritize by actual risk, not just CVSS score — a "critical" bug on a system nobody uses matters less than a medium one on something internet-facing.
 4) Test in staging first, always, before pushing to production.
 5) Automate what you can — tools like WSUS, SCCM, Ansible, or cloud-native patch managers cut down the human error that caused Equifax's whole mess.
 6) Set real SLAs — e.g. critical patches within 72 hours, high within a week — and actually track if you're hitting them.
 7) Verify and audit, continuously — don't just assume a patch worked. Check. And treat your scanning tools themselves as things that need maintenance too (Equifax's scanner was the thing that failed).

6. Why Organizations Struggle to Patch Promptly
Patching sounds simple on paper, but orgs fall behind for pretty consistent reasons:
    1) Legacy systems — old apps might not even be supported anymore, or a new patch might break some custom integration built on top. Fix: budget dedicated time for legacy system maintenance instead of treating it as a "someday" task.
    2) Downtime worries — hospitals, factories, banks — a lot of critical systems can't just go down to get patched. Fix: use redundant/failover systems so patching one node doesn't take the whole service offline.
    3)Slow testing and approval processes — by the time a patch clears change-control, weeks can pass. Fix: have a fast-track lane specifically for critical or actively-exploited CVEs.
    4)Not enough people — small security teams can't realistically track every advisory for every asset manually. Fix: automate discovery and deployment so people only need to step in for the tricky calls.
    5)Nobody clearly owns it — in big orgs, patch responsibility can fall through the cracks, which is literally what happened at Equifax. Fix: assign clear, auditable ownership per asset, and don't rely on someone just "remembering" to do it.

7. Conclusion
Patch management isn't exciting work, but WannaCry and Equifax both prove it's one of the highest-value things a security team can do. In both cases, the fix already existed before the attack happened — the failure wasn't technical, it was organizational. A good patch management program doesn't treat patching as an occasional chore; it treats it as a continuous loop that has to be tracked and verified, because that gap between "a patch exists" and "the patch is actually installed" is exactly where breaches like these slip through.
References
 1) NIST Special Publication 800-40 Rev. 4, Guide to Enterprise Patch Management Planning: Preventive Maintenance for Technology — https://csrc.nist.gov/pubs/sp/800/40/r4/final
 2) CISA, Known Exploited Vulnerabilities (KEV) Catalog — https://www.cisa.gov/known-exploited-vulnerabilities-catalog
 3) MITRE, CVE Database — https://cve.mitre.org
 4) FIRST.org, Common Vulnerability Scoring System (CVSS) — https://www.first.org/cvss
 5) CSO Online, Equifax data breach FAQ: What happened, who was affected, what was the impact? — https://www.csoonline.com/article/567833/equifax-data-breach-faq-what-happened-who-was-affected-what-was-the-impact.html
 6) National Cyber Security Centre / Wired retrospectives on the WannaCry ransomware outbreak (May 2017)

Submitted as part of the Oasis Infobyte Summer Internship Program (OIBSIP) — Cyber Security Track.
