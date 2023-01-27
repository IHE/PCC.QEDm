
The Query for Existing Data for Mobile Profile (QEDm) supports dynamic
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

The Query for Existing Data for Mobile (QEDm) Profile defines a
standardized interface to health (HTTP-based RESTful APIs) suited for
deployment of mobile applications on resource-constrained devices with
simple programming environment (e.g., JavaScript), simple protocol stack
(e.g., HTTP), and simple display functionality (e.g., HTML browser). The
goal is to limit required additional libraries that are often necessary
to process SOAP, MIME-Multipart, MTOM/XOP Web Services.

The Query for Existing Data for Mobile Profile (QEDm) Profile, uses the
already defined actors Clinical Data Consumer and Clinical Data Source,
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
links to source documents accessible through the MHD or XDS Profiles

<div markdown="1" class="stu-note">

| [Significant Changes, Open, and Closed Issues](issues.html) |
{: .grid}

</div>

### Organization of This Guide
This guide is organized into the following sections:

1. Volume 1: Profiles
   1. [Introduction](volume-1.html)
   1. [Actors and Transactions](volume-1.html#actors-and-transactions)
   1. [Actor Options](volume-1.html#actor-options)
   1. [Actor Required Groupings](volume-1.html#required-groupings)
   1. [Overview](volume-1.html#overview)
   1. [Security Considerations](volume-1.html#security-considerations)
   1. [Cross Profile Considerations](volume-1.html#other-grouping)

2. Volume 2: Transaction Detail
   1. [Mobile Query for Existing Data \[PCC-44\]](PCC-44.html)

3. [Volume 4: National Extensions](volume-4.html)

4. [Test Plan](testplan.html)

5. Other
   1. [Changes to Other Documents](other.html)
   2. [Downloads and Analysis](downloads.html)

See also the [Table of Contents](toc.html) and the index of [Artifacts](artifacts.html) defined as part of this implementation guide.

### Conformance Expectations

IHE uses the normative words: Shall, Should, and May according to [standards conventions](https://profiles.ihe.net/GeneralIntro/ch-E.html).

#### Must Support

The use of ```mustSupport``` in StructureDefinition profiles equivalent to the IHE use of **R2** as defined in [Appendix Z](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.10-profiling-conventions-for-constraints-on-fhir).

mustSupport of true - only has a meaning on items that are minimal cardinality of zero (0), and applies only to the source actor populating the data. The source actor shall populate the elements marked with MustSupport, if the concept is supported by the actor, a value exists, and security and consent rules permit. 
The consuming actors should handle these elements being populated or being absent/empty. 
Note that sometimes mustSupport will appear on elements with a minimal cardinality greater than zero (0), this is due to inheritance from a less constrained profile.

