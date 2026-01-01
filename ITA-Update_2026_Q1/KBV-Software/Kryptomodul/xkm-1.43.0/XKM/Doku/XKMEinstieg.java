/* 
 * Datei: XKMEinstieg2.java
 * Autor: rstahlberg
 * Erstellungsdatum: 25.01.2005 13:53:33
 * 
 * Copyright Kassenaerztliche Bundesvereinigung, 2005
 * 
 */

/*
 * Package
 */
package de.kbv.xkm.extern;

/*
 * Import
 */
import de.kbv.xkm.Main;
import de.kbv.xkm.Schalter;
import de.kbv.xkm.Steuerung;
import de.kbv.xkm.XKMException;
import de.kbv.xkm.arbeitsmodus.Arbeitsmodi;
import de.kbv.xkm.protokoll.Protokoll;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;


/** 
 * Diese Klasse enthaelt einen Einstiegspunkt zum KBV-Kryptomodul XKM.
 */
public class XKMEinstieg {
    private static Logger LOG = LogManager.getLogger("xkm");


    private String  m_sKonfigDatei = null;  // Name der Konfigurationsdatei ('-c')   	
    private String  m_sQuelle = null;       // Name der zu verschluesselnden Datei oder Pfad ('-f', 'quelle')		  	
    private String  m_sArbeitsmodus = null; // Name des Arbeitsmodus ('-m', 'arbeitsmodus') 		
    private boolean m_bServer = false;     // Flag Servermodus ('-s') 		  	
    private boolean m_bEinzelLaufVerzeichnis = false;  // Flag Einzellauf ('-e')          
    private boolean m_bLoeschen = false;      // Flag fuer Loeschen nach Bearbeitung ('-l') 		
    private String  m_sSchluesselpfad = null;  // Name des Schluessel-Verzeichnis ('-u', 'schluesselpfad')
    private String  m_sProtokolldatei = null;  // Name der Protokolldatei ('-p', 'protokolldatei') 
    private String  m_sAusschusspfad = null;   // Name des Ausschusspfad ('-a', 'ausschuss')
    private String  m_sVerschluesseltpfad = null; // Name des Pfad fuer die verschluesselten Dateien ('-v', 'verschluesselt')
    private String  m_sEntschluesseltpfad = null; // Name des Pfad fuer die entschluesselten Dateien ('-t', 'entschluesselt')
    private String  m_sSystempfad = null;      // Name des Systempfad ('-z', 'system')
    private String  m_sDiskette = null;        // Flag fuer Diskettenmodus ('-d', 'diskette')
    private String  m_sPaketgroesse = null;    // Paketgroesse in Bytes  ('-g', 'paketgroesse')
    private String  m_sProtokollformat = null; // Protokollformat ('-r', 'protokollformat')
    private boolean m_bDiskettenpruefung = false; // Flag fuer Diskettenpruefung ('-n')
    private String  m_sPruefinfo = null;           // Name fuer den Komunikationssatz ('-i', 'pruefinfo')
    private String  m_sKonfigDialog = null;        // Flag fuer Schalter KonfigurationsDialog ('-c')
    private String  m_sExterneArbeitsmodi = null;  // Name der Datei fuer externe Arbeitsmodi  ('-k, 'schluesseldatei')
    
    private Arbeitsmodi m_Arbeitsmodi;
    
    /** Standardkonstruktor */
    public XKMEinstieg(String sConfigFile) {
    	setKonfigurationsdatei (sConfigFile);
    }

    /** Standardkonstruktor */    
    public XKMEinstieg() {
        setKonfigurationsdatei ("Konfig/config.xml");
    }
    
    /** Setter-Methode fuer Uebergabeparameter Konfigurationsdatei ('-c') */    
    public void setKonfigurationsdatei (String sKonfigDatei) {
        m_sKonfigDatei = sKonfigDatei;
    }

    /** Getter-Methode fuer Uebergabeparameter Konfigurationsdatei ('-c') */
    public String getKonfigurationsdatei () {
        return (m_sKonfigDatei);
    }

    /** Setter-Methode fuer Schalter 'quelle' */    
    public void setQuelle (String sQuelle) {
        m_sQuelle = sQuelle;
    }

    /** Getter-Methode fuer Schalter 'quelle' */    
    public String getQuelle () {
        return (m_sQuelle);
    }

    /** Setter-Methode fuer Schalter 'arbeitsmodus' (per String) */
    public void setArbeitsmodus (String sArbeitsmodus) {
        m_sArbeitsmodus = sArbeitsmodus;
    }

    /** Setter-Methode fuer Schalter 'arbeitsmodus' (per int) */
    public void setArbeitsmodus (int nArbeitsmodus) {
        m_sArbeitsmodus = m_Arbeitsmodi.getModusName(nArbeitsmodus);
    }
    
    /** Getter-Methode fuer Schalter 'arbeitsmodus' */
    public String getArbeitsmodus () {
        return (m_sArbeitsmodus);
    }
    
    /** Setter-Methode fuer Uebergabeparameter Servermodus ('-s')*/
    public void setServer (boolean bServer) {
        m_bServer = bServer;
    }

    /** Getter-Methode fuer Uebergabeparameter Servermodus ('-s') */    
    public boolean getServer () {
        return (m_bServer);
    }

    /** Setter-Methode fuer Uebergabeparameter Einzellauf  Verzeichnis('-e') */    
    public void setEinzelLaufVerzeichnis (boolean bEinzelLaufVerzeichnis) {
        m_bEinzelLaufVerzeichnis = bEinzelLaufVerzeichnis;
    }

    /** Getter-Methode fuer Uebergabeparameter Einzellauf Verzeichnis ('-e') */    
    public boolean getEinzelLaufVerzeichnis () {
        return (m_bEinzelLaufVerzeichnis);
    }

    /** Setter-Methode fuer Uebergabeparameter Loeschmodus ('-l')*/    
    public void setLoeschen (boolean bLoeschen) {
        m_bLoeschen = bLoeschen;
    }

    /** Getter-Methode fuer Uebergabeparameter Loeschmodus ('-l')*/
    public boolean getLoeschen () {
        return (m_bLoeschen);
    }

    /** Setter-Methode fuer Schalter 'schluesselpfad' */ 
    public void setSchluesselpfad (String sSchluesselpfad) {
        m_sSchluesselpfad = sSchluesselpfad;
    }
    
    /** Getter-Methode fuer Schalter 'schluesselpfad' */    
    public String getSchluesselpfad () {
        return (m_sSchluesselpfad);
    }

    /** Setter-Methode fuer Schalter 'protokolldatei' */
    public void setProtokolldatei (String sSchluesselpfad) {
        m_sProtokolldatei = sSchluesselpfad;
    }
    
    /** Getter-Methode fuer Schalter 'protokolldatei' */    
    public String getProtokolldatei () {
        return (m_sProtokolldatei);
    }
    
    /** Setter-Methode fuer Schalter 'ausschuss' */ 
    public void setAusschusspfad (String sAusschusspfad) {
        m_sAusschusspfad = sAusschusspfad;
    }
    
    /** Getter-Methode fuer Schalter 'ausschuss' */    
    public String getAusschusspfad () {
        return (m_sAusschusspfad);
    }

    /** Setter-Methode fuer Schalter 'verschluesselt' */ 
    public void setVerschluesseltpfad (String sVerschluesseltpfad) {
        m_sVerschluesseltpfad = sVerschluesseltpfad;
    }
    
    /** Getter-Methode fuer Schalter 'verschluesselt' */    
    public String getVerschluesseltpfad () {
        return (m_sVerschluesseltpfad);
    }

    /** Setter-Methode fuer Schalter 'entschluesselt' */ 
    public void setEntschluesseltpfad (String sEntschluesseltpfad) {
        m_sEntschluesseltpfad = sEntschluesseltpfad;
    }
    
    /** Getter-Methode fuer Schalter 'entschluesselt' */    
    public String getEntschluesseltpfad () {
        return (m_sEntschluesseltpfad);
    }

    /** Setter-Methode fuer Schalter 'system' */ 
    public void setSystempfad (String sSystempfad) {
        m_sSystempfad = sSystempfad;
    }
    
    /** Getter-Methode fuer Schalter 'system' */    
    public String getSystempfad () {
        return (m_sSystempfad);
    }
    
    /** Setter-Methode fuer Schalter Diskettenpruefung */
    public void setDiskettenpruefung (boolean bDiskettenpruefung) {
        m_bDiskettenpruefung = bDiskettenpruefung;
    }
    
    /** Getter-Methode fuer Schalter Diskettenpruefung */
    public boolean getDiskettenpruefung () {
        return (m_bDiskettenpruefung);
    }
    
    /** Setter-Methode fuer Schalter 'diskette' */    
    public void setDiskette (String sDiskette) {
        m_sDiskette = sDiskette;
    }

    /** Getter-Methode fuer Schalter 'diskette' */    
    public String getDiskette ()
    {
        return (m_sDiskette);
    }

    /** Setter-Methode fuer Schalter 'paketgroesse' */    
    public void setPaketgroesse (String sPaketgroesse) {
        m_sPaketgroesse = sPaketgroesse;
    }

    /** Getter-Methode fuer Schalter 'paketgroesse' */    
    public String getPaketgroesse () {
        return (m_sPaketgroesse);
    }

