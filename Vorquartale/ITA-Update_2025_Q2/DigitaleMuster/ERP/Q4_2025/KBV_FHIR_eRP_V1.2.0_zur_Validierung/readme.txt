Erklärung zur Nutzung dieses Archives

Diese Erklärung erstreckt sich auf die Nutzung dieses Archives sowie alle nachfolgenden Versionen. 
Mit dem Entpacken der Datei nimmt das Softwarehaus die folgende Information zur Kenntnis:

1. Die bereitgestellten Dateien dienen der beispielhaften Darstellung bzw. als Unterstützung zur Validierung einer eRezept-FHIR-Instanzen.
2. Softwarehersteller müssen unbeachtet dieser Dateien sicherstellen, dass zur Validierung der FHIR-Instanzen im Feld immer die aktuellen FHIR-Ressourcen verwendet werden.

Änderungen der Version 1.2.0 vom 26.03.2025 zum Stand Version 1.1.0 
- Integration der KBV-Basis in der Version 1.7.0
- Integration der neuen deutschen HL7 Basis-Profile in der Version 1.5.2
- Slicing in meta.profile für alle ERP- und FOR-Profile außer KBV_PR_ERP_Bundle
- Vereinheitlichung der Profile: keine Angabe des mapping-Elements
- Vereinheitlichung der Profile: publisher = „Kassenärztliche Bundesvereinigung (KBV)“
- Vereinheitlichung der Constraints: Element source gestrichen
- Vereinheitlichung der Kardinalitäten, bspw. bei Maximalanzahl von Slices
- Vereinheitlichung der Extensions: elementdefinition-translatable und Elemente mit Codes „normative“ und „4.0.0“ gestrichen
- Aufgrund von Änderungen in der KBV-Basis: Anpassung aller betroffenen Diskriminatoren von type: pattern auf type: value geändert
- Streichen des Codesystems UCUM (http://unitsofmeasure.org) für Mengenangaben

- KBV_EX_ERP_Prescriber_ID neu aufgenommen
- KBV_EX_ERP_Multiple_Prescription
	- Constraints neu aufgenommen
		-erp-multiplePrescriptionEinloesefristEnde
		-erp-aufbauMehrfachverordnungID
	- Korrektur Extension.extension.value[x] statt valuePeriod
	- Kardinalität von Extension.extension:ID.value[x]:valueIdentifier sowie system und value angepasst auf 1..1
- KBV_EX_ERP_PracticeSupply_Payor
	- Ungültigen Referenzen auf die Slices (XX-Type) gestrichen
- KBV_EX_ERP_BVG 
	- Extension gestrichen und ersetzt durch KBV_EX_FOR_SER
-KBV_PR_ERP_Bundle:
	- Namen einiger Constraints angepasst
	- Constraints -erp-angabeSubstitutionPZN, -erp-angabeSubstitutionIngredient, -erp-angabeSubstitutionCompounding, -erp-angabeSubstitutionFreetext gestrichen und ersetzt durch erp-angabeSubstitutionPflicht und -erp-angabeSubstitutionVerbot
	- Constraints -erp-angabeVersichertenIDbeiGKV und -erp-angabeVersichertenIDbeiPKV gestrichen und ersetzt durch -erp-angabeVersichertenIDPflicht
	- Constraint -erp-angabeVersichertennummerBeiKVK gestrichen und ersetzt durch -erp-angabeKVKVersichertennummerVerbot
	- Constraint -erp-angabeUnfallkennzeichenUnfallVerbot überarbeitet
	- Ergänzung der Constraints entsprechend der technischen Vorgaben
		-erp-angabeVerantwortlichePersonPflicht
		-erp-angabePatientenAdressePflicht
		-erp-referenzAufAusstellendePerson-2
		-erp-angabeVertretungWeiterbildungVerbot
		-erp-angabeUnfallkennzeichenArbeitsunfallBerufskrankheitPflicht
		-erp-angabeUnfallkennzeichenZuzahlungsbefreiung
		-erp-geburtsdatumPatient
		-erp-angabeAsvTeamnummerPflicht
		-erp-angabeAsvTeamnummerVerbot
		-erp-angabeKZV-AbrechnungsnummerPflicht
		-erp-angabeKZV-AbrechnungsnummerVerbot
		-erp-angabeImpfstoffRezepturFalse
		-erp-multiplePrescriptionEinloesefristBeginn
- KBV_PR_ERP_ Composition
	- Kardinalität von text angepasst auf 0..0
	- Kardinalität von extension:Rechtsgrundlage angepasst auf 0..1
	- MustSupport gesetzt für .extension:Rechtsgrundlage.value[x]:valueCoding.system und code
	- Kardinalität von extension:PKV-Tarif angepasst auf 0..1
- KBV_PR_ERP_Prescription
	- Ableitung vom Basis-Profil KBV_PR_Base_MedicationRequest
	- Einbindung der Extension SER anstelle von BVG
	- Aufnahme der Extension VerschreiberID
	- Namen einiger Constraints angepasst
	- Ergänzung der Constraints entsprechend der technischen Vorgaben
		-erp-unfalltagDatum
		-erp-angabeUnfalltagVerbot
	-Neuer Constraint -erp-begrenzungIntegerValue am Element dispenseRequest.quantity.value, sodass nur ganzzahlige Angaben größer 0 erlaubt sind
- KBV_PR_ERP_PracticeSupply
	- Constraint -erp-laengeIK angepasst
- Alle Medication-Profile
	- Anpassungen aufgrund von Änderungen im Basis-Profil (betrifft z.B. Elementen zur Normgröße, da diese in KBV_PR_Base_Medication aufgenommen wurde)
- KBV_PR_ERP_Medication_PZN
	- Constraint -erp-NormgroesseOderMenge umbenannt in -erp-angabeNormgroesseOderMenge und überarbeitet
	- Anpassungen durch Änderungen der Codes für die Kategorien Arzneimittel/Rezeptur in KBV_VS_Base_Medication_Type
		-Version
			- alt: http://snomed.info/sct/900000000000207008/version/20220331
			- neu: http://snomed.info/sct/11000274103/version/20240515
	- Maximale Länge des Handelsnamens geändert von 50 auf 100
	- Constraint -erp-codeUndSystem gestrichen
	- Aufnahme von ingredient.* zur Angabe von Wirkstoffinformationen
- KBV_PR_ERP_Medication_Ingredient
	- Constraint -erp-NormgroesseOderMenge umbenannt in -erp-angabeNormgroesseOderMenge und überarbeitet
	- Constraint -erp-codeUndSystem gestrichen
- KBV_PR_ERP_Medication_Compounding
	- Anpassungen durch Änderungen der Codes für die Kategorien Arzneimittel/Rezeptur in KBV_VS_Base_Medication_Type
		-Version
			- alt: http://snomed.info/sct/900000000000207008/version/20220331
			- neu: http://snomed.info/sct/11000274103/version/20240515
		- Code
			- alt: 373873005:860781008=362943005
			- neu: 1208954007
		- Bezeichnung
			- alt: Pharmaceutical / biologic product (product): Has product characteristic (attribute) = Manual method (qualifier value)
			- neu: Extemporaneous preparation (product)
	- Constraint -erp-codeUndSystem gestrichen
	- Kardinalität von amount.numerator.extension angepasst auf 1..1
	- Kardinalität von ingredient.extension angepasst auf 0..1


