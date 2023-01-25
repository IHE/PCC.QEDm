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

| Actor             | Role                        |
|-------------------|-----------------------------|
| [Clinical Data Consumer](volume-1.html#client)    | Queries the Clinical Data Source for clinical data content. Clinical content requested by the Clinical Data Consumer depends on query options supported by the consumer. |
| [Clinical Data Source](volume-1.html#server) | Responds to query, supplying the FHIR Resources representing the clinical data content that match the search criteria provided by the Clinical Data Consumer. |
{:.grid .table-striped}

### 2:3.44.3 Referenced Standards

- HL7 FHIR - [FHIR standard Release 4:] (http://www.hl7.org/fhir/R4/index.html)
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

The search target follows the FHIR http specification [http://hl7.org/fhir/R4/http.html]
(http://hl7.org/fhir/R4/http.html), addressing the proper FHIR
Resource type, according to the supported query options (see Section
2:3.44.4.1.2.1). The syntax of the FHIR query is:

GET \[base\]/\[Resource-type\]{?\[parameters\]}

with the following constraints:

- The \[base\] represents the Service Base URL

- The \[Resource-type\] represents the name of the FHIR Resource to consider (each option can involve one or more Resources), as specified in Section 3.44.4.1.2.1

- The \[parameters\] represents a series of encoded name-value pairs representing the filter for the query, as specified in Section 3.44.4.1.2.1, as well as control parameters to modify the behavior of the Clinical Data Source such as response format, or pagination. See ITI TF-2x: Appendix Z.6 for more details on response format.

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
