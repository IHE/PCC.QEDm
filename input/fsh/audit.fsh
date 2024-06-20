Invariant: val-audit-source
Description: "The Audit Source is this agent too."
Expression: "$this.who = %resource.source.observer"
Severity: #error


Profile:        AuditQedmQuerySource
Parent:         IHE.BasicAudit.Query
Id:             IHE.QEDm.Query.Audit.Source
Title:          "Audit Event for QEDm Query at Source"
Description:    """
Defines constraints on the AuditEvent (AuditMessage) Resource when a Clinical Data Source responds to a Clinical Data Query [PCC-44](./PCC-44.html).
- Build off of the IHE BasicAudit Query event
- add the PCC-44 as a subtype
- client is Clinical Data Consumer
- server is Clinical Data Source
- entity slice for query are REQUIRED
- entity slice for transaction is available
- entity for patient SHALL be used 
- source is the server
"""
* modifierExtension 0..0
* subtype 2..
* subtype contains pcc44 1..1
* subtype[pcc44] = urn:ihe:event-type-code#PCC-44 "Mobile Query Existing Data"
* agent[server] obeys val-audit-source
* agent[client] ^short = "Clinical Data Consumer"
* agent[server] ^short = "Clinical Data Source"
* entity[query] ^short = "Search Parameters"
* entity contains patient 1..1
* entity[patient].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
* entity[patient].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity[patient].what 1..1
* entity[patient].what only Reference(Patient)
* entity[patient] ^short = "Patient"


Profile:        AuditQedmQueryConsumer
Parent:         IHE.BasicAudit.Query
Id:             IHE.QEDm.Query.Audit.Consumer
Title:          "Audit Event for QEDm Query at Consumer"
Description:    """
Defines constraints on the AuditEvent (AuditMessage) Resource for a Clinical Data Consumer to record when it performs a Clinical Data Query [PCC-44](./PCC-44.html).
- Build off of the IHE BasicAudit Query event
- add the PCC-44 as a subtype
- client is Clinical Data Consumer
- server is Clinical Data Source
- entity slice for query are REQUIRED
- entity slice for transaction is available
- entity for patient SHALL be used
- source is the client
"""
* modifierExtension 0..0
* subtype 2..
* subtype contains pcc44 1..1
* subtype[pcc44] = urn:ihe:event-type-code#PCC-44 "Mobile Query Existing Data"
* agent[client] obeys val-audit-source
* agent[client] ^short = "Clinical Data Consumer"
* agent[server] ^short = "Clinical Data Source"
* entity[query] ^short = "Search Parameters"
* entity contains patient 1..1
* entity[patient].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
* entity[patient].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity[patient].what 1..1
* entity[patient].what only Reference(Patient)
* entity[patient] ^short = "Patient"


Instance: ex-auditQedmQuery-consumer
InstanceOf: IHE.QEDm.Query.Audit.Consumer
Title: "Audit Example of PCC-44 at Consumer"
Description: """
Audit Event for QEDm Query Transaction by the Patient Identifier Cross-reference Consumer

where the Query was executed with a GET as follows:

```
GET https://server.example.com/fhir/AllergyIntolerance?patient=ex-patient
Accept: application/fhir+json; fhirVersion=4.0
```
"""
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* type = http://terminology.hl7.org/CodeSystem/audit-event-type#rest "Restful Operation"
* action = #E
* subtype[anySearch] = http://hl7.org/fhir/restful-interaction#search "search"
* subtype[pcc44] = urn:ihe:event-type-code#PCC-44 "Mobile Query Existing Data"
//* severity = #Informational
* recorded = 2021-07-13T19:17:32Z
* outcome = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 "Success"
* source.site = "fancy mobile app"
* source.observer = Reference(Device/ex-device)
* source.type = http://terminology.hl7.org/CodeSystem/security-source-type#1 "User Device"
* agent[client].type = DCM#110153 "Source Role ID"
* agent[client].who = Reference(Device/ex-device)
* agent[client].requestor = false
* agent[client].network.address = "2001:0db8:85a3:0000:0000:8a2e:0370:7334"
* agent[client].network.type = http://hl7.org/fhir/network-type#2 "IP Address"
// not clear how a server uses the IUA Oauth token here
* agent[server].type = DCM#110152 "Destination Role ID"
* agent[server].who.display = "http://server.example.com/fhir"
* agent[server].requestor = false
* agent[server].network.address = "http://server.example.com/fhir"
* agent[server].network.type = http://hl7.org/fhir/network-type#5 "URI"
* entity[patient].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
* entity[patient].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity[patient].what = Reference(Patient/ex-patient)
* entity[query].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2 "System Object"
* entity[query].role = http://terminology.hl7.org/CodeSystem/object-role#24 "Query"
* entity[query].query = "R0VUIGh0dHBzOi8vc2VydmVyLmV4YW1wbGUuY29tL2ZoaXIvQWxsZXJneUludG9sZXJhbmNlP3BhdGllbnQ9ZXgtcGF0aWVudApBY2NlcHQ6IGFwcGxpY2F0aW9uL2ZoaXIranNvbjsgZmhpclZlcnNpb249NC4wCg=="



Instance: ex-auditQedmQuery-source
InstanceOf: IHE.QEDm.Query.Audit.Source
Title: "Audit Example of PCC-44 at Source"
Description: """
Audit Event for QEDm Query Transaction by the Patient Identifier Cross-reference Source

where the Query was executed with a GET as follows:

```
GET https://server.example.com/fhir/AllergyIntolerance?patient=ex-patient
Accept: application/fhir+json; fhirVersion=4.0
```
"""
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* type = http://terminology.hl7.org/CodeSystem/audit-event-type#rest "Restful Operation"
* action = #E
* subtype[anySearch] = http://hl7.org/fhir/restful-interaction#search "search"
* subtype[pcc44] = urn:ihe:event-type-code#PCC-44 "Mobile Query Existing Data"
//* severity = #Informational
* recorded = 2021-07-13T19:17:32Z
* outcome = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 "Success"
* source.site = "HIE QEDm api example"
* source.observer.display = "http://server.example.com/fhir"
* source.type = http://terminology.hl7.org/CodeSystem/security-source-type#4 "Application Server"
* agent[client].type = DCM#110153 "Source Role ID"
* agent[client].who = Reference(Device/ex-device)
* agent[client].requestor = false
* agent[client].network.address = "2001:0db8:85a3:0000:0000:8a2e:0370:7334"
* agent[client].network.type = http://hl7.org/fhir/network-type#2 "IP Address"
// not clear how a server uses the IUA Oauth token here
* agent[server].type = DCM#110152 "Destination Role ID"
* agent[server].who.display = "http://server.example.com/fhir"
* agent[server].requestor = false
* agent[server].network.address = "http://server.example.com/fhir"
* agent[server].network.type = http://hl7.org/fhir/network-type#5 "URI"
* entity[patient].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
* entity[patient].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity[patient].what = Reference(Patient/ex-patient)
* entity[query].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2 "System Object"
* entity[query].role = http://terminology.hl7.org/CodeSystem/object-role#24 "Query"
* entity[query].query = "R0VUIGh0dHBzOi8vc2VydmVyLmV4YW1wbGUuY29tL2ZoaXIvQWxsZXJneUludG9sZXJhbmNlP3BhdGllbnQ9ZXgtcGF0aWVudApBY2NlcHQ6IGFwcGxpY2F0aW9uL2ZoaXIranNvbjsgZmhpclZlcnNpb249NC4wCg=="

