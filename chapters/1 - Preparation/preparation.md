![05](https://progress-bar.dev/15/?title=Completeness) 

!!STILL UNDER DEVELOPMENT!!
# Preparation
Oh preparation, the most likely of all steps to be skipped, and only gets attention after the company suffered substantial losses and had to hire external consultants.

**DO NOT SKIP THIS STEP**

**Please, do it now. You will thank me later when you do not need to hire me to help you respond to an incident.**

Awesome Incident Response happens _BEFORE_ an incident occurs. Preparation is EASY AND FUN. By preparing before a crisis occurs, you can minimize impact and ensure a quick response when faced with an attack. 
Also, you will look like a hero! Awesome Incident Response requires a collaboration across multiple teams, this is not only for IT & Security (surprise!). 
This section describes how to ensure that you have the right people, capbabilities, authorities, and processes in place in order to effectively respond to a crisis. 
Then we will discuss how to test your IR capablity to validate that everything is working as expected.

### Do these 7 things now to greatly improve your ability to respond to any cyber crisis:


### 1. Develop an Incident Response Plan and exercise it:

Your company should have a comprehensive plan in place that outlines the steps to be taken in the event of a cyber attack or breach. An Awesome Incident Response Plan (IRP) should cover several key components to ensure an effective and coordinated response to cyber incidents. Here are some of the most important components to include:

* **Purpose and Scope:**
Clearly define the purpose and scope of the IRP. Outline the objectives, goals, and intended audience of the plan. Specify the types of incidents covered and any specific exclusions.
* **Roles and Responsibilities:**
Identify the key roles and responsibilities of the incident response team members and other stakeholders. This should include the CISO, incident commander, IT staff, legal counsel, public relations, and any external entities involved in the response by name, with contact information.
* **Incident Categorization and Classification:**
Establish a framework for categorizing and classifying incidents based on their severity, impact, and type. This helps in prioritizing and allocating appropriate resources for incident response. It should also specifically state who has the authority to declare an incident (vs. a security event)
* **Incident Detection and Reporting:**
Define procedures for detecting and reporting incidents. Describe the methods and tools used for monitoring, including intrusion detection systems, log analysis, and threat intelligence feeds. Specify how incidents should be reported and to whom.
* **Incident Response Procedures:**
Provide detailed step-by-step procedures for responding to different types of incidents. Reference external "Runbooks" that include specific actions, timelines, and decision-making criteria. Outline the process for incident triage, containment, eradication, and recovery.
* **Communication and Notification:**
Establish communication channels and protocols for internal and external stakeholders. Clearly define who should be notified during an incident and at what stage. Specify the methods and frequency of communication, including reporting templates and escalation procedures.
* **Resources and Contacts:**
Compile a list of internal and external resources required during incident response. This includes contact details for key personnel, service providers, law enforcement, incident response teams, and legal counsel. Include information on system inventories, network diagrams, and technical documentation.
* **Legal and Regulatory Considerations:**
Address legal and regulatory requirements related to incident response, including data protection laws, breach notification obligations, and evidence handling procedures. Ensure compliance with relevant industry standards and regulations.
* **Training and Awareness:**
Outline training and awareness programs for incident response team members and other employees. Provide guidance on recognizing and reporting security incidents, handling sensitive data, and adhering to incident response procedures.
* **Testing and Review:**
Include plans for regular testing and exercising the IRP to ensure its effectiveness. Conduct tabletop exercises, simulations, and penetration testing to validate the plan. Schedule periodic reviews and updates to incorporate lessons learned and emerging threats.
* **Document Retention:**
Define the retention and disposal policies for incident-related documentation, including logs, reports, and evidence. Ensure compliance with legal and regulatory requirements.

Remember that an IRP should be a living document, regularly reviewed and updated to reflect changes in the organization's IT environment, emerging threats, and lessons learned from previous incidents. Collaboration and coordination with relevant stakeholders are crucial for maintaining an effective incident response capability, and this document should be reviewed and updated at least yearly.


### 2. Ensure you are logging the correct events:

I have worked thousands of incidents, and I have never seen an organization that is logging all the data sources that would have been extremely helpful for the detection and/or response. Often this is because they simply do not know what to log, or a logging solution is something they have not tackled (or received expense approval for) yet. Having a logging plan is essential, as a security leader you can’t keep going back to get more budget as new applications, services, networks, or assets are introduced to your environment. These costs need to be built into the project BEFORE it was implemented, start that understanding at an executive level now. At the very basic level, you need to be logging the the most critical areas of your environment, and these logs should be located on a separate system and retained for at least 90 days. For a indepth discussion about logging, see the [Identification Chapter](./chapters/2%20-%20Identification/identification.md)

### 3. Regularly update software and systems: 

Keeping all software and systems up-to-date with the latest security patches and upgrades is essential. This includes not just operating systems, but also any applications and devices connected to the network. There should be a documented policy stating timelines for Critical, High, Medium, and Low severity software patches, with a documented exception process. Leverage asset tracking systems and your regular security assessments to validate that this process is working as intended. 

[Brian Krebs](https://krebsonsecurity.com/2011/05/krebss-3-basic-rules-for-online-safety/) Wrote "Krebs’s 3 Basic Rules for Online Safety" in 2011 and it still remains true today:

* If you didn’t go looking for it, don’t install it.
* If you installed it, update it.
* If you no longer need it, remove it.


### 4. Conduct regular security assessments:

Regular security assessments can help identify vulnerabilities in your systems before they are exploited. This can include regular penetration testing, vulnerability scans, and security audits.
At the least, Vulnerability Scanning should happen monthly, with each asset on your network being scanned at least once every quarter. Penetration testing should occur at least yearly. 


### 5. Train employees:

Regular training for all employees on cybersecurity best practices and the importance of data privacy is crucial. This will not only raise awareness about potential risks, but also help prevent incidents from happening in the first place.


### 6. Establish partnerships:

Establishing partnerships with outside experts, such as cybersecurity firms or incident response teams, can provide additional support and expertise in the event of a crisis. Having these relationships in place before an incident occurs can help ensure a rapid and effective response.


### 7. Understand what your Cyber Insurance Covers (and does not cover):
Most incident responders are technical, Awesome Incident Responders understand that a cyber incident is a Company risk. Therefore, knowing what your cyber insurance covers helps you align your incident response planning accordingly. It allows you to understand the resources and services available through your policy, such as access to incident response teams, forensic investigations, legal support, and public relations assistance. I have been a part of several incidents, where the "boots on ground" team had to stop all incident response actions, because the Cyber Insurance required their IR team to perform all actions. Knowing this prior to an incident would have helped dramatically, reduced re-work, and shortened the timeline to mitigation. This understanding ensures that your incident response plan considers the available coverage and leverages the insurance-provided resources effectively.

As the CISO, you should understand all the following regarding your Cyber Insurance:

* **Risk Management:** Cyber insurance is an integral part of an organization's risk management strategy. By understanding the coverage provided by your policy, you can assess the risks that are adequately mitigated and those that require additional measures. It helps you identify potential gaps in coverage and make informed decisions about risk transfer and risk mitigation strategies.
* **Financial Protection:** Cyber incidents can result in significant financial losses, including costs associated with incident response, legal fees, regulatory fines, data breach notification, credit monitoring, public relations, and potential lawsuits. By understanding your cyber insurance coverage, you can assess whether your policy adequately protects your organization from these financial liabilities. It allows you to determine the extent to which your policy will cover the expenses related to a cyber incident, reducing the financial impact on your organization.
* **Incident Response Planning:** Knowing what your cyber insurance covers helps you align your incident response planning accordingly. It allows you to understand the resources and services available through your policy, such as access to incident response teams, forensic investigations, legal support, and public relations assistance. This understanding ensures that your incident response plan considers the available coverage and leverages the insurance-provided resources effectively.
* **Contractual Obligations:** Many organizations have contractual agreements with clients, vendors, or business partners that require them to maintain specific cyber insurance coverage. By understanding the coverage provided by your policy, you can ensure compliance with contractual obligations. It enables you to confirm that your insurance meets the requirements stipulated in your contracts and provides the necessary coverage to fulfill your obligations.
* **Risk Transfer Assessment:** Cyber insurance is a means of transferring some of the financial risks associated with cyber incidents to an insurance provider. Understanding the coverage and exclusions of your policy helps you assess the risks that remain with your organization and determine if additional risk transfer measures are necessary. This may involve implementing additional security controls, seeking supplementary insurance coverage, or considering alternative risk management strategies.
* **Incident Response Coordination:** During a cyber incident, coordinating with your insurance provider can be crucial. Understanding your cyber insurance coverage enables you to initiate timely communication with your insurer, report the incident, and understand the necessary steps to take to invoke coverage. It streamlines the coordination between your internal incident response team and the insurance provider, ensuring a smooth claims process.


