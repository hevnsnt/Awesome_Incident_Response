![35](https://progress-bar.dev/35/?title=Completeness) 

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

I have worked thousands of incidents, and I have never seen an organization that is logging all the data sources that would have been extremely helpful for the detection and/or response. Often this is because they simply do not know what to log, or a logging solution is something they have not tackled (or received expense approval for) yet. Having a logging plan is essential, as a security leader you can’t keep going back to get more budget as new applications, services, networks, or assets are introduced to your environment. These costs need to be built into the project BEFORE it was implemented, start that understanding at an executive level now. At the very basic level, you need to be logging the the most critical areas of your environment, and these logs should be located on a separate system and retained for at least 90 days. This is not an authoritative list, but here is a good start on what you should be logging in your environment, and why.

#### Authentication (Active Directory, Identity Providers, Application, CASB, etc.) 
If a user logs into it, you should have that log. Luckily for us, most of the authentication systems do a pretty good job of this. Authentication logs specifically are a subset of all log data that provide information about attempts to verify identity and access systems. The following are some of the key reasons why logging these authentication systems is important to incident response:

* Identifying Unauthorized Access: Authentication logs record each login attempt to a system, including successful and unsuccessful attempts. These logs can help identify cases where an unauthorized user has gained access to a system, or attempted to do so.
* Tracking User Behavior: By recording when and where users log in, authentication logs can help identify anomalous behavior that could indicate a security incident. For example, if a user suddenly logs in from an unfamiliar location, or at a strange time, this could indicate that their account has been compromised.
* Investigating Account Compromise: In the event of a suspected account compromise, authentication logs can provide crucial evidence. They can show when the compromise may have occurred and any actions that were taken by the compromised account.
* Monitoring Privileged Accounts: Authentication logs are particularly important for tracking the activities of privileged accounts, which have the ability to make significant changes to systems. Any misuse of privileged accounts can have serious consequences, so close monitoring of these accounts is crucial.
* Validating User Claims: If a user reports a suspected security incident, authentication logs can help validate their claims. For example, if a user believes that they have been locked out of their account, the logs can show whether there have been multiple failed login attempts.
* Proving Compliance: Many regulatory frameworks require the collection and analysis of authentication logs to prove that only authorized individuals have access to certain information. This can be important for proving compliance with these frameworks and avoiding penalties.
* Post-Incident Analysis: After an incident has been resolved, authentication logs can be used to perform a post-mortem analysis. This can help to identify how the incident occurred, whether it could have been prevented, and what measures can be put in place to prevent similar incidents in the future.

#### Firewalls
If a packet can go to it, you should have a log. Firewall logs are a critical component in a comprehensive security strategy and play a vital role in incident response for several reasons:

* Identifying Attack Vectors: Firewall logs can help identify the methods or paths that attackers are using to try to gain unauthorized access to a network. These logs record all incoming and outgoing traffic, so they can show if there are any repeated attempts from a certain IP address or a particular type of traffic that is being blocked frequently.
* Detecting Unusual Traffic Patterns: Firewall logs can be used to establish a baseline of what is considered 'normal' network traffic. Once this baseline is established, any deviations from this pattern can be easily identified. This could indicate a potential security incident, such as a Distributed Denial of Service (DDoS) attack, data exfiltration, or attempts to exploit a vulnerability.
* Investigating Security Incidents: When a security incident occurs, firewall logs can provide crucial evidence to help understand the incident. They can show when the incident began, which systems were involved, and what kind of traffic was associated with the incident.
* Proving Regulatory Compliance: Many regulatory frameworks require organizations to maintain and review their firewall logs regularly. Regular review of firewall logs can show auditors that the organization is monitoring its network traffic and taking steps to prevent unauthorized access.
* Preventing Future Attacks: By understanding the tactics used in past attacks (which can be gleaned from firewall logs), organizations can better protect themselves against future attacks. They can update firewall rules to block similar traffic in the future, or they can implement additional security measures if necessary.
* Incident Response and Forensics: Firewall logs often serve as a starting point for incident response activities, providing valuable information about the origin, targets, and nature of an attack. Furthermore, in a forensic investigation, firewall logs help trace back the attacker's steps and actions.

#### Proxy / Webfiltering Solutions (DNS)
If a user visits a website (or attempts to resolve a DNS name) you should have a log of who did it, when, and from what system. Proxy and web content filter logs are fundamental components in network security, and they play a significant role in incident response and ongoing security operations. Here's why:

* Identifying Malicious Websites or Content: Proxy or web content filter logs can help identify when users have attempted to access potentially harmful websites or download malicious content. These logs record all requests, so they can show if a user has attempted to visit a blacklisted site, or if a particular type of content is being blocked regularly.
* Detecting Data Exfiltration: Unusually large amounts of data being sent to an external website may be a sign of a data breach. Web content filters and proxies can log these data transfers, and by monitoring these logs, anomalies can be detected and investigated.
* Monitoring User Behavior: These logs provide insight into user behavior, which can be used to detect potentially suspicious activity. For instance, multiple attempts to access blocked websites or unusual browsing activity could suggest a compromised account or insider threat.
* Investigating Security Incidents: When a security incident occurs, proxy and web content filter logs can provide valuable information to help understand the event. For example, they can provide details about a phishing attempt or the source of malware.
* Maintaining Compliance: Regulatory frameworks often require organizations to control and monitor web access and content. Logs from proxies and web content filters can provide the evidence needed to demonstrate compliance with these requirements.
* Improving Policy: By analyzing web content filter logs, organizations can gain insight into the types of websites and content users are attempting to access. This can inform decisions about which sites should be blocked or allowed, helping to improve the organization's web use policy.
* Incident Response and Forensics: In incident response, these logs help identify the origin, nature, and timeline of an attack. During forensic investigations, they can reveal the attacker's steps and behavior patterns, helping to remediate the issue and prevent future incidents.

#### Security Tools (IDS/IPS, DLP, Zeek, etc.)

* Threat Detection: IDS, IPS, and DLP systems monitor network and system activities for malicious actions or policy violations. Logs from these tools provide information about detected threats, helping security teams to quickly identify and respond to potential security incidents.
* Incident Investigation: In the event of a security incident, logs from these tools can provide crucial forensic evidence. They can help trace the origin of an attack, the systems or data that were targeted, the tactics used by the attacker, and the timeline of the incident.
* Preventing Future Attacks: By analyzing the logs, security teams can gain insights into the tactics and techniques used by attackers. This information can be used to improve the organization's defenses and prevent similar attacks in the future.
* Regulatory Compliance: Many regulatory frameworks require organizations to monitor their systems for potential security threats. Logs from IDS, IPS, and EDR tools can provide the evidence needed to demonstrate compliance with these regulations.
* Performance Tuning: Logs from these systems can help to identify performance issues or false positives/negatives. This can help security teams to adjust the system settings or update the rules to improve performance and accuracy.
* Alerting: Security logs can be used to generate alerts for suspicious activity, allowing security teams to respond promptly to potential threats. They can also be set to trigger automatic responses, such as blocking a suspicious IP address or quarantining a compromised system.
* Maintaining Security Posture: The continuous monitoring and logging of these tools help organizations maintain a strong security posture by keeping track of potential threats and malicious activities.
* Incident Response and Forensics: The logs from these tools provide valuable insights into the specifics of a cyber attack, often serving as a starting point for incident response activities. They play a pivotal role in forensic investigations, helping to understand the attacker's steps and behavior.

#### VPN Connections
Logs from Virtual Private Networks (VPNs) play a crucial role in cybersecurity and incident response. Here's why:

* User Authentication: VPN logs provide a record of every user who has attempted to access the network, including both successful and unsuccessful attempts. This data can be used to identify unauthorized access attempts or to verify user claims.
* Location Tracking: VPNs usually log the IP address that a user is connecting from. This information can be useful for identifying where users are accessing the network from, and if there are any unexpected or unauthorized access attempts from unfamiliar locations.
* Session Duration: By logging how long users are connected to the VPN, organizations can identify any unusual patterns, such as connections that last for unusually long periods, which might suggest a system has been compromised.
* Bandwidth Usage: Monitoring the amount of data sent over a VPN connection can help identify potential data breaches. A sudden increase in data being sent over a VPN could indicate data exfiltration.
* Troubleshooting: VPN logs can be useful for identifying the cause of technical issues. For instance, if users are experiencing slow connection speeds or are unable to connect, the logs can be checked for potential reasons.
* Compliance: Many regulatory frameworks require companies to log access to their network for auditing purposes. VPN logs can provide evidence of compliance with these requirements.
* Incident Response and Forensics: In the event of a security incident, VPN logs can be crucial for understanding the nature of the attack, tracing the source, and developing appropriate countermeasures. They play a vital role in forensic investigations, providing valuable insights into the incident.

#### Anti-Malware / EDR
Suprisingly, Anti-Malware and Endpoint Detection and Response (EDR) logs are kind of a highly-contested component in IR circles.  Some people say "why do I need to see the logs of what it blocked?".  I think quite the opposite. Imagine all the layers in your security stack, the AV/EDR is often your last line of defense, and shows you what made it all the way through. Please keep them, you'll need them. 

* Threat Detection and Identification: These logs record the detection of potential malware or suspicious behavior on endpoints. They provide essential details such as the type of malware detected, the affected files or processes, and the actions taken by the software (e.g., quarantine, deletion).
* Investigating Incidents: In the event of a security incident, these logs can provide crucial forensic evidence. They can help trace the origin of a malware infection, the systems or data that were affected, the behavior of the malware, and the timeline of the incident.
* Remediation Efforts: Anti-Malware/EDR logs provide valuable information about the malicious software or actions that have been taken on an infected system. This information can aid in the remediation process by identifying what needs to be cleaned, restored, or patched.
* Performance Monitoring: Logs can provide insights into the performance of the anti-malware or EDR solution itself, including how often it scans, how many threats it detects, and whether it's up to date. This can help identify any issues with the solution that may need addressing.
* Regulatory Compliance: Many regulatory frameworks require organizations to have anti-malware controls in place and to be able to demonstrate their effectiveness. Logs from these tools can provide the evidence needed to demonstrate compliance with these requirements.
* Trend Analysis and Predictive Security: By analyzing these logs over time, security teams can identify trends in threats faced by the organization. This can inform future security measures, such as additional training in specific threat areas.
* Incident Response and Forensics: Anti-Malware/EDR logs are pivotal in incident response activities as they provide detailed information about the incident, including the type of malware, its behavior, and the affected endpoints. These details are valuable for forensic investigations and help design strategies to prevent similar incidents in the future.

#### Endpoint Command Line (Often overlooked, but is a GOLDMINE for Awesome Incident Response)
Ooooooooh command line logs.  When we have them the identificaiton phase goes so soothly.  Guess how often we have them?  Normally, this answer would be **NEVER** but over the last couple years, more and more EDR systems have been keeping them.  Thank you!

* Detecting Malicious Activity: Many types of malware and attacks involve the execution of suspicious commands. Monitoring and logging command line activity can help to detect these activities. For instance, certain types of commands, such as those that disable security controls or establish remote connections, may indicate malicious activity.
* Investigating Incidents: Command-line logs can provide critical forensic evidence in the event of a security incident. They can help trace the actions taken by an attacker, the systems or data that were targeted, and the timeline of the incident.
* Understanding Attacker Techniques: By examining the command-line activities recorded in the logs, security analysts can gain insights into the techniques, tactics, and procedures (TTPs) used by attackers. This understanding can inform the development of new defensive measures or the enhancement of existing ones.
* Identifying Insider Threats: Abnormal command line activity can also indicate malicious actions by an insider. For example, a user running commands they typically do not use or do not have the necessary permissions for could suggest an insider threat.
* Compliance: Certain regulations may require the logging and monitoring of user activities, including command-line activities. Command-line logs can provide evidence needed to demonstrate compliance with these regulatory requirements.
* Prevention of Future Attacks: Command-line logs offer visibility into the past actions of an attacker, which can be used to prevent similar future attacks. By analyzing these logs, security teams can develop new rules and heuristics to identify similar activities in the future.
* Incident Response and Forensics: These logs provide granular details about actions performed on an endpoint, which can be critical during incident response and forensic investigations. They help understand the attacker's steps and behavior, aiding in timely remediation and future prevention.

#### DHCP
* IP Address Tracking: DHCP logs contain information about the allocation of IP addresses within the network. If a security incident occurs, this information can help identify the device involved.
* Device Identification: DHCP logs often include the MAC address of devices, providing a way to identify a particular device within the network. This can be useful when dealing with rogue devices or tracking down a device involved in a security incident.
* Identifying Anomalous Activity: Unusual DHCP activity, such as an unexpected surge in IP address requests, can be an indicator of malicious activity. For example, a sudden influx of requests could suggest a Denial of Service (DoS) attack, or the presence of a worm spreading through the network.
* Network Troubleshooting: DHCP logs can also help in troubleshooting network connectivity issues. They can show if and when a device has been assigned an IP address, which can help identify potential network configuration problems.
* Compliance: For some industries, logging of DHCP transactions is a requirement for regulatory compliance. For instance, if an audit requires an organization to account for data flow within the network, DHCP logs can provide some of the necessary information.
* Incident Response and Forensics: DHCP logs are instrumental during a cybersecurity incident response. They help in identifying which devices were assigned which IP addresses at the time of the incident, helping to trace back potential threat actors. They're also important for forensic investigations, offering vital information about the network activities at a specific time.

### Email Filtering / Spam Filtering
* Detecting Malicious Content: Email filters log messages that are marked as spam, contain malware, or fit other configured detection rules. These logs can provide insights into the types of malicious content that are being sent to users and how effective the filtering rules are.
* Tracking Phishing Attempts: Email filters often include features to detect phishing attempts, which are then logged. If a user reports a suspicious email, these logs can be used to verify whether it was marked as phishing and whether similar emails are being sent to other users.
* Investigating Data Breaches: If an organization suffers a data breach, email filtering logs can be used to help determine if the breach was the result of a malicious email. They can also provide information on who received and interacted with the email.
* Improving Filtering Rules: By regularly reviewing email filtering logs, organizations can improve their detection and filtering rules. For instance, if a particular type of phishing email is consistently making it through the filter, the logs can provide insights into why this is happening.
* Compliance: Some regulations require companies to take reasonable measures to protect against threats delivered via email. Email filtering logs can provide evidence of these protective measures.
* Incident Response and Forensics: In incident response, email filtering logs can provide crucial information about the origin and nature of the malicious email, and the targeted individuals. For forensic investigations, these logs help in understanding the timeline and the impact of the incident.

### Webservers / Application servers
* Identifying Malicious Activity: Web server logs record all requests made to the server. This includes requests that are associated with known malicious activity, such as SQL injection or cross-site scripting attacks. By examining these logs, it's possible to identify such attacks and take appropriate action.
* Incident Investigation: If a security incident occurs, web server logs can provide valuable forensic information. They can show what requests were made, when, and by whom. This can help determine the origin of an attack, what the attacker accessed or attempted to access, and how they interacted with the server.
* Tracking User Activity: Web server logs can be used to track user activity on the site. This can help identify any unusual behavior, such as repeated login attempts, that might indicate a security threat.
* Error Detection: These logs often record server errors. By examining these errors, it may be possible to identify potential security vulnerabilities that need to be addressed. For instance, repeated errors could suggest an ongoing attack or a part of your system that needs patching.
* Performance Monitoring: By reviewing the web server logs, you can monitor the load on the server and how quickly it's able to respond to requests. This can provide valuable information about the server's performance, which could be useful for identifying potential denial of service (DoS) attacks.
* Regulatory Compliance: Certain regulations require businesses to keep detailed logs of activity on their web servers. These logs can provide the necessary documentation to demonstrate compliance during an audit.
* Incident Response and Forensics: Web server logs are vital during a cybersecurity incident response, helping to identify the root cause, understand the nature of the attack, and create a timeline of the incident. During forensic investigations, they provide essential details that help understand the attacker's tactics and behavior, which aids in future prevention.


### Servers (Cloud and On-prem)
* Detecting Unauthorized Access: Cloud server logs record all attempts to access the server, both successful and unsuccessful. Unusual access patterns, such as login attempts from unfamiliar locations or at odd times, could indicate unauthorized access attempts.
* Incident Investigation: In the event of a security incident, cloud server logs provide crucial evidence that can help trace the source of the attack, the systems or data that were targeted, and the timeline of the incident.
* Monitoring User Activity: Cloud server logs provide visibility into the activities of users and applications within the cloud environment. This can help identify any unusual or potentially malicious behavior.
* Resource Usage: Cloud server logs provide detailed information about resource usage, such as CPU, memory, and network bandwidth. An unexpected spike in resource usage could indicate a potential security issue, such as a denial of service (DoS) attack or a compromised server running a malicious workload.
* Configuration Changes: Logs record changes made to the server or application configurations. Unapproved or malicious changes are often a sign of a security incident and can provide clues for investigators during a security incident.
* Compliance and Auditing: Many regulatory frameworks require organizations to maintain logs of activities in their IT environments, including the cloud. Cloud server logs can provide the necessary documentation to demonstrate compliance with these regulations.
* Incident Response and Forensics: In the event of a cybersecurity incident, cloud server logs are instrumental for incident response and forensic investigations. They help in understanding the incident, identifying affected systems, tracing back the attacker's actions, and aiding in the timely resolution and recovery from the incident.

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


