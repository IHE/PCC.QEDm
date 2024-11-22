This section corresponds to transaction [PCC-44] of the IHE Technical Framework. Transaction \[PCC-44\] is used by the Clinical Data Consumer and Clinical Data Source Actors.

### 2:3.44.1 Scope

The Mobile Query Existing Data transaction is used to query for fine
grained clinical data elements that satisfy a set of parameters by using
the FHIR framework. The result of the query is a FHIR Bundle containing
FHIR clinical data Resources that match the query parameters.

The QEDm Profile assumes that categories and codes referenced by these
FHIR Resources need to be defined at the time of deployment. The
specification of these FHIR Resources make recommendations on categories
and codes that SHOULD be considered.

### 2:3.44.2 Actor Roles

**Table 2:3.44.2-1: Actor Roles**

| Actor                                 | Role                                              |
|---------------------------------------|---------------------------------------------------|
| [Clinical Data Consumer](volume-1.html#client)    | Queries the Clinical Data Source for clinical data content. Clinical content requested by the Clinical Data Consumer depends on query options supported by the consumer. |
| [Clinical Data Source](volume-1.html#server) | Responds to query, supplying the FHIR Resources representing the clinical data content that match the search criteria provided by the Clinical Data Consumer. |
{:.grid .table-striped}

### 2:3.44.3 Referenced Standards

- [HL7 FHIR standard]({{site.data.fhir.path}})

### 2:3.44.4 Messages

<div>
{%include PCC-44-seq.svg%}
</div>
<br clear="all">

**Figure 2:3.44.4-1: Interaction Diagram**

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

The search target follows the FHIR http specification [{{site.data.fhir.path}}http.html]({{site.data.fhir.path}}http.html), addressing the proper FHIR
Resource type, according to the supported query options (see Section
2:3.44.4.1.2.1). The syntax of the FHIR query is:

```
GET [base]/[Resource-type]{?[parameters]}
```

with the following constraints:

- The `[base]` represents the Service Base URL
- The `[Resource-type]` represents the name of the FHIR Resource to consider (each option can involve one or more Resources), as specified in Section 3.44.4.1.2.1
- The `[parameters]` represents a series of encoded name-value pairs representing the filter for the query, as specified in Section 3.44.4.1.2.1, as well as control parameters to modify the behavior of the Clinical Data Source such as response format, or pagination. See [ITI TF-2: Appendix Z.6](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.6-populating-the-expected-response-format) for more details on response format.

###### 2:3.44.4.1.2.1 Query Search Parameters

All query parameter values SHALL be appropriately encoded per RFC3986
"percent" encoding rules. Note that percent encoding does restrict the
character set to a subset of ASCII characters which is used for encoding
all other characters used in the URL.

The FHIR Resource type or types supported by the Clinical Data Consumer
and Clinical Data Source are determined by a QEDm named option. An actor
claiming named option is required to support the FHIR Resource types
listed below. According to the supported option, the Clinical Data
Consumer MAY query and the Clinical Data Source SHALL be capable of
responding on the Resource types specified in Table 2:3.44.4.1.2.1-1 by processing
all the search parameters defined in the following sections.

The Clinical Data Source MAY choose to support additional query
parameters beyond the subset defined by the profiling listed below, if
done according to the core FHIR specification. Such additional
parameters are considered out of scope for this transaction. The
Clinical Data Source MAY ignore any additional parameter not specified
in this transaction. See [{{site.data.fhir.path}}search.html#errors]({{site.data.fhir.path}}search.html#errors).

Sections 2:3.44.4.1.2.1.1 through 2:3.44.4.1.2.1.10 detail the Resource and search
parameters combinations to be supported for each of the FHIR Resources
designated by a named option.

See [ITI TF-2: Appendix Z.10 Profiling conventions for constraints on FHIR](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.10-profiling-conventions-for-constraints-on-fhir) for a description of terms used in the Optionality columns.

###### 2:3.44.4.1.2.1.1 Simple Observations Option Search Parameters

When supporting the Simple Observations Option, the Clinical Data
Consumer supplies, and the Clinical Data Source SHALL support, the
FHIR [Observation]({{site.data.fhir.path}}observation.html) Resource
and be at least capable
of processing the search parameters combinations as specified by the
following table, according to the related optionality.

```
GET [base]/Observation?[parameters]
```

<tablecaption><b>Table 2:3.44.4.1.2.1.1-1: Simple Observations Option Search Parameters</b></tablecaption>

| Parameters                       | Type                     | Modifiers                          | Clinical Data Source | Clinical Data Consumer |
|----------------------------------|--------------------------|------------------------------------|----------------------|------------------------|
| patient + category               | reference + token        |                                    | R                    | O                      |
| patient + category + code        | reference + token        |                                    | R                    | O                      |
| patient + category + date        | reference + token + date | date modifiers `ge`,`le`,`gt`,`lt` | R                    | O                      |
| patient + category + code + date | reference + token + date | date modifiers `ge`,`le`,`gt`,`lt` | O                    | O                      |
{:.grid .table-striped}

*Note 1: The Clinical Data Consumer SHALL support at least one of the search parameters combinations.*

###### 2:3.44.4.1.2.1.2 Allergies and Intolerances Option Search Parameters

When supporting the Allergies and Intolerances Option, the Clinical Data
Consumer SHALL supply and the Clinical Data Source SHALL support the
FHIR [AllergyIntolerance]({{site.data.fhir.path}}allergyintolerance.html) Resource
and be capable of
processing the search parameter as specified by the following table.

```
GET [base]/AllergyIntolerance?[parameters]
```

**Table 2:3.44.4.1.2.1.2-1: Allergies and Intolerances Option Search Parameters**

| Parameters | Type      | Clinical Data Source | Clinical Data Consumer |
|------------|-----------|----------------------|------------------------|
| patient    | reference | R                    | R                      |
{:.grid .table-striped}

###### 2:3.44.4.1.2.1.3 Conditions Option Search Parameters

The intended use of FHIR Condition resource includes recording of detailed information about conditions, problems or diagnoses recognized by a clinician.
When supporting the Conditions Option, the Clinical Data Consumer
supplies and the Clinical Data Source SHALL support the
FHIR [Condition]({{site.data.fhir.path}}condition.html) Resource
and be capable of processing all
the search parameters combinations as specified by the following table,
according to the related optionality.

```
GET [base]/Condition?[parameters]
```

**Table 2:3.44.4.1.2.1.3-1: Conditions Option Search Parameters**

| Parameters                | Type              | Clinical Data Source | Clinical Data Consumer |
|---------------------------|-------------------|----------------------|------------------------|
| patient                   | reference         | R                    | O                      |
| patient + category        | reference + token | O                    | O                      |
| patient + clinical-status | reference + token | O                    | O                      |
{:.grid .table-striped}

*Note 1: The Clinical Data Consumer SHALL support at least one of the search parameters combinations*

###### 2:3.44.4.1.2.1.4 Diagnostic Reports Option Search Parameters

When supporting the Diagnostic Reports Option, the Clinical Data
Consumer supplies and the Clinical Data Source SHALL support the
FHIR [DiagnosticReport]({{site.data.fhir.path}}diagnosticreport.html) Resource
and be capable of
processing all the search parameters combinations as specified by the
following table, according to the related optionality.

```
GET [base]/DiagnosticReport?[parameters]
```

Table 2:3.44.4.1.2.1.4-1: Diagnostic Reports Option Search Parameters

| Parameters                       | Type                     | Modifiers                          | Clinical Data Source | Clinical Data Consumer |
|----------------------------------|--------------------------|------------------------------------|----------------------|------------------------|
| patient + category               | reference + token        |                                    | R                    | O                      |
| patient + category + code        | reference + token        |                                    | R                    | O                      |
| patient + category + date        | reference + token + date | date modifiers `ge`,`le`,`gt`,`lt` | R                    | O                      |
| patient + category + code + date | reference + token + date | date modifiers `ge`,`le`,`gt`,`lt` | O                    | O                      |
{:.grid .table-striped}

*Note 1: The Clinical Data Consumer SHALL support at least one of the search parameters combinations*

###### 2:3.44.4.1.2.1.5 Medications Option Search Parameters

When supporting the Medications Option, the Clinical Data Consumer SHALL
supply and the Clinical Data Source SHALL support the
FHIR [Medication]({{site.data.fhir.path}}medication.html) Resource,
FHIR [MedicationStatement]({{site.data.fhir.path}}medicationstatement.html) Resource, and
FHIR [MedicationRequest]({{site.data.fhir.path}}medicationrequest.html) Resource,
and be capable of processing the
search parameters as specified by the following tables.

The `MedicationStatement` and `MedicationRequest` resources can represent a
medication, using an external reference to a `Medication` resource. If an
external `Medication` Resource is used in a `MedicationStatement` or a
`MedicationRequest`, it can be retrieved by using the `_include` search
parameter.

There are no search parameters required for the `Medication` Resource.

For MedicationStatement:

```
GET [base]/MedicationStatement?[parameters]
```

**Table 2:3.44.4.1.2.1.5-1: MedicationStatement Search Parameters**

| Parameters | Type      | `_include`                     | Clinical Data Source | Clinical Data Consumer |
|------------|-----------|--------------------------------|----------------------|------------------------|
| patient    | reference | MedicationStatement:medication | R                    | R                      |
{:.grid .table-striped}

For MedicationRequest:

```
GET [base]/MedicationRequest?[parameters]
```

**Table 3.44.4.1.2.1.5-2: MedicationRequest Search Parameters**

| Parameters | Type      | `_include`                     | Clinical Data Source | Clinical Data Consumer |
|------------|-----------|--------------------------------|----------------------|------------------------|
| patient    | reference | MedicationRequest:medication   | R                    | R                      |
{:.grid .table-striped}

###### 2:3.44.4.1.2.1.6 Immunizations Option Search Parameters

When supporting the Immunizations Option, the Clinical Data Consumer MAY
supply and the Clinical Data Source SHALL support the
FHIR [Immunization]({{site.data.fhir.path}}immunization.html) Resource
and be capable of processing the
search parameter as specified by the following table.

```
GET [base]/Immunization?[parameters]
```

**Table 2:3.44.4.1.2.1.6-1: Immunizations Option Search Parameters**

| Parameter | Type      | Clinical Data Source | Clinical Data Consumer |
|-----------|-----------|----------------------|------------------------|
| patient   | reference | R                    | R                      |
{:.grid .table-striped}

###### 2:3.44.4.1.2.1.7 Procedures Option Search Parameters

When supporting the Procedures Option, the Clinical Data Consumer
supplies and the Clinical Data Source SHALL support the
FHIR [Procedure]({{site.data.fhir.path}}procedure.html) Resource
and be capable of processing all
the search parameters as specified by the following table, according to
the related optionality.

```
GET [base]/Procedure?[parameters]
```

**Table 2:3.44.4.1.2.1.7-1: Procedures Option Search Parameters**

| Parameter      | Type             | Modifiers                          | Clinical Data Source | Clinical Data Consumer |
|----------------|------------------|------------------------------------|----------------------|------------------------|
| patient        | reference        |                                    | R                    | O                      |
| patient + date | reference + date | date modifiers `ge`,`le`,`gt`,`lt` | R                    | O                      |
{:.grid .table-striped}

*Note 1: The Clinical Data Consumer SHALL support at least one of the search parameters combinations*

###### 2:3.44.4.1.2.1.8 Encounters Option Search Parameters

When supporting the Encounters Option, the Clinical Data Consumer
supplies and the Clinical Data Source SHALL support the
FHIR [Encounter]({{site.data.fhir.path}}encounter.html) Resource
and be capable of processing all
the search parameters as specified by the following table, according to
the related optionality.

```
GET [base]/Encounter?[parameters]
```

**Table 2:3.44.4.1.2.1.8-1: Encounters Option Search Parameters**

| Parameter      | Type             | Modifiers                          | Clinical Data Source | Clinical Data Consumer |
|----------------|------------------|------------------------------------|----------------------|------------------------|
| patient        | reference        |                                    | R                    | O                      |
| patient + date | reference + date | date modifiers `ge`,`le`,`gt`,`lt` | R                    | O                      |
{:.grid .table-striped}

*Note 1: The Clinical Data Consumer SHALL support at least one of the search parameters combinations*

###### 2:3.44.4.1.2.1.9 Provenance Option Search Parameters

Clinical Data Consumer supporting this option is enabled to fetch a
certain FHIR Resource(s) together with any reference to the original
Document from which the Resource(s) has been derived. The FHIR
Provenance Resource containing those references can be included by
providing the `_revinclude` parameter in the query.

When supporting the Provenance Option, the Clinical Data
Consumer SHALL supply and the Clinical Data Source SHALL be capable of
processing the `_revinclude` parameter, as defined at [FHIR Search include]({{site.data.fhir.path}}search.html#include)

```
GET [base]/[Resource-type]?_revinclude=Provenance:target&criteria
```

When supporting the Provenance Option, the Clinical Data Consumer
supplies and the Clinical Data Source SHALL support the
FHIR [Provenance]({{site.data.fhir.path}}provenance.html) Resource
and be capable of processing all
the search parameters as specified by the following table, according to
the related optionality.

```
GET [base]/Provenance?[parameters]
```

**Table 2:3.44.4.1.2.1.9-1: Provenance Option Search Parameters**

| Parameter      | Type             | Modifiers                          | Clinical Data Source | Clinical Data Consumer |
|----------------|------------------|------------------------------------|----------------------|------------------------|
| target         | reference        |                                    | R                    | O                      |
{:.grid .table-striped}

See Section 2:3.44.4.2.2.1 for the specification about the Provenance
content.

###### 2:3.44.4.1.2.1.10 Occupational Data for Health Option Search Parameters

When supporting the Occupational Data for Health (ODH) Option, the Clinical
Data Consumer SHALL supply and the Clinical Data Source SHALL be capable
of supporting `Observation` Resources compliant with
the [IHE FHIR Profile: Occupational Data for Health (ODH) - International]({{site.data.fhir.ihepccodh}}).

###### 2:3.44.4.1.2.2 Parameter Modifiers

The Clinical Data Source SHALL support the ":exact" parameter modifier
on all query parameters of type string. When supplied by the Clinical
Data Consumer, the ":exact" parameter modifier instructs the Clinical
Data Source that exact matching SHALL be performed.

The Clinical Data Consumer SHOULD not use any additional parameter modifiers listed in the FHIR standard,
which are considered out of scope in the context of this transaction.

The Clinical Data Source SHALL reject any search request that contains a search parameter with an [unsupported modifier]({{site.data.fhir.path}}search.html#modifiers).

###### 2:3.44.4.1.2.3 Populating Expected Response Format

The FHIR standard provides encodings for responses as either XML or
JSON. The Clinical Data Source SHALL support both message encodings,
whilst the Clinical Data Consumer SHALL support one and MAY support
both.

See [ITI TF-2: Appendix Z.6](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.6-populating-the-expected-response-format) for details.

##### 2:3.44.4.1.3 Expected Actions

The Clinical Data Source SHALL process the query to discover the
clinical data FHIR Resource entries (the fine-grained data elements)
that match the search parameters given and SHALL use a FHIR Bundle
resource to collect the matching entries to be returned.

The Clinical Data Source SHALL respond with a Mobile Query Existing Data
Response synchronously (i.e., on the same connection as was used to
initiate the request).

When the Provenance Option is specified, the response FHIR
Bundle SHALL also contain FHIR Provenance Resource entries that provide
consistency of the returned fine-grained data elements with the
coarse-grained data origin (e.g., Document). See Section 3.44.4.2.2.1
for the specification about the Provenance content. If the fine-grained
data element has not been extracted from a document, the Provenance
Resource MAY be absent.

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

When the Clinical Data Source needs to report an error, it SHALL use
HTTP error response codes and SHOULD include a FHIR OperationOutcome
with more details on the failure. See FHIR
<{{site.data.fhir.path}}http.html> and
<{{site.data.fhir.path}}operationoutcome.html>.

In particular, if a Data Source receives a Mobile Query Existing Data
transaction for a resource related to a QEDm Option not supported, it
SHALL return an OperationOutcome.issue.code valued as: ‘not-supported’
and an OperationOutcome.issue.details valued as: MSG_NO_MATCH No
Resource found matching the query "%s".

If the Mobile Query Existing Data request message is processed
successfully, whether or not clinical data Resources are found, the HTTP
status code SHALL be 200.

The Mobile Query Existing Data Response message SHALL be a FHIR Bundle
Resource containing zero or more clinical data Resources plus optional
Provenance Resources (see Section 2:3.44.4.2.2.1). If the Clinical Data
Source is sending warnings, the Bundle Resource SHALL also contain an
OperationOutcome Resource that contains those warnings.

The response SHALL adhere to the FHIR Bundle constraints specified in
[ITI TF-2: Appendix Z.1](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.1-resource-bundles).

###### 2:3.44.4.2.2.1 Provenance Option

A Clinical Data Source that supports the Provenance Option
may be grouped with the [Mobile Cross-Enterprise Document Data Element Extraction (mXDE)]({{site.data.fhir.iheitimxde}}/index.html) Data Element Extractor [Actor]({{site.data.fhir.iheitimxde}}/volume-1.html#145111-data-element-extractor) and thus will expose [mXDE defined Provenance]({{site.data.fhir.iheitimxde}}/StructureDefinition-IHE.ITI.mXDE.Provenance.html) resources.

The Clinical Data Source MAY return Provenance Resources used for other
purposes than the one defined here. These would not have the indicated
`Provenance.policy` of `urn:ihe:iti:mxde:2023:document-provenance-policy`.

###### 2:3.44.4.2.2.2 Resource Bundling

Resource Bundling SHALL comply with the guidelines in [ITI TF-2: Appendix Z.1](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.1-resource-bundles).

The Clinical Data Source SHALL include all resources to be returned as a
contained resource. This means that the query SHALL return resource data
contained in the FHIR Bundle as entries.

##### 2:3.44.4.2.3 Expected Actions

The Clinical Data Consumer processes the bundle of resources, received
in transaction \[PCC-44\] according to the capabilities of its
application. These capabilities are not specified by IHE.

If a Clinical Data Consumer cannot automatically recover from an error
condition, it SHOULD offer a means to make the error accessible to the
query initiator (e.g., user, system).

###### 2:3.44.4.2.3.1 Provenance Option

A Clinical Data Consumer that supports the Provenance Option
processes the FHIR Provenance
resources.

When a Provenance resource is received with Provenance.policy valued at
`urn:ihe:iti:mxde:2023:document-provenance-policy`, the Provenance is compliant with the  [mXDE defined Provenance]({{site.data.fhir.iheitimxde}}/StructureDefinition-IHE.ITI.mXDE.Provenance.html). The `Provenance.target`
has a reference for the data element(s) for which a document reference
is sought. The Clinical Data Consumer SHALL extract from these Provenance.entity, the reference contained in the Provenance.entity to the document from which the target data-element was extracted. For more detail on interpretation of these Provenance records and accessing the provenance documents, see [Mobile Cross-Enterprise Document Data Element Extraction (mXDE)]({{site.data.fhir.iheitimxde}}/index.html).

A Clinical Data Consumer that supports the Provenance Option
SHALL process all Provenance resources contained in a bundle returned by
a \[PCC-44\] transaction where each provenance resource MAY include one
or more Provenance.target in conjunction with one or more
Provenance.entity.

#### 2:3.44.4.3 Conformance Resource

Clinical Data Sources implementing this transaction SHALL provide a
Conformance Resource as described in [ITI TF-2: Appendix Z.3](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.3-capabilitystatement-resource) indicating
the query operation for the Resources have been implemented and SHALL
include all the supported query parameters.

### 2:3.44.5 Security Considerations

The retrieved content contains PHI that SHALL be protected.

See the [QEDm Security Considerations](volume-1.html#security-considerations).

#### 2:3.44.5.1 Security Audit Considerations

Grouping a Clinical Data Source with an [Audit Trail and Node Authentication (ATNA)](https://profiles.ihe.net/ITI/TF/Volume1/ch-9.html) Secure Node or Secure
Application is required. Grouping a Clinical Data Consumer with an [ATNA](https://profiles.ihe.net/ITI/TF/Volume1/ch-9.html)
Secure Node or Secure Application is recommended.

The Clinical Data Consumer MAY be considered overburdened to fully
implement the requirements of a Secure Node or Secure Application. The
Clinical Data Source is likely a more robust service and SHALL
generate audit messages.

The AuditEvent resources to be recorded are refinements of the [Basic AuditEvent Log Patterns (BALP)]({{site.data.fhir.iheitibasicaudit}}/index.html) for [RESTful Execute (search and query) where a Patient is a subject of the search]({{site.data.fhir.iheitibasicaudit}}/content.html#3573-restful-activities).

##### 2:3.44.5.1.1 Clinical Data Consumer

The Clinical Data Consumer when grouped with [ATNA Secure Node or Secure Application](https://profiles.ihe.net/ITI/TF/Volume1/ch-9.html) Actor SHALL be able to record a [Clinical Data Consumer AuditEvent](StructureDefinition-IHE.QEDm.Query.Audit.Consumer.html). [Audit Example for a QEDm Query transaction from consumer perspective](AuditEvent-ex-auditQedmQuery-consumer.html).

##### 2.3.44.5.1.2 Clinical Data Source

The Clinical Data Source when grouped with [ATNA Secure Node or Secure Application](https://profiles.ihe.net/ITI/TF/Volume1/ch-9.html) Actor SHALL be able to record a [Clinical Data Source AuditEvent](StructureDefinition-IHE.QEDm.Query.Audit.Source.html). [Audit Example for a QEDm Query transaction from source perspective](AuditEvent-ex-auditQedmQuery-source.html).

