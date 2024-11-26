
Instance: ex-documentreference
InstanceOf: DocumentReference
Title: "Dummy DocumentReference example"
Description: "Dummy DocumentReference example for completeness sake. No actual use of this resource other than an example target"
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* status = #current
* subject = Reference(ex-patient)
* content.attachment.title = "Hello World"
* content.attachment.contentType = #text/plain



Instance:   ex-device
InstanceOf: Device
Title:      "Dummy Device example"
Description: "Dummy Device example for completeness sake. No actual use of this resource other than an example target"
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* status = #active
* manufacturer = "Acme"
* distinctIdentifier = "Decomposer"
* version.value = "1000"

Instance: ex-provenance
InstanceOf: IHE.ITI.mXDE.Provenance
Title: "Provenance of extracted resources"
Description: "Sample of a Provenance of a set of target FHIR Resource elements derived from a DocumentReference"
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* target[+] = Reference(ex-IHE-QEDm-bloodPressure-0)
* target[+] = Reference(ex-encounter)
* target[+] = Reference(ex-weight)
* target[+] = Reference(ex-weight2)
* recorded = 2023-01-25T09:49:00.000Z
// already assigned * policy = "urn:ihe:iti.mxde:2023:document-provenance-policy"
* activity = http://hl7.org/fhir/w3c-provenance-activity-type#Derivation
* agent[theAssembler].type = http://terminology.hl7.org/CodeSystem/provenance-participant-type#assembler
* agent[theAssembler].who = Reference(ex-device)
* entity[0].role = #source
* entity[0].what = Reference(ex-documentreference)

Instance: ex-search
InstanceOf: Bundle
Title: "Example of a search set bundle"
Description: "Search on Weight Observations with reverse include requesting Provenance. This is returning two weight Observations and one Provenance."
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* type = #searchset
* link[0].relation = "self"
* link[0].url = "http://example.org/Observation?patient=ex-patient&category=http://terminology.hl7.org/CodeSystem/observation-category|vital-signs&_revinclude=Provenance:target"
* total = 3
* timestamp = 2024-11-26T11:32:24Z
* entry[+].fullUrl = "http://example.org/Observation/ex-weight"
* entry[=].resource = ex-weight
* entry[=].search.mode = #match
* entry[+].fullUrl = "http://example.org/Observation/ex-weight2"
* entry[=].resource = ex-weight2
* entry[=].search.mode = #match
* entry[+].fullUrl = "http://example.org/Provenance/ex-provenance"
* entry[=].resource = ex-provenance
* entry[=].search.mode = #include
