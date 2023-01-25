
The Query for Existing Data for Mobile (QEDm) Profile supports dynamic
queries for clinical data elements, including observations, allergy and
intolerances, problems, diagnostic results, medications, immunizations,
procedures, encounters and provenance by making the information widely
available to other systems within and across enterprises to support
provision of better clinical care. It defines a transaction used to
query a list of specific data elements, persisted as FHIR resources.

QEDm is functionally equivalent to the QED Profile (based on HL7v3), but
QEDm is better suited for implementation by application on mobile
devices or where the http/REST technology is preferred. The term
“mobile” must be understood in a wide sense: it refers not only to
applications on devices used for mobility that are resource- and
platform-constrained. (e.g., tablets, smartphones, and embedded devices
including home-health devices), but also to larger systems deployed in
environments where interoperability requirements are simple, such as
pulling the latest summary for display.

The QEDm Profile defines a standardized interface to health (HTTP-based RESTful APIs) suited for
deployment of mobile applications on resource-constrained devices with
simple programming environment (e.g., JavaScript), simple protocol stack
(e.g., HTTP), and simple display functionality (e.g., HTML browser). The
goal is to limit required additional libraries that are often necessary
to process SOAP, MIME-Multipart, MTOM/XOP Web Services.

The QEDm Profile uses the already defined actors Clinical Data Consumer and Clinical Data Source,
for which it specifies option and a transaction to be used for querying
a list of specific data elements, persisted as FHIR resources. The
current version of Supplement doesn’t consider the reconciliation of the
fine-grained data elements gathered by the Clinical Data Source and/or
Clinical Data Consumer Actors. In order to perform reconciliation a
grouping with RECON Reconciliation Agent should be considered.

The QEDm Profile may also be deployed in conjunction with document
sharing profiles such as MHD or XDS Profiles. The Document Provenance
Option in QEDm is used in particular by the mXDE Profile to address the
combined deployment of QEDm for access to fine-grained data element with
links to source documents accessible through the MHD or XDS Profiles.

## 1:X.1 QEDm Actors, Transactions, and Content Modules

<a name="actors-and-transactions"> </a>

