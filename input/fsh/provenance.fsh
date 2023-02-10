Profile: IHE_QEDm_Provenance
Parent: Provenance
Id: IHE.PCC.QEDm.Provenance
Title: "QEDm Provenance"
Description: """
Provenance profile for use in QEDm when the data-elements (Resources pointed to by target) come from an XDS or MHD document.
"""
* modifierExtension 0..0
* target ^short = "The FHIR Resource elements found in the Document"
* policy 1..1
* policy = "urn:ihe:pcc:qedm:2017:document-provenance-policy"
* activity 1..1
* activity = http://hl7.org/fhir/w3c-provenance-activity-type#Derivation
* agent ^slicing.discriminator.type = #pattern
* agent ^slicing.discriminator.path = "type"
* agent ^slicing.rules = #open
* agent contains theAssembler 1..1
* agent[theAssembler] ^short = "The Assembler of the FHIR Resources"
* agent[theAssembler].type 1..
* agent[theAssembler].type = http://terminology.hl7.org/CodeSystem/provenance-participant-type#assembler
* agent[theAssembler].who 1..1
* agent[theAssembler].who only Reference(Device)
* agent[theAssembler].who ^type.aggregation[+] = #contained
* agent[theAssembler].who ^type.aggregation[+] = #referenced
* entity 1..1
* entity ^short = "The DocumentReference from which these resources came"
* entity.role = #source
* entity.what only Reference(DocumentReference)
* entity.agent 0..0
