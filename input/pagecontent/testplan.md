<div markdown="1" class="stu-note">

This Test Plan page is a prototype.   We expect the maturity of the content will improve over time.  For now, we summarize high level testing scope and available tools. Comments are welcome.
</div>

## Introduction

Overall test plan leverages the Profiles, and Examples shown on the [Artifacts Summary](artifacts.html). The Profiles listed are describing the constraints that would be adhered to by Actors claiming conformance to this implementation guide. Thus any applicable Resources that are known to have been published by an app or server MUST be conformant to these profiles as appropriate.

The Examples listed in [Example Instances](artifacts.html#example-example-instances) are example instances. Some are conformant to the profiles. Other examples that either assist with the structure of the examples (e.g. Patient and Encounter) or are examples that  SHOULD be able to handle in various ways. 

This section will be improved as the IHE-Connectathon need drives the creation of the test plans, test procedures, test tools, and reporting.

### Unit Test Procedure

Unit Tests in this context is where a SUT is tested against a simulator or validator.  A simulator is a implementation of an actor that is designed specifically to test the opposite pair actor. The simulator might be a reference implementation or MAY be a specially designed test-bench. Where a reference implementation is used the negative tests are harder to simulate. A validator is an implementation that can check conformance. A validator MAY be a simulator, but MAY also be a standalone tool used to validate only a message encoding. Some reference implementations MAY be able to validate to a StructureDefinition profile, but often these do not include sufficient constraints given the overall actor conformance criteria. 

QEDm has two Actors:
- [Clinical Data Consumer](volume-1.html#client)
- [Clinical Data Source](volume-1.html#server)

The Options declared indicate the kind of clinical FHIR Resources (data) that are supported. So the following will be focused on the those that are declared supported.
The term "System Under Test" or "SUT" is used to represent a system being tested for conformance to QEDm. This same term is used for a Clinical Data Consumer as well as a Clinical Data Source; when an instance of a system is being tested.

#### Testing Clinical Data Consumer (aka Client)

- Test Tooling: A FHIR Server, such as HAPI.
    - user authorization would need to be flexible to support Test Clients
    - Could be accessible without user authorization
    - Should be accessible with IUA user authorization
    - Might be accessible with SMART-App-Launch authorization
    - The FHIR Server in this case must be configured to not accept changes during the testing, and should be able to be reset to a known dataset readily.
- given set of Patients
    - Given a known set of reasonable clinical information covering all Resources in QEDm over these Patients
        - A potential source of this data might be [Synthea](https://synthetichealth.github.io/synthea/). There are [available datasets for download](https://synthea.mitre.org/downloads), or the tool is available to enable creation of a dataset more specific to the needs. These datasets are likely sufficient to get started, but may not cover the full breath of QEDm, or have sufficient depth.
    - Some patients should have minimal information, some should be fully populated
    - A patient should have no clinical data, so as to test that clients can handle getting no response
    - All clinical information should be human reasonable clinical information. Not to say medically normal, there should be some abnormal patients. The data should not be outside of the possibility for that kind of data (e.g. a negative heart-rate)
    - Some clinical information should be proper profile validating, but be at the limits of clinically relevant. Such as dateTime that is just the year. Such as not using standards based codes. Such as reasonably long narrative strings.
- Test Script
    - note that a SUT Searches on Patient is testing PDQm, but is an important precondition as is testing of ATNA and IUA as appropriate.
    - Client SUT are asked to search on a given Patient, for a specific kind of clinical data (e.g. Allergies)
      - Validate that they got the expected clinical data
      - repeat for all the clinical data the client supports
      - Note that some clients may not be able to do individual searches, this is fine as long as they can prove they executed the search on the FHIR Resources for which their options are declared, and they can prove that they got back and handled the data as expected to have been returned by the FHIR Server
      - repeat to stress any search parameters that the SUT supports. 

##### failure mode testing

- Test Tooling should be able to be configured to return reasonable error responses. (Resources unavailable, access denied)
    - The SUT should be able to handle gracefully these errors

##### advanced testing

- Should also have a known set of information that is not reasonable clinical information. These would be QEDm Resources that hold data that is not clinically reasonable. These data are used to test that a client can handle invalid data. The client does not need to show that they can process these data, but does need to show that searching on these patients does not cause anything bad to happen (e.g. a client crash)
    - This data might be generated by a fuzzing tool, that understands the FHIR Resource format and provides randomized data filling those schema elements
    - Various  datatypes should be stressed. For example badly formatted dateTime, or dateTime that is beyond now, or before 1900. 

#### Testing Clinical Data Source (aka Servers)

- Test Tooling: A FHIR Client. 
    - This might be a custom written client, might be use of test tooling like Postman
    - This tool will need to be able to be configured for reasonable user security (none, IUA, and SMART-App-Launch)
- Given the SUT offers one or more patients to use for the testing, and that the SUT has a reasonable set of qualifying clinical data according to the SUT declared options
- Test Script
    - Test tool will query the FHIR metadata endpoint on the SUT, and confirm that the CapabilityStatement returned is valid for a QEDm Clinical Data Source with the given options declared by the SUT
    - Test tool will be configured for the SUT identified user authentication
    - Test tool will search for the Patient given, failing if the patients are not found
    - Test tool will search on each of the Resources as identified by the declared options of the SUT, failing if the Resources are not supported (Note that it is valid to return zero resources found so this is not a failure. Failure)
    - Test tool will iterate thru all the mandatory search parameters., failing if a manditory search parameter returns an error or appears to not function.
        - For example, given the first searches provide the resources available. The test tool can use a search parameter that should have a deterministic response.

### Integration Test Procedure

Integration Tests in this context is where two SUT of paired actors test against each other. In this case the subset of tests that can be tested is the intersection. Testing only this intersection is necessary but not sufficient. The testing must also include the capability of the client to exercise the test scenarios that this SUT can test, to determine that failure-modes are handled properly by both SUT.


