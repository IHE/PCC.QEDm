
## Significant Changes

### Significant Changes from Revision 2.3 (PDF)

- Converted to an IG
- align AuditEvent with BALP
- align with mXDE as the definer of the Provenance profile

## Issues

### Submit an Issue

IHE welcomes [New Issues](https://github.com/IHE/QEDm/issues/new/choose) from the GitHub community. 
For those without GitHub access, issues may be submitted to the [PCC Public Comment form](https://www.ihe.net/PCC_Public_Comments/).

As issues are submitted they will be managed on the [QEDm GitHub Issues](https://github.com/IHE/QEDm/issues), where discussion and workarounds may be found. These issues, when critical, will be processed using the normal [IHE Change Proposal](https://wiki.ihe.net/index.php/Category:CPs) management and balloting. 
It is important to note that as soon as a Change Proposal is approved, it carries the same weight as a published Implementation Guide (i.e., it is testable at an [IHE Connectathon](https://www.ihe.net/participate/connectathon/) from the time it is approved, even if it will not be integrated until several months later).

### Open Issues

These issues were known as part of the publication and IHE invites comments.

**QEDm_012:**

Currently QEDm does not constrain the FHIR Resources. This has
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

### Closed Issues

These issues have been resolved and documented in the publication.

**QEDm_011: For the Medications Option, should we add split in two distinct options and add a specific query to the Medication Resource?**

- In the current specification, the Medication Option includes both queries for the medication request and the medication statement. It was discussed if those should each be a distinct option.
   - **Resolution:** In the trial implementation version of this profile, it was decided to keep those as a single option and consider implementers feedback if they need to be split.

- Current specification allows to retrieve the Medication Resource related to each MedicationRequest or MedicationStatement by performing a query by ‘patient’ for those resources and by supporting the “\_include” of the related Medication into the returned Bundle. It was discussed the need to include a specific query for the Medication Resource, along with query parameters for searching on Medication such as: code, ingredient, container, form…
   - **Resolution:** It was decided in the Trial implementation version to not include a specific query for the Medication Resource and consider implementer’s feedback if such a query was needed.
   
**QEDm_001: Agree on the list of requirements for QEDm by comparing with QED.**

&rarr; **Resolution:** 

|    | Requirements                                                               | QED                  | QEDm                                      |
|----|----------------------------------------------------------------------------|----------------------|-------------------------------------------|
| 1  | Support __listing__ of Problems, Medications, Allergies, Med-Allergies     | Yes                  | Yes, by using the FHIR Condition Resource |
| 2  | Supports __listing__ of rest of DE (Data-element) per full QED List        | Yes                  | Yes                                       |
| 3  | Supports __listing__ of additional DE per DAF (Access Framework) resources | No                   | Yes, almost                               |
| 4  | Supports access to DE across DAF/US Core defined resource                  | No                   | To be decided                             |
| 5  | Identifies source documents from where DE was extracted, if any.           | Yes, but not clearly | Yes                                       |
| 6  | Selects source documents for scope of query                                | No                   | Yes                                       |
| 7  | Flag in response that auto de-duplication has happen by clinical DE source | No                   | No (Closed Issue)                         |
| 8  | Shows specific DEs that have been auto de-duplicated                       | No? (not with RECON) | No, too complex                           |
{:.grid .table-striped}


**QEDm_002: Scope Listing of Data Elements**
Which is the best approach in specifying the QEDm query transaction and complementary provenance information? 
FHIR  allows essentially two approaches (querying strategies in FHIR STU3):
1. Querying ‘named’ Lists of resources (‘Operations’)
2. Querying directly the underlying resources

Considerations:
- Only the support for listing Resources has sense from a clinical point of view (see Issue QEDm:001 - requirements 1,2,3)
- FHIR List resource enumerates a flat collection of resources and provides features for managing the collection. While a particular List instance may represent a "snapshot", from a business process perspective the notion of "List" is dynamic – items are added and removed over time. The list resource references other resources. Lists may be curated and have specific business meaning (see [here](https://www.hl7.org/FHIR/list.html#queryfor) more comments).

&rarr; **Resolution:** Basic remains the goal and Argonauts doesn’t consider ‘curated lists’ (aka ‘named’ Lists of resources) as a basic function   start consider querying directly the underlying resources


**QEDm_003: Which are the QEDm query parameters to consider for accessing Data Elements (Resources)?**

&rarr; **Resolution:** try to replicate QED functionalities according to the query strategy adopted.


**QEDm_004: To define the core set of FHIR resources that align with QED and related QEDm’s options**

Resolution strategy:
 - consider a subset of FHIR Resources: the stable ones.
(keep in the Supplement the complete table to make evident all open issues about Resources until the final review: see “Classification of Information” section for more details)
 - consider the STU3 version of Resources

Comments:

Below is a comparison table between the current clinical information classification/options from QED, QEDm and FHIR Resources.

Alternative classifications from Argonauts and US Core projects/initiatives have been considered and discussed.

| QED Option                  | QEDm Option              | FHIR Resource/Profile                               |
|-----------------------------|--------------------------|-----------------------------------------------------|
| Vital Signs                 | Simple Observation       | Observation (Vital Signs are profiled Observations) |
| Diagnostic Results          | Diagnostic Results Option| DiagnosticReport                                    |
| Problems and Allergies      | Allergy and Intolerances | AllergyIntolerance                                  |
| Medications                 | Conditions               | Condition                                           |
| Immunizations               | Medications              | Medication; MedicationStatement; MedicationRequest  |
| Professional Services       | Immunizations            | Immunization                                        |
|                             | Procedures               | Procedures                                          |
|                             | Encounters               | Encounter                                           |
|                             | Provenance               | Provenance                                          |
|                             |                          | Goals &rarr; not considered                         |
|                             |                          | Assessment and Plan &rarr; not considered           |
|                             |                          | CareTeam &rarr; not considered                      |
|                             |                          | Practitioner &rarr; not considered                  |
|                             |                          | Organization &rarr; not considered                  |
|                             |                          | Location &rarr; not considered                  |
{:.grid .table-striped}

&rarr; **Resolution:** Only a core-set of FHIR resources will be considered, consequently only a limited number of options are going to be specified. See the table above.

**QEDm_005: Managing reconciliation of Data Elements**

How to record reconciliation performed on the FHIR resources returned by the QEDm query transaction?

Considerations:  
- Reconciliation of clinical data without a manual intervention has no sense. 
- An automatic algorithm could work well if limited to the data deduplication.

Consequences:
- a 'manual reconciliation' can be conceived at the Clinical Data Consumer side and it’s necessary when this actor is going to perform multiple query for gathering and merging information from different sources the reconciliation is obtained by considering a Reconciliation Agent grouped with it.
- an ‘automatic deduplication’ can be conceived as option for the Clinical Data Source*

Reconciliation/deduplication specific content is already defined by RECON. The results of reconciliation are noted in the FHIR List resource by using the FHIR Provenance resource. See the following two sections:
- PCC Vol.3: 6.6.A - FHIR Reconciled List
- PCC Vol.3: 6.6.B - FHIR Provenance Constraints

BUT:
- RECON specifications must be updated to FHIR STU3

- See also considerations about multi-stage import/reconciliation supported by the Provenance Resource: [http://hl7.org/fhir/2017Jan/provenance.html#6.2.4.6](http://hl7.org/fhir/2017Jan/provenance.html)

&rarr; **Resolution:** too complex, no reconciliation and no deduplication will be considered by QEDm (no automatic operations specified by RECON Profile)

**QEDm_006: New name for the \[PCC-44\] transaction: “Mobile Query Existing Data”?**

In order to appear more generic, it’s proposed to use the name “Mobile Query Existing Data” for the transaction \[PCC-44\] to be aligned with the QED \[PCC-2\] “Query Existing Data” transaction, just like done with PIX/PIXm and PDQ/PDQm.>

&rarr; **Resolution:** ok to rename.


**QEDm_007:How to consider the “Multi-Patient Query Option” in the query transaction?**

&rarr; **Resolution:** ok to remove this option from this year scope

**QEDm_008: Consistency – How to identify Document Sources of Data Elements**

Strategy:
Consider the FHIR Provenance resource as used in PCC-RECON: “When the Data Element comes from a Document, the ID of the document is used as the source. When the Data Element is the result of a query (such as QED), the query ID is the source.

When the data comes directly from a system, provenance may not exist because there is not a document source ID from the system. The solution is to start broad and add the “provenance” Option (source of the data). …”

&rarr; **Resolution:**

- The original Document(s) reference(s) can be supported by the Provenance.entity: http://hl7.org/fhir/STU3/provenance.html (in general each Provenance object can link N ‘target’ Resources to M ‘entity’ Documents)

- To consider also the available FHIR specifications on FHIR & XDS Documents https://www.hl7.org/FHIR/STU3/usecases.html#xds

   - specifically, the DocumentReference FHIR resource: https://www.hl7.org/FHIR/STU3/documentreference.html

- Additional considerations on query for including Provenance:

   - FHIR query on “resource” (e.g., medication), add “\_revinclude” with “Provenance”. GET \[base\]/MedicationRequest?\_revinclude=Provenance:target&criteria...Always on the GET by client and server must support.

   - For list FHIR is an “operation” (not RESTful GET). Is it worth exposing “list operations” because may be perfectly reconciled.

   - Use Doc Resource versus and/or provenance resource.

**QEDm_009: QED retirement**

&rarr; **Resolution:** it may be considered, but the timing is independent of QEDm completion

**QEDm_010: Which is the best FHIR Implementation Guide to refer?**

- Should we move to US-Core? Are they other countries/international efforts?

- Alternative is Argonaut (modified, by removing a few US specific).

Considerations:

- STU 3 ‘final’ has been released and the US Core IG has been aligned to STU3

&rarr; **Resolution:** No need to base the whole profile on US Core specific constrains. US Core resource specific profiling or other profiling can be referenced only if/when necessary.