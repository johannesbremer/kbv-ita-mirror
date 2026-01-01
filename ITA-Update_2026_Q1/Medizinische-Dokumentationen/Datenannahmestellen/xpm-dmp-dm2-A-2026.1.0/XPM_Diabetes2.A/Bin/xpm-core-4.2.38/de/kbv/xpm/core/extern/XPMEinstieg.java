package de.kbv.xpm.core.extern;

import de.kbv.xpm.core.ErrorCode;
import de.kbv.xpm.core.Steuerung;
import de.kbv.xpm.core.XPMConfiguration;
import de.kbv.xpm.core.XPMException;
import de.kbv.xpm.core.XPMPruefungsTyp;
import de.kbv.xpm.core.io.ConfigFile;
import de.kbv.xpm.core.io.PruefAdapter;

/*******************************************************************************
 * Diese Klasse enthaelt einen Einstiegspunkt zum KBV-Pruefmodul XPM.
 ******************************************************************************/
public class XPMEinstieg {
	private XPMPruefungsTyp pruefTyp = XPMPruefungsTyp.STANDARD;

	/** Konfigurationsdatei */
	private String m_sConfigFile;

	/** Pruefdatei */
	private String m_sPruefFile;

	/** Servermodus */
	private boolean m_bServer;

	/** Einzellauf im Servermodus */
	private boolean m_bEinzel;

	/** Verschieben von geprüften Dateien im Servermodus */
	private boolean m_bMove;

	/** Ziparchive */
	private boolean m_bZipFile;

	/** Eine Steuerungsinstanz */
	public Steuerung m_Steuerung;

	private final PruefAdapter adapter;

	/** Standardkonstruktor */
	public XPMEinstieg(String sConfigFile, String sPruefFile, PruefAdapter adapter) throws XPMException {
		// Pruefdatei setzen
		m_sPruefFile = sPruefFile;
		// Konfigurationsdatei setzen
		m_sConfigFile = sConfigFile;
		this.adapter = adapter;
		XPMConfiguration xpmConfig = new XPMConfiguration();
		synchronized (getClass()) {
			// Eine neue Steuerungsinstanz
			Steuerung.xpmVersion=xpmConfig.getXpmVersion();
			m_Steuerung = new Steuerung(m_sConfigFile, m_sPruefFile, this.adapter);
			
		}
	}

	/** Standardkonstruktor */
	public XPMEinstieg(String sConfigFile, PruefAdapter adapter) throws XPMException {
		this(sConfigFile, null, adapter);
	}

	/** Standardkonstruktor */
	public XPMEinstieg(ConfigFile configFile, String sPruefFile, PruefAdapter adapter) throws XPMException {
		/** Pruefdatei setzen */
		m_sPruefFile = sPruefFile;
		this.adapter = adapter;
		synchronized (getClass()) {
			/** Eine neue Steuerungsinstanz */
			m_Steuerung = new Steuerung(configFile, m_sPruefFile, this.adapter);
		}
	}

	/** Liefert die Konfigurationsdatei */
	public String getKonfigurationsdatei() {
		return m_sConfigFile;
	}

	/** Liefert die Konfiguration als Instanz */
	public ConfigFile getKonfiguration() {
		return m_Steuerung.getConfigFile();
	}

	/** Liefert die Pruefdatei */
	public String getPruefdatei() {
		return m_sPruefFile;
	}

	/** Setzt die Pruefdatei */
	public void setPruefdatei(String sPruefFile) {
		m_sPruefFile = sPruefFile;
	}

	/** Liefert den Servermodus */
	public boolean getServer() {
		return m_bServer;
	}

	/** Servermodus setzen */
	public void setServer(boolean bServer) {
		m_bServer = bServer;
	}

	/** Liefert das Einzellaufflag */
	public boolean getEinzel() {
		return m_bEinzel;
	}

	/** Einzellaufflag im Servermodus setzen */
	public void setEinzel(boolean bEinzel) {
		m_bEinzel = bEinzel;
	}

	/** Liefert das Verschiebenflag */
	public boolean getMove() {
		return m_bMove;
	}

