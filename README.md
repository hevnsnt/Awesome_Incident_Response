# Awesome Incident Response [![Awesome](https://cdn.rawgit.com/sindresorhus/awesome/d7305f38d29fed78fa85652e3a63e154dd8e8829/media/badge.svg)](https://github.com/sindresorhus/awesome)
<img align="right" src="./images/awesome-incident-response.png" width="200" alt="Awesome Incident Response" title="Awesome Incident Response">
Welcome to "Awesome Incident Response" the ultimate open-source repository designed to simplify and guide you through the intricate world of incident response! Whether you're a seasoned cybersecurity professional or an aspiring enthusiast, this comprehensive collection of resources and tutorials will equip you with the knowledge and skills to effectively handle and mitigate security incidents. These strategies were developed with several decades of incident response experience and should guide you well through any type of cyber security incident, and pulls text and images from multiple sources that will be cited. 
<br /><br />

**Using this Guide:**

The main page (this page) should be considered the consolidated aka the "For Dummies" version of the Awesome Incident Response guide. Each phase of Awesome Incident Response is described and gives you the best practices needed for an effecient and effective response.  But if you want more detail, or need additional guidance, each section will have a [Read More] that will go more in depth.

This curated list of tools and resources is aimed to help security leaders, analysts, and [DFIR](http://www.acronymfinder.com/Digital-Forensics%2c-Incident-Response-%28DFIR%29.html) teams, and is always a work in progress. I hope you find this valuable, and as always Pull requests are encouraged and appreciated!


[-Bill (hevnsnt)](https://github.com/hevnsnt/Awesome_Incident_Response/blob/main/author.md)

---
**FUNDING:** 

If you believe that a community driven, open-sourced, and validated "Awesome Incident Response" resource is valuable for the internet to reference, please consider supporting this project. You can find more information for supporting the project in the right-sidebar, or by clicking the sponsor button below.  Anything you contribute is greatly appreciated and goes 100% to supporting this project!

![18](https://progress-bar.dev/18/?title=&#37;Complete)  [![Daily Visits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2Fhevnsnt%2FAwesome_Incident_Response&count_bg=%2379C83D&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=Daily%20Visits&edge_flat=false)](https://hits.seeyoufarm.com)  [![](https://img.shields.io/github/sponsors/hevnsnt?label=Sponsor&logo=GitHub)](https://github.com/sponsors/hevnsnt)  

---
<p align="center">
<picture>
  <source media="(prefers-color-scheme: dark)" srcset="./images/Awesome-Incident-Response-Logo-Darkmode.png">
  <img alt="Text changing depending on mode. Light: 'Awesome Incident Response Logo' Dark: 'Awesome Incident Response Logo'" src="./images/Awesome-Incident-Response-Logo.png">
</picture>
</p>

## Contents
- [Preparation](https://github.com/hevnsnt/Awesome_Incident_Response/blob/main/README.md#preparation)
- [Identification](https://github.com/hevnsnt/Awesome_Incident_Response/blob/main/README.md#Identification)
- [Containment](https://github.com/hevnsnt/Awesome_Incident_Response/blob/main/README.md#containment)
- [Eradication](https://github.com/hevnsnt/Awesome_Incident_Response/blob/main/README.md#eradication)
- [Recovery](https://github.com/hevnsnt/Awesome_Incident_Response/blob/main/README.md#recovery)
- [Lessions Learned](https://github.com/hevnsnt/Awesome_Incident_Response/blob/main/README.md#lessons-learned)
- [Tools Index](https://github.com/hevnsnt/Awesome_Incident_Response/blob/main/README.md#tools-index)

---
## Preparation
Oh preparation, the most likely of all steps to be skipped, and only gets attention after the company suffered substantial losses and had to hire external consultants.

**DO NOT SKIP THIS STEP**

**Please, do it now. You will thank me later when you do not need to hire me to help you respond to an incident.**

Awesome Incident Response happens _BEFORE_ an incident occurs. Preparation is EASY AND FUN. By preparing before a crisis occurs, you can minimize impact and ensure a quick response when faced with an attack. 
Also, you will look like a super hero!

> The basic premise of incident management is to respond to an incident in a structured way. Large-scale incidents can be confusing; a structure that teams agree on beforehand can reduce chaos. Formulating rules about how to communicate and coordinate your efforts before disaster strikes allows your team to concentrate on resolving an incident when it occurs. If your team has already practiced and familiarized themselves with communication and coordination, they don’t need to worry about these factors during an incident.
> 
> --  [Google, Incident Response](https://sre.google/workbook/incident-response/)

Awesome Incident Response requires a collaboration across multiple teams, this is not only for IT & Security (surprise!). Any major cyber-incident is a Company-wide crisis, and will require support from Executives, Legal, Communications, HR, Disaster Recovery, IT Operations, Development, and Security. Make sure these people know their role during an incident, and have the authority to act.
This section describes how to ensure that you have the right people, capbabilities, authorities, and processes in place in order to effectively respond to a crisis. 
Then we will discuss how to test your IR capablity to validate that everything is working as expected.

### Do these 7 things now to greatly improve your ability to respond to any cyber crisis:

### 1. Develop an Incident Response Plan and exercise it:

Your company should have a comprehensive plan in place that outlines the steps to be taken in the event of a cyber attack or breach. An Awesome Incident Response Plan (IRP) should cover several key components to ensure an effective and coordinated response to cyber incidents. The Incident Response Plan section of the [Preparation Chapter](./chapters/1%20-%20Preparation/preparation.md#1-develop-an-incident-response-plan-and-exercise-it) goes into much more detail of what should be included in your Awesome Incident Response Plan (IRP)

After you have a plan, Exercise it!  There is a saying "Train like you fight, Fight like you trained" (or something like that). Run a table top exercise and validate the controls you put into place are working as you expected! Trust me you will find something that needs some adjustment.  Need a place to start for a TTX idea? Go visit [@badthingsdaily](https://twitter.com/badthingsdaily) and pick something that might happen to you!

### 2. Ensure you are logging the correct events:

I have worked thousands of incidents, and I have never seen an organization that is logging all the data sources that would have been extremely helpful for the detection and/or response. Often this is because they simply do not know what to log, or a logging solution is something they have not tackled (or received expense approval for) yet. Having a logging plan is essential, as a security leader you can’t keep going back to get more budget as new applications, services, networks, or assets are introduced to your environment. These costs need to be built into the project BEFORE it was implemented, start that understanding at an executive level now. At the very basic level, you need to be logging the the most critical areas of your environment, and these logs should be located on a separate system and retained for at least 90 days. For a indepth discussion about logging, see the Logging section of the [Preparation Chapter](./chapters/1%20-%20Preparation/preparation.md#2-ensure-you-are-logging-the-correct-events)

### 3. Regularly update software and systems: 

Keeping all software and systems up-to-date with the latest security patches and upgrades is essential. This includes not just operating systems, but also any applications and devices connected to the network. There should be a documented policy stating timelines for Critical, High, Medium, and Low severity software patches, with a documented exception process. Leverage asset tracking systems and your regular security assessments to validate that this process is working as intended. While I don't go into great detail in this guide, having a process for identifying vulnerabilities, deploying software updates, and regularly testing will go a long way to never having to leverage your incident response plan.


### 4. Conduct regular security assessments, and Third Party Risk Reviews:

Regular security assessments can help identify vulnerabilities in your systems before they are exploited. This can include regular penetration testing, vulnerability scans, and security audits. At the least, Vulnerability Scanning should happen monthly, with each asset on your network being scanned at least once every quarter. Penetration testing should occur at least yearly.

This isn't the Awesome Vulnerability Managment plan, so I will spare you the details. But if you want less incident response (reactive) and are looking for a proactive solution, well please patch your systems, and test them often.

Over the past couple of years, a high percentage of the incidents I have worked were because a third-party had lost control of "our" data on "their" systems. You can build the most secure environment and still be working an incident response because a vendor of yours .... didn't. Knowing WHO has WHAT data and access can greatly reduce the time to identify where a security incident originated. If you have extremely critical (or secret) data residing at a 3rd party, ensure that their standards meet yours.  Of course Cloud providers meet this criteria, but expand your thinking to include Law Firms, Accounting, Building Managment, etc. (yikes)


### 5. Train employees and setup a Secure Communications Channel:

As it pertains to Awesome Incident Response, you need to train your employees how to report security incidents, and train those individuals that have a incident response responsiblity (listed above) on their specific roles. I am trying to keep this guide focused on IR, but regular training for all employees on cybersecurity best practices and the importance of data privacy is crucial. This will not only raise awareness about potential risks, but also help prevent incidents from happening in the first place.

Now would be a good time to identify a secure messaging channel, it is my recommendation that during the initial phases of an incident, to not use any corporate messaging solutions.  I recommend [Signal](https://signal.org). Have every person identified as an Incident Response Team member ensure it is installed and tested. When you have an incident, create a new group chat with a codename related to the incident, and have the messages delete after 1 week. Often as the incident is spinning up, you are not confident on the full scope of the incident, and mistakes are made. Taking these actions will protect against the threat actor having inside information and legal discovery activities, but check with your legal team before you do this.


### 6. Establish partnerships:

Establishing partnerships with outside experts, such as cybersecurity firms or incident response teams, can provide additional support and expertise in the event of a crisis. Having these relationships in place before an incident occurs can help ensure a rapid and effective response. Right now is a good time to setup an Incident Response Retainer with an IR Firm. It can be exceedingly difficult to retain help during an incident (sometimes it can take months to get the right resources), so the sooner you have that done the better. But before you do this, please make sure you understand what your Cyber Insurance covers (and does not cover).


### 7. Understand what your Cyber Insurance Covers (and does not cover):
Most incident responders are technical, Awesome Incident Responders understand that a cyber incident is a Company risk. Therefore, knowing what your cyber insurance covers helps you align your incident response planning accordingly. It allows you to understand the resources and services available through your policy, such as access to incident response teams, forensic investigations, legal support, and public relations assistance. I have been a part of several incidents, where the "boots on ground" team had to stop all incident response actions, because the Cyber Insurance required their IR team to perform all actions. Knowing this prior to an incident would have helped dramatically, reduced re-work, and shortened the timeline to mitigation. This understanding ensures that your incident response plan considers the available coverage and leverages the insurance-provided resources effectively. The [Preparation Chapter](./chapters/1%20-%20Preparation/preparation.md#7-understand-what-your-cyber-insurance-covers-and-does-not-cover) goes into more detail on understanding your Cyber Insurance Provider.

---

## Identification
Before we _Declare_ an incident, we need to identify the severity and impact of a security _event_. This section describes the best practices for building an effective Cyber Defense team, to ensure you are correctly monitoring the _correct things_ in your environment to quickly detect events as they occur in your environment. That said, Identification is much more than monitoring, I like to think of it as identifying all of the "Indicators of Compromise" as it pertains to the incident at hand.

Being able to fully understand the scope of a security incident, we need evidence to review. When did this happen? How long ago? How many systems are impacted? Was anything exfiltrated/destroyed? Who did this?.  All of these can be answered with an Awesome Logging strategy.  The logging section of the [Preparation Chapter](./chapters/1%20-%20Preparation/preparation.md#2-ensure-you-are-logging-the-correct-events) is a good starting point of systems that should be logged.



Read More on the [Identification Chapter](./chapters/2%20-%20Identification/identification.md)

---

## Containment
The "containment" phase of incident response refers to the stage in which the primary objective is to limit the impact and scope of a security incident or breach. During this phase, the incident response team works swiftly to prevent further damage, isolate affected systems or areas, and mitigate the immediate risks associated with the incident. The containment phase is crucial in minimizing the potential harm caused by the incident and laying the foundation for subsequent recovery and remediation efforts.

Read More on the [Containment Chapter](./chapters/3%20-%20Containment/containment.md)

---

## Eradication
The "eradication" phase of incident response is the stage where the incident response team focuses on completely removing the cause of the security incident or breach from the affected systems and infrastructure. The objective is to eliminate any remnants of the attacker's presence and ensure that the environment is secure and free from vulnerabilities that could be exploited in the future. The eradication phase typically follows the containment phase and precedes the recovery and lessons learned phases.

Read More on the [Eradication Chapter](./chapters/4%20-%20Eradication/eradication.md)

---

## Recovery
The "recovery" phase of incident response refers to the stage where the focus shifts towards restoring normal business operations and returning the affected systems, networks, and data to a fully functional and secure state. The recovery phase follows the containment and eradication phases and involves activities aimed at recovering from the impact of the incident and minimizing any disruption caused to the organization. Often companies move to the recovery phase before Containment and Eradication are complete, leading to ineffective incient response and delaying a normal operating state. Do not make this mistake.

Read More on the [Recovery Chapter](./chapters/5%20-%20Recovery/recovery.md)

---

## Lessons Learned
The "lessons learned" phase of incident response is a crucial step that occurs after the incident has been resolved and normal operations have been restored. This phase focuses on reflecting on the incident response process and identifying valuable insights, improvements, and best practices to enhance future incident response efforts. The primary goal is to learn from the incident, prevent similar incidents from occurring in the future, and strengthen the overall security posture of the organization.

Read More on the [Lessons Learned Chapter](./chapters/6%20-%20Lessons%20Learned/lessonslearned.md)

---

## Tools Index
An amazing list of resources for an incident responder.
[Tools Index](./tools.md)
