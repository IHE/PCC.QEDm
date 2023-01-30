
### Issues

IHE welcomes [New Issues](https://github.com/IHE/QEDm/issues/new/choose) from the GitHub community. 
For those without GitHub access, issues may be submitted to the [PCC Public Comment form](https://www.ihe.net/PCC_Public_Comments/).

As issues are submitted they will be managed on the [QEDm GitHub Issues](https://github.com/IHE/QEDm/issues), where discussion and workarounds may be found. These issues, when critical, will be processed using the normal [IHE Change Proposal](https://wiki.ihe.net/index.php/Category:CPs) management and balloting. 
It is important to note that as soon as a Change Proposal is approved, it carries the same weight as a published Implementation Guide (i.e., it is testable at an [IHE Connectathon](https://www.ihe.net/participate/connectathon/) from the time it is approved, even if it will not be integrated until several months later).

#### Open Issues and Questions
These issues were known as part of the publication and IHE invites comments.

**QEDm_012:** Currently QEDm does not constrain the FHIR Resources. This has
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
   - **Resolution:** In the trial implementation version of this profile, it was decided to keep those as a single option and consider implementers feedback if they need to be split.

- Current specification allows to retrieve the Medication Resource related to each MedicationRequest or MedicationStatement by performing a query by ‘patient’ for those resources and by supporting the “\_include” of the related Medication into the returned Bundle. It was discussed the need to include a specific query for the Medication Resource, along with query parameters for searching on Medication such as: code, ingredient, container, form…
   - **Resolution:** It was decided in the Trial implementation version to not include a specific query for the Medication Resource and consider implementer’s feedback if such a query was needed.
   
**QEDm_001:** Agree on the list of requirements for QEDm by comparing with QED.
- **Resolution:** 

|    | Requirements                                                               | QED                  | QEDm                                      |
|----|----------------------------------------------------------------------------|----------------------|-------------------------------------------|
| 1  | Support __listing__ of Problems, Medications, Allergies, Med-Allergies     | Yes                  | Yes, by using the FHIR COndition Resource |
| 2  | Supports __listing__ of rest of DE (Data-element) per full QED List        | Yes                  | Yes                                       |
| 3  | Supports __listing__ of additional DE per DAF (Access Framework) resources | No                   | Yes, almost                               |
| 4  | Supports access to DE across DAF/US Core defined resource                  | No                   | To be decided                             |
| 5  | Identifies source documents from where DE was extracted, if any.           | Yes, but not clearly | Yes                                       |
| 6  | Selects source documents for scope of query                                | No                   | Yes                                       |
| 7  | Flag in response that auto de-duplication has happen by clinical DE source | No                   | No (Closed Issue)                         |
| 8  | Shows specific DEs that have been auto de-duplicated                       | No? (not with RECON) | No, too complex                           |
{:.grid .table-striped}


**QEDm_002:** Scope Listing of Data Elements
Which is the best approach in specifying the QEDm query transaction and complementary provenance information? 
FHIR  allows essentially two approaches (querying strategies in FHIR STU3):
1. Querying ‘named’ Lists of resources (‘Operations’)
2. Querying directly the underlying resources

Considerations:
- Only the support for listing Resources has sense from a clinical point of view (see Issue QEDm:001 - requirements 1,2,3)
- FHIR List resource enumerates a flat collection of resources and provides features for managing the collection. While a particular List instance may represent a "snapshot", from a business process perspective the notion of "List" is dynamic – items are added and removed over time. The list resource references other resources. Lists may be curated and have specific business meaning (see [here](https://www.hl7.org/FHIR/list.html#queryfor) more comments).
- **Resolution:** Basic remains the goal and Argonauts doesn’t consider ‘curated lists’ (aka ‘named’ Lists of resources) as a basic function   start consider querying directly the underlying resources


**QEDm_003:** which are the QEDm query parameters to consider for accessing Data Elements (Resources)?
- **Resolution:** try to replicate QED functionalities according to the query strategy adopted.


**QEDm_004:** To define the core set of FHIR resources that align with QED and related QEDm’s options

- Resolution strategy:
   - consider a subset of FHIR Resources: the stable ones.
(keep in the Supplement the complete table to make evident all open issues about Resources until the final review: see “Classification of Information” section for more details)
   - consider the STU3 version of Resources



***QEDm_004: To define the core set of FHIR resources that align with
QED and related QEDm’s options***

> *Resolution strategy:*

-   *consider a subset of FHIR Resources: the stable ones.  
    (keep in the Supplement the complete table to make evident all open
    issues about Resources until the final review: see “Classification
    of Information” section for more details)*

-   *consider the STU3 version of Resources.*

> *Comments:*
>
> *Here below a comparison table between the current clinical
> information classification/options from QED, QEDm and FHIR Resources.*
>
> *Alternative classifications from Argonauts and US Core
> projects/initiatives have been considered and discussed.*

<table>
<colgroup>
<col style="width: 32%" />
<col style="width: 24%" />
<col style="width: 43%" />
</colgroup>
<thead>
<tr class="header">
<th>QED Option</th>
<th>QEDm Option</th>
<th>FHIR Resource/Profile</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Vital Signs</td>
<td>Simple Observations</td>
<td><p>Observation</p>
<p>(Vital Signs are profiled Observations)</p></td>
</tr>
<tr class="even">
<td>Diagnostic Results</td>
<td>Diagnostic Results Option</td>
<td><a
href="http://hl7.org/fhir/us/core/StructureDefinition-us-core-diagnosticreport.html">DiagnosticReport</a></td>
</tr>
<tr class="odd">
<td rowspan="2">Problems and Allergies</td>
<td>Allergy and Intolerances</td>
<td>AllergyIntolerance</td>
</tr>
<tr class="even">
<td>Conditions</td>
<td>Condition</td>
</tr>
<tr class="odd">
<td>Medications</td>
<td>Medications</td>
<td><p>Medication</p>
<p>MedicationStatement</p>
<p>MedicationRequest</p></td>
</tr>
<tr class="even">
<td>Immunizations</td>
<td>Immunizations</td>
<td>Immunization</td>
</tr>
<tr class="odd">
<td rowspan="2">Professional Services</td>
<td>Procedures</td>
<td>Procedures</td>
</tr>
<tr class="even">
<td>Encounters</td>
<td>Encounter</td>
</tr>
<tr class="odd">
<td></td>
<td>Provenance</td>
<td>Provenance</td>
</tr>
<tr class="even">
<td></td>
<td></td>
<td>Goals not considered</td>
</tr>
<tr class="odd">
<td></td>
<td></td>
<td>Assessment and Plan not considered</td>
</tr>
<tr class="even">
<td></td>
<td></td>
<td>CareTeam not considered</td>
</tr>
<tr class="odd">
<td></td>
<td></td>
<td><a
href="http://hl7.org/fhir/us/core/StructureDefinition-us-core-pract.html">Practitioner</a>
not considered</td>
</tr>
<tr class="even">
<td></td>
<td></td>
<td><a
href="http://hl7.org/fhir/us/core/StructureDefinition-us-core-organization.html">Organization</a>
not considered</td>
</tr>
<tr class="odd">
<td></td>
<td></td>
<td><a
href="http://hl7.org/fhir/us/core/StructureDefinition-us-core-location.html">Location</a>
not considered</td>
</tr>
</tbody>
</table>

> ***Resolution:***

-   ***Only a core-set of FHIR resources will be considered,
    consequently only a limited number of options are going to be
    specified. See the table above.***
