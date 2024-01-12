
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
* target[+] = Reference(ex-weight-stone)
* recorded = 2023-01-25T09:49:00.000Z
// already assigned * policy = "urn:ihe:iti.mxde:2023:document-provenance-policy"
* activity = http://hl7.org/fhir/w3c-provenance-activity-type#Derivation
* agent[theAssembler].type = http://terminology.hl7.org/CodeSystem/provenance-participant-type#assembler
* agent[theAssembler].who = Reference(ex-device)
* entity[0].role = #source
* entity[0].what = Reference(ex-documentreference)

Instance: IHE-QEDm-Provenance-Example
InstanceOf: IHE_QEDm_Provenance
Description: "Provenance example for use in QEDm when the data-elements (Resources pointed to by target) come from an XDS or MHD document"
Usage: #example
* target[+] = Reference(ex-encounter)
* occurredDateTime = "2023-08-15T20:16:40+02:00"
* recorded = "2023-09-26T17:20:59.765+02:00"
* policy = "urn:ihe:pcc:qedm:2017:document-provenance-policy"
* agent[0].type = $provenance-participant-type#assembler "Assembler"
* agent[=].who = Reference(ex-device)
* entity.role = #source
* entity.what = Reference(http://example.org/fhir/DocumentReference/urn:oid:1.2.3.99.2) "CDA Document in XDS Repository"
* entity.what.type = "DocumentReference"
* entity.what.identifier.use = #official
* entity.what.identifier.system = "urn:oid:1.2.3.999"
* entity.what.identifier.value = "urn:oid:1.2.3.999.2"