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
{%include domain-Y-seq.svg%}
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

- The `\[parameters\]` represents a series of encoded name-value pairs representing the filter for the query, as specified in Section 3.44.4.1.2.1, as well as control parameters to modify the behavior of the Clinical Data Source such as response format, or pagination. See ITI TF-2x: Appendix Z.6 for more details on response format.

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
responding on the Resource types specified in Table X.3-2 by processing
all the search parameters defined in the following sections.

The Clinical Data Source may choose to support additional query
parameters beyond the subset defined by the profiling listed below, if
done according to the core FHIR specification. Such additional
parameters are considered out of scope for this transaction. The
Clinical Data Source may ignore any additional parameter not specified
in this transaction. See [http://hl7.org/fhir/R4/search.html#errors](http://hl7.org/fhir/R4/search.html#errors).

**Table 2:3.44.4.1.2.1-1: QEDm Options, FHIR Resources and Query Search Parameters**


<table border="1" borderspacing="0" style='border: 1px solid black; border-collapse: collapse'>
<thead>
<tr class="header">
<th>QEDm Actor Option</th>
<th>FHIR Resource Type</th>
<th>Reference</th>
<th>Search Paramters</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Simple Observations</td>
<td>Observation</td>
<td><a href="http://hl7.org/fhir/R4/observation.html">http://hl7.org/fhir/R4/observation.html</a></td>
<td>See Section 3.44.4.1.2.1.1</td>
</tr>
<tr class="even">
<td>Allergies and Intolerances</td>
<td>AllergyIntolerance</td>
<td><a href="http://hl7.org/fhir/R4/allergyintolerance.html">http://hl7.org/fhir/R4/allergyintolerance.html</a></td>
<td>See Section 3.44.4.1.2.1.2</td>
</tr>
<tr class="odd">
<td>Condition</td>
<td>Condition (See Note 1)</td>
<td><a href="http://hl7.org/fhir/R4/condition.html">http://hl7.org/fhir/R4/condition.html</a></td>
<td>See Section 3.44.4.1.2.1.3</td>
</tr>
<tr class="even">
<td>Diagnostic Results</td>
<td>DiagnosticReport</td>
<td><a href="http://hl7.org/fhir/R4/diagnosticreport.html">http://hl7.org/fhir/R4/diagnosticreport.html</a></td>
<td>See Section 3.44.4.1.2.1.4</td>
</tr>
<tr class="odd">
<td rowspan="3">Medications</td>
<td>Medication</td>
<td><a href="http://hl7.org/fhir/R4/medication.html">http://hl7.org/fhir/R4/medication.html</a></td>
<td>See Section 3.44.4.1.2.1.5</td>
</tr>
<tr class="odd">
<td>Medication Statement</td>
<td><a href="http://hl7.org/fhir/R4/medicationstatement.html">http://hl7.org/fhir/R4/medicationstatement.html</a></td>
<td>See Section 3.44.4.1.2.1.5</td>
</tr>
<tr class="odd">
<td>Medication Request</td>
<td><a href="http://hl7.org/fhir/R4/medicationrequest.html">http://hl7.org/fhir/R4/medicationrequest.html</a></td>
<td>See Section 3.44.4.1.2.1.5</td>
</tr>
<tr class="even">
<td>Immunzations</td>
<td>Immunization</td>
<td><a href="http://hl7.org/fhir/R4/immunization.html">http://hl7.org/fhir/R4/immunization.html</a></td>
<td>See Section 3.44.4.1.2.1.6/td>
</tr>
<tr class="odd">
<td>Procedures</td>
<td>Procedure</td>
<td><a href="http://hl7.org/fhir/R4/procedure.html">http://hl7.org/fhir/R4/procedure.html</a></td>
<td>See Section 3.44.4.1.2.1.7</td>
</tr>
<tr class="even">
<td>Encounters</td>
<td>Encounter</td>
<td><a href="http://hl7.org/fhir/R4/encounter.html">http://hl7.org/fhir/R4/encounter.html</a></td>
<td>See Section 3.44.4.1.2.1.8</td>
</tr>
<tr class="odd">
<td>Provenance</td>
<td>Provenance</td>
<td><a href="http://hl7.org/fhir/R4/provenance.html">http://hl7.org/fhir/R4/provenance.html</a></td>
<td>See Section 3.44.4.1.2.1.9</td>
</tr>
<tr class="even">
<td rowspan="5">Occupational Data for Health</td>
<td>rowspan="5">Observation (See Note 2)</td>
<td><a href="http://hl7.org/fhir/us/odh/StructureDefinition-odh-CombatZonePeriod.html">CombatZonePeriod</a></td>
<tdrowspan="5">See Section 3.44.4.1.2.1.10</td>
</tr>
<tr class="odd">
<td><a href="http://hl7.org/fhir/us/odh/StructureDefinition-odh-EmploymentStatus.html">EmploymentStatus</a></td>
</tr>
<tr class="odd">
<td><a href="http://hl7.org/fhir/us/odh/StructureDefinition-odh-PastOrPresentJob.html">PastOrPresentJob</a></td>
</tr>
<tr class="odd">
<td><a href="http://hl7.org/fhir/us/odh/StructureDefinition-odh-RetirementDate.html">RetirementDate</a></td>
</tr>
<tr class="odd">
<td><a href="http://hl7.org/fhir/us/odh/StructureDefinition-odh-UsualWork.html">UsualWork</a></td>
</tr>
</tbody>
</table>

*Note 1: The intended use of FHIR Condition resource includes recording of detailed information about conditions, problems or diagnoses recognized by a clinician.*

*Note 2: Definitions and vocabularies for these resources are available at the referenced link*

Sections 2:3.44.4.1.2.1.1 through 2:3.44.4.1.2.1.10 detail the search
parameters combinations to be supported for each of the FHIR Resources
designated by a named option.

See [https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.10-profiling-conventions-for-constraints-on-fhir](ITI TF-2: Appendix Z.10 “Profiling conventions for constraints on
FHIR) for a description of terms used in the Optionality columns.


**TODO Remove extra table below once html table above finalized**


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

###### 2:3.44.1.2.1.1 Simple Observations Option Search Parameters

When supporting the Simple Observations Option, the Clinical Data
Consumer supplies and the Clinical Data Source shall be at least capable
of processing the search parameters combinations as specified by the
following table, according to the related optionality.

```
GET \[base\]/Observation?\[parameters\]
```

**Table 2:3.44.4.1.2.1.1-1: Simple Observations Option Search Parameters



##### Expected Actions

''TODO: define expected actions''

#### Go Response Message

##### Trigger Events

''TODO: define the triggers''

##### Message Semantics

''TODO: define the message -- usually with a StructureDefintion''

##### Expected Actions

''TODO: define expected actions''


### CapabilityStatement Resource

Server implementing this transaction shall provide a CapabilityStatement Resource as described in ITI TF-2x: Appendix Z.3 indicating the transaction has been implemented. 
* Requirements CapabilityStatement for [Client](CapabilityStatement-IHE.QEDm.client.html)
* Requirements CapabilityStatement for [Server](CapabilityStatement-IHE.QEDm.server.html)

### Security Considerations

See [MHD Security Considerations](volume-1.html#security-considerations)

#### Security Audit Considerations

''TODO: The security audit criteria ''

##### Client Audit 

''TODO: the specifics''

##### Server Audit 

''TODO: the specifics''
