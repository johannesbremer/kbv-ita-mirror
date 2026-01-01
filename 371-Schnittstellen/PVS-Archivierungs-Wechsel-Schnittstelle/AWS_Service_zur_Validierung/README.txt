Disclaimer: Der Service zur Validierung erhebt keinen Anspruch auf Vollständigkeit, Korrektheit sowie Verbindlichkeit.

Diese Sammlung stellt eine beispielhafte Validierungsumgebung dar. Die notwendigen Abhängigkeiten sind bereitgestellt und koennen direkt eingebunden werden.

Die Dependencies finden Sie alternativ unter folgenden links:
1.	KBV-Basis: https://simplifier.net/packages/kbv.basis/1.1.0
2.	KBV-Profile: https://update.kbv.de/ita-update/371-Schnittstellen/PVS-Archivierungs-Wechsel-Schnittstelle/KBV_FHIR_AW.zip
3.	KBV-Terminologie: https://update.kbv.de/ita-update/371-Schnittstellen/PVS-Archivierungs-Wechsel-Schnittstelle/KBV_FHIR_AW.zip
4.	Hl7 Basis: https://simplifier.net/packages/de.basisprofil.r4/0.9.11
5.	KBV-Impfpass: https://simplifier.net/packages/kbv.mio.impfpass/1.00.000

Weitere Voraussetzung ist eine aktuelle Java Version.

-version 4.0.1 :  Ist die FHIR Version
-no-extensible-binding-warnings : Dies ist ein optionaler Parameter, um zusaetzliche Warnungen zu verhindern
der Dateipfad zeigt auf die zu validierende Datei

Beispielaufruf:
java -jar validator_cli_5.2.12.jar -version 4.0.1 -ig dependencies/ -recurse -no-extensible-binding-warnings [DATEIPFAD].xml

statt [Dateipfad].xml kann auch ein Ordner mit allen Instanzen angegeben werden