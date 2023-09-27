## IG prototype

http://build.fhir.org/ig/IHE/QEDm/branches/master/index.html



## QEDm
FHIR Constraints for QEDm

QEDm_012: Currently QEDm does not constrain the FHIR Resources. This has been deliberately done due to the limited experience (Trial Implementation) with these FHIR Resources. There will be an effort during the spring and summer of 2019 to add constraints on the FHIR Resources. These constraints will be international, with support for Volume 4 regional constraints. These constraints will be based on original QED use-cases, original QED constraints, HL7 Implementation Guide for US-Core, and regional experience. All are encouraged to participate in this effort. Participate by joining the PCC technical workgroup, and by interacting with the GitHub.

US-Core github is https://github.com/HL7/US-Core-R4

See a blog Rene wrote on concerns with QEDm http://www.ringholm.com/column/Context_issues_with_IHE_QED.htm

## Conversion Plan

Contact John Moehrke if you would like to comment or help.

- Deadline for committee review is end of Feb
  - Committee review deadline April 7th
- Mary has converted the WORD to IG publisher format
  - Committee could review this narrative
  - However the narrative might change based on the other tasks
- John will change
  - Use IPA rather than going direct to FHIR core
  - QEDm will profile IPA to fit the use-cases within QEDm
  - QEDm will indicate that the IPA DocumentReference functionality can be found in MHD
  - 