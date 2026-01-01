Programm LDK-Prüfmodul für die Prüfung der Schnittstelle LDT 3.2.18 und der digitalen Muster 10 und 10A 
auf formale korrektheit, sowie dem Abgleich der beiden mit der Schnittstelle LDT 3.2.18
 
+++++ Version: 2.18.0 +++++

Zu diesem Programm gehören folgende Dateien:

- Installation.txt          Hinweise zur Installation
- Readme.txt                diese Datei
- ReleaseNotes.html         Hinweise zum aktuellen Release

Im Ordner XPM-LDK.praxis:
- SetVariablen.bat          Setzt die XPM_CLASS_PATH Variable, die zum Starten von XPM
                            in den Batchdateien benötigt wird (Batchdatei für Windows)
- SetVariablen.sh           Setzt die XPM_CLASS_PATH Variable, die zum Starten von XPM
                            in den Shellskripten benötigt wird (Shellskript für Unix, Mac)
- StartPruefmodul.bat       Startet eine grafische Benutzeroberfläche
                            für LDT-Prüfung und digitale-Muster-Prüfung (Batchdatei für Windows)
- StartPruefmodul.sh        Startet eine grafische Benutzeroberfläche
                            für LDT-Prüfungund  digitale-Muster-Prüfung(Shellskript für Unix, Mac)
- StartPruefung.bat         Prüft eine LDT-Datei (Batchdatei für Windows)
- StartPruefung.sh          Prüft eine LDT-Datei (Shellskript für Unix, Mac)
- VerzeichnisPruefung.bat   Prüft alle Dateien eines Verzeichnisses
                            (Batchdatei für Windows)
- VerzeichnisPruefung.sh    Prüft alle Dateien eines Verzeichnisses
                            (Shellskript für Unix, Mac)
                            
                            \\****------ Pruefung Digitale Muster 10 Formal -----****//
- StartPruefungDigitaleMuster.bat         	Prüft ein digitales Muster (10/10A) (Batchdatei für Windows)
- StartPruefungDigitaleMuster.sh          	Prüft ein digitales Muster (10/10A) (Shellskript für Unix, Mac)
- VerzeichnisPruefungDigitaleMuster.bat   	Prüft alle digitalen Muster eines Verzeichnisses (Batchdatei für Windows)
- VerzeichnisPruefungDigitaleMuster.sh    	Prüft alle digitalen Muster eines Verzeichnisses (Shellskript für Unix, Mac)
                            				
							\\****------ Pruefung Digitale Muster 10 gegen LDT-Datei -----****//
- StartPruefungDigitaleMusterVsLDT.bat		Prüft ein digitales Muster gegen eine LDT-Datei (Batchdatei für Windows)
- StartPruefungDigitaleMusterVsLDT.sh      	Prüft ein digitales Muster gegen eine LDT-Datei (Shellskript für Unix, Mac)

und Verzeichnisse:
- Bin                       Beinhaltet alle Java-Archive, die zur Ausführung des neuen
                            LDK-Prüfmoduls benötigt werden.
- Daten                     Enthält zu prüfende LDT-Dateien und / oder digtiale Muster.
- Doku                      Dokumentation zum LDT-Prüfmodul
- Geprueft/Abgelehnt        Ablage bereits geprüfter LDT-Dateien.
- Geprueft/NichtAbgelehnt   Ablage bereits geprüfter LDT-Dateien.
- Kbvtab                    Enthält alle binären Steuerdateien und Stammdaten.
- Konfig                    Enthält Konfigurationsdateien in XML-Format.
- Listen                    Ausgabeverzeichnis für alle Ausgaben des LDK-Prüfmodul.
- Schema                    Verzeichnis mit allen XML-Schemas.
                            Die Schema-Dateien bitte nicht verändern und auch nicht löschen.
