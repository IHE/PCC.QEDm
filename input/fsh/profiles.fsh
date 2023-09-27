Profile: IHE_QEDm_Provenance
Parent: Provenance
Id: IHE.QEDm.Provenance
Title: "QEDm Provenance"
Description: "Provenance profile for use in QEDm when the data-elements (Resources pointed to by target) come from an XDS or MHD document. See [Profile Description](http://wiki.ihe.net/index.php/Query_for_Existing_Data_for_Mobile)"
* ^url = "https://profiles.ihe.net/PCC/QEDm/StructureDefinition/IHE.QEDm.Provenance"
* ^status = #draft
* ^date = "2019-07-09"
* ^publisher = "Integrating the Healthcare Enterprise (IHE)"
* ^contact[0].name = "IHE"
* ^contact[=].telecom.system = #url
* ^contact[=].telecom.value = "http://ihe.net"
* ^contact[+].name = "John Moehrke"
* ^contact[=].telecom.system = #email
* ^contact[=].telecom.value = "JohnMoehrke@gmail.com"
* ^copyright = "IHE [Intellectual Property rules/rights](http://www.ihe.net/Governance/#Intellectual_Property)"
* . 1..1
* policy 1..1
* policy = "urn:ihe:pcc:qedm:2017:document-provenance-policy" (exactly)
* agent ^label = "assembler"
* agent ^slicing.discriminator.type = #pattern
* agent ^slicing.discriminator.path = "type"
* agent ^slicing.description = "Assembler of the FHIR Resources"
* agent ^slicing.rules = #open
* agent contains theAssembler 1..1
* agent[theAssembler].type 1..
* agent[theAssembler].type = $provenance-participant-type#assembler
* agent[theAssembler].who only Reference(Device)
* agent[theAssembler].who ^short = "Service identity"
* agent[theAssembler].who ^definition = "Device Resource identifying the extraction device. This should be by reference to a known Device Resource by may be a contained resource or an identifier."
* agent[theAssembler].who ^type.aggregation[0] = #contained
* agent[theAssembler].who ^type.aggregation[+] = #referenced
* agent[theAssembler].who.reference 1..
* entity 1..1
* entity.role = #source (exactly)
* entity.agent ..0