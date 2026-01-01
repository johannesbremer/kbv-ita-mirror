Programm KBV-Prüfmodul für DMP Herzinsuffizienz A Prüfung Version 2025.2.0 2/2025

Zu diesem Programm gehören folgende Dateien:

- ReleaseNotes.txt           Hinweise zum aktuellen Release
- Readme.txt                 diese Datei
- Installation.txt           Hinweise zur Installation

Im Ordner XPM_Herzinsuffizienz.A:
- AktualisiereMeldungen.bat  Fehlermeldungen kompilieren und einbinden.
- ArchivPruefung.bat         Prüft alle Dateien eines Zip-Archivs
                             (Batchdatei für Windows)
- ArchivPruefung.sh          Prüft alle Dateien eines Zip-Archivs
                             (Shellskript für Unix)
- EinzelPruefungED.bat       Prüft eine Erst-Dokumentation (Batchdatei für Windows)
- EinzelPruefungED.sh        Prüft eine Erst-Dokumentation (Shellskript für Unix)
- EinzelPruefungFD.bat       Prüft eine Folge-Dokumentation (Batchdatei für Windows)
- EinzelPruefungFD.sh        Prüft eine Folge-Dokumentation (Shellskript für Unix)
- StartePruefmodulED.bat     Startet eine grafische Benutzeroberfläche
                             für Erst-Dokumentationsprüfung (Batchdatei für Windows)
- StartePruefmodulED.sh      Startet eine grafische Benutzeroberfläche
                             für Erst-Dokumentationsprüfung (Shellskript für Unix)
- StartePruefmodulFD.bat     Startet eine grafische Benutzeroberfläche
                             für Folge-Dokumentationsprüfung (Batchdatei für Windows)
- StartePruefmodulFD.sh      Startet eine grafische Benutzeroberfläche
                             für Folge-Dokumentationsprüfung (Shellskript für Unix)
- VerzeichnisPruefung.bat    Prüft alle Dateien eines Verzeichnisses
                             (Batchdatei für Windows)
- VerzeichnisPruefung.sh     Prüft alle Dateien eines Verzeichnisses
                             (Shellskript für Unix)

und Verzeichnisse:
- Bin                        Beinhaltet alle Java-Archive, die zur Ausführung des neuen
                             KBV-Prüfmoduls benötigt werden.
- Daten                      Enthält zu prüfende XML-Dateien.
- Geprueft/Abgelehnt         Ablage bereits geprüfter BK-Dateien.
- Geprueft/NichtAbgelehnt    Ablage bereits geprüfter BK-Dateien.
- Kbvtab                     Enthält alle binären Steuerdateien und Stammdaten.
- Konfig                     Enthält Konfigurationsdateien in XML-Format.
- Listen                     Ausgabeverzeichnis für alle Ausgaben des Prüfmodul.
- Schema                     Verzeichnis mit allen XML-Schemas.
                             Die Schema-Dateien bitte nicht verändern und auch nicht löschen.
                             
Bibliotheken:

Im Core-Jar befindet sich eine Pom, in welcher alle Abhängikeiten aufgeführt sind. 
Der Core wird zur besseren einbindbarkeit als Single-Jar, ohne Abhängikeiten, im Ordner Bin ausgeliefert.
Da der KBV-PdfViewer in keinem öffentlichen Repository vorhanden ist wird dieser hier auch ausgeliefert.
Alle anderen Abhängikeiten sind in öffentlichen Repositories auffindbar.
                             