This section defines the actors, transactions, and/or content modules in
this implementation guide. Further information about actor and transaction definitions can be found in the IHE Technical Frameworks General Introduction [Appendix A: Actors](https://profiles.ihe.net/GeneralIntro/ch-A.html) and [Appendix B: Transactions](https://profiles.ihe.net/GeneralIntro/ch-B.html).

Figure X.1-1 shows the actors directly involved in the QEDm Profile and
the relevant transaction between them.

<div>
{%include ActorsAndTransactions.svg%}
</div>
<br clear="all">

**Figure: 1:X.1-1: QEDm Actor Diagram**

Table 1:X.1-1 lists the transactions for each actor directly involved in
the QEDm Profile. To claim compliance with this profile, an actor shall
support all required transactions (labeled “R”) and may support the
optional transactions (labeled “O”).

**Table 1:X.1-1: QEDm Integration Profile - Actors and Transactions**

| Actors                 | Transactions                           | Optionality    | Reference                 |
|------------------------|----------------------------------------|----------------|---------------------------|
| Clinical Data Source   | Mobile Query Existing Data \[PCC-44\]  | R              | PCC TF-2: 3               |
| Clinical Data Consumer | Mobile Query Existing Data \[PCC-44\]  | R              | PCC TF-2: 3.              |
{:.grid .table-striped}

### 1:X.1.1 Actor Descriptions and Actor Profile Requirements

#### 1:X.1.1.1 Clinical Data Source

<a name="client"> </a>

The Clinical Data Source in this profile responds to FHIR-based queries
for one or more fine-grained data elements (FHIR resources) defined by
the options listed in Section X.2.

FHIR Capability Statement for [Client]{CapabilityStatement-IHE.QEDm.client.html}

#### 1:X.1.1.2 Clinical Data Consumer

Server <a name="server"> </a>

The Clinical Data Consumer in this profile sends FHIR-based queries to the Clinical Data Source for one or more fine-grained data elements (FHIR resources) defined by the options listed in Section X.2. Rendering or further processing of the data is not defined by this profile.

FHIR Capability Statement for [Server](CapabilityStatement-IHE.QEDm.server.html)

## 1:X.2 QEDm Actor Options

<a name="actor-options"> </a>

Options that may be selected for each actor in this profile, if any, are
listed in the Table 1:X.2-1. Dependencies between options when applicable
are specified in notes.

**Table 1:X.2-1: QEDm - Actors and Options**

<table border="1" borderspacing="0" style='border: 1px solid black; border-collapse: collapse'>
<thead>
<tr class="header">
<th>Actor</th>
<th>Option Name</th>
<th>Reference</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td rowspan="10">Clinical Data Source</td>
<td>Simple Observations (Note 1)</td>
<td>Section 1:X.2.1.1</td>
</tr>
<tr class="even">
<td>Allergies and Intolerances (Note 1)</td>
<td>Section 1:X.2.1.2</td>
</tr>
<tr class="odd">
<td>Conditions (Note 1)</td>
<td>Section 1:X.2.1.3</td>
</tr>
<tr class="even">
<td>Diagnostic Results (Note 1)</td>
<td>Section 1:X.2.1.4</td>
</tr>
<tr class="odd">
<td>Medications (Note 1)</td>
<td>Section 1:X.2.1.5</td>
</tr>
<tr class="even">
<td>Immunizations (Note 1)</td>
<td>Section 1:X.2.1.6</td>
</tr>
<tr class="odd">
<td>Procedures (Note 1)</td>
<td>Section 1:X.2.1.7</td>
</tr>
<tr class="even">
<td>Encounters (Note 1)</td>
<td>Section 1:X.2.1.8</td>
</tr>
<tr class="odd">
<td>Document Provenance (Note 1)</td>
<td>Section 1:X.2.1.9</td>
</tr>
<tr class="even">
<td>Occuupational Data for Health (Note 1)</td>
<td>Section 1:X.2.1.10</td>
</tr>
<tr class="odd">
<td rowspan="10">Clinical Data Consumer</td>
<td>Simple Observations (Note 1)</td>
<td>Section 1:X.2.2.1</td>
</tr>
<tr class="even">
<td>Allergies and Intolerances (Note 1)</td>
<td>Section 1:X.2.2.2</td>
</tr>
<tr class="odd">
<td>Conditions (Note 1)</td>
<td>Section 1:X.2.2.3</td>
</tr>
<tr class="even">
<td>Diagnostic Results (Note 1)</td>
<td>Section 1:X.2.2.4</td>
</tr>
<tr class="odd">
<td>Medications (Note 1)</td>
<td>Section 1:X.2.2.5</td>
</tr>
<tr class="even">
<td>Immunizations (Note 1)</td>
<td>Section 1:X.2.2.6</td>
</tr>
<tr class="odd">
<td>Procedures (Note 1)</td>
<td>Section 1:X.2.2.7</td>
</tr>
<tr class="even">
<td>Encounters (Note 1)</td>
<td>Section 1:X.2.2.8</td>
</tr>
<tr class="odd">
<td>Document Provenance (Note 1)</td>
<td>Section 1:X.2.2.9</td>
</tr>
<tr class="even">
<td>Occuupational Data for Health (Note 1)</td>
<td>Section 1:X.2.2.10</td>
</tr>
</tbody>
</table>

*Note 1: At least one of these options shall be supported by the related actor.*

### 1:X.2.1 Clinical Data Consumer Options

#### 1:X.2.1.1 Simple Observations Option

A Clinical Data Consumer that implements the Simple Observations Option
performs the Mobile Query Existing Data transaction using the vocabulary
specified for Simple Observations in \[PCC-44\] in PCC TF-2:
3.44.4.1.2.1.1.

#### 1:X.2.1.2 Allergies and Intolerances Option

A Clinical Data Consumer that implements the Allergies and Intolerances
Option performs the Mobile Query Existing Data transaction using the
vocabulary specified for Allergies and Intolerances in \[PCC-44\] in PCC
TF-2: 3.44.4.1.2.1.2.

#### 1:X.2.1.3 Conditions Option

A Clinical Data Consumer that implements the Conditions Option performs
the Mobile Query Existing Data transaction using the vocabulary
specified for Conditions in \[PCC-44\] in PCC TF-2: 3.44.4.1.2.1.3.

#### 1:X.2.1.4 Diagnostic Results Option

A Clinical Data Consumer
that implements the Diagnostic Results Option performs the Mobile Query
Existing Data transaction using the vocabulary specified for Diagnostic
Results in \[PCC-44\] in PCC TF-2: 3.44.4.1.2.1.4.

#### 1:X.2.1.5 Medications Option

A Clinical Data Consumer
that implements the Medications Option performs the Mobile Query
Existing Data transaction using the vocabulary specified for Medications
in \[PCC-44\] in PCC TF-2: 3.44.4.1.2.1.5.

#### 1:X.2.1.6 Immunizations Option

A Clinical Data Consumer
that implements the Immunizations Option performs the Mobile Query
Existing Data transaction using the vocabulary specified for
Immunizations in \[PCC-44\] in PCC TF-2: 3.44.4.1.2.1.6.

#### 1:X.2.1.7 Procedures Option

A Clinical Data Consumer that implements the Procedures Option performs
the Mobile Query Existing Data transaction using the vocabulary
specified for Procedures in \[PCC-44\] in PCC TF-2: 3.44.4.1.2.1.7.

#### 1:X.2.1.8 Encounters Option

A Clinical Data Consumer that implements the Encounters Option performs
the Mobile Query Existing Data transaction using the vocabulary
specified for Encounters in \[PCC-44\] in PCC TF-2: 3.44.4.1.2.1.8.

#### 1:X.2.1.9 Document Provenance Option

This option is different than the above options that allow the selection
of appropriate clinical content to query. It provides a means to extend
the traceability of information used for clinical decisions: when a data
element is accessed by a Clinical Data Consumer, identifiers from that
data element can be retrieved to enable access to one or more documents
in which this data element was originally recorded, providing a valuable
broader clinical context.

A Clinical Data Consumer that implements the Document Provenance Option
performs the Mobile Query Existing Data transaction using the vocabulary
specified for Provenance in \[PCC-44\] in PCC TF-2: 3.44.4.1.2.1.9.

#### 1:X.2.1.10 Occupational Data for Health Option

A Clinical Data Consumer that implements the Occupational Data for
Health Option performs the Mobile Query Existing Data transaction using the vocabulary
specified for Occupational Data for Health in \[PCC-44\] in PCC TF-2:
3.44.4.1.2.1.10.

### 1:X.2.2 Clinical Data Source Options

#### 1:X.2.2.1 Simple Observations Option

A Clinical Data Source that implements the Simple Observations Option
responds to the message semantics specified for Simple Observations in
\[PCC-44\] in PCC TF-2: 3.44.4.1.2.1.1.

#### 1:X.2.2.2 Allergies and Intolerances Option

A Clinical Data Source that implements the Allergies and Intolerances
Option responds to the message semantics specified for Allergies and
Intolerances in \[PCC-44\] in PCC TF-2: 3.44.4.1.2.1.2.

#### 1:X.2.2.3 Conditions Option

A Clinical Data Consumer that implements the Conditions Option responds
to the message semantics specified for Conditions in \[PCC-44\] in PCC
TF-2: 3.44.4.1.2.1.3.

#### 1:X.2.2.4 Diagnostic Results Option

A Clinical Data Source that implements the Diagnostic Results Option
responds to the message semantics specified for Diagnostic Results in
\[PCC-44\] in PCC TF-2: 3.44.4.1.2.1.4.

#### 1:X.2.2.5 Medications Option

A Clinical Data Source that implements the Medications Option responds
to the message semantics specified for Medications in \[PCC-44\] in PCC
TF-2: 3.44.4.1.2.1.5.

#### 1:X.2.2.6 Immunizations Option

A Clinical Data Source that implements the Immunizations Option responds
to the message semantics specified for Immunizations in \[PCC-44\] in
PCC TF-2: 3.44.4.1.2.1.6.

#### 1:X.2.2.7 Procedures Option

A Clinical Data Source that implements the Procedures Option responds to
the message semantics specified for Procedures in \[PCC-44\] in PCC
TF-2: 3.44.4.1.2.1.7.

#### 1:X.2.2.8 Encounters Option

A Clinical Data Source that implements the Encounters Option responds to
the message semantics specified for Encounters in \[PCC-44\] in PCC
TF-2: 3.44.4.1.2.1.8.

#### 1:X.2.2.9 Document Provenance Option

This option is different than the above options that allow the selection
of appropriate clinical content to query. It provides a means to extend
the traceability of information used for clinical decisions: when a data
element is accessed by a Clinical Data Consumer, identifiers from that
data element can be provided to the Clinical Data Consumer to enable
access to one or more documents in which this data element was
originally recorded, providing a valuable broader clinical context.

A Clinical Data Source that implements the Document Provenance Option
responds to the message semantics specified for Provenance in \[PCC-44\]
in PCC TF-2: 3.44.4.1.2.1.9.

#### 1:X.2.2.10 Occupational Data for Health Option 

A Clinical Data Source that implements the Occupational Data for Health
Option responds to the message semantics specified for Occupational Data
for Health in \[PCC-44\] in PCC TF-2: 3.44.4.1.2.1.10 with the profiled
content specified in the Reference link location.

## 1:X.3 QEDm Required Actor Groupings

**Table 1:X.3-1: QED for Mobile - Required Actor Groupings**

| QEDm Actor             | Actor to be grouped with | Reference |
|------------------------|--------------------------|-----------|
| Clinical Data Consumer | None                     | \-        |
| Clinical Data Source   | None                     | \-        |

## 1:X.4 QEDm Overview

<a name="overview"> </a>

### 1:X.4.1 Concepts

The QEDm Profile supports a broad set of the QED use cases and
functionality while keeping the implementation as simple as possible.

### 1:X.4.2 Use Cases

#### 1:X.4.2.1 Use Case \#1: Discovery and Retrieval of Existing Data Elements

##### 1:X.4.2.1.1 Discovery and Retrieval of Existing Data Elements Description

In this use case, the patient, by using a mobile device, needs access to
existing data elements. For example, a mobile application involved in a workflow needs to
discover all the current Observations and Medications.

##### 1:X.4.2.1.2 Discovery and Retrieval of Existing Data Elements Process Flow

The Mobile Query Existing Data transaction is used to provide
parameterized queries that result in a list of returned data elements.

<div>
{%include usecase1-processflow.svg%}
</div>
<br clear="all">

**Figure 1:X.4.2.1.2-1: Use Case \#1 Process Flow in QEDm Profile**

#### 1:X.4.2.2 Use Case \#2: Discovery and Retrieval of Existing Data Elements with Source Document Links

##### 1:X.4.2.2.1 Discovery and Retrieval of Existing Data Elements with Source Document Links Description

In this use case, the physician, by using a mobile device, needs to
access all existing data elements and eventually to retrieve and consume
the source documents, if any.

For example, a mobile application involved in a workflow needs to
discover all Encounters which the patient has participated in and, for
those of interest, it needs to retrieve and show the related document
where the Encounter was originally specified.

##### 1:X.4.2.2.2 Discovery and Retrieval of Existing Data Elements with Source Document Links Process Flow

The Mobile Query Existing Data \[PCC-44\] transaction is used to provide
parameterized queries that result in a list of returned data elements.
One of the query options specifies that provenance information must be
included in the result to obtain the links to source documents, if any.

The mobile application implements The Clinical Data Consumer to perform
the query.

The mobile application also implements an MHD Document Consumer and
retrieves the document from the MHD Document Responder by using the
related returned document link.

<div>
<img alt="Use Case #2 Process Flow Diagram" src="qedm_x42221.png" width="100%">
</div>

**Figure 1:X.4.2.2.2-1: Use Case \#2 Process Flow in QEDm Profile**


## 1:X.5 QEDm Security Considerations

<a name="security-considerations"> </a>

See ITI TF-2x: [Appendix Z.8 “Mobile Security Considerations”](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.8-mobile-security-considerations).

The QEDm Profile provides an API for accessing Data Element level
details that are identifiable to a specific Patient. Thus, all the data
communicated, including the query parameters, should be considered
Patient Identifiable data. The grouping with IUA, or some similar User
Authentication and Authorization solution, is critical to enforcing
Privacy and Security. All accesses to this data should be recorded as
audit log for security surveillance and Privacy reporting. These topics
are discussed in Appendix Z.8 with recommendations.

The Document Provenance Option adds an additional protection against
Data Integrity and Data Authenticity risks. The Provenance record
associated with a Data Element returned by the Clinical Data Source
would indicate the source of the data. In the case where Provenance is
specific to a Document, grouping with MHD Document Consumer or XDS
Document Consumer enables the retrieval of that source Document. The
mXDE Profile ITI TF-1:45.5 Security Considerations includes further
discussion on the specific Security Considerations of bridging between a
Document Sharing environment and a Data Element access model.

## 1:X.6 QEDm Cross-Profile Considerations

<a name="other-grouping"> </a>

**ITI mXDE – Mobile Cross-Enterprise Document Data Element Extraction**

A Clinical Data Source may be grouped with a Data Element Extractor
which requires the addition of necessary provenance information to
ensure consistency within each returned data element.

This grouping allows the extraction of data elements and the addition of
references to data origins (e.g., Documents) used in generating the
result.

A Clinical Data Consumer may be grouped with a Data Element Provenance
Consumer to extract the identifiers (provenance information) that
consistently link the returned data elements to the related data origin.

**ITI PIX - Patient Identity Cross Referencing and ITI PDQ - Patient Demographics Query**

A Clinical Data Consumer may be grouped with a Patient Identifier
Cross-reference Consumer or a Patient Demographics Consumer to resolve
patient identifiers prior to submitting queries to a Clinical Data
Source.

Within an enterprise, the need to cross-reference patient identifiers
may not be necessary. However, once enterprise boundaries are crossed,
these identifiers will need to be resolved. In that case profiles such
as PIX, PIXm, PDQ and/or PDQm may be used.

**ITI MHD – Mobile Health Documents**

A Clinical Data Source may be grouped with an MHD Document Responder.
Data gathered from clinical documents submitted to the Document
Responder can be a source of information returned by the Clinical Data
Source. It may include references to documents used in generating the
QEDm returned data-elements, by using the FHIR Provenance Resource.

A Clinical Data Consumer may be grouped with an MHD Document Consumer.
The Clinical Data Consumer may use the references to access the source
documents.

**ITI XDS - Cross-Enterprise Document Sharing**

A Clinical Data Source may be grouped with an XDS Document Repository.
Data gathered from clinical documents submitted to the Document
Repository can be a source of information returned by the Clinical Data
Source. Information returned by the Clinical Data Source may include
references to all documents used in generating the results, by using the
FHIR Provenance Resource.

**Content Integration Profiles**

A Content Creator may be grouped with a Clinical Data Consumer to obtain
some or all of the information necessary to create a Medical Summary
based on information found in a Clinical Data Source.

A Content Creator may be grouped with a Clinical Data Source. When
grouped with a Content Creator, the Clinical Data Source shall respond
to queries containing the relevant vocabulary codes used by the Content
Creator.

