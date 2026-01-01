Programm KBV-Prüfmodul für HKS Prüfung Version 2026.1.0 1/2026

Zu diesem Programm gehören folgende Dateien:

- Installation.txt          Hinweise zur Installation
- Readme.txt                diese Datei
- ReleaseNotes.html         Hinweise zum aktuellen Release

Im Ordner XPM_eHKS:
- ArchivPruefung.bat        Prüft alle Dateien eines Zip-Archivs
                            (Batchdatei für Windows)
- ArchivPruefung.sh         Prüft alle Dateien eines Zip-Archivs
                            (Shellskript für Unix, Mac)
- EinzelPruefungD.bat       Prüft eine Dermatologen-Dokumentation (Batchdatei für Windows)
- EinzelPruefungD.sh        Prüft eine Dermatologen-Dokumentation (Shellskript für Unix, Mac)
- EinzelPruefungND.bat      Prüft eine Nicht-Dermatologen-Dokumentation (Batchdatei für Windows)
- EinzelPruefungND.sh       Prüft eine Nicht-Dermatologen-Dokumentation (Shellskript für Unix, Mac)
- SetVariablen.bat          Setzt die XPM_CLASS_PATH Variable, die zum Starten von XPM
                            in den Batchdateien benötigt wird (Batchdatei für Windows)
- SetVariablen.sh           Setzt die XPM_CLASS_PATH Variable, die zum Starten von XPM
                            in den Shellskripten benötigt wird (Shellskript für Unix, Mac)
- StartePruefmodulD.bat     Startet eine grafische Benutzeroberfläche
                            für Dermatologen-Dokumentationsprüfung (Batchdatei für Windows)
- StartePruefmodulD.sh      Startet eine grafische Benutzeroberfläche
                            für Dermatologen-Dokumentationsprüfung (Shellskript für Unix, Mac)
- StartePruefmodulND.bat    Startet eine grafische Benutzeroberfläche
                            für Nicht-Dermatologen-Dokumentationsprüfung (Batchdatei für Windows)
- StartePruefmodulND.sh     Startet eine grafische Benutzeroberfläche
                            für Nicht-Dermatologen-Dokumentationsprüfung (Shellskript für Unix, Mac)
- VerzeichnisPruefung.bat   Prüft alle Dateien eines Verzeichnisses
                            (Batchdatei für Windows)
- VerzeichnisPruefung.sh    Prüft alle Dateien eines Verzeichnisses
                            (Shellskript für Unix, Mac)

und Verzeichnisse:
- Bin                       Beinhaltet alle Java-Archive, die zur Ausführung des neuen
                            KBV-Prüfmoduls benötigt werden.
- Daten                     Enthält zu prüfende XML-Dateien.
- Doku                      Dokumentation zum KBV-Prüfmodul
- Geprueft/Abgelehnt        Ablage bereits geprüfter HKSD- und HKSND-Dateien.
- Geprueft/NichtAbgelehnt   Ablage bereits geprüfter HKSD- und HKSND-Dateien.
- Kbvtab                    Enthält alle binären Steuerdateien und Stammdaten.
- Konfig                    Enthält Konfigurationsdateien in XML-Format.
- Listen                    Ausgabeverzeichnis für alle Ausgaben des Prüfmodul.
- Schema                    Verzeichnis mit allen XML-Schemas.
                            Die Schema-Dateien bitte nicht verändern und auch nicht löschen.