    /** Setter-Methode fuer Schalter 'prokollformat' */    
    public void setProtokollformat (String sProtokollformat) {
        m_sProtokollformat = sProtokollformat;
    }

    /** Getter-Methode fuer Schalter 'prokollformat' */    
    public String getProtokollformat () {
        return (m_sProtokollformat);
    }
    
    /** Setter-Methode fuer Schalter 'pruefinfo' */
    public void setPruefinfo (String sPruefinfo) {
        m_sPruefinfo = sPruefinfo;
    }
    
    /** Getter-Methode fuer Schalter 'pruefinfo' */
    public String getPruefinfo () {
        return (m_sPruefinfo);
    }

    /** Setter-Methode fuer Schalter 'konfigdialog' */
    public void setKonfigDialog (String sKonfigDialog) {
        m_sKonfigDialog = sKonfigDialog;
    }
    
    /** Getter-Methode fuer Schalter 'konfigdialog' */    
    public String getKonfigDialog () {
        return (m_sKonfigDialog);
    }
    
    /** Setter-Methode fuer Schalter 'schluesseldatei' */
    public void setExterneArbeitsmodi (String sExterneArbeitsmodi) {
        m_sExterneArbeitsmodi = sExterneArbeitsmodi;
    }
    
    /** Getter-Methode fuer Schalter 'schluesseldatei' */
    public String getExterneArbeitsmodi () {
        return (m_sExterneArbeitsmodi);
    }
    
    /** Startet die Ver- bzw. Entschluesselung */
    public int start () throws XKMException {
        
        int nRetCode = 0;

        Schalter schalter = new Schalter();
        Arbeitsmodi m_Arbeitsmodi = new Arbeitsmodi(schalter);
        schalter.setArbeitsmodi(m_Arbeitsmodi);
        Protokoll protokoll = new Protokoll (schalter, m_Arbeitsmodi);
        
        synchronized (getClass()) {
            
            try
            {
                schalter.setKonfigDatei (this.getKonfigurationsdatei());
                schalter.setQuellpfad (this.getQuelle());
                schalter.setArbeitsModus (this.getArbeitsmodus());
                schalter.setServerModus (this.getServer());
                schalter.setEinzelLaufVerzeichnis (this.getEinzelLaufVerzeichnis());
                schalter.setLoeschModus (this.getLoeschen());
                schalter.setSchluesselpfad(this.getSchluesselpfad());
                schalter.setProtokollDatei(this.getProtokolldatei());
                schalter.setAusschusspfad(this.getAusschusspfad());
                schalter.setVerschluesseltpfad(this.getVerschluesseltpfad());
                schalter.setEntschluesseltpfad(this.getEntschluesseltpfad());                
                schalter.setSystempfad(this.getSystempfad());                
                // schalter.setDiskette(this.getDiskette());              
                // schalter.setDiskettenpruefung(this.getDiskettenpruefung());
                schalter.setPaketgroesse(this.getPaketgroesse());
                schalter.setProtokollFormat(this.getProtokollformat());
                schalter.setPruefinfo(this.getPruefinfo());
                schalter.setKonfigDialog(this.getKonfigDialog());
                schalter.setExternArbeitsmodi(this.getExterneArbeitsmodi());
                
                Main.initXKM (null, schalter, m_Arbeitsmodi, false);
        
                Steuerung steuerung = new Steuerung ();
                nRetCode = steuerung.run (schalter, m_Arbeitsmodi, protokoll);
                
                protokoll.create (nRetCode, "Kryptomodul mit Returncode " + nRetCode + " beendet");        
            }
            catch (XKMException ex) {
                
                nRetCode = ex.getCode ();
                protokoll.create (nRetCode, "Kryptomodul mit Fehler " + nRetCode + " beendet\n" + ex.getMessage());    
                throw ex;
            }
        }
            
        return (nRetCode);
    }

    // Beispiel fuer einen einfachen Verschluesselungslauf
    public static void main (String args[]) {

        XKMEinstieg xkm = new XKMEinstieg ();
        int nRetCode = 0;

        LOG.info ("Kryptomodul ueber XKMEinstieg2 gestartet");

        try {
            
            xkm.setQuelle("quelle/beispiel_daten.zip");
            xkm.setProtokolldatei("listen/MeinProtokoll");
            xkm.setProtokollformat("XLS");
            xkm.setArbeitsmodus ("Verschluesselung");
            nRetCode = xkm.start ();
            LOG.info( "Kryptomodul mit Returncode " + nRetCode + " beendet" );
        }
        catch (XKMException ex) {
            
            nRetCode = ex.getCode ();
            LOG.error("Fehlercode: " + nRetCode + ". " + ex.getMessage());
        }
    }
}
