java -jar validator_cli_6.7.2.jar `
-version 4.0.1 `
-no-extensible-binding-warnings `
-display-issues-are-warnings `
-best-practice ignore `
-html-output ("output\validation_{0}.html" -f (Get-Date -Format "yyyyMMdd_HHmmss")) `
-ig kbv.ita.for#1.2.0 `
-ig de.basisprofil.r4#1.5.2 `
-ig de.ihe-d.terminology `
-ig kbv.all.st `
-ig kbv.basis#1.7.0 `
-ig de.gematik.epa#1.2.0 `
-ig de.gematik.epa.medication#1.2.0 `
-ig de.fhir.medication#1.0.0 `
-ig hl7.fhir.uv.extensions.r4#5.2.0 `
-ig kbv.ita.erp `
-ig rendered `
-ig kbv.ita.vos `
examples



---
Folgende Meldungen können ignoriert werden:
	--> sobald die neue Version vom eRezept1.4.0 veröffentlicht wird, und diese als dependency angegeben wird, werden diese Warnings/Informations/Errors nicht angezeigt

-- kbv.ita.vos\StructureDefinition-KBV-PR-VoS-Provenance-ePrescription.json --------------------------------------------------------------------------------
Success: 0 errors, 4 warnings, 2 notes
  Information @ StructureDefinition.differential.element[10].type[0].targetProfile[1] (line 106, col74): Canonical URL 'https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Bundle' kann nicht aufgel´┐â´¥Âst werden
  Information @ StructureDefinition.differential.element[11].type[0].targetProfile[0] (line 124, col74): Canonical URL 'https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Bundle' kann nicht aufgel´┐â´¥Âst werden
  Warning @ StructureDefinition.differential.element[10]: Cannot check whether the target profile https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Bundle on Provenance.target is valid constraint on the base because it is not known
  Warning @ StructureDefinition.differential.element[11]: Cannot check whether the target profile https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Bundle on Provenance.target is valid constraint on the base because it is not known
  Warning @ StructureDefinition.differential.element[10].type[0].targetProfile[0]: !!!!!!!!!!!!!!Profil https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Bundle kann nicht aufgel´┐â´¥Âst werden
  Warning @ StructureDefinition.differential.element[11].type[0].targetProfile[0]: !!!!!!!!!!!!!!Profil https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Bundle kann nicht aufgel´┐â´¥Âst werden
------------------------------------------------------------------------------------------------------------------------------------------------------------
-- kbv.ita.vos\StructureDefinition-KBV-PR-VoS-MedicationStatement-MP.json ------------------------------------------------------------------------------
Success: 0 errors, 8 warnings, 4 notes
  Information @ StructureDefinition.differential.element[23].type[0].targetProfile[4] (line 205, col90): Canonical URL 'https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Medication_Compounding' kann nicht aufgel´┐â´¥Âst werden
  Information @ StructureDefinition.differential.element[23].type[0].targetProfile[5] (line 206, col87): Canonical URL 'https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Medication_FreeText' kann nicht aufgel´┐â´¥Âst werden
  Information @ StructureDefinition.differential.element[23].type[0].targetProfile[6] (line 207, col89): Canonical URL 'https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Medication_Ingredient' kann nicht aufgel´┐â´¥Âst werden
  Information @ StructureDefinition.differential.element[23].type[0].targetProfile[7] (line 208, col82): Canonical URL 'https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Medication_PZN' kann nicht aufgel´┐â´¥Âst werden
  Warning @ StructureDefinition.differential.element[23]: Cannot check whether the target profile https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Medication_Compounding on MedicationStatement.medication[x] is valid constraint on the base because it is not known
  Warning @ StructureDefinition.differential.element[23]: Cannot check whether the target profile https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Medication_FreeText on MedicationStatement.medication[x] is valid constraint on the base because it is not known
  Warning @ StructureDefinition.differential.element[23]: Cannot check whether the target profile https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Medication_Ingredient on MedicationStatement.medication[x] is valid constraint on the base because it is not known
  Warning @ StructureDefinition.differential.element[23]: Cannot check whether the target profile https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Medication_PZN on MedicationStatement.medication[x] is valid constraint on the base because it is not known
  Warning @ StructureDefinition.differential.element[23].type[0].targetProfile[0]: !!!!!!!!!!!!!!Profil https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Medication_Compounding kann nicht aufgel´┐â´¥Âst werden
  Warning @ StructureDefinition.differential.element[23].type[0].targetProfile[0]: !!!!!!!!!!!!!!Profil https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Medication_FreeText kann nicht aufgel´┐â´¥Âst werden
  Warning @ StructureDefinition.differential.element[23].type[0].targetProfile[0]: !!!!!!!!!!!!!!Profil https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Medication_Ingredient kann nicht aufgel´┐â´¥Âst werden
  Warning @ StructureDefinition.differential.element[23].type[0].targetProfile[0]: !!!!!!!!!!!!!!Profil https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Medication_PZN kann nicht aufgel´┐â´¥Âst werden
--------------------------------------------------------------------------------------------------------------------------------------------------------
-- examples\example-ak7-aufruf-bundle-oberservations-BMP-muster16.xml --------------------------------------------------------------------------
*FAILURE*: 2 errors, 5 warnings, 14 notes
  Error @ Bundle.entry[0].resource/*Composition/54ef329e-48a1-4733-a751-7f3a7bc193b7*/.section[2].entry[0] (line 119, col28): Der Profilbezug 'https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Bundle' konnte nicht aufgel´┐â´¥Âst werden.
  Error @ Bundle.entry[0].resource/*Composition/54ef329e-48a1-4733-a751-7f3a7bc193b7*/.section[2].entry[1] (line 122, col28): Der Profilbezug 'https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Bundle' konnte nicht aufgel´┐â´¥Âst werden.