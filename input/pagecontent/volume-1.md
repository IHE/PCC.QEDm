
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

<div>
<img alt="QEDm Actor Diagram" src="qedm_x11.png" width="100%">
</div>
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
{: .grid}

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

If process flow “swimlane” diagrams require additional explanation
to clarify conditional flows, or flow variations need to be described
where alternate systems may be playing different actor roles, document
those conditional flows here.


## XX.5 QEDm Security Considerations <a name="security-considerations"> </a>

See ITI TF-2x: [Appendix Z.8 “Mobile Security Considerations”](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.8-mobile-security-considerations)

The following is instructions to the editor and this text is not to be included in a publication. 
The material initially from [RFC 3552 "Security Considerations Guidelines" July 2003](https://tools.ietf.org/html/rfc3552).

This section should address downstream design considerations, specifically for: Privacy, Security, and Safety. These might need to be individual header sections if they are significant or need to be referenced.

The editor needs to understand Security and Privacy fundamentals. 
General [Security and Privacy guidance](http://hl7.org/fhir/secpriv-module.html) is provided in the FHIR Specification. 
The FHIR core specification should be leveraged where possible to inform the reader of your specification.

IHE FHIR based profiles should reference the [ITI Appendix Z](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html) section 8 Mobile Security and Privacy Considerations base when appropriate.

IHE Document Content profiles can reference the security and privacy provided by the Document Sharing infrastructure as directly grouped or possibly to be grouped.

   While it is not a requirement that any given specification or system be
   immune to all forms of attack, it is still necessary for authors of specifications to
   consider as many forms as possible.  Part of the purpose of the
   Security and Privacy Considerations section is to explain what attacks have been 
   considered and what countermeasures can be applied to defend against them.
   
   There should be a clear description of the kinds of threats on the
   described specification.  This should be approached as an
   effort to perform "due diligence" in describing all known or
   foreseeable risks and threats to potential implementers and users.

Authors MUST describe:
* which attacks have been considered and addressed in the specification
* which attacks have been considered but not addressed in the specification
* what could be done in system design, system deployment, or user training


   At least the following forms of attack MUST be considered:
   eavesdropping, replay, message insertion, deletion, modification, and
   man-in-the-middle.  Potential denial of service attacks MUST be
   identified as well.  If the specification incorporates cryptographic
   protection mechanisms, it should be clearly indicated which portions
   of the data are protected and what the protections are (i.e.,
   integrity only, confidentiality, and/or endpoint authentication,
   etc.).  Some indication should also be given to what sorts of attacks
   the cryptographic protection is susceptible.  Data which should be
   held secret (keying material, random seeds, etc.) should be clearly
   labeled.

   If the specification involves authentication, particularly user-host
   authentication, the security of the authentication method MUST be
   clearly specified.  That is, authors MUST document the assumptions
   that the security of this authentication method is predicated upon.

   The threat environment addressed by the Security and Privacy Considerations
   section MUST at a minimum include deployment across the global
   Internet across multiple administrative boundaries without assuming
   that firewalls are in place, even if only to provide justification
   for why such consideration is out of scope for the protocol.  It is
   not acceptable to only discuss threats applicable to LANs and ignore
   the broader threat environment.  In
   some cases, there might be an Applicability Statement discouraging
   use of a technology or protocol in a particular environment.
   Nonetheless, the security issues of broader deployment should be
   discussed in the document.

   There should be a clear description of the residual risk to the user
   or operator of that specification after threat mitigation has been
   deployed.  Such risks might arise from compromise in a related
   specification (e.g., IPsec is useless if key management has been
   compromised), from incorrect implementation, compromise of the
   security technology used for risk reduction (e.g., a cipher with a
   40-bit key), or there might be risks that are not addressed by the
   specification (e.g., denial of service attacks on an
   underlying link protocol).  Particular care should be taken in
   situations where the compromise of a single system would compromise
   an entire protocol.  For instance, in general specification designers
   assume that end-systems are inviolate and don't worry about physical
   attack.  However, in cases (such as a certificate authority) where
   compromise of a single system could lead to widespread compromises,
   it is appropriate to consider systems and physical security as well.

   There should also be some discussion of potential security risks
   arising from potential misapplications of the specification or technology
   described in the specification.  
  
This section also include specific considerations regarding Digital Signatures, Provenance, Audit Logging, and De-Identification.

Where audit logging is specified, a StructureDefinition profile(s) should be included, and Examples of those logs might be included.

## XX.6 QEDm Cross-Profile Considerations <a name="other-grouping"> </a>

This section is informative, not normative. It is intended to put
this profile in context with other profiles. Any required groupings
should have already been described above. Brief descriptions can go
directly into this section; lengthy descriptions should go into an
appendix. Examples of this material include ITI Cross Community Access
(XCA) Grouping Rules (Section 18.2.3), the Radiology associated profiles
listed at wiki.ihe.net, or ITI Volume 1 Appendix E “Cross Profile
Considerations”, and the “See Also” sections Radiology Profile
descriptions on the wiki such as
<http://wiki.ihe.net/index.php/Scheduled_Workflow#See_Also>. If this
section is left blank, add “Not applicable.”

Consider using a format such as the following:

other profile acronym - other profile name

A other profile actor name in other profile name might
be grouped with a this profile actor name to describe
benefit/what is accomplished by grouping.


