This section corresponds to transaction [PCC-44] of the IHE Technical Framework. Transaction \[PCC-44\] is used by the Clinical Data Consumer and Clinical Data Source Actors.

### 2:3.44.1 Scope

The Mobile Query Existing Data transaction is used to query for fine
grained clinical data elements that satisfy a set of parameters by using
the FHIR framework. The result of the query is a FHIR Bundle containing
FHIR clinical data Resources that match the query parameters.

The QEDm Profile assumes that categories and codes referenced by these
FHIR Resources need to be defined at the time of deployment. The
specification of these FHIR Resources make recommendations on categories
and codes that should be considered.

### 2:3.44.2 Actor Roles

**Table: Actor Roles**

| Actor                                 | Role                                              |
|---------------------------------------|---------------------------------------------------|
| [Clinical Data Consumer](volume-1.html#client)    | Queries the Clinical Data Source for clinical data content. Clinical content requested by the Clinical Data Consumer depends on query options supported by the consumer. |
| [Clinical Data Source](volume-1.html#server) | Responds to query, supplying the FHIR Resources representing the clinical data content that match the search criteria provided by the Clinical Data Consumer. |
{:.grid .table-striped}

### 2:3.44.3 Referenced Standards

- HL7 FHIR: [FHIR standard Release 4](http://www.hl7.org/fhir/R4/index.html)
- IETF RFC2616: Hypertext Transfer Protocol – HTTP/1.1
- IETF RFC7540: Hypertext Transfer Protocol – HTTP/2
- IETF RFC3986: Uniform Resource Identifier (URI): Generic Syntax
- IETF RFC4627: The application/json Media Type for JavaScript Object Notation (JSON)
- IETF RFC6585: Additional HTTP Status Codes

### 2:3.44.4 Messages

<div>
{%include PCC-44-seq.svg%}
</div>
<br clear="all">

**Figure: 2:3.44.4-1: Interaction Diagram**

#### 2:3.44.4.1 Mobile Query Existing Data Request message
This message uses the HTTP GET method parameterized query to retrieve
FHIR Resources representing clinical data matching search parameters in
the GET request.

QEDm does not mandate any additional extended or custom method.

##### 2:3.44.4.1.1 Trigger Events

When the Clinical Data Consumer needs to discover clinical data
Resources matching various search parameters it issues a Mobile Query
Existing Data message.

##### 2:3.44.4.1.2 Message Semantics

The Clinical Data Consumer executes an HTTP GET against the proper
Clinical Data Source’s QEDm URL.

The search target follows the FHIR http specification [http://hl7.org/fhir/R4/http.html](http://hl7.org/fhir/R4/http.html), addressing the proper FHIR
Resource type, according to the supported query options (see Section
2:3.44.4.1.2.1). The syntax of the FHIR query is:

```
GET \[base\]/\[Resource-type\]{?\[parameters\]}
```

with the following constraints:

- The `\[base\]` represents the Service Base URL

- The `\[Resource-type\]` represents the name of the FHIR Resource to consider (each option can involve one or more Resources), as specified in Section 3.44.4.1.2.1

- The `\[parameters\]` represents a series of encoded name-value pairs representing the filter for the query, as specified in Section 3.44.4.1.2.1, as well as control parameters to modify the behavior of the Clinical Data Source such as response format, or pagination. See [ITI TF-2: Appendix Z.6](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.6-populating-the-expected-response-format0 for more details on response format.

###### 3.44.4.1.2.1 Query Search Paramters

All query parameter values shall be appropriately encoded per RFC3986
“percent” encoding rules. Note that percent encoding does restrict the
character set to a subset of ASCII characters which is used for encoding
all other characters used in the URL.

The FHIR Resource type or types supported by the Clinical Data Consumer
and Clinical Data Source are determined by a QEDm named option. An actor
claiming named option is required to support the FHIR Resource types
listed below. According to the supported option, the Clinical Data
Consumer may query and the Clinical Data Source shall be capable of
responding on the Resource types specified in Table 2:3.44.4.1.2.1-1 by processing
all the search parameters defined in the following sections.

The Clinical Data Source may choose to support additional query
parameters beyond the subset defined by the profiling listed below, if
done according to the core FHIR specification. Such additional
parameters are considered out of scope for this transaction. The
Clinical Data Source may ignore any additional parameter not specified
in this transaction. See [http://hl7.org/fhir/R4/search.html#errors](http://hl7.org/fhir/R4/search.html#errors).

**Table 2:3.44.4.1.2.1-1: QEDm Options, FHIR Resources and Query Search Parameters**

| QEDm Actor Option                | FHIR Resource Type           | Reference                                                                                    | Search Parameters           |
|----------------------------------|------------------------------|----------------------------------------------------------------------------------------------|-----------------------------|
| **Simple Observations**          | **Observation**              | <http://hl7.org/fhir/R4/observation.html>                                                    | See Section 3.44.4.1.2.1.1  |
| **Allergies and Intolerances**   | **AllergyIntolerance**       | <http://hl7.org/fhir/R4/allergyintolerance.html>                                             | See Section 3.44.4.1.2.1.2  |
| **Condition**                    | **Condition (See Note 1)**   | <http://hl7.org/fhir/R4/condition.html>                                                      | See Section 3.44.4.1.2.1.3  |
| **Diagnostic Results**           | **DiagnosticReport**         | <http://hl7.org/fhir/R4/diagnosticreport.html>                                               | See Section 3.44.4.1.2.1.4  |
| **Medications**                  | **Medication:**              | <http://hl7.org/fhir/R4/medication.html>                                                     | See Section 3.44.4.1.2.1.5  |
|                                  | **Medication Statement**     | <http://hl7.org/fhir/R4/medicationstatement.html>                                            |                             |
|                                  | **Medication Request**       | <http://hl7.org/fhir/R4/medicationrequest.html>                                              |                             |
| **Immunizations**                | **Immunization**             | <http://hl7.org/fhir/R4/immunization.html>                                                   | See Section 3.44.4.1.2.1.6  |
| **Procedures**                   | **Procedure**                | <http://hl7.org/fhir/R4/procedure.html>                                                      | See Section 3.44.4.1.2.1.7  |
| **Encounters**                   | **Encounter**                | <http://hl7.org/fhir/R4/encounter.html>                                                      | See Section 3.44.4.1.2.1.8  |
| **Provenance**                   | **Provenance**               | <http://hl7.org/fhir/R4/provenance.html>                                                     | See Section 3.44.4.1.2.1.9  |
| **Occupational Data for Health** | **Observation (See Note 2)** | [CombatZonePeriod](http://hl7.org/fhir/us/odh/StructureDefinition-odh-CombatZonePeriod.html) | See Section 3.44.4.1.2.1.10 |
|                                  |                              | [EmploymentStatus](http://hl7.org/fhir/us/odh/StructureDefinition-odh-EmploymentStatus.html) |                             |
|                                  |                              | [PastOrPresentJob](http://hl7.org/fhir/us/odh/StructureDefinition-odh-PastOrPresentJob.html) |                             |
|                                  |                              | [RetirementDate](http://hl7.org/fhir/us/odh/StructureDefinition-odh-RetirementDate.html)     |                             |
|                                  |                              | [UsualWork](http://hl7.org/fhir/us/odh/StructureDefinition-odh-UsualWork.html)               |                             |
{:.grid .table-striped}

*Note 1: The intended use of FHIR Condition resource includes recording of detailed information about conditions, problems or diagnoses recognized by a clinician.*

*Note 2: Definitions and vocabularies for these resources are available at the referenced link.*

Sections 2:3.44.4.1.2.1.1 through 2:3.44.4.1.2.1.10 detail the search
parameters combinations to be supported for each of the FHIR Resources
designated by a named option.

See [ITI TF-2: Appendix Z.10 “Profiling conventions for constraints on FHIR](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.10-profiling-conventions-for-constraints-on-fhir) for a description of terms used in the Optionality columns.

###### 2:3.44.1.2.1.1 Simple Observations Option Search Parameters

When supporting the Simple Observations Option, the Clinical Data
Consumer supplies and the Clinical Data Source shall be at least capable
of processing the search parameters combinations as specified by the
following table, according to the related optionality.

```
GET \[base\]/Observation?\[parameters\]
```

**Table 2:3.44.4.1.2.1.1-1: Simple Observations Option Search Parameters**

| Parameters                       | Type                     | Modifiers                          | Optionality          |                                       |
|----------------------------------|--------------------------|------------------------------------|----------------------|---------------------------------------|
|                                  |                          |                                    | Clinical Data Source | Clinical Data Consumer <sup>(1)</sup> |
| patient + category               | reference + token        |                                    | R                    | O                                     |
| patient + category + code        | reference + token        |                                    | R                    | O                                     |
| patient + category + date        | reference + token + date | date modifiers ‘ge’,‘le’,’gt’,’lt’ | R                    | O                                     |
| patient + category + code + date | reference + token + date | date modifiers ‘ge’,‘le’,’gt’,’lt’ | O                    | O                                     |
{:.grid .table-striped}

*Note 1: The Clinical Data Consumer shall support at least one of the search parameters combinations.*

###### 2:3.44.4.1.2.1.2 Allergies and Intolerances Option Search Parameters 

When supporting the Allergies and Intolerances Option, the Clinical Data
Consumer shall supply and the Clinical Data Source shall be capable of
processing the search parameter as specified by the following table.

```
GET \[base\]/AllergyIntolerance?\[parameters\]
```

**Table 2:3.44.4.1.2.1.2-1: Allergies and Intolerances Option Search Parameters**

| Parameters | Type      | Optionality          |                        |
|------------|-----------|----------------------|------------------------|
|            |           | Clinical Data Source | Clinical Data Consumer |
| patient    | reference | R                    | R                      |
{:.grid .table-striped}

###### 2:3.44.4.1.2.1.3 Conditions Option Search Parameters 

When supporting the Conditions Option, the Clinical Data Consumer
supplies and the Clinical Data Source shall be capable of processing all
the search parameters combinations as specified by the following table,
according to the related optionality.

```
GET \[base\]/Condition?\[parameters\]
```

**Table 2:3.44.4.1.2.1.3-1: Conditions Option Search Parameters**

| Parameters                | Type              | Optionality          |                                       |
|---------------------------|-------------------|----------------------|---------------------------------------|
|                           |                   | Clinical Data Source | Clinical Data Consumer (See Note 1)   |
| patient                   | reference         | R                    | O                                     |
| patient + category        | reference + token | O                    | O                                     |
| patient + clinical-status | reference + token | O                    | O                                     |
{:.grid .table-striped}

*Note 1: The Clinical Data Consumer shall support at least one of the search parameters combinations*

###### 2:3.44.4.1.2.1.4 Diagnostic Reports Option Search Parameters 

When supporting the Diagnostic Reports Option, the Clinical Data
Consumer supplies and the Clinical Data Source shall be capable of
processing all the search parameters combinations as specified by the
following table, according to the related optionality.

```
GET \[base\]/DiagnosticReport?\[parameters\]
```

Table 2:3.44.4.1.2.1.4-1: Diagnostic Reposts Option Search Parameters

| Parameters                       | Type                     | Modifiers                          | Optionality          |                                                |
|----------------------------------|--------------------------|------------------------------------|----------------------|------------------------------------------------|
|                                  |                          |                                    | Clinical Data Source | Clinical Data Consumer (See Note 1)            |
| patient + category               | reference + token        |                                    | R                    | O                                              |
| patient + category + code        | reference + token        |                                    | R                    | O                                              |
| patient + category + date        | reference + token + date | date modifiers ‘ge’,‘le’,’gt’,’lt’ | R                    | O                                              |
| patient + category + code + date | reference + token + date | date modifiers ‘ge’,‘le’,’gt’,’lt’ | O                    | O                                              |
{:.grid .table-striped}

*Note 1: The Clinical Data Consumer shall support at least one of the search parameters combinations*

###### 2:3.44.4.1.2.1.5 Medications Option Search Parameters 

When supporting the Medications Option, the Clinical Data Consumer shall
supply and the Clinical Data Source shall be capable of processing the
search parameters as specified by the following tables.

The MedicationStatement and MedicationRequest resources can represent a
medication, using an external reference to a Medication resource. If an
external Medication Resource is used in a MedicationStatement or a
MedicationRequest, it can be retrieved by using the \_include search
parameter.

There are no search parameters required for the Medication Resource.

For MedicationStatement:

```
GET \[base\]/MedicationStatement?\[parameters\]
```

**Table 2:3.44.4.1.2.1.5-1: MedicationStatement Search Parameters**

| Parameters | Type      | \_include                      | Optionality          |                        |
|------------|-----------|--------------------------------|----------------------|------------------------|
|            |           |                                | Clinical Data Source | Clinical Data Consumer |
| patient    | reference | MedicationStatement:medication | R                    | R                      |
{:.grid .table-striped}

For MedicationRequest:

```
GET \[base\]/MedicationRequest?\[parameters\]
```

**Table 3.44.4.1.2.1.5-2: MedicationRequest Search Parameters**

| Parameters | Type      | \_include                    | Optionality          |                        |
|------------|-----------|------------------------------|----------------------|------------------------|
|            |           |                              | Clinical Data Source | Clinical Data Consumer |
| patient    | reference | MedicationRequest:medication | R                    | R                      |
{:.grid .table-striped}

###### 2:3.44.4.1.2.1.6 Immunizations Option Search Parameters 

When supporting the Immunizations Option, the Clinical Data Consumer may
supply and the Clinical Data Source shall be capable of processing the
search parameter as specified by the following table.
 ```
GET \[base\]/Immunization?\[parameters\]
```

**Table 2:3.44.4.1.2.1.6-1: Immunizations Option Search Parameters**

| Parameter | Type      | Optionality          |                        |
|-----------|-----------|----------------------|------------------------|
|           |           | Clinical Data Source | Clinical Data Consumer |
| patient   | reference | R                    | R                      |
{:.grid .table-striped}

###### 2:3.44.4.1.2.1.7 Procedures Option Search Parameters 

When supporting the Procedures Option, the Clinical Data Consumer
supplies and the Clinical Data Source shall be capable of processing all
the search parameters as specified by the following table, according to
the related optionality.

```
GET \[base\]/Procedure?\[parameters\]
```

**Table 2:3.44.4.1.2.1.7-1: Procedures Option Search Parameters**

| Parameter      | Type             | Modifiers                          | Optionality          |                                       |
|----------------|------------------|------------------------------------|----------------------|---------------------------------------|
|                |                  |                                    | Clinical Data Source | Clinical Data Consumer (See Note 1)   |
| patient        | reference        |                                    | R                    | O                                     |
| patient + date | reference + date | date modifiers ‘ge’,‘le’,’gt’,’lt’ | R                    | O                                     |
{:.grid .table-striped}

*Note 1: The Clinical Data Consumer shall support at least one of the search parameters combinations*

###### 2:3.44.4.1.2.1.8 Encounters Option Search Parameters 

When supporting the Encounters Option, the Clinical Data Consumer
supplies and the Clinical Data Source shall be capable of processing all
the search parameters as specified by the following table, according to
the related optionality.

```
GET \[base\]/Encounter?\[parameters\]
```

**Table 2:3.44.4.1.2.1.8-1: Encounters Option Search Parameters**

| Parameter      | Type             | Modifiers                          | Optionality          |                                       |
|----------------|------------------|------------------------------------|----------------------|---------------------------------------|
|                |                  |                                    | Clinical Data Source | Clinical Data Consumer (Ssee Note 1)   |
| patient        | reference        |                                    | R                    | O                                     |
| patient + date | reference + date | date modifiers ‘ge’,‘le’,’gt’,’lt’ | R                    | O                                     |
{:.grid .table-striped}

*Note 1: The Clinical Data Consumer shall support at least one of the search parameters combinations*

###### 2:3.44.4.1.2.1.9 Document Provenance Option Search Parameters 

Clinical Data Consumer supporting this option is enabled to fetch a
certain FHIR Resource(s) together with any reference to the original
Document from which the Resource(s) has been derived. The FHIR
Provenance Resource containing those references can be included by
providing the \_revinclude parameter in the query.

When supporting the Document Provenance Option, the Clinical Data
Consumer shall supply and the Clinical Data Source shall be capable of
processing the \_revinclude parameter, as defined at [https://www.hl7.org/fhir/R4/search.html#include](https://www.hl7.org/fhir/R4/search.html#include)

```
GET \[base\]/\[Resource-type\]?\_revinclude=Provenance:target&criteria
```

See Section 2:3.44.4.2.2.1 for the specification about the Provenance
content.

###### 2:3.44.4.1.2.1.10 Occupational Data for Health Option Search Parameters 

When supporting the Occupational Data for Health Option, the Clinical
Data Consumer shall supply and the Clinical Data Source shall be capable
of processing the search parameters as specified by the following
tables.

For CombatZonePeriod:

```
GET
\[base\]/observation?code=http://loinc.org\|87511-2&patient=Patient/*id*
```

For EmploymentStatus:

```
GET
\[base\]/observation?code=http://loinc.org\|74165-2&patient=Patient/*id*
```

For PastOrPresentJob:

```
GET
\[base\]/observation?code=http://loinc.org\|11341-5&patient=Patient/*id*
```

For RetirementDate:

```
GET
\[base\]/observation?code=http://loinc.org\|87510-4&patient=Patient/*id*
```

For UsualWork:

```
GET
\[base\]/observation?code=http://loinc.org\|21843-8&patient=Patient/*id*
```

###### 2:3.44.4.1.2.2 Parameter Modifiers

The Clinical Data Source shall support the “:exact” parameter modifier
on all query parameters of type string. When supplied by the Clinical
Data Consumer, the “:exact” parameter modifier instructs the Clinical
Data Source that exact matching shall be performed.

The Clinical Data Consumer should not use and Clinical Data Source may
ignore any additional parameter modifiers listed in the FHIR standard,
which are considered out of scope in the context of this transaction.

###### 2:3.44.4.1.2.3 Populating Expected Response Format

The FHIR standard provides encodings for responses as either XML or
JSON. The Clinical Data Source shall support both message encodings,
whilst the Clinical Data Consumer shall support one and may support
both.

See [ITI TF-2: Appendix Z.6](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.6-populating-the-expected-response-format) for details.

##### 2:3.44.4.1.3 Expected Actions

The Clinical Data Source shall process the query to discover the
clinical data FHIR Resource entries (the fine-grained data elements)
that match the search parameters given and shall use a FHIR Bundle
resource to collect the matching entries to be returned.

The Clinical Data Source shall respond with a Mobile Query Existing Data
Response synchronously (i.e., on the same connection as was used to
initiate the request).

When the Document Provenance Option is specified, the response FHIR
Bundle shall also contain FHIR Provenance Resource entries that provide
consistency of the returned fine-grained data elements with the
coarse-grained data origin (e.g.: Document). See Section 3.44.4.2.2.1
for the specification about the Provenance content. If the fine-grained
data element has not been extracted from a document, the Provenance
Resource may be absent.

See [ITI TF-2: Appendix Z.6](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.6-populating-the-expected-response-format) for more details on response format
handling. See [ITI TF-2: Appendix Z.7](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.7-guidance-on-access-denied-results) for handling guidance for Access
Denied.

#### 3.44.4.2 Mobile Query Existing Data Response message

The Clinical Data Source returns an HTTP Status code appropriate to the
processing as well as a list of the matching clinical data FHIR
Resources.

##### 3.44.4.2.1 Trigger Events

The Clinical Data Source completed processing of the Mobile Query
Existing Data Request message.

##### 3.44.4.2.2 Message Semantics

Based on the query results, the Clinical Data Source will either return
an error or success. The guidance on handling Access Denied related to
use of 200, 403 and 404 can be found in [ITI TF-2: Appendix Z.7](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.7-guidance-on-access-denied-results).

When the Clinical Data Source needs to report an error, it shall use
HTTP error response codes and should include a FHIR OperationOutcome
with more details on the failure. See FHIR
<http://hl7.org/fhir/R4/http.html> and
<http://hl7.org/fhir/R4/operationoutcome.html>.

In particular, if a Data Source receives a Mobile Query Existing Data
transaction for a resource related to a QEDm Option not supported, it
shall return an operationoutcome.issue.code valued as: ‘not-supported’
and an operationoutcome.issue.details valued as: MSG_NO_MATCH No
Resource found matching the query "%s".

If the Mobile Query Existing Data request message is processed
successfully, whether or not clinical data Resources are found, the HTTP
status code shall be 200.

The Mobile Query Existing Data Response message shall be a FHIR Bundle
Resource containing zero or more clinical data Resources plus optional
Provenance Resources (see Section 2:3.44.4.2.2.1). If the Clinical Data
Source is sending warnings, the Bundle Resource shall also contain an
OperationOutcome Resource that contains those warnings.

The response shall adhere to the FHIR Bundle constraints specified in
[ITI TF-2: Appendix Z.1](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.1-resource-bundles).

###### 2:3.44.4.2.2.1 Document Provenance Option

A Clinical Data Source that supports the Document Provenance Option is
part of a document sharing environment. This enables it to access the
data elements for FHIR Resources returned in the \[PCC-44\] query
response and also reference(s) to original document(s).

The Clinical Data Source shall make available one Provenance Resource
for every document from which it extracted data elements.

The Clinical Data Source may return Provenance Resources used for other
purposes than the one defined here. These would not have the indicated
`Provenance.policy` for this transaction.

The following bullets list the constraints for the FHIR Provenance
Resource:

- `Provenance.target` shall be a reference to each of the FHIR Resources extracted from the document referenced by the Provenance.entity element.

- `Provenance.policy` shall contain the static URI `“urn:ihe:iti:mxde:2023:document-provenance-policy”`.

- `Provenance.agent` shall contain at least one entry \[1..\*\] holding the description of the system that extracted the elements from the document.

    - `Provenance.agent.type` shall contain “assembler” code in the system “http://terminology.hl7.org/CodeSystem/provenance-participant-type”.

    - `Provenance.agent.who` shall be a Device Resource identifying the extraction device. This should be by reference to a known Device Resource but may be a contained resource or an identifier.

- `Provenance.entity` shall contain one element \[1..1\] describing the document from which the elements were extracted.

    - `Provenance.entity.role` shall be the code “source”

    -  `Provenance.entity.what` shall be populated with one or more of the following:

        - `Provenance.entity.what.reference` shall be the reference to the DocumentReference Resource as specified in the MHD Profile.

        - `Provenance.entity.what.identifier` shall be the reference metadata attributes used to access documents in the XDS Profile:


            - The value of `DocumentEntry.repositoryUniqueId` as `.system`

            - The value of `DocumentEntry.uniqueId` as `.value`

A FHIR StructureDefinition can be found in implementation materials; see
[ITI TF-2: Appendix W](https://profiles.ihe.net/ITI/TF/Volume2/ch-W.html) for instructions on how to get to the
implementation materials.

###### 2:3.44.4.2.2.2 Resource Bundling

Resource Bundling shall comply with the guidelines in [ITI TF-2: Appendix Z.1](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.1-resource-bundles).

The Clinical Data Source shall include all resources to be returned as a
contained resource. This means that the query shall return resource data
contained in the FHIR Bundle as entries.

##### 2:3.44.4.2.3 Expected Actions

The Clinical Data Consumer processes the bundle of resources, received
in transaction \[PCC-44\] according to the capabilities of its
application. These capabilities are not specified by IHE.

If a Clinical Data Consumer cannot automatically recover from an error
condition, it should offer a means to make the error accessible to the
query initiator (e.g., user, system).

###### 2:3.44.4.2.3.1 Document Provenance Option

A Clinical Data Consumer that supports the Document Provenance Option
processes the document references contained in the FHIR Provenance
resources. The document references enable the Clinical Data Consumer to
access the documents from which the data elements were extracted.

When a Provenance resource is received with Provenance.policy valued at
`“urn:ihe:iti:mxde:2023:document-provenance-policy”` and `Provenance.target`
has a reference for the data element(s) for which a document reference
is sought, the Clinical Data Consumer:

- Shall extract from these Provenance.entity, the reference contained in the Provenance.entity to the document from which the target data-element was extracted.

A Clinical Data Consumer that supports the Document Provenance Option
shall process all Provenance resources contained in a bundle returned by
a \[PCC-44\] transaction where each provenance resource may include one
or more Provenance.target in conjunction with one or more
Provenance.entity.

#### 2:3.44.4.3 Conformance Resource

Clinical Data Sources implementing this transaction shall provide a
Conformance Resource as described in [ITI TF-2: Appendix Z.3](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.3-capabilitystatement-resource) indicating
the query operation for the Resources have been implemented and shall
include all the supported query parameters.

### 2:3.44.5 Security Considerations

The retrieved content contains PHI that shall be protected.

See the [QEDm Security Considerations](volume-1.html#security-considerations).

#### 2:3.44.5.1 Security Audit Considerations

Grouping a Clinical Data Source with an ATNA Secure Node or Secure
Application is required. Grouping a Clinical Data Consumer with an ATNA
Secure Node or Secure Application is recommended.

The Clinical Data Consumer may be considered overburdened to fully
implement the requirements of a Secure Node or Secure Application. The
Clinical Data Source is likely a more robust application and shall
generate audit messages.

Both actors generate a “Query” Audit Message, which is consistent with
ATNA. The Mobile Query Existing Data \[PCC-44\] is a Query Information
event as defined in [ITI TF-2: Table 3.20.4.1.1.1-1](https://profiles.ihe.net/ITI/TF/Volume2/ITI-20.html#3.20.4.1.1.1). The message shall
comply with the following pattern:

- Event

    - EventID = EV(110112, DCM, “Query”)

    - EventTypeCode = EV(“PCC-44”, “IHE Transactions”, “Mobile Query Existing Data”)

    - EventActionCode = “E” (Execute)

- Source of the request (1..1)

    - UserID = The Clinical Data Consumer Actor system identity

    - RoleIDCode = EV(110153, DCM, “Source”)

-   Human Requestor (0..n)  one for each know User

    - UserID = Identity of the human that initiated the transaction

    - RoleIDCode = Access Control role(s) the user holds that allows this transaction

- Destination of the request (1..1)

    - Clinical Data Source Actor system identity

    - RoleIDCode = EV(110152, DCM, “Destination”)

- Audit Source (1..1)

    - not specified

- Patient (1..1)

    - ParticipantObjectTypeCode = “1” (Person)

    - ParticipantObjectTypeCodeRole = “1” (Patient)

    - ParticipantObjectID = The ‘patient’ parameter value

-  Query Parameters (1..1)

    - ParticipantObjectTypeCode = “2” (system object)

    - ParticipantObjectTypeCode Role = “24” (query)

    - ParticipantObjectIDTypeCode = EV(“PCC-44”, “IHE Transactions”, “Mobile Query Existing Data”)

    - ParticipantObjectQuery = Requested URL including query parameters, base64 encoded

    - ParticipantObjectDetail = HTTP Request Headers contained in the query (e.g., Accept header)