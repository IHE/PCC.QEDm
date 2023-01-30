
###Issues

IHE welcomes [New Issues](https://github.com/IHE/QEDm/issues/new/choose) from the GitHub community. 
For those without GitHub access, issues may be submitted to the [PCC Public Comment form](https://www.ihe.net/PCC_Public_Comments/).

As issues are submitted they will be managed on the [PIXm GitHub Issues](https://github.com/IHE/QEDm/issues), where discussion and workarounds may be found. These issues, when critical, will be processed using the normal [IHE Change Proposal](https://wiki.ihe.net/index.php/Category:CPs) management and balloting. 
It is important to note that as soon as a Change Proposal is approved, it carries the same weight as a published Implementation Guide (i.e., it is testable at an [IHE Connectathon](https://www.ihe.net/participate/connectathon/) from the time it is approved, even if it will not be integrated until several months later).

#### Open Issues and Questions
These issues were known as part of the publication and IHE invites comments.

- QEDm_012: Currently QEDm does not constrain the FHIR Resources. This has
been deliberately done due to the limited experience (Trial
Implementation) with these FHIR Resources. There will be an effort
during the spring and summer of 2019 to add constraints on the FHIR
Resources. These constraints will be international, with support for
Volume 4 regional constraints. These constraints will be based on
original QED use-cases, original QED constraints, HL7 Implementation
Guide for US-Core, and regional experience. All are encouraged to
participate in this effort. Participate by joining the PCC technical
workgroup, and by interacting with the GitHub https://github.com/IHE/QEDm.

Should future releases of the HL7 FHIR profile for ODH be modified as
International Realm, this profile will be updated to point to those
updated profiles. The scope of the modifications in the IHE ODH profiles
is to reference ‘Patient’ instead of US Core Patient, and to reference
the 3 US-Centric value sets with binding of ‘example’ rather than
‘required’:

   - Occupation

   - Industry

   - Supervisory Level or Pay Grade

Occupation, Industry, and Work Classification value sets may vary by
jurisdiction. The US CDC census valuesets are provided as an ‘example
binding’. There is no apparent specification for an expression of
‘concept domain’, which is leveraged by multiple IHE QRPH and PCC
profiles as a method to allow for jurisdictions to specify other value
sets.

#### Closed Issues
These issues have been resolved and documented in the publication.

**QEDm_011:** For the Medications Option, should we add split in two distinct options and add a specific query to the Medication Resource?

- In the current specification, the Medication Option includes both queries for the medication request and the medication statement. It was discussed if those should each be a distinct option.
   - Resolution: In the trial implementation version of this profile, it was decided to keep those as a single option and consider implementers feedback if they need to be split.

- Current specification allows to retrieve the Medication Resource related to each MedicationRequest or MedicationStatement by performing a query by ‘patient’ for those resources and by supporting the “\_include” of the related Medication into the returned Bundle. It was discussed the need to include a specific query for the Medication Resource, along with query parameters for searching on Medication such as: code, ingredient, container, form…
   - Resolution: It was decided in the Trial implementation version to not include a specific query for the Medication Resource and consider implementer’s feedback if such a query was needed.