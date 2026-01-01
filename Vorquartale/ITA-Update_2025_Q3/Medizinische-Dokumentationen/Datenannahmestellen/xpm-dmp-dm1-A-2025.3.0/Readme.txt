Programm KBV-Prüfmodul für DMP Diabetes mellitus Typ 1 A Prüfung Version 2025.3.0 3/2025

Zu diesem Programm gehören folgende Dateien:

- Installation.txt          Hinweise zur Installation
- Readme.txt                diese Datei
- ReleaseNotes.html         Hinweise zum aktuellen Release

Im Ordner XPM_Diabetes1.A:
- ArchivPruefung.bat        Prüft alle Dateien eines Zip-Archivs
                            (Batchdatei für Windows)
- ArchivPruefung.sh         Prüft alle Dateien eines Zip-Archivs
                            (Shellskript für Unix, Mac)
- EinzelPruefungED.bat      Prüft eine Erst-Dokumentation (Batchdatei für Windows)
- EinzelPruefungED.sh       Prüft eine Erst-Dokumentation (Shellskript für Unix, Mac)
- EinzelPruefungVD.bat      Prüft eine Verlaufsdokumentation (Batchdatei für Windows)
- EinzelPruefungVD.sh       Prüft eine Verlaufsdokumentation (Shellskript für Unix, Mac)
- SetVariablen.bat          Setzt die XPM_CLASS_PATH Variable, die zum Starten von XPM
                            in den Batchdateien benötigt wird (Batchdatei für Windows)
- SetVariablen.sh           Setzt die XPM_CLASS_PATH Variable, die zum Starten von XPM
                            in den Shellskripten benötigt wird (Shellskript für Unix, Mac)
- StartePruefmodulED.bat    Startet eine grafische Benutzeroberfläche
                            für Erst-Dokumentationsprüfung (Batchdatei für Windows)
- StartePruefmodulED.sh     Startet eine grafische Benutzeroberfläche
                            für Erst-Dokumentationsprüfung (Shellskript für Unix, Mac)
- StartePruefmodulVD.bat    Startet eine grafische Benutzeroberfläche
                            für Verlaufsdokumentationsprüfung (Batchdatei für Windows)
- StartePruefmodulVD.sh     Startet eine grafische Benutzeroberfläche
                            für Verlaufsdokumentationsprüfung (Shellskript für Unix, Mac)
- VerzeichnisPruefung.bat   Prüft alle Dateien eines Verzeichnisses
                            (Batchdatei für Windows)
- VerzeichnisPruefung.sh    Prüft alle Dateien eines Verzeichnisses
                            (Shellskript für Unix, Mac)

und Verzeichnisse:
- Bin                       Beinhaltet alle Java-Archive, die zur Ausführung des neuen
                            KBV-Prüfmoduls benötigt werden.
- Daten                     Enthält zu prüfende XML-Dateien.
- Doku                      Dokumentation zum KBV-Prüfmodul
- Geprueft/Abgelehnt        Ablage bereits geprüfter EED1- und EVD1-Dateien.
- Geprueft/NichtAbgelehnt   Ablage bereits geprüfter EED1- und EVD1-Dateien.
- Kbvtab                    Enthält alle binären Steuerdateien und Stammdaten.
- Konfig                    Enthält Konfigurationsdateien in XML-Format und
                            die Meldungsliste mit allen Meldungen.
- Listen                    Ausgabeverzeichnis für alle Ausgaben des Prüfmodul.
- Schema                    Verzeichnis mit allen XML-Schemas.
                            Die Schema-Dateien bitte nicht verändern und auch nicht löschen.
