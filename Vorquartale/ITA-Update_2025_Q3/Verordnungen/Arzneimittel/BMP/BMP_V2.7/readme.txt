BMP Schemadatei (Version 2.7, Stand Januar 2025)
************************************************************************

Dieses Paket beinhaltet das XSD-Schema zum bundeseinheitlichen Medikationsplan.

Alle Komponenten des Pakets sind separat versioniert. Es können keine Schlussfolgerungen aus den Versionsnummern 
des Pakets und der Komponenten untereinander gezogen werden. Die Versionsnummer der Schnittstelle muss auch nicht
identisch mit der Versionsnummer der Schnittstellenbeschreibung sein.

Das XSD-Schema in der Version 2.7 ist der Spezifikation für einen bundeseinheitlichen Medikationsplan (BMP) gemäß § 31a SGB V
[EXT_ITA_VGEX_BMP_Anlage3] der Version 2.7 vom 01. April 2023, zugeordnet. 


1. Inhaltsverzeichnis
2. Änderungshistorie
3. Meldung von Problemen

1. Inhaltsverzeichnis
#############################################################################

./
- readme.txt                                                    (diese Datei)
- bmp_V2.7.xsd							(Schemadatei)


2. Änderungshistorie
#############################################################################
Änderungen von Version 2.7 von Januar 2025 zur Vorversion 2.6 von Juli 2019:
 - Folgende Korrekturen wurden vorgenommen: 
	- Kreatin-Wert		(MP.O.c):		Streichung der Beschränkung maxExclusive 
	- Versionsnummer 	(MP.v):			Attributwert angepasst (fixed="027")

Änderungen von Version 2.6 von Juli 2019 zur Vorversion 2.5 von Juli 2018:
 - Folgende Korrekturen wurden vorgenommen:
	- Geschlecht		(MP.P.s):		Wertebereich des Attributes um "D" für divers erweitert (<xs:enumeration value="D">)
	- Versionsnummer 	(MP.v):			Attributwert angepasst (fixed="026")

Änderungen von Version 2.5 von Juli 2018 zur Vorversion 2.4.1 von Juni 2017:
 - Folgende Korrekturen wurden vorgenommen:
	- Patientenparameter 		(MP.O):		Element als optional gesetzt (<xs:element name="O" minOccurs="0" maxOccurs="1">)
	- Dosiereinheit (codiert) 	(MP.S.M.du):	Validitätskriterium in der Beschreibung korrigiert (<xs:documentation>)
	- Dosiereinheit (Freitext) 	(MP.S.M.dud):	Validitätskriterium in der Beschreibung korrigiert (<xs:documentation>)
	- Versionsnummer 		(MP.v):		Attributwert angepasst (fixed="025")

Änderungen von Version 2.4.1 von Juni 2017 zur Vorversion 2.4 von April 2017:
 - Folgende Korrekturen wurden vorgenommen:
	- Allergien/Unvert. (MP.O.ai):	Längenbeschränkung gemäß Spezifikation erhöht (<xs:maxLength value="50"/>)

Änderungen von Version 2.4 von April 2017 zur Vorversion 2.3 von Juli 2016:
 - Folgende Korrekturen und Anpassungen in den Elementen / Attributen wurden vorgenommen:
 	- Allgemein:			Hinterlegen / Aktualisierung einer Beschreibung (<xs:Documentation>) zu jedem Element / Attribut 
 					Hinterlegen der Verbindlichkeit (use="required|optional") für jedes Attribut
	- Geburtsdatum 	(MP.P.b):	Syntax angepasst (neues Format YYYYMMDD), Längenbeschränkung eingeführt
	- Geschlecht	(MP.P.s):	Werte- und Längenbeschränkung eingeführt
	- LANR		(MP.A.lanr):	Längenbeschränkung eingeführt
	- Apotheken-IDF	(MP.A.idf):	Längenbeschränkung eingeführt
	- Postleitzahl	(MP.A.z):	Längenbeschränkung eingeführt
	- Ausdruckdatum (MP.A.t):	Typ in xs:datetime geändert, Wertebeschränkung eingeführt	
	- schwanger	(MP.O.p):	von fixed in eine Enumeration geändert, Längenbeschränkung eingeführt
	- stillend	(MP.O.b):	von fixed in eine Enumeration geändert, Längenbeschränkung eingeführt
	- Wirkstoff	(MP.S.M.W.w):	in "use = requiered" geändert
	- Wirkstärke	(MP.S.M.W.s):	Längenbeschränkung angepasst (<xs:maxLength value="15"/>)
	- Version:	(MP.v):		fixed auf die neue Version ("024") angepasst
	- Instanz-ID	(MP.U):		Längenbeschränkung eingeführt
	- Länderkennzeichen (MP.l):	Werte- und Längenbeschränkung eingeführt

 - Folgende Attribute wurden neu aufgenommen
	- Titel (MP.P.t)
	- Vorsatzwort (MP.P.v)
	- Namenszusatz (MP.P.z)
	- Krankenhaus-IK (MP.A.kik)
	- gebundene Zusatzzeile für Medikationseinträge (MP.S.M.x)
	- gebundene Zusatzzeile für Rezeptureinträge (MP.S.R.x)


3. Meldung von Problemen
#############################################################################

 - Wird Ihre BMP-Softwarelösung vornehmlich in einer Arztpraxis oder einem Krankenhaus eingesetzt, wenden Sie sich im Falle von technischen Fragen, Anregungen oder Problemen an:
   ita@kbv.de.

 - Wird Ihre BMP-Softwarelösung vornehmlich in einer Arztpraxis oder einem Krankenhaus eingesetzt, wenden Sie sich im Falle von fachlichen Fragen, Anregungen oder Problemen an:
   kbv_arzneimittel@kbv.de.

 - Wird Ihre BMP-Softwarelösung in Apotheken eingesetzt, so wenden Sie sich bitte an:
   medikationsplan@abda.de.


