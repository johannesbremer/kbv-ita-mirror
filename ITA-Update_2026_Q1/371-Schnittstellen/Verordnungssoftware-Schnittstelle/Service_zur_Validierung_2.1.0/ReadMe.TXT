Aufruf des beigefügten Validators in der Kommandozeile:

java -jar validator_cli.jar -version 4.0.1 -no-extensible-binding-warnings -display-issues-are-warnings -ig de.basisprofil.r4 -ig kbv.basis -ig kbv.ita.erp -ig kbv.ita.for -ig KBV-Schluesseltabellen -ig kbv.ita.vos -ig de.ihe-d.terminology examples\BSP_AllergyIntolerance.xml

-version 4.0.1 : Parameter für die Angabe der FHIR-Version, hier Version 4.0.1

-no-extensible-binding-warnings : Dies ist ein optionaler Parameter, um zusätzliche Warnungen zu verhindern.

-display-issues-are-warnings : Dies ist ein neuer optionaler Parameter, der dazu dient, Anzeigeprobleme als Warnungen zu behandeln, anstatt sie als Fehler zu behandeln.

-ig : Hier müssen alle relevanten Ordner mit den abhängigen Profilen aufgeführt werden.

-tx n/a: weiterer optionaler Parameter, damit ohne Terminologieserver-Zugriff validiert werden kann, falls der Terminologie-Server nicht erreichbar ist

examples\BSP_AllergyIntolerance.xml : Dies ist die zu validierende Datei aus dem Ordner "examples", in diesem Fall ein Beispiel einer Allergie/Intoleranz
Es kann hier auch ein gesamter Ordner angegeben werden bspw. examples oder kbv.ita.vos

Der FHIR-Validator 6.3.3 kann unter folgendem Link heruntergeladen werden
https://github.com/hapifhir/org.hl7.fhir.core/releases/tag/6.3.3

Folgende Warnungen und Hinweise entstehen bei der Validierung der Profile und zur Verfügung gestellten Beispielinstanzen mit der Version 6.3.3 des HL7.org-Validators, obwohl nach unserer Einschätzung weder Fehler in den Instanzen noch in den Profilen enthalten sind. HINWEIS: Die Fehlermeldungen in den Bundle-Dateien entsprechen den Fehlermeldungen aus den einzelnen enthaltenen Instanzen und daraus resultierenden Folgefehlern.


-- examples\BSP_AllergyIntolerance.xml -------------------------------------------
Success: 0 errors, 1 warnings, 0 notes
  Warning @ AllergyIntolerance (line 1, col49): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
----------------------------------------------------------------------------------

-- examples\BSP_AllergyIntolerance_2.xml ---------------------------------------------
Success: 0 errors, 1 warnings, 3 notes
  Information @ AllergyIntolerance.code.coding[1].system (line 25, col9): A definition for CodeSystem 'http://fhir.de/CodeSystem/ask' could not be found, so the code cannot be validated
  Information @ AllergyIntolerance.code.coding[2].system (line 25, col9): A definition for CodeSystem 'http://fhir.de/CodeSystem/bfarm/atc' version '2022' could not be found, so the code cannot be validated. Valid versions: []
  Information @ AllergyIntolerance.code.coding[3].system (line 25, col9): A definition for CodeSystem 'http://fhir.de/CodeSystem/ifa/pzn' could not be found, so the code cannot be validated
  Warning @ AllergyIntolerance (line 1, col49): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
--------------------------------------------------------------------------------------

-- examples\BSP_Bundle_PVS_VoS.xml ----------------------------------------
Success: 0 errors, 35 warnings, 15 notes
  Information @ Bundle.entry[12].resource/*Observation/500*/ (line 691, col13): Validate Observation against the Body height profile (http://hl7.org/fhir/StructureDefinition/bodyheight) which is required by the FHIR specification because the LOINC code 8302-2 was found
  Information @ Bundle.entry[12].resource (line 691, col13): Validate Observation against the Body height profile (http://hl7.org/fhir/StructureDefinition/bodyheight) which is required by the FHIR specification because the LOINC code 8302-2 was found
  Information @ Bundle.entry[13].resource/*Observation/510*/ (line 735, col13): Validate Observation against the Body weight profile (http://hl7.org/fhir/StructureDefinition/bodyweight) which is required by the FHIR specification because the LOINC code 29463-7 was found
  Information @ Bundle.entry[13].resource (line 735, col13): Validate Observation against the Body weight profile (http://hl7.org/fhir/StructureDefinition/bodyweight) which is required by the FHIR specification because the LOINC code 29463-7 was found
  Information @ Bundle.entry[7].resource/*Coverage/600*/.type (line 414, col11): Keiner der angegebenen Codes ist im Valueset 'Coverage Type and Self-Pay Codes' (http://hl7.org/fhir/ValueSet/coverage-type|4.0.1), und es wird empfohlen, einen Code aus dieserm Valueset zu verwenden) (Codes = http://fhir.de/CodeSystem/versicherungsart-de-basis#GKV)
  Information @ Bundle.entry[8].resource/*Practitioner/200*/.qualification[0].code (line 479, col12): Keiner der angegebenen Codes ist im Valueset 'Practitioner Speciality' (https://fhir.kbv.de/ValueSet/KBV_VS_Base_Practitioner_Speciality|1.3.0), und es wird empfohlen, einen Code aus dieserm Valueset zu verwenden) (Codes = https://fhir.kbv.de/CodeSystem/KBV_CS_FOR_Qualification_Type#00)
  Information @ Bundle.entry[8].resource/*Practitioner/200*/.qualification[1].code (line 487, col12): Keiner der angegebenen Codes ist im Valueset 'Practitioner Speciality' (https://fhir.kbv.de/ValueSet/KBV_VS_Base_Practitioner_Speciality|1.3.0), und es wird empfohlen, einen Code aus dieserm Valueset zu verwenden) (Codes = https://fhir.kbv.de/CodeSystem/KBV_CS_FOR_Berufsbezeichnung#Berufsbezeichnung)
 Information @ Bundle.entry[18].resource/*DocumentReference/2500*/.type (line 942, col11): Keiner der angegebenen Codes ist im Valueset 'Document Type Value Set' (http://hl7.org/fhir/ValueSet/c80-doc-typecodes|4.0.1), und es wird empfohlen, einen Code aus dieserm Valueset zu verwenden) (Codes = https://fhir.kbv.de/CodeSystem/KBV_CS_VoS_DocumentType#Rezept, http://ihe-d.de/CodeSystems/IHEXDStypeCode#MEDI)
  Information @ Bundle (line 1, col37): 'MedicationRequest/700' konnte nicht in bundle (Bundle.entry[18].resource.context.related[0]) gefunden werden
  Information @ Bundle.entry[11].resource/*AllergyIntolerance/4*/.code.coding[1].system (line 655, col11): A definition for CodeSystem 'http://fhir.de/CodeSystem/ask' could not be found, so the code cannot be validated
  Information @ Bundle.entry[11].resource/*AllergyIntolerance/4*/.code.coding[2].system (line 655, col11): A definition for CodeSystem 'http://fhir.de/CodeSystem/bfarm/atc' version '2022' could not be found, so the code cannot be validated. Valid versions: []
  Information @ Bundle.entry[11].resource/*AllergyIntolerance/4*/.code.coding[3].system (line 655, col11): A definition for CodeSystem 'http://fhir.de/CodeSystem/ifa/pzn' could not be found, so the code cannot be validated
  Information @ Bundle.entry[17].resource/*Condition/50*/.code.coding[0].system (line 904, col11): A definition for CodeSystem 'http://fhir.de/CodeSystem/bfarm/icd-10-gm' version '2022' could not be found, so the code cannot be validated. Valid versions: []
  Information @ Bundle.entry[19].resource/*Medication/710*/.code.coding[0].system (line 1028, col11): A definition for CodeSystem 'http://fhir.de/CodeSystem/ifa/pzn' could not be found, so the code cannot be validated
  Information @ Bundle.entry[19].resource/*Medication/710*/.ingredient[0].item.ofType(CodeableConcept).coding[0].system (line 1055, col27): A definition for CodeSystem 'http://fhir.de/CodeSystem/ask' could not be found, so the code cannot be validated
  Warning @ Bundle.entry[19].resource/*Medication/710*/.amount.numerator (line 1042, col17): UCUM Codes that contain human readable annotations like {HKP} can be misleading (e.g. they are ignored when comparing units). Best Practice is not to depend on annotations in the UCUM code, so this usage should be checked, and the Quantity.unit 'Hartkapseln' SHOULD contain the annotation (it does not)
  Warning @ Bundle.entry[12].resource/*Observation/500*/.code.coding[0] (line 707, col14): Resolved system http://snomed.info/sct, but the definition is not complete, so assuming value set include is correct
  Warning @ Bundle.entry[13].resource/*Observation/510*/.code.coding[0] (line 751, col14): Resolved system http://snomed.info/sct, but the definition is not complete, so assuming value set include is correct
  Warning @ Bundle.entry[19].resource/*Medication/710*/.extension[0].value.ofType(CodeableConcept).coding[0] (line 1005, col15): Resolved system http://snomed.info/sct, but the definition is not complete, so assuming value set include is correct
  Warning @ Bundle.entry[12].resource/*Observation/500*/ (line 691, col13): Alle Observations sollten einen Performer haben
  Warning @ Bundle.entry[12].resource (line 691, col13): Alle Observations sollten einen Performer haben
  Warning @ Bundle.entry[13].resource/*Observation/510*/ (line 735, col13): Alle Observations sollten einen Performer haben
  Warning @ Bundle.entry[13].resource (line 735, col13): Alle Observations sollten einen Performer haben
  Warning @ Bundle.entry[14].resource/*Observation/520*/ (line 779, col13): Alle Observations sollten einen Performer haben
  Warning @ Bundle.entry[14].resource (line 779, col13): Alle Observations sollten einen Performer haben
  Warning @ Bundle.entry[15].resource/*Observation/530*/ (line 815, col13): Alle Observations sollten einen Performer haben
  Warning @ Bundle.entry[15].resource (line 815, col13): Alle Observations sollten einen Performer haben
  Warning @ Bundle.entry[16].resource/*Observation/540*/ (line 846, col13): Alle Observations sollten einen Performer haben
  Warning @ Bundle.entry[16].resource (line 846, col13): Alle Observations sollten einen Performer haben
  Warning @ Bundle.entry[0].resource/*Composition/1500*/ (line 16, col13): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
  Warning @ Bundle.entry[1].resource/*Practitioner/2*/ (line 131, col13): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
  Warning @ Bundle.entry[2].resource/*Organization/250*/ (line 168, col13): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
  Warning @ Bundle.entry[3].resource/*Device/20000*/ (line 224, col13): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
  Warning @ Bundle.entry[4].resource/*PractitionerRole/210*/ (line 261, col13): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
  Warning @ Bundle.entry[5].resource/*Provenance/10000*/ (line 284, col13): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
  Warning @ Bundle.entry[6].resource/*Provenance/10001*/ (line 327, col13): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
  Warning @ Bundle.entry[7].resource/*Coverage/600*/ (line 370, col13): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
  Warning @ Bundle.entry[8].resource/*Practitioner/200*/ (line 438, col13): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
  Warning @ Bundle.entry[9].resource/*Patient/100*/ (line 500, col13): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
  Warning @ Bundle.entry[10].resource/*AllergyIntolerance/3*/ (line 579, col13): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
  Warning @ Bundle.entry[11].resource/*AllergyIntolerance/4*/ (line 630, col13): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
  Warning @ Bundle.entry[12].resource/*Observation/500*/ (line 691, col13): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
  Warning @ Bundle.entry[13].resource/*Observation/510*/ (line 735, col13): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
 Warning @ Bundle.entry[14].resource/*Observation/520*/ (line 779, col13): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
  Warning @ Bundle.entry[15].resource/*Observation/530*/ (line 815, col13): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
  Warning @ Bundle.entry[16].resource/*Observation/540*/ (line 846, col13): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
  Warning @ Bundle.entry[17].resource/*Condition/50*/ (line 877, col13): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
  Warning @ Bundle.entry[18].resource/*DocumentReference/2500*/ (line 934, col13): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
  Warning @ Bundle.entry[19].resource/*Medication/710*/ (line 995, col13): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
  Warning @ Bundle.entry[20].resource/*MedicationStatement/720*/ (line 1079, col13): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
---------------------------------------------------------------------------

-- examples\BSP_Bundle_PVS_VoS_2.xml -----------------------------------------
Success: 0 errors, 8 warnings, 3 notes
  Information @ Bundle.entry[5].resource/*Coverage/91001*/.type (line 245, col11): Keiner der angegebenen Codes ist im Valueset 'Coverage Type and Self-Pay Codes' (http://hl7.org/fhir/ValueSet/coverage-type|4.0.1), und es wird empfohlen, einen Code aus dieserm Valueset zu verwenden) (Codes = http://fhir.de/CodeSystem/versicherungsart-de-basis#GKV)
  Information @ Bundle.entry[6].resource/*Practitioner/90000*/.qualification[0].code (line 295, col12): Keiner der angegebenen Codes ist im Valueset 'Practitioner Speciality' (https://fhir.kbv.de/ValueSet/KBV_VS_Base_Practitioner_Speciality|1.3.0), und es wird empfohlen, einen Code aus dieserm Valueset zu verwenden) (Codes = https://fhir.kbv.de/CodeSystem/KBV_CS_FOR_Qualification_Type#00)
  Information @ Bundle.entry[6].resource/*Practitioner/90000*/.qualification[1].code (line 303, col12): Keiner der angegebenen Codes ist im Valueset 'Practitioner Speciality' (https://fhir.kbv.de/ValueSet/KBV_VS_Base_Practitioner_Speciality|1.3.0), und es wird empfohlen, einen Code aus dieserm Valueset zu verwenden) (Codes = https://fhir.kbv.de/CodeSystem/KBV_CS_FOR_Berufsbezeichnung#Berufsbezeichnung)
  Warning @ Bundle.entry[0].resource/*Composition/85100*/ (line 16, col13): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
  Warning @ Bundle.entry[1].resource/*Practitioner/5600*/ (line 82, col13): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
  Warning @ Bundle.entry[2].resource/*Organization/90001*/ (line 101, col13): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
  Warning @ Bundle.entry[3].resource/*Device/20000*/ (line 153, col13): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
  Warning @ Bundle.entry[4].resource/*PractitionerRole/90002*/ (line 190, col13): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
  Warning @ Bundle.entry[5].resource/*Coverage/91001*/ (line 209, col13): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
  Warning @ Bundle.entry[6].resource/*Practitioner/90000*/ (line 266, col13): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
  Warning @ Bundle.entry[7].resource/*Patient/91000*/ (line 316, col13): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
------------------------------------------------------------------------------

-- examples\BSP_Bundle_PVS_VoS_3.xml -----------------------------------------
Success: 0 errors, 7 warnings, 3 notes
  Information @ Bundle.entry[5].resource/*Practitioner/90000*/.qualification[0].code (line 235, col12): Keiner der angegebenen Codes ist im Valueset 'Practitioner Speciality' (https://fhir.kbv.de/ValueSet/KBV_VS_Base_Practitioner_Speciality|1.3.0), und es wird empfohlen, einen Code aus dieserm Valueset zu verwenden) (Codes = https://fhir.kbv.de/CodeSystem/KBV_CS_FOR_Qualification_Type#00)
  Information @ Bundle.entry[5].resource/*Practitioner/90000*/.qualification[1].code (line 243, col12): Keiner der angegebenen Codes ist im Valueset 'Practitioner Speciality' (https://fhir.kbv.de/ValueSet/KBV_VS_Base_Practitioner_Speciality|1.3.0), und es wird empfohlen, einen Code aus dieserm Valueset zu verwenden) (Codes = https://fhir.kbv.de/CodeSystem/KBV_CS_FOR_Berufsbezeichnung#Berufsbezeichnung)
  Information @ Bundle.entry[6].resource/*DocumentReference/85201*/.type (line 272, col11): Keiner der angegebenen Codes ist im Valueset 'Document Type Value Set' (http://hl7.org/fhir/ValueSet/c80-doc-typecodes|4.0.1), und es wird empfohlen, einen Code aus dieserm Valueset zu verwenden) (Codes = https://fhir.kbv.de/CodeSystem/KBV_CS_VoS_DocumentType#Signiertes_eRezept, http://ihe-d.de/CodeSystems/IHEXDStypeCode#MEDI)
  Warning @ Bundle.entry[0].resource/*Composition/85200*/ (line 16, col13): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
  Warning @ Bundle.entry[1].resource/*Practitioner/5600*/ (line 79, col13): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
  Warning @ Bundle.entry[2].resource/*Organization/90001*/ (line 98, col13): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
  Warning @ Bundle.entry[3].resource/*Device/20000*/ (line 150, col13): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
  Warning @ Bundle.entry[4].resource/*PractitionerRole/90002*/ (line 187, col13): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
  Warning @ Bundle.entry[5].resource/*Practitioner/90000*/ (line 206, col13): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
  Warning @ Bundle.entry[6].resource/*DocumentReference/85201*/ (line 256, col13): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
------------------------------------------------------------------------------

-- examples\BSP_Bundle_VoS_PVS.xml ----------------------------------------
Success: 0 errors, 7 warnings, 3 notes
  Information @ Bundle.entry[0].resource/*DocumentReference/2500*/.type (line 43, col11): Keiner der angegebenen Codes ist im Valueset 'Document Type Value Set' (http://hl7.org/fhir/ValueSet/c80-doc-typecodes|4.0.1), und es wird empfohlen, einen Code aus dieserm Valueset zu verwenden) (Codes = https://fhir.kbv.de/CodeSystem/KBV_CS_VoS_DocumentType#Rezept, http://ihe-d.de/CodeSystems/IHEXDStypeCode#MEDI)
  Information @ Bundle.entry[2].resource/*Medication/710*/.code.coding[0].system (line 210, col11): A definition for CodeSystem 'http://fhir.de/CodeSystem/ifa/pzn' could not be found, so the code cannot be validated
  Information @ Bundle.entry[2].resource/*Medication/710*/.ingredient[0].item.ofType(CodeableConcept).coding[0].system (line 237, col27): A definition for CodeSystem 'http://fhir.de/CodeSystem/ask' could not be found, so the code cannot be validated
  Warning @ Bundle.entry[1].resource/*MedicationRequest/700*/.dispenseRequest.quantity (line 159, col16): UCUM Codes that contain human readable annotations like {Package} can be misleading (e.g. they are ignored when comparing units). Best Practice is not to depend on annotations in the UCUM code, so this usage should be checked, and the Quantity.unit SHOULD contain the annotation
  Warning @ Bundle.entry[2].resource/*Medication/710*/.amount.numerator (line 224, col17): UCUM Codes that contain human readable annotations like {HKP} can be misleading (e.g. they are ignored when comparing units). Best Practice is not to depend on annotations in the UCUM code, so this usage should be checked, and the Quantity.unit 'Hartkapseln' SHOULD contain the annotation (it does not)
  Warning @ Bundle.entry[2].resource/*Medication/710*/.extension[0].value.ofType(CodeableConcept).coding[0] (line 187, col15): Resolved system http://snomed.info/sct, but the definition is not complete, so assuming value set include is correct
  Warning @ Bundle.entry[0].resource/*DocumentReference/2500*/ (line 35, col13): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
  Warning @ Bundle.entry[1].resource/*MedicationRequest/700*/ (line 100, col13): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
  Warning @ Bundle.entry[2].resource/*Medication/710*/ (line 177, col13): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
  Warning @ Bundle.entry[3].resource/*MedicationStatement/720*/ (line 265, col13): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
---------------------------------------------------------------------------

-- examples\BSP_Bundle_VoS_PVS_2.xml -----------------------------------------
Success: 0 errors, 43 warnings, 16 notes
  Information @ Bundle.entry[17].resource/*Medication/100070*/.extension[0].value.ofType(CodeableConcept).coding[0].code (line 1271, col28): Not validated against the Machine Readable Concept Model (MRCM)
  Information @ Bundle.entry[0].resource/*DocumentReference/100033*/.type (line 43, col11): Keiner der angegebenen Codes ist im Valueset 'Document Type Value Set' (http://hl7.org/fhir/ValueSet/c80-doc-typecodes|4.0.1), und es wird empfohlen, einen Code aus dieserm Valueset zu verwenden) (Codes = https://fhir.kbv.de/CodeSystem/KBV_CS_VoS_DocumentType#Rezept, http://ihe-d.de/CodeSystems/IHEXDStypeCode#MEDI)
  Information @ Bundle.entry[1].resource/*DocumentReference/100103*/.type (line 114, col11): Keiner der angegebenen Codes ist im Valueset 'Document Type Value Set' (http://hl7.org/fhir/ValueSet/c80-doc-typecodes|4.0.1), und es wird empfohlen, einen Code aus dieserm Valueset zu verwenden) (Codes = https://fhir.kbv.de/CodeSystem/KBV_CS_VoS_DocumentType#Rezept, http://ihe-d.de/CodeSystems/IHEXDStypeCode#MEDI)
  Information @ Bundle.entry[2].resource/*DocumentReference/100113*/.type (line 179, col11): Keiner der angegebenen Codes ist im Valueset 'Document Type Value Set' (http://hl7.org/fhir/ValueSet/c80-doc-typecodes|4.0.1), und es wird empfohlen, einen Code aus dieserm Valueset zu verwenden) (Codes = https://fhir.kbv.de/CodeSystem/KBV_CS_VoS_DocumentType#Rezept, http://ihe-d.de/CodeSystems/IHEXDStypeCode#MEDI)
  Information @ Bundle.entry[3].resource/*DocumentReference/100043*/.type (line 244, col11): Keiner der angegebenen Codes ist im Valueset 'Document Type Value Set' (http://hl7.org/fhir/ValueSet/c80-doc-typecodes|4.0.1), und es wird empfohlen, einen Code aus dieserm Valueset zu verwenden) (Codes = https://fhir.kbv.de/CodeSystem/KBV_CS_VoS_DocumentType#Rezept, http://ihe-d.de/CodeSystems/IHEXDStypeCode#MEDI)
  Information @ Bundle.entry[4].resource/*DocumentReference/100073*/.type (line 309, col11): Keiner der angegebenen Codes ist im Valueset 'Document Type Value Set' (http://hl7.org/fhir/ValueSet/c80-doc-typecodes|4.0.1), und es wird empfohlen, einen Code aus dieserm Valueset zu verwenden) (Codes = https://fhir.kbv.de/CodeSystem/KBV_CS_VoS_DocumentType#Rezept, http://ihe-d.de/CodeSystems/IHEXDStypeCode#MEDI)
  Information @ Bundle.entry[5].resource/*DocumentReference/100023*/.type (line 374, col11): Keiner der angegebenen Codes ist im Valueset 'Document Type Value Set' (http://hl7.org/fhir/ValueSet/c80-doc-typecodes|4.0.1), und es wird empfohlen, einen Code aus dieserm Valueset zu verwenden) (Codes = https://fhir.kbv.de/CodeSystem/KBV_CS_VoS_DocumentType#Rezept, http://ihe-d.de/CodeSystems/IHEXDStypeCode#MEDI)
  Information @ Bundle.entry[7].resource/*Medication/100000*/.code.coding[0].system (line 540, col11): A definition for CodeSystem 'http://fhir.de/CodeSystem/ifa/pzn' could not be found, so the code cannot be validated
  Information @ Bundle.entry[7].resource/*Medication/100000*/.ingredient[0].item.ofType(CodeableConcept).coding[0].system (line 567, col27): A definition for CodeSystem 'http://fhir.de/CodeSystem/ask' could not be found, so the code cannot be validated
  Information @ Bundle.entry[9].resource/*Medication/100010*/.code.coding[0].system (line 705, col11): A definition for CodeSystem 'http://fhir.de/CodeSystem/ifa/pzn' could not be found, so the code cannot be validated
  Information @ Bundle.entry[9].resource/*Medication/100010*/.ingredient[0].item.ofType(CodeableConcept).coding[0].system (line 732, col27): A definition for CodeSystem 'http://fhir.de/CodeSystem/ask' could not be found, so the code cannot be validated
  Information @ Bundle.entry[11].resource/*Medication/100030*/.code.coding[0].system (line 870, col11): A definition for CodeSystem 'http://fhir.de/CodeSystem/ifa/pzn' could not be found, so the code cannot be validated
  Information @ Bundle.entry[11].resource/*Medication/100030*/.ingredient[0].item.ofType(CodeableConcept).coding[0].system (line 897, col27): A definition for CodeSystem 'http://fhir.de/CodeSystem/ask' could not be found, so the code cannot be validated
  Information @ Bundle.entry[13].resource/*Medication/100020*/.ingredient[0].item.ofType(CodeableConcept).coding[0].system (line 1044, col27): A definition for CodeSystem 'http://fhir.de/CodeSystem/ask' could not be found, so the code cannot be validated
  Information @ Bundle.entry[19].resource/*Medication/100100*/.code.coding[0].system (line 1460, col11): A definition for CodeSystem 'http://fhir.de/CodeSystem/ifa/pzn' could not be found, so the code cannot be validated
  Information @ Bundle.entry[21].resource/*Medication/100110*/.code.coding[0].system (line 1632, col11): A definition for CodeSystem 'http://fhir.de/CodeSystem/ifa/pzn' could not be found, so the code cannot be validated
  Warning @ Bundle.entry[6].resource/*MedicationRequest/100001*/.dispenseRequest.quantity (line 489, col16): UCUM Codes that contain human readable annotations like {Package} can be misleading (e.g. they are ignored when comparing units). Best Practice is not to depend on annotations in the UCUM code, so this usage should be checked, and the Quantity.unit SHOULD contain the annotation
  Warning @ Bundle.entry[7].resource/*Medication/100000*/.amount.numerator (line 554, col17): UCUM Codes that contain human readable annotations like {Stueck} can be misleading (e.g. they are ignored when comparing units). Best Practice is not to depend on annotations in the UCUM code, so this usage should be checked, and the Quantity.unit 'Stück' SHOULD contain the annotation (it does not)
  Warning @ Bundle.entry[8].resource/*MedicationRequest/100011*/.dispenseRequest.quantity (line 654, col16): UCUM Codes that contain human readable annotations like {Package} can be misleading (e.g. they are ignored when comparing units). Best Practice is not to depend on annotations in the UCUM code, so this usage should be checked, and the Quantity.unit SHOULD contain the annotation
  Warning @ Bundle.entry[9].resource/*Medication/100010*/.amount.numerator (line 719, col17): UCUM Codes that contain human readable annotations like {Stueck} can be misleading (e.g. they are ignored when comparing units). Best Practice is not to depend on annotations in the UCUM code, so this usage should be checked, and the Quantity.unit 'Stück' SHOULD contain the annotation (it does not)
  Warning @ Bundle.entry[10].resource/*MedicationRequest/100031*/.dispenseRequest.quantity (line 819, col16): UCUM Codes that contain human readable annotations like {Package} can be misleading (e.g. they are ignored when comparing units). Best Practice is not to depend on annotations in the UCUM code, so this usage should be checked, and the Quantity.unit SHOULD contain the annotation
  Warning @ Bundle.entry[11].resource/*Medication/100030*/.amount.numerator (line 884, col17): UCUM Codes that contain human readable annotations like {Stueck} can be misleading (e.g. they are ignored when comparing units). Best Practice is not to depend on annotations in the UCUM code, so this usage should be checked, and the Quantity.unit 'Stück' SHOULD contain the annotation (it does not)
  Warning @ Bundle.entry[12].resource/*MedicationRequest/100021*/.dispenseRequest.quantity (line 983, col16): UCUM Codes that contain human readable annotations like {Package} can be misleading (e.g. they are ignored when comparing units). Best Practice is not to depend on annotations in the UCUM code, so this usage should be checked, and the Quantity.unit SHOULD contain the annotation
  Warning @ Bundle.entry[13].resource/*Medication/100020*/.amount.numerator (line 1031, col17): UCUM Codes that contain human readable annotations like {Stueck} can be misleading (e.g. they are ignored when comparing units). Best Practice is not to depend on annotations in the UCUM code, so this usage should be checked, and the Quantity.unit 'Stück' SHOULD contain the annotation (it does not)
  Warning @ Bundle.entry[14].resource/*MedicationRequest/100041*/.dispenseRequest.quantity (line 1130, col16): UCUM Codes that contain human readable annotations like {Package} can be misleading (e.g. they are ignored when comparing units). Best Practice is not to depend on annotations in the UCUM code, so this usage should be checked, and the Quantity.unit SHOULD contain the annotation
  Warning @ Bundle.entry[16].resource/*MedicationRequest/100071*/.dispenseRequest.quantity (line 1244, col16): UCUM Codes that contain human readable annotations like {Package} can be misleading (e.g. they are ignored when comparing units). Best Practice is not to depend on annotations in the UCUM code, so this usage should be checked, and the Quantity.unit SHOULD contain the annotation
  Warning @ Bundle.entry[18].resource/*MedicationRequest/100101*/.dispenseRequest.quantity (line 1412, col16): UCUM Codes that contain human readable annotations like {Package} can be misleading (e.g. they are ignored when comparing units). Best Practice is not to depend on annotations in the UCUM code, so this usage should be checked, and the Quantity.unit SHOULD contain the annotation
  Warning @ Bundle.entry[19].resource/*Medication/100100*/.amount.numerator (line 1474, col17): UCUM Codes that contain human readable annotations like {Stueck} can be misleading (e.g. they are ignored when comparing units). Best Practice is not to depend on annotations in the UCUM code, so this usage should be checked, and the Quantity.unit 'Stück' SHOULD contain the annotation (it does not)
  Warning @ Bundle.entry[20].resource/*MedicationRequest/100111*/.dispenseRequest.quantity (line 1584, col16): UCUM Codes that contain human readable annotations like {Package} can be misleading (e.g. they are ignored when comparing units). Best Practice is not to depend on annotations in the UCUM code, so this usage should be checked, and the Quantity.unit SHOULD contain the annotation
  Warning @ Bundle.entry[21].resource/*Medication/100110*/.amount.numerator (line 1646, col17): UCUM Codes that contain human readable annotations like {Stueck} can be misleading (e.g. they are ignored when comparing units). Best Practice is not to depend on annotations in the UCUM code, so this usage should be checked, and the Quantity.unit 'Stück' SHOULD contain the annotation (it does not)
  Warning @ Bundle.entry[7].resource/*Medication/100000*/.extension[0].value.ofType(CodeableConcept).coding[0] (line 517, col15): Resolved system http://snomed.info/sct, but the definition is not complete, so assuming value set include is correct
  Warning @ Bundle.entry[9].resource/*Medication/100010*/.extension[0].value.ofType(CodeableConcept).coding[0] (line 682, col15): Resolved system http://snomed.info/sct, but the definition is not complete, so assuming value set include is correct
  Warning @ Bundle.entry[11].resource/*Medication/100030*/.extension[0].value.ofType(CodeableConcept).coding[0] (line 847, col15): Resolved system http://snomed.info/sct, but the definition is not complete, so assuming value set include is correct
  Warning @ Bundle.entry[17].resource/*Medication/100070*/.extension[0].value.ofType(CodeableConcept).coding[0] (line 1272, col15): Resolved system http://snomed.info/sct, but the definition is not complete, so assuming value set include is correct
  Warning @ Bundle.entry[19].resource/*Medication/100100*/.extension[0].value.ofType(CodeableConcept).coding[0] (line 1440, col15): Resolved system http://snomed.info/sct, but the definition is not complete, so assuming value set include is correct
  Warning @ Bundle.entry[21].resource/*Medication/100110*/.extension[0].value.ofType(CodeableConcept).coding[0] (line 1612, col15): Resolved system http://snomed.info/sct, but the definition is not complete, so assuming value set include is correct
  Warning @ Bundle.entry[17].resource/*Medication/100070*/.extension[0].value.ofType(CodeableConcept).coding[0].display (line 1271, col28): Wrong Display Name 'Pharmaceutical / biologic product (product) : Has product characteristic (attribute) = Manual method (qualifier value)' for http://snomed.info/sct#373873005:860781008=362943005. Valid display is 'Pharmaceutical / biologic product where Has product characteristic = Manual method' (for the language(s) '--')
  Warning @ Bundle.entry[0].resource/*DocumentReference/100033*/ (line 35, col13): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
  Warning @ Bundle.entry[1].resource/*DocumentReference/100103*/ (line 106, col13): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
  Warning @ Bundle.entry[2].resource/*DocumentReference/100113*/ (line 171, col13): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
  Warning @ Bundle.entry[3].resource/*DocumentReference/100043*/ (line 236, col13): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
  Warning @ Bundle.entry[4].resource/*DocumentReference/100073*/ (line 301, col13): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
  Warning @ Bundle.entry[5].resource/*DocumentReference/100023*/ (line 366, col13): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
  Warning @ Bundle.entry[6].resource/*MedicationRequest/100001*/ (line 431, col13): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
  Warning @ Bundle.entry[7].resource/*Medication/100000*/ (line 507, col13): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
  Warning @ Bundle.entry[8].resource/*MedicationRequest/100011*/ (line 595, col13): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
  Warning @ Bundle.entry[9].resource/*Medication/100010*/ (line 672, col13): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
  Warning @ Bundle.entry[10].resource/*MedicationRequest/100031*/ (line 760, col13): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
  Warning @ Bundle.entry[11].resource/*Medication/100030*/ (line 837, col13): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
  Warning @ Bundle.entry[12].resource/*MedicationRequest/100021*/ (line 925, col13): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
  Warning @ Bundle.entry[13].resource/*Medication/100020*/ (line 1001, col13): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
  Warning @ Bundle.entry[14].resource/*MedicationRequest/100041*/ (line 1072, col13): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
  Warning @ Bundle.entry[15].resource/*Medication/100040*/ (line 1148, col13): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
  Warning @ Bundle.entry[16].resource/*MedicationRequest/100071*/ (line 1184, col13): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
  Warning @ Bundle.entry[17].resource/*Medication/100070*/ (line 1262, col13): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
  Warning @ Bundle.entry[18].resource/*MedicationRequest/100101*/ (line 1347, col13): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
  Warning @ Bundle.entry[19].resource/*Medication/100100*/ (line 1430, col13): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
  Warning @ Bundle.entry[20].resource/*MedicationRequest/100111*/ (line 1511, col13): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
  Warning @ Bundle.entry[21].resource/*Medication/100110*/ (line 1602, col13): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
------------------------------------------------------------------------------

-- examples\BSP_Bundle_VoS_PVS_3.xml -----------------------------------------
Success: 0 errors, 1 warnings, 0 notes
  Warning @ Bundle.entry[0].resource/*Provenance/300002*/ (line 35, col13): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
------------------------------------------------------------------------------

-- examples\BSP_Composition.xml ----------------------------------------
Success: 0 errors, 1 warnings, 0 notes
  Warning @ Composition (line 1, col42): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
------------------------------------------------------------------------

-- examples\BSP_Composition_2.xml ----------------------------------------
Success: 0 errors, 1 warnings, 0 notes
  Warning @ Composition (line 1, col42): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
--------------------------------------------------------------------------

-- examples\BSP_Composition_3.xml ----------------------------------------
Success: 0 errors, 1 warnings, 0 notes
  Warning @ Composition (line 1, col42): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
--------------------------------------------------------------------------

-- examples\BSP_Condition.xml ----------------------------------------
Success: 0 errors, 1 warnings, 1 notes
  Information @ Condition.code.coding[0].system (line 27, col8): A definition for CodeSystem 'http://fhir.de/CodeSystem/bfarm/icd-10-gm' version '2022' could not be found, so the code cannot be validated. Valid versions: []
  Warning @ Condition (line 1, col40): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
----------------------------------------------------------------------

-- examples\BSP_Coverage.xml ----------------------------------------
Success: 0 errors, 1 warnings, 1 notes
  Information @ Coverage.type (line 44, col9): Keiner der angegebenen Codes ist im Valueset 'Coverage Type and Self-Pay Codes' (http://hl7.org/fhir/ValueSet/coverage-type|4.0.1), und es wird empfohlen, einen Code aus dieserm Valueset zu verwenden) (Codes = http://fhir.de/CodeSystem/versicherungsart-de-basis#GKV)
  Warning @ Coverage (line 1, col39): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
---------------------------------------------------------------------

-- examples\BSP_Coverage_SahraSchuhmann.xml ------------------------------------------------
Success: 0 errors, 1 warnings, 1 notes
  Information @ Coverage.type (line 36, col8): Keiner der angegebenen Codes ist im Valueset 'Coverage Type and Self-Pay Codes' (http://hl7.org/fhir/ValueSet/coverage-type|4.0.1), und es wird empfohlen, einen Code aus dieserm Valueset zu verwenden) (Codes = http://fhir.de/CodeSystem/versicherungsart-de-basis#GKV)
  Warning @ Coverage (line 1, col39): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
--------------------------------------------------------------------------------------------

-- examples\BSP_Device_PVS.xml ----------------------------------------
Success: 0 errors, 1 warnings, 0 notes
  Warning @ Device (line 1, col37): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
-----------------------------------------------------------------------

-- examples\BSP_DocumentReference.xml ------------------------------------------
Success: 0 errors, 1 warnings, 1 notes
  Information @ DocumentReference.type (line 8, col8): Keiner der angegebenen Codes ist im Valueset 'Document Type Value Set' (http://hl7.org/fhir/ValueSet/c80-doc-typecodes|4.0.1), und es wird empfohlen, einen Code aus dieserm Valueset zu verwenden) (Codes = https://fhir.kbv.de/CodeSystem/KBV_CS_VoS_DocumentType#Rezept, http://ihe-d.de/CodeSystems/IHEXDStypeCode#MEDI)
  Warning @ DocumentReference (line 1, col48): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
--------------------------------------------------------------------------------

-- examples\BSP_DocumentReference_2.xml --------------------------------------------
Success: 0 errors, 1 warnings, 1 notes
  Information @ DocumentReference.type (line 16, col8): Keiner der angegebenen Codes ist im Valueset 'Document Type Value Set' (http://hl7.org/fhir/ValueSet/c80-doc-typecodes|4.0.1), und es wird empfohlen, einen Code aus dieserm Valueset zu verwenden) (Codes = https://fhir.kbv.de/CodeSystem/KBV_CS_VoS_DocumentType#Signiertes_eRezept, http://ihe-d.de/CodeSystems/IHEXDStypeCode#MEDI)
  Warning @ DocumentReference (line 1, col48): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
------------------------------------------------------------------------------------

-- examples\BSP_DocumentReference_3.xml --------------------------------------------
Success: 0 errors, 1 warnings, 1 notes
  Information @ DocumentReference.type (line 16, col8): Keiner der angegebenen Codes ist im Valueset 'Document Type Value Set' (http://hl7.org/fhir/ValueSet/c80-doc-typecodes|4.0.1), und es wird empfohlen, einen Code aus dieserm Valueset zu verwenden) (Codes = https://fhir.kbv.de/CodeSystem/KBV_CS_VoS_DocumentType#Signiertes_eRezept, http://ihe-d.de/CodeSystems/IHEXDStypeCode#MEDI)
  Warning @ DocumentReference (line 1, col48): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
------------------------------------------------------------------------------------

-- examples\BSP_DocumentReference_BtM_Rezept.xml -----------------------------------------------------
Success: 0 errors, 1 warnings, 1 notes
  Information @ DocumentReference.type (line 8, col8): Keiner der angegebenen Codes ist im Valueset 'Document Type Value Set' (http://hl7.org/fhir/ValueSet/c80-doc-typecodes|4.0.1), und es wird empfohlen, einen Code aus dieserm Valueset zu verwenden) (Codes = https://fhir.kbv.de/CodeSystem/KBV_CS_VoS_DocumentType#Rezept, http://ihe-d.de/CodeSystems/IHEXDStypeCode#MEDI)
  Warning @ DocumentReference (line 1, col48): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
------------------------------------------------------------------------------------------------------

-- examples\BSP_DocumentReference_M16_3Verordnungen.xml ------------------------------------------------------------
Success: 0 errors, 1 warnings, 1 notes
  Information @ DocumentReference.type (line 8, col8): Keiner der angegebenen Codes ist im Valueset 'Document Type Value Set' (http://hl7.org/fhir/ValueSet/c80-doc-typecodes|4.0.1), und es wird empfohlen, einen Code aus dieserm Valueset zu verwenden) (Codes = https://fhir.kbv.de/CodeSystem/KBV_CS_VoS_DocumentType#Rezept, http://ihe-d.de/CodeSystems/IHEXDStypeCode#MEDI)
  Warning @ DocumentReference (line 1, col48): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
--------------------------------------------------------------------------------------------------------------------

-- examples\BSP_DocumentReference_M16_Freitext.xml -------------------------------------------------------
Success: 0 errors, 1 warnings, 1 notes
  Information @ DocumentReference.type (line 8, col8): Keiner der angegebenen Codes ist im Valueset 'Document Type Value Set' (http://hl7.org/fhir/ValueSet/c80-doc-typecodes|4.0.1), und es wird empfohlen, einen Code aus dieserm Valueset zu verwenden) (Codes = https://fhir.kbv.de/CodeSystem/KBV_CS_VoS_DocumentType#Rezept, http://ihe-d.de/CodeSystems/IHEXDStypeCode#MEDI)
  Warning @ DocumentReference (line 1, col48): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
----------------------------------------------------------------------------------------------------------

-- examples\BSP_DocumentReference_M16_Rezeptur.xml -------------------------------------------------------
Success: 0 errors, 1 warnings, 1 notes
  Information @ DocumentReference.type (line 8, col8): Keiner der angegebenen Codes ist im Valueset 'Document Type Value Set' (http://hl7.org/fhir/ValueSet/c80-doc-typecodes|4.0.1), und es wird empfohlen, einen Code aus dieserm Valueset zu verwenden) (Codes = https://fhir.kbv.de/CodeSystem/KBV_CS_VoS_DocumentType#Rezept, http://ihe-d.de/CodeSystems/IHEXDStypeCode#MEDI)
  Warning @ DocumentReference (line 1, col48): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
----------------------------------------------------------------------------------------------------------

-- examples\BSP_DocumentReference_M16_Wirkstoff.xml --------------------------------------------------------
Success: 0 errors, 1 warnings, 1 notes
  Information @ DocumentReference.type (line 8, col8): Keiner der angegebenen Codes ist im Valueset 'Document Type Value Set' (http://hl7.org/fhir/ValueSet/c80-doc-typecodes|4.0.1), und es wird empfohlen, einen Code aus dieserm Valueset zu verwenden) (Codes = https://fhir.kbv.de/CodeSystem/KBV_CS_VoS_DocumentType#Rezept, http://ihe-d.de/CodeSystems/IHEXDStypeCode#MEDI)
  Warning @ DocumentReference (line 1, col48): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
------------------------------------------------------------------------------------------------------------

-- examples\BSP_DocumentReference_T_Rezept.xml ---------------------------------------------------
Success: 0 errors, 1 warnings, 1 notes
  Information @ DocumentReference.type (line 8, col8): Keiner der angegebenen Codes ist im Valueset 'Document Type Value Set' (http://hl7.org/fhir/ValueSet/c80-doc-typecodes|4.0.1), und es wird empfohlen, einen Code aus dieserm Valueset zu verwenden) (Codes = https://fhir.kbv.de/CodeSystem/KBV_CS_VoS_DocumentType#Rezept, http://ihe-d.de/CodeSystems/IHEXDStypeCode#MEDI)
  Warning @ DocumentReference (line 1, col48): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
--------------------------------------------------------------------------------------------------

-- examples\BSP_MedicationStatement_MP.xml -----------------------------------------------
Success: 0 errors, 1 warnings, 0 notes
  Warning @ MedicationStatement (line 1, col50): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
------------------------------------------------------------------------------------------

-- examples\BSP_MedicationStatement_MP_HinweisGrund.xml ------------------------------------------------------------
Success: 0 errors, 1 warnings, 0 notes
  Warning @ MedicationStatement (line 1, col50): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
--------------------------------------------------------------------------------------------------------------------

-- examples\BSP_Medication_Compounding.xml -----------------------------------------------
Success: 0 errors, 3 warnings, 2 notes
  Information @ Medication.extension[0].value.ofType(CodeableConcept).coding[0].code (line 9, col25): Not validated against the Machine Readable Concept Model (MRCM)
  Information @ Medication.ingredient[0].item.ofType(CodeableConcept).coding[0].system (line 57, col24): A definition for CodeSystem 'http://fhir.de/CodeSystem/ifa/pzn' could not be found, so the code cannot be validated
  Warning @ Medication.extension[0].value.ofType(CodeableConcept).coding[0] (line 10, col12): Resolved system http://snomed.info/sct, but the definition is not complete, so assuming value set include is correct
  Warning @ Medication.extension[0].value.ofType(CodeableConcept).coding[0].display (line 9, col25): Wrong Display Name 'Pharmaceutical / biologic product (product) : Has product characteristic (attribute) = Manual method (qualifier value)' for http://snomed.info/sct#373873005:860781008=362943005. Valid display is 'Pharmaceutical / biologic product where Has product characteristic = Manual method' (for the language(s) '--')
  Warning @ Medication (line 1, col41): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
------------------------------------------------------------------------------------------

-- examples\BSP_Medication_Compounding_2.xml -------------------------------------------------
Success: 0 errors, 3 warnings, 1 notes
  Information @ Medication.extension[0].value.ofType(CodeableConcept).coding[0].code (line 9, col25): Not validated against the Machine Readable Concept Model (MRCM)
  Warning @ Medication.extension[0].value.ofType(CodeableConcept).coding[0] (line 10, col12): Resolved system http://snomed.info/sct, but the definition is not complete, so assuming value set include is correct
  Warning @ Medication.extension[0].value.ofType(CodeableConcept).coding[0].display (line 9, col25): Wrong Display Name 'Pharmaceutical / biologic product (product) : Has product characteristic (attribute) = Manual method (qualifier value)' for http://snomed.info/sct#373873005:860781008=362943005. Valid display is 'Pharmaceutical / biologic product where Has product characteristic = Manual method' (for the language(s) '--')
  Warning @ Medication (line 1, col41): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
----------------------------------------------------------------------------------------------

-- examples\BSP_Medication_Compounding_3.xml -------------------------------------------------
Success: 0 errors, 3 warnings, 2 notes
  Information @ Medication.extension[0].value.ofType(CodeableConcept).coding[0].code (line 9, col25): Not validated against the Machine Readable Concept Model (MRCM)
  Information @ Medication.ingredient[0].item.ofType(CodeableConcept).coding[0].system (line 54, col24): A definition for CodeSystem 'http://fhir.de/CodeSystem/ifa/pzn' could not be found, so the code cannot be validated
  Warning @ Medication.extension[0].value.ofType(CodeableConcept).coding[0] (line 10, col12): Resolved system http://snomed.info/sct, but the definition is not complete, so assuming value set include is correct
  Warning @ Medication.extension[0].value.ofType(CodeableConcept).coding[0].display (line 9, col25): Wrong Display Name 'Pharmaceutical / biologic product (product) : Has product characteristic (attribute) = Manual method (qualifier value)' for http://snomed.info/sct#373873005:860781008=362943005. Valid display is 'Pharmaceutical / biologic product where Has product characteristic = Manual method' (for the language(s) '--')
  Warning @ Medication (line 1, col41): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
----------------------------------------------------------------------------------------------

-- examples\BSP_Medication_Freetext.xml --------------------------------------------
Success: 0 errors, 1 warnings, 0 notes
  Warning @ Medication (line 1, col41): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
------------------------------------------------------------------------------------

-- examples\BSP_Medication_FreeText_2.xml ----------------------------------------------
Success: 0 errors, 1 warnings, 0 notes
  Warning @ Medication (line 1, col41): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
----------------------------------------------------------------------------------------

-- examples\BSP_Medication_Ingredient.xml ----------------------------------------------
Success: 0 errors, 2 warnings, 1 notes
  Information @ Medication.ingredient[0].item.ofType(CodeableConcept).coding[0].system (line 43, col24): A definition for CodeSystem 'http://fhir.de/CodeSystem/ask' could not be found, so the code cannot be validated
  Warning @ Medication.amount.numerator (line 30, col14): UCUM Codes that contain human readable annotations like {Stueck} can be misleading (e.g. they are ignored when comparing units). Best Practice is not to depend on annotations in the UCUM code, so this usage should be checked, and the Quantity.unit 'Stück' SHOULD contain the annotation (it does not)
  Warning @ Medication (line 1, col41): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
----------------------------------------------------------------------------------------

-- examples\BSP_Medication_Ingredient_2.xml ------------------------------------------------
Success: 0 errors, 2 warnings, 1 notes
  Information @ Medication.ingredient[0].item.ofType(CodeableConcept).coding[0].system (line 43, col24): A definition for CodeSystem 'http://fhir.de/CodeSystem/ask' could not be found, so the code cannot be validated
  Warning @ Medication.amount.numerator (line 30, col14): UCUM Codes that contain human readable annotations like {Stueck} can be misleading (e.g. they are ignored when comparing units). Best Practice is not to depend on annotations in the UCUM code, so this usage should be checked, and the Quantity.unit 'Stück' SHOULD contain the annotation (it does not)
  Warning @ Medication (line 1, col41): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
--------------------------------------------------------------------------------------------

-- examples\BSP_Medication_PZN.xml ----------------------------------------
Success: 0 errors, 3 warnings, 2 notes
  Information @ Medication.code.coding[0].system (line 33, col8): A definition for CodeSystem 'http://fhir.de/CodeSystem/ifa/pzn' could not be found, so the code cannot be validated
  Information @ Medication.ingredient[0].item.ofType(CodeableConcept).coding[0].system (line 60, col24): A definition for CodeSystem 'http://fhir.de/CodeSystem/ask' could not be found, so the code cannot be validated
  Warning @ Medication.amount.numerator (line 47, col14): UCUM Codes that contain human readable annotations like {HKP} can be misleading (e.g. they are ignored when comparing units). Best Practice is not to depend on annotations in the UCUM code, so this usage should be checked, and the Quantity.unit 'Hartkapseln' SHOULD contain the annotation (it does not)
  Warning @ Medication.extension[0].value.ofType(CodeableConcept).coding[0] (line 10, col12): Resolved system http://snomed.info/sct, but the definition is not complete, so assuming value set include is correct
  Warning @ Medication (line 1, col41): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
---------------------------------------------------------------------------

-- examples\BSP_Medication_PZN_2.xml -----------------------------------------
Success: 0 errors, 3 warnings, 2 notes
  Information @ Medication.code.coding[0].system (line 33, col8): A definition for CodeSystem 'http://fhir.de/CodeSystem/ifa/pzn' could not be found, so the code cannot be validated
  Information @ Medication.ingredient[0].item.ofType(CodeableConcept).coding[0].system (line 60, col24): A definition for CodeSystem 'http://fhir.de/CodeSystem/ask' could not be found, so the code cannot be validated
  Warning @ Medication.amount.numerator (line 47, col14): UCUM Codes that contain human readable annotations like {Stueck} can be misleading (e.g. they are ignored when comparing units). Best Practice is not to depend on annotations in the UCUM code, so this usage should be checked, and the Quantity.unit 'Stück' SHOULD contain the annotation (it does not)
  Warning @ Medication.extension[0].value.ofType(CodeableConcept).coding[0] (line 10, col12): Resolved system http://snomed.info/sct, but the definition is not complete, so assuming value set include is correct
  Warning @ Medication (line 1, col41): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
------------------------------------------------------------------------------

-- examples\BSP_Medication_PZN_3.xml -----------------------------------------
Success: 0 errors, 3 warnings, 2 notes
  Information @ Medication.code.coding[0].system (line 33, col8): A definition for CodeSystem 'http://fhir.de/CodeSystem/ifa/pzn' could not be found, so the code cannot be validated
  Information @ Medication.ingredient[0].item.ofType(CodeableConcept).coding[0].system (line 60, col24): A definition for CodeSystem 'http://fhir.de/CodeSystem/ask' could not be found, so the code cannot be validated
  Warning @ Medication.amount.numerator (line 47, col14): UCUM Codes that contain human readable annotations like {Stueck} can be misleading (e.g. they are ignored when comparing units). Best Practice is not to depend on annotations in the UCUM code, so this usage should be checked, and the Quantity.unit 'Stück' SHOULD contain the annotation (it does not)
  Warning @ Medication.extension[0].value.ofType(CodeableConcept).coding[0] (line 10, col12): Resolved system http://snomed.info/sct, but the definition is not complete, so assuming value set include is correct
  Warning @ Medication (line 1, col41): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
------------------------------------------------------------------------------

-- examples\BSP_Medication_PZN_4.xml -----------------------------------------
Success: 0 errors, 3 warnings, 2 notes
  Information @ Medication.code.coding[0].system (line 33, col8): A definition for CodeSystem 'http://fhir.de/CodeSystem/ifa/pzn' could not be found, so the code cannot be validated
  Information @ Medication.ingredient[0].item.ofType(CodeableConcept).coding[0].system (line 60, col24): A definition for CodeSystem 'http://fhir.de/CodeSystem/ask' could not be found, so the code cannot be validated
  Warning @ Medication.amount.numerator (line 47, col14): UCUM Codes that contain human readable annotations like {Stueck} can be misleading (e.g. they are ignored when comparing units). Best Practice is not to depend on annotations in the UCUM code, so this usage should be checked, and the Quantity.unit 'Stück' SHOULD contain the annotation (it does not)
  Warning @ Medication.extension[0].value.ofType(CodeableConcept).coding[0] (line 10, col12): Resolved system http://snomed.info/sct, but the definition is not complete, so assuming value set include is correct
  Warning @ Medication (line 1, col41): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
------------------------------------------------------------------------------

-- examples\BSP_Medication_PZN_5.xml -----------------------------------------
Success: 0 errors, 2 warnings, 1 notes
  Information @ Medication.code.coding[0].system (line 33, col8): A definition for CodeSystem 'http://fhir.de/CodeSystem/ifa/pzn' could not be found, so the code cannot be validated
  Warning @ Medication.extension[0].value.ofType(CodeableConcept).coding[0] (line 10, col12): Resolved system http://snomed.info/sct, but the definition is not complete, so assuming value set include is correct
  Warning @ Medication (line 1, col41): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
------------------------------------------------------------------------------

-- examples\BSP_Medication_PZN_6.xml -----------------------------------------
Success: 0 errors, 3 warnings, 1 notes
  Information @ Medication.code.coding[0].system (line 33, col8): A definition for CodeSystem 'http://fhir.de/CodeSystem/ifa/pzn' could not be found, so the code cannot be validated
  Warning @ Medication.amount.numerator (line 47, col14): UCUM Codes that contain human readable annotations like {Stueck} can be misleading (e.g. they are ignored when comparing units). Best Practice is not to depend on annotations in the UCUM code, so this usage should be checked, and the Quantity.unit 'Stück' SHOULD contain the annotation (it does not)
 Warning @ Medication.extension[0].value.ofType(CodeableConcept).coding[0] (line 10, col12): Resolved system http://snomed.info/sct, but the definition is not complete, so assuming value set include is correct
  Warning @ Medication (line 1, col41): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
------------------------------------------------------------------------------

-- examples\BSP_Medication_PZN_7.xml -----------------------------------------
Success: 0 errors, 2 warnings, 1 notes
  Information @ Medication.code.coding[0].system (line 33, col8): A definition for CodeSystem 'http://fhir.de/CodeSystem/ifa/pzn' could not be found, so the code cannot be validated
  Warning @ Medication.extension[0].value.ofType(CodeableConcept).coding[0] (line 10, col12): Resolved system http://snomed.info/sct, but the definition is not complete, so assuming value set include is correct
 Warning @ Medication (line 1, col41): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
------------------------------------------------------------------------------

-- examples\BSP_Medication_PZN_BTM.xml -------------------------------------------
Success: 0 errors, 3 warnings, 1 notes
  Information @ Medication.code.coding[0].system (line 30, col8): A definition for CodeSystem 'http://fhir.de/CodeSystem/ifa/pzn' could not be found, so the code cannot be validated
  Warning @ Medication.amount.numerator (line 44, col14): UCUM Codes that contain human readable annotations like {Stueck} can be misleading (e.g. they are ignored when comparing units). Best Practice is not to depend on annotations in the UCUM code, so this usage should be checked, and the Quantity.unit 'Stück' SHOULD contain the annotation (it does not)
  Warning @ Medication.extension[0].value.ofType(CodeableConcept).coding[0] (line 10, col12): Resolved system http://snomed.info/sct, but the definition is not complete, so assuming value set include is correct
  Warning @ Medication (line 1, col41): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
----------------------------------------------------------------------------------

-- examples\BSP_Medication_PZN_T.xml -----------------------------------------
Success: 0 errors, 3 warnings, 1 notes
  Information @ Medication.code.coding[0].system (line 30, col8): A definition for CodeSystem 'http://fhir.de/CodeSystem/ifa/pzn' could not be found, so the code cannot be validated
  Warning @ Medication.amount.numerator (line 44, col14): UCUM Codes that contain human readable annotations like {Stueck} can be misleading (e.g. they are ignored when comparing units). Best Practice is not to depend on annotations in the UCUM code, so this usage should be checked, and the Quantity.unit 'Stück' SHOULD contain the annotation (it does not)
  Warning @ Medication.extension[0].value.ofType(CodeableConcept).coding[0] (line 10, col12): Resolved system http://snomed.info/sct, but the definition is not complete, so assuming value set include is correct
  Warning @ Medication (line 1, col41): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
------------------------------------------------------------------------------

-- examples\BSP_Observation_Body_Height.xml ------------------------------------------------
Success: 0 errors, 3 warnings, 1 notes
  Information @ Observation (line 1, col42): Validate Observation against the Body height profile (http://hl7.org/fhir/StructureDefinition/bodyheight) which is required by the FHIR specification because the LOINC code 8302-2 was found
  Warning @ Observation.code.coding[0] (line 16, col10): Resolved system http://snomed.info/sct, but the definition is not complete, so assuming value set include is correct
  Warning @ Observation (line 1, col42): Alle Observations sollten einen Performer haben
  Warning @ Observation (line 1, col42): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
--------------------------------------------------------------------------------------------

-- examples\BSP_Observation_Body_Weight.xml ------------------------------------------------
Success: 0 errors, 3 warnings, 1 notes
  Information @ Observation (line 1, col42): Validate Observation against the Body weight profile (http://hl7.org/fhir/StructureDefinition/bodyweight) which is required by the FHIR specification because the LOINC code 29463-7 was found
  Warning @ Observation.code.coding[0] (line 16, col11): Resolved system http://snomed.info/sct, but the definition is not complete, so assuming value set include is correct
  Warning @ Observation (line 1, col42): Alle Observations sollten einen Performer haben
  Warning @ Observation (line 1, col42): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
--------------------------------------------------------------------------------------------

-- examples\BSP_Observation_Breastfeeding_Status.xml ---------------------------------------------------------
Success: 0 errors, 2 warnings, 0 notes
  Warning @ Observation (line 1, col42): Alle Observations sollten einen Performer haben
  Warning @ Observation (line 1, col42): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
--------------------------------------------------------------------------------------------------------------

-- examples\BSP_Observation_Creatinine_Level.xml -----------------------------------------------------
Success: 0 errors, 2 warnings, 0 notes
  Warning @ Observation (line 1, col42): Alle Observations sollten einen Performer haben
  Warning @ Observation (line 1, col42): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
------------------------------------------------------------------------------------------------------

-- examples\BSP_Observation_Pregnancy_Status.xml -----------------------------------------------------
Success: 0 errors, 2 warnings, 0 notes
  Warning @ Observation (line 1, col42): Alle Observations sollten einen Performer haben
  Warning @ Observation (line 1, col42): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
------------------------------------------------------------------------------------------------------

-- examples\BSP_Organization.xml ----------------------------------------
Success: 0 errors, 1 warnings, 0 notes
  Warning @ Organization (line 1, col43): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
-------------------------------------------------------------------------

-- examples\BSP_Organization_HA-Praxis_BenSchulz.xml ---------------------------------------------------------
Success: 0 errors, 1 warnings, 0 notes
  Warning @ Organization (line 1, col43): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
--------------------------------------------------------------------------------------------------------------

-- examples\BSP_Patient.xml ----------------------------------------
Success: 0 errors, 1 warnings, 0 notes
  Warning @ Patient (line 1, col38): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
--------------------------------------------------------------------

-- examples\BSP_Patient_SahraSchuhmann.xml -----------------------------------------------
Success: 0 errors, 1 warnings, 0 notes
  Warning @ Patient (line 1, col38): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
------------------------------------------------------------------------------------------

-- examples\BSP_Practitioner.xml ----------------------------------------
Success: 0 errors, 1 warnings, 2 notes
  Information @ Practitioner.qualification[0].code (line 41, col15): Keiner der angegebenen Codes ist im Valueset 'Practitioner Speciality' (https://fhir.kbv.de/ValueSet/KBV_VS_Base_Practitioner_Speciality|1.3.0), und es wird empfohlen, einen Code aus dieserm Valueset zu verwenden) (Codes = https://fhir.kbv.de/CodeSystem/KBV_CS_FOR_Qualification_Type#00)
  Information @ Practitioner.qualification[1].code (line 49, col15): Keiner der angegebenen Codes ist im Valueset 'Practitioner Speciality' (https://fhir.kbv.de/ValueSet/KBV_VS_Base_Practitioner_Speciality|1.3.0), und es wird empfohlen, einen Code aus dieserm Valueset zu verwenden) (Codes = https://fhir.kbv.de/CodeSystem/KBV_CS_FOR_Berufsbezeichnung#Berufsbezeichnung)
  Warning @ Practitioner (line 1, col43): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
-------------------------------------------------------------------------

-- examples\BSP_PractitionerRole.xml -----------------------------------------
Success: 0 errors, 1 warnings, 0 notes
  Warning @ PractitionerRole (line 1, col47): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
------------------------------------------------------------------------------

-- examples\BSP_PractitionerRole_BenSchulz.xml ---------------------------------------------------
Success: 0 errors, 1 warnings, 0 notes
  Warning @ PractitionerRole (line 1, col47): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
--------------------------------------------------------------------------------------------------

-- examples\BSP_Practitioner_BenSchulz.xml -----------------------------------------------
Success: 0 errors, 1 warnings, 2 notes
  Information @ Practitioner.qualification[0].code (line 29, col9): Keiner der angegebenen Codes ist im Valueset 'Practitioner Speciality' (https://fhir.kbv.de/ValueSet/KBV_VS_Base_Practitioner_Speciality|1.3.0), und es wird empfohlen, einen Code aus dieserm Valueset zu verwenden) (Codes = https://fhir.kbv.de/CodeSystem/KBV_CS_FOR_Qualification_Type#00)
  Information @ Practitioner.qualification[1].code (line 37, col9): Keiner der angegebenen Codes ist im Valueset 'Practitioner Speciality' (https://fhir.kbv.de/ValueSet/KBV_VS_Base_Practitioner_Speciality|1.3.0), und es wird empfohlen, einen Code aus dieserm Valueset zu verwenden) (Codes = https://fhir.kbv.de/CodeSystem/KBV_CS_FOR_Berufsbezeichnung#Berufsbezeichnung)
  Warning @ Practitioner (line 1, col43): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
------------------------------------------------------------------------------------------

-- examples\BSP_Prescription.xml ----------------------------------------
Success: 0 errors, 2 warnings, 0 notes
  Warning @ MedicationRequest.dispenseRequest.quantity (line 59, col12): UCUM Codes that contain human readable annotations like {Package} can be misleading (e.g. they are ignored when comparing units). Best Practice is not to depend on annotations in the UCUM code, so this usage should be checked, and the Quantity.unit SHOULD contain the annotation
  Warning @ MedicationRequest (line 1, col48): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
-------------------------------------------------------------------------

-- examples\BSP_Prescription_2.xml ----------------------------------------
Success: 0 errors, 2 warnings, 0 notes
  Warning @ MedicationRequest.dispenseRequest.quantity (line 58, col13): UCUM Codes that contain human readable annotations like {Package} can be misleading (e.g. they are ignored when comparing units). Best Practice is not to depend on annotations in the UCUM code, so this usage should be checked, and the Quantity.unit SHOULD contain the annotation
  Warning @ MedicationRequest (line 1, col48): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
---------------------------------------------------------------------------

-- examples\BSP_Prescription_3.xml ----------------------------------------
Success: 0 errors, 2 warnings, 0 notes
  Warning @ MedicationRequest.dispenseRequest.quantity (line 59, col13): UCUM Codes that contain human readable annotations like {Package} can be misleading (e.g. they are ignored when comparing units). Best Practice is not to depend on annotations in the UCUM code, so this usage should be checked, and the Quantity.unit SHOULD contain the annotation
  Warning @ MedicationRequest (line 1, col48): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
---------------------------------------------------------------------------

-- examples\BSP_Prescription_4.xml ----------------------------------------
Success: 0 errors, 2 warnings, 0 notes
  Warning @ MedicationRequest.dispenseRequest.quantity (line 59, col13): UCUM Codes that contain human readable annotations like {Package} can be misleading (e.g. they are ignored when comparing units). Best Practice is not to depend on annotations in the UCUM code, so this usage should be checked, and the Quantity.unit SHOULD contain the annotation
  Warning @ MedicationRequest (line 1, col48): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
---------------------------------------------------------------------------

-- examples\BSP_Prescription_5.xml ----------------------------------------
Success: 0 errors, 2 warnings, 0 notes
  Warning @ MedicationRequest.dispenseRequest.quantity (line 58, col13): UCUM Codes that contain human readable annotations like {Package} can be misleading (e.g. they are ignored when comparing units). Best Practice is not to depend on annotations in the UCUM code, so this usage should be checked, and the Quantity.unit SHOULD contain the annotation
  Warning @ MedicationRequest (line 1, col48): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
---------------------------------------------------------------------------

-- examples\BSP_Prescription_6.xml ----------------------------------------
Success: 0 errors, 2 warnings, 0 notes
  Warning @ MedicationRequest.dispenseRequest.quantity (line 58, col13): UCUM Codes that contain human readable annotations like {Package} can be misleading (e.g. they are ignored when comparing units). Best Practice is not to depend on annotations in the UCUM code, so this usage should be checked, and the Quantity.unit SHOULD contain the annotation
  Warning @ MedicationRequest (line 1, col48): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
---------------------------------------------------------------------------

-- examples\BSP_Prescription_7.xml ----------------------------------------
Success: 0 errors, 2 warnings, 0 notes
  Warning @ MedicationRequest.dispenseRequest.quantity (line 60, col13): UCUM Codes that contain human readable annotations like {Package} can be misleading (e.g. they are ignored when comparing units). Best Practice is not to depend on annotations in the UCUM code, so this usage should be checked, and the Quantity.unit SHOULD contain the annotation
  Warning @ MedicationRequest (line 1, col48): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
---------------------------------------------------------------------------

-- examples\BSP_Prescription_BTM.xml -----------------------------------------
Success: 0 errors, 2 warnings, 0 notes
  Warning @ MedicationRequest.dispenseRequest.quantity (line 65, col13): UCUM Codes that contain human readable annotations like {Package} can be misleading (e.g. they are ignored when comparing units). Best Practice is not to depend on annotations in the UCUM code, so this usage should be checked, and the Quantity.unit SHOULD contain the annotation
  Warning @ MedicationRequest (line 1, col48): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
------------------------------------------------------------------------------

-- examples\BSP_Prescription_T.xml ----------------------------------------
Success: 0 errors, 2 warnings, 0 notes
  Warning @ MedicationRequest.dispenseRequest.quantity (line 73, col13): UCUM Codes that contain human readable annotations like {Package} can be misleading (e.g. they are ignored when comparing units). Best Practice is not to depend on annotations in the UCUM code, so this usage should be checked, and the Quantity.unit SHOULD contain the annotation
  Warning @ MedicationRequest (line 1, col48): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
---------------------------------------------------------------------------

-- examples\BSP_Provenance_AllergyIntolerance.xml ------------------------------------------------------
Success: 0 errors, 1 warnings, 0 notes
  Warning @ Provenance (line 1, col41): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
--------------------------------------------------------------------------------------------------------

-- examples\BSP_Provenance_AllergyIntolerance_2.xml --------------------------------------------------------
Success: 0 errors, 1 warnings, 0 notes
  Warning @ Provenance (line 1, col41): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
------------------------------------------------------------------------------------------------------------

-- examples\BSP_Provenance_ePrescription.xml -------------------------------------------------
Success: 0 errors, 1 warnings, 0 notes
  Warning @ Provenance (line 1, col41): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
----------------------------------------------------------------------------------------------

-- examples\BSP_Provenance_ePrescription_2.xml ---------------------------------------------------
Success: 0 errors, 1 warnings, 0 notes
  Warning @ Provenance (line 1, col41): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
--------------------------------------------------------------------------------------------------

-- examples\BSP_User.xml ----------------------------------------
Success: 0 errors, 1 warnings, 0 notes
  Warning @ Practitioner (line 1, col43): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
-----------------------------------------------------------------

-- examples\BSP_User_2.xml ----------------------------------------
Success: 0 errors, 1 warnings, 0 notes
  Warning @ Practitioner (line 1, col43): Constraint failed: dom-6: 'A resource should have narrative for robust management' (defined in http://hl7.org/fhir/StructureDefinition/DomainResource) (Best Practice Recommendation)
-------------------------------------------------------------------