	/** Verschiebenflag im Servermodus setzen */
	public void setMove(boolean bMove) {
		m_bMove = bMove;
	}

	/** Liefert das Ziparchivflag */
	public boolean getZipFile() {
		return m_bZipFile;
	}

	/** Ziparchiveflag setzen */
	public void setZipFile(boolean bZipFile) {
		m_bZipFile = bZipFile;
	}

	/**
	 * Und hier startet das Hauptprogramm des Pruefmoduls.
	 */
	public int pruefe() throws XPMException {
		/** Returncode auf Abbruch setzen */
		int nRet = ErrorCode.cCANCEL_ERROR;

		synchronized (getClass()) {
			try {
				m_Steuerung.m_sPruefFile = m_sPruefFile;

				if (m_bServer) {
					nRet = m_Steuerung.doEver(m_bMove, m_bEinzel, pruefTyp);
				} else if (m_bZipFile) {
					nRet = m_Steuerung.doOnceZip(m_bMove);
				} else {
					// Hier wird keine Verarbeitung von PDF Dateien erlaubt
					nRet = m_Steuerung.doOnce(m_bMove, pruefTyp);
				}
			} catch (XPMException ex) {
				Steuerung.handleCancelError(ex);
				throw ex;
			}
		}
		return nRet;
	}

	/**
	 * Hier werden alle allozierten Objekte wieder zerstört.
	 */
	public void unload() {
		if (m_Steuerung != null) {
			// erst ab der Version 1.01 funktionsfähig
			m_Steuerung.unload();
			m_Steuerung = null;
		}
	}

	/** Startet einen beispielhaften Prüflauf */
	public static void main(String[] args) {
		// Prüfstatus
		int nStatus = -1;
		try {
			// Neue Instanz
			XPMEinstieg xpm_ed = new XPMEinstieg("Konfig/konfigED.xml", "Daten/2780123_100_20020712.ED2",
					new PruefAdapter() {

						@Override
						public void saveVorgabedateien(String sOutputDir, String sContainer) throws XPMException {
							// TODO Auto-generated method stub

						} // !!!! den Pruefadpater durch den
							// eigentlichen konkreten Adapter
							// des jeweiligen Moduls ersetzen

					});

			xpm_ed.setServer(false);
			xpm_ed.setZipFile(false);
			nStatus = xpm_ed.pruefe();
			System.out.println("Einzel-Prüfung mit Status " + nStatus + " beendet.");

			/**
			 * Prüfung aller Dateien im Verzeichnis. Das Verzeichnis wird in der Konfigurationsdatei festgelegt nun wird
			 * es neu festgelegt. über das Objekt m_ConfigFile können alle Vorgaben aus der Konfigurationsdatei
			 * übersteuert werden
			 */
			xpm_ed.m_Steuerung.getConfigFile()
					.setPruefData("Daten/");
			xpm_ed.setServer(true);
			// Einmal abarbeiten
			xpm_ed.setEinzel(true);
			// Geprüfte Dateien in andere Verzeichnisse verschieben
			xpm_ed.setMove(false);
			xpm_ed.setZipFile(false);
			nStatus = xpm_ed.pruefe();
			System.out.println("Server-Prüfung mit Status " + nStatus + " beendet.");

			// Prüfung aller Dateien im Zip-Archiv
			xpm_ed.setPruefdatei("C:/Projekte/JavaPruefmodul/Test/Dm2.Praxis/Daten/2780123_20020712_1.zip");
			xpm_ed.setServer(false);
			xpm_ed.setZipFile(true);
			nStatus = xpm_ed.pruefe();
			System.out.println("Archiv-Prüfung mit Status " + nStatus + " beendet.");
			// Alle allozierten Objekte wieder freigeben
			xpm_ed.unload();

			// !!! Neue Instanz für Folgedokumentation
			// den Pruefadpater durch den
			// eigentlichen konkreten Adapter
			// des jeweiligen Moduls ersetzen

			XPMEinstieg xpm_fd = new XPMEinstieg("Konfig/konfigFD.xml", "Daten/2780123_340_20020712.FD2",
					new PruefAdapter() {

						@Override
						public void saveVorgabedateien(String sOutputDir, String sContainer) throws XPMException {
							// TODO Auto-generated method stub

						}
					});

			xpm_fd.setServer(false);
			xpm_fd.setZipFile(false);
			nStatus = xpm_fd.pruefe();
			System.out.println("Einzel-Prüfung Folgedokumenttion mit Status " + nStatus + " beendet.");
			// Alle allozierten Objekte wieder freigeben
			xpm_fd.unload();
		} catch (XPMException ex) {
			System.err.println("Abbruch Fehler (" + ex.getErrorCode() + "):\n" + ex.toString());
			System.exit(ErrorCode.cCANCEL_ERROR);
		}
	}

	public void beispielAufrufeLDK_PDF_FORMAL() {
		try {
			// Prüfstatus
			int nStatus = -1;
			// Neue Instanz
			// HIER LDT DATEI!
			XPMEinstieg xpm_ed = new XPMEinstieg("src/test/resources/Konfig/konfig.xml",
					"src/test/resources/lokaleTestDaten/inPDF/Muster_10.pdf", new XPMAdapter());

			xpm_ed.setServer(false);
			xpm_ed.setZipFile(false);
			xpm_ed.setPruefTyp(XPMPruefungsTyp.PDFFORMAL);
			nStatus = xpm_ed.pruefe();

			System.out.println("Einzel-Prüfung mit Status " + nStatus + " beendet.");
		} catch (XPMException ex) {
			System.err.println("Abbruch Fehler (" + ex.getErrorCode() + "):\n" + ex.toString());
			System.exit(ErrorCode.cCANCEL_ERROR);
		}
	}

	public void beispielAufrufeLDK_PDF_INHALT() {
		try {
			// Prüfstatus
			int nStatus = -1;
			// Neue Instanz
			// HIER LDT DATEI!
			XPMEinstieg xpm_ed = new XPMEinstieg("src/test/resources/Konfig/konfig.xml",
					"src/test/resources/lokaleTestDaten/inPDF/Muster_10.pdf", new XPMAdapter());

			xpm_ed.setServer(false);
			xpm_ed.setZipFile(false);
			xpm_ed.setPruefTyp(XPMPruefungsTyp.PDFINHALT);
			nStatus = xpm_ed.pruefe();

			System.out.println("Einzel-Prüfung mit Status " + nStatus + " beendet.");
		} catch (XPMException ex) {
			System.err.println("Abbruch Fehler (" + ex.getErrorCode() + "):\n" + ex.toString());
			System.exit(ErrorCode.cCANCEL_ERROR);
		}
	}

	public void beispielAufrufeLDK_PDFVSLDT() {
		try {
			// Prüfstatus
			int nStatus = -1;
			// Neue Instanz
			// HIER LDT DATEI!
			XPMEinstieg xpm_ed = new XPMEinstieg("src/test/resources/Konfig/konfig.xml",
					"src/test/resources/lokaleTestDaten/Z01Auftrag.ldt", new XPMAdapter());

			xpm_ed.setServer(false);
			xpm_ed.setZipFile(false);
			xpm_ed.setPruefTyp(XPMPruefungsTyp.PDFLDT);
			xpm_ed.setPDFFile("src/test/resources/lokaleTestDaten/inPDF/Muster_10.pdf");
			nStatus = xpm_ed.pruefe();

			System.out.println("Einzel-Prüfung mit Status " + nStatus + " beendet.");
		} catch (XPMException ex) {
			System.err.println("Abbruch Fehler (" + ex.getErrorCode() + "):\n" + ex.toString());
			System.exit(ErrorCode.cCANCEL_ERROR);
		}
	}

	public void setPruefTyp(XPMPruefungsTyp pruefTyp) {
		this.pruefTyp = pruefTyp;
	}

	/**
	 * 
	 */
	public void setPDFFile(String pdf) {
		m_Steuerung.setPDFFile(pdf);
	}
}

class XPMAdapter extends PruefAdapter {

	/**
	 * Nur zum Demonstrieren
	 */

	private static final long serialVersionUID = 1L;

	@Override
	public void saveVorgabedateien(String sOutputDir, String sContainer) throws XPMException {
		// TODO Auto-generated method stub

	}

}
