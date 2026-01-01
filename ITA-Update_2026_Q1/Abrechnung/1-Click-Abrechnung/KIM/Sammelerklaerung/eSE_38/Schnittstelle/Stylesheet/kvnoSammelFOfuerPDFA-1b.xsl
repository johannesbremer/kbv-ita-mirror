<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns:fo="http://www.w3.org/1999/XSL/Format"
 xmlns:fox="http://xmlgraphics.apache.org/fop/extensions"
 xmlns:kvno="urn:ehd/ese/001"
 xmlns:sciphox="urn::sciphox-org/sciphox"
 xmlns:ehd="urn:ehd/001"
 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
 version="1.00">

	<!-- Version: 23.06.2022
		 - Neues Logo eingefügt
		 - Änderungen am Text zu Leistungen ($sammeltyp='Arzt')
		 - Unterschrift neben dem Datum bei den zugelassenen Ärzten hinzugefügt
	
		Version: 19.06.2017
		- allgemeinere Beschreibung für den Einsatz zertifizierter Software (nur $sammeltyp = Arzt)
		- Ändernungen am Textfeld zum ärztlichen Notdienst (nur $sammeltyp = Arzt)
	
		Version:  13.07.2016
		am 13.07.2016 folgende Änderung
		- vollständige Anpassung dieses Stylesheets an den PDF1b Standard unter Verwendung der Apache FOP Version 2.1
		- die Fonts müssen auch mit Apache FOP 2.1 erstellt werden
		am 02.07.2015 folgende Änderung
		- Anpassung der Variante Ärzte an die neuen textuellen Vorgaben.
		- Einbau einer Versionierung
		
		am 10.06.2015 folgende Änderung:
		- Die 3-spaltige Auflistung der Teilnahme am Notdienst wurde bei Verwendung von Apache fop-0.94 außerhalb der Seitengröße gedruckt.
		  Zur Vermeidung der Darstellungsprobleme wurden in der ersten Leerzeile zur Tabelle zwei weitere Zellen zur Zeile eingefügt (siehe Kommentar).
		
		am 29.07.2014 folgende Änderung:
		- Anpassung an das 3.Quartal 2014
		- Für //ehd:provider/ehd:organization/ehd:addr  hinzugefügt, dass entweder POB oder ZIP erkannt wird.
-->

	<!-- Globaler Parameter 'sammeltyp' zur Steuerung der Ausgabe. Es können folgende Sammelerklärungen erzeugt werden:
		1. Sammelerklärung für Arzt
		2. Sammelerklärung für Ermächtigte Ärzte
		3. Sammerlerklärung für Krankenhäuser
		Mögliche Werte für den Parameter 'sammeltyp' sind: Arzt, Ermächtigt oder Krankenhaus.
		Der gewünschte Wert wird dem Element <ehd:organization.nm> aus der XML-Datendatei entnommen:
		//ehd:header/ehd:intended_recipient/ehd:organization/ehd:organization.nm/@V="Arzt" 
-->
	<xsl:param name="sammeltyp" select="//ehd:header/ehd:intended_recipient/ehd:organization/ehd:organization.nm/@V"/>
	<xsl:param name="schriftgroesse_festerText" select=" '10pt' "/>
	<xsl:param name="schriftgroesse_variablerText" select=" '9pt' "/>
	<xsl:param name="version" select=" 'Formularversion 23.06.2022' "/>
	<!-- Versionsangabe des Stylesheets. Wird am Fussende jeder Seite ausgegeben. -->

	<xsl:output method="xml" encoding="ISO-8859-1" indent="yes"/>
	<xsl:strip-space elements="*"/>

	<xsl:template match="/">
		<xsl:call-template name="start"/>
	</xsl:template>


	<xsl:template name="start">

		<xsl:element name="fo:root">
			<xsl:attribute name="font-family">
				<xsl:value-of select="'Arial'"/>
			</xsl:attribute>

			<xsl:element name="fo:layout-master-set">
				<xsl:element name="fo:simple-page-master">
					<xsl:attribute name="master-name">
						<xsl:value-of select="'seite_1'"/>
					</xsl:attribute>
					<xsl:attribute name="page-height">
						<xsl:value-of select="'29.7cm'"/>
					</xsl:attribute>
					<xsl:attribute name="page-width">
						<xsl:value-of select="'21cm'"/>
					</xsl:attribute>
					<xsl:attribute name="margin-top">
						<xsl:value-of select="'1.5cm'"/>
					</xsl:attribute>
					<xsl:attribute name="margin-bottom">
						<xsl:value-of select="'1.5cm'"/>
					</xsl:attribute>
					<xsl:attribute name="margin-left">
						<xsl:value-of select="'1.5cm'"/>
					</xsl:attribute>
					<xsl:attribute name="margin-right">
						<xsl:value-of select="'1cm'"/>
					</xsl:attribute>
					<xsl:element name="fo:region-body">
						<xsl:attribute name="margin-top">
							<xsl:value-of select="'1.0cm'"/>
						</xsl:attribute>
						<xsl:attribute name="margin-bottom">
							<xsl:value-of select="'1.0cm'"/>
						</xsl:attribute>
					</xsl:element>
					<xsl:element name="fo:region-after">
						<xsl:attribute name="extent">
							<xsl:value-of select="'0.4cm'"/>
						</xsl:attribute>
					</xsl:element>
				</xsl:element>

				<xsl:element name="fo:simple-page-master">
					<xsl:attribute name="master-name">
						<xsl:value-of select="'seite_rest'"/>
					</xsl:attribute>
					<xsl:attribute name="page-height">
						<xsl:value-of select="'29.7cm'"/>
					</xsl:attribute>
					<xsl:attribute name="page-width">
						<xsl:value-of select="'21cm'"/>
					</xsl:attribute>
					<xsl:attribute name="margin-top">
						<xsl:value-of select="'1.5cm'"/>
					</xsl:attribute>
					<xsl:attribute name="margin-bottom">
						<xsl:value-of select="'1.5cm'"/>
					</xsl:attribute>
					<xsl:attribute name="margin-left">
						<xsl:value-of select="'1.5cm'"/>
					</xsl:attribute>
					<xsl:attribute name="margin-right">
						<xsl:value-of select="'1cm'"/>
					</xsl:attribute>
					<xsl:element name="fo:region-body">
						<xsl:attribute name="margin-top">
							<xsl:value-of select="'2.5cm'"/>
						</xsl:attribute>
						<xsl:attribute name="margin-bottom">
							<xsl:value-of select="'1.0cm'"/>
						</xsl:attribute>
					</xsl:element>
					<xsl:element name="fo:region-before">
						<xsl:attribute name="extent">
							<xsl:value-of select="'2.0cm'"/>
						</xsl:attribute>
					</xsl:element>
					<xsl:element name="fo:region-after">
						<xsl:attribute name="extent">
							<xsl:value-of select="'0.4cm'"/>
						</xsl:attribute>
					</xsl:element>
				</xsl:element>

				<xsl:element name="fo:simple-page-master">
					<xsl:attribute name="master-name">
						<xsl:value-of select="'seite_letzte'"/>
					</xsl:attribute>
					<xsl:attribute name="page-height">
						<xsl:value-of select="'29.7cm'"/>
					</xsl:attribute>
					<xsl:attribute name="page-width">
						<xsl:value-of select="'21cm'"/>
					</xsl:attribute>
					<xsl:attribute name="margin-top">
						<xsl:value-of select="'1.5cm'"/>
					</xsl:attribute>
					<xsl:attribute name="margin-bottom">
						<xsl:value-of select="'1.5cm'"/>
					</xsl:attribute>
					<xsl:attribute name="margin-left">
						<xsl:value-of select="'1.0cm'"/>
					</xsl:attribute>
					<xsl:attribute name="margin-right">
						<xsl:value-of select="'1cm'"/>
					</xsl:attribute>
					<xsl:element name="fo:region-body">
						<xsl:attribute name="margin-top">
							<xsl:value-of select="'2.5cm'"/>
						</xsl:attribute>
						<xsl:attribute name="margin-bottom">
							<xsl:value-of select="'1.0cm'"/>
						</xsl:attribute>
						<xsl:attribute name="margin-left">
							<xsl:value-of select="'0.5cm'"/>
						</xsl:attribute>
					</xsl:element>
					<xsl:element name="fo:region-before">
						<xsl:attribute name="extent">
							<xsl:value-of select="'2.0cm'"/>
						</xsl:attribute>
					</xsl:element>
					<xsl:element name="fo:region-after">
						<xsl:attribute name="extent">
							<xsl:value-of select="'0.4cm'"/>
						</xsl:attribute>
					</xsl:element>
					<xsl:element name="fo:region-start">
						<xsl:attribute name="extent">
							<xsl:value-of select="'0.5cm'"/>
						</xsl:attribute>
						<xsl:attribute name="display-align">
							<xsl:value-of select=" 'after' "/>
						</xsl:attribute>
					</xsl:element>
				</xsl:element>


				<xsl:element name="fo:page-sequence-master">
					<xsl:attribute name="master-name">
						<xsl:value-of select="'contents'"/>
					</xsl:attribute>

					<xsl:element name="fo:repeatable-page-master-alternatives">
						<xsl:element name="fo:conditional-page-master-reference">
							<xsl:attribute name="master-reference">
								<xsl:value-of select="'seite_1'"/>
							</xsl:attribute>
							<xsl:attribute name="page-position">
								<xsl:value-of select="'first'"/>
							</xsl:attribute>
						</xsl:element>
						<xsl:element name="fo:conditional-page-master-reference">
							<xsl:attribute name="master-reference">
								<xsl:value-of select="'seite_rest'"/>
							</xsl:attribute>
							<xsl:attribute name="page-position">
								<xsl:value-of select="'rest'"/>
							</xsl:attribute>
						</xsl:element>
						<xsl:element name="fo:conditional-page-master-reference">
							<xsl:attribute name="master-reference">
								<xsl:value-of select="'seite_letzte'"/>
							</xsl:attribute>
							<xsl:attribute name="page-position">
								<xsl:value-of select="'last'"/>
							</xsl:attribute>
						</xsl:element>
					</xsl:element>
				</xsl:element>
			</xsl:element>
			<!-- fo:layout-master-set -->


			<xsl:element name="fo:declarations">
				<x:xmpmeta xmlns:x="adobe:ns:meta/">
					<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
						<rdf:Description rdf:about="" xmlns:xmp="http://ns.adobe.com/xap/1.0/"/>
						<rdf:Description rdf:about="" xmlns:pdf="http://ns.adobe.com/pdf/1.3/">
							<pdf:Keywords>PDF FOP Apache XSL-FO</pdf:Keywords>
						</rdf:Description>
						<rdf:Description rdf:about="" xmlns:dc="http://purl.org/dc/elements/1.1/">
							<dc:title>
								<rdf:Alt>
									<rdf:li xml:lang="x-default">
										<xsl:value-of select="'Sammelerklaerung im Format PDF/A-1b'" />
									</rdf:li>
								</rdf:Alt>
							</dc:title>
							<dc:subject>
								<rdf:Bag>
									<rdf:li xml:lang="x-default">PDF/A-1b</rdf:li>
								</rdf:Bag>
							</dc:subject>
							<dc:creator>
								<rdf:Seq>
									<rdf:li xml:lang="x-default">KV Nordrhein</rdf:li>
								</rdf:Seq>
							</dc:creator>
							<dc:relation>
								<rdf:Bag>
									<rdf:li xml:lang="x-default">
										<xsl:value-of select="$version" />
									</rdf:li>
								</rdf:Bag>
							</dc:relation>
						</rdf:Description>
					</rdf:RDF>
				</x:xmpmeta>
			</xsl:element>

			<xsl:element name="fo:page-sequence">
				<xsl:attribute name="master-reference">
					<xsl:value-of select="'contents'"/>
				</xsl:attribute>

				<xsl:element name="fo:static-content">
					<!-- Kopfzeile -->
					<xsl:attribute name="flow-name">
						<xsl:value-of select="'xsl-region-before'"/>
					</xsl:attribute>
					<fo:block text-align="right" padding-top="-0.5cm" xml:lang="de-DE">
						<fo:external-graphic src="./Stylesheet/KVNO_Logo_FIN_RGB_Claim.jpg" width="20%" content-width="scale-to-fit" content-height="45%" fox:alt-text="KVNO Logo"/>
					</fo:block>
				</xsl:element>

				<xsl:element name="fo:static-content">
					<!-- rechte Randzeile -->
					<xsl:attribute name="flow-name">
						<xsl:value-of select="'xsl-region-start'"/>
					</xsl:attribute>
					<fo:block-container width="130pt" height="10pt" font-size="8pt" font-weight="normal" border="0pt solid black" reference-orientation="90">
						<fo:block xml:lang="de-DE">
							<xsl:value-of select="$version" />
						</fo:block>
					</fo:block-container>
				</xsl:element>

				<xsl:element name="fo:static-content">
					<!-- Fusszeile -->
					<xsl:attribute name="flow-name">
						<xsl:value-of select="'xsl-region-after'"/>
					</xsl:attribute>
					<fo:table border="0pt solid black" table-layout="fixed" width="100%">
						<fo:table-body>
							<fo:table-row>
								<!-- fo:table-cell padding="0pt" font-weight="normal" font-size="8pt" text-align="left">
								<fo:block><xsl:value-of select="$version" /></fo:block>
							</fo:table-cell -->
								<fo:table-cell padding="0pt" font-weight="bold" font-size="9pt" text-align="right">
									<fo:block xml:lang="de-DE">
										<fo:page-number/>|<fo:page-number-citation ref-id="terminator"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
					</fo:table>
				</xsl:element>

				<xsl:element name="fo:flow">
					<xsl:attribute name="flow-name">
						<xsl:value-of select="'xsl-region-body'"/>
					</xsl:attribute>

					<xsl:element name="fo:block">
						<xsl:attribute name="font-size">
							<xsl:value-of select="'14pt'"/>
						</xsl:attribute>
						<xsl:attribute name="font-weight">
							<xsl:value-of select="'bold'"/>
						</xsl:attribute>
						<xsl:attribute name="text-align">
							<xsl:value-of select="'center'"/>
						</xsl:attribute>
						<xsl:attribute name="space-after.optimum">
							<xsl:value-of select="'15pt'"/>
						</xsl:attribute>
						<fo:inline text-decoration="underline">
							<xsl:value-of select="/kvno:anlage_hvv/kvno:header/kvno:empfaenger/@V"/>
						</fo:inline>
					</xsl:element>

					<xsl:choose>
						<xsl:when test="$sammeltyp='Arzt'">
							<xsl:call-template name="Arztstempel"/>
							<xsl:call-template name="Block_1">
								<xsl:with-param name="lfd-nummer" select=" '1' "/>
							</xsl:call-template>
							<xsl:call-template name="Block_2">
								<xsl:with-param name="lfd-nummer" select=" '2' "/>
							</xsl:call-template>
							<xsl:call-template name="Fueller"/>
							<xsl:call-template name="Assistenten">
								<xsl:with-param name="persontyp" select="//ehd:body/kvno:ese_data/kvno:assistent_liste"/>
							</xsl:call-template>
							<xsl:call-template name="AngestellterArzt">
								<xsl:with-param name="persontyp" select="//ehd:body/kvno:ese_data/kvno:angestellter_arzt_liste"/>
							</xsl:call-template>
							<xsl:call-template name="Vertretung">
								<xsl:with-param name="persontyp" select="//ehd:body/kvno:ese_data/kvno:vertretungszeit_liste"/>
							</xsl:call-template>
							<xsl:call-template name="Block_3">
								<xsl:with-param name="lfd-nummer" select=" '3' "/>
							</xsl:call-template>
							<xsl:call-template name="Block_4">
								<xsl:with-param name="lfd-nummer" select=" '4' "/>
							</xsl:call-template>
							<xsl:call-template name="Bestaetige_ich"/>
							<xsl:call-template name="Block_5">
								<xsl:with-param name="lfd-nummer" select=" '5' "/>
							</xsl:call-template>
							<xsl:call-template name="Block_6">
								<xsl:with-param name="lfd-nummer" select=" '6' "/>
							</xsl:call-template>
							<xsl:call-template name="Block_7">
								<xsl:with-param name="lfd-nummer" select=" '7' "/>
							</xsl:call-template>
							<xsl:call-template name="Block_8">
								<xsl:with-param name="lfd-nummer" select=" '8' "/>
							</xsl:call-template>
							<xsl:call-template name="Block_9">
								<xsl:with-param name="lfd-nummer" select=" '9' "/>
							</xsl:call-template>
							<xsl:call-template name="Block_10">
								<xsl:with-param name="lfd-nummer" select=" '10' "/>
							</xsl:call-template>
							<xsl:call-template name="Block_11"/>
							<xsl:call-template name="Block_12"/>
						</xsl:when>
						<xsl:when test="$sammeltyp='Ermächtigt'">
							<xsl:call-template name="Ermaechtigtestempel"/>
							<xsl:call-template name="Block_1">
								<xsl:with-param name="lfd-nummer" select=" '1' "/>
							</xsl:call-template>
							<xsl:call-template name="Block_2">
								<xsl:with-param name="lfd-nummer" select=" '2' "/>
							</xsl:call-template>
							<xsl:call-template name="Block_3">
								<xsl:with-param name="lfd-nummer" select=" '3' "/>
							</xsl:call-template>
							<xsl:call-template name="Bestaetige_ich"/>
							<xsl:call-template name="Block_5">
								<xsl:with-param name="lfd-nummer" select=" '4' "/>
							</xsl:call-template>
							<xsl:call-template name="Block_6">
								<xsl:with-param name="lfd-nummer" select=" '5' "/>
							</xsl:call-template>
							<xsl:call-template name="Block_8">
								<xsl:with-param name="lfd-nummer" select=" '6' "/>
							</xsl:call-template>
							<xsl:call-template name="Block_7">
								<xsl:with-param name="lfd-nummer" select=" '7' "/>
							</xsl:call-template>
							<xsl:call-template name="Block_10">
								<xsl:with-param name="lfd-nummer" select=" '8' "/>
							</xsl:call-template>
							<xsl:call-template name="check_PageBreak"/>
							<xsl:call-template name="Block_11"/>
							<xsl:call-template name="Block_12"/>
						</xsl:when>
						<xsl:when test="$sammeltyp='Krankenhaus'">
							<xsl:call-template name="Krankenhausstempel"/>
							<xsl:call-template name="Block_1">
								<xsl:with-param name="lfd-nummer" select=" '1' "/>
							</xsl:call-template>
							<xsl:call-template name="Block_2">
								<xsl:with-param name="lfd-nummer" select=" '2' "/>
							</xsl:call-template>
							<xsl:call-template name="Block_3">
								<xsl:with-param name="lfd-nummer" select=" '3' "/>
							</xsl:call-template>
							<xsl:call-template name="Block_4K">
								<xsl:with-param name="lfd-nummer" select=" '4' "/>
							</xsl:call-template>
							<xsl:call-template name="Bestaetige_ich"/>
							<xsl:call-template name="Block_4K2">
								<xsl:with-param name="lfd-nummer" select=" '5' "/>
							</xsl:call-template>
							<xsl:call-template name="Block_5">
								<xsl:with-param name="lfd-nummer" select=" '6' "/>
							</xsl:call-template>
							<xsl:call-template name="Block_6">
								<xsl:with-param name="lfd-nummer" select=" '7' "/>
							</xsl:call-template>
							<xsl:call-template name="Block_8">
								<xsl:with-param name="lfd-nummer" select=" '8' "/>
							</xsl:call-template>
							<xsl:call-template name="Block_10">
								<xsl:with-param name="lfd-nummer" select=" '9' "/>
							</xsl:call-template>
							<xsl:call-template name="check_PageBreak"/>
							<xsl:call-template name="Block_11"/>
							<xsl:call-template name="Block_12"/>
						</xsl:when>
					</xsl:choose>


					<xsl:call-template name="Erstellungsdatum_Sammelerklaerung"/>

					<!-- Endemarke für den Seitenzähler -->
					<xsl:element name="fo:block">
						<xsl:attribute name="id">
							<xsl:value-of select="'terminator'"/>
						</xsl:attribute>
					</xsl:element>

				</xsl:element>
			</xsl:element>

		</xsl:element>
		<!-- fo:root -->
	</xsl:template>


	<!-- Beginn Arztstempel -->
	<xsl:template name="Arztstempel">
		<fo:block text-align="right" padding-top="-1cm" xml:lang="de-DE">
			<fo:external-graphic src="./Stylesheet/KVNO_Logo_FIN_RGB_Claim.jpg" width="20%" content-width="scale-to-fit" content-height="45%" fox:alt-text="KVNO Logo"/>
		</fo:block>
		<fo:table margin-top="0cm" text-align="center" table-layout="fixed" width="100%">
			<xsl:attribute name="space-before">
				<xsl:value-of select="'20pt'"/>
			</xsl:attribute>
			<xsl:attribute name="font-size">
				<xsl:value-of select="'9pt'"/>
			</xsl:attribute>
			<xsl:attribute name="font-weight">
				<xsl:value-of select="'bold'"/>
			</xsl:attribute>
			<xsl:attribute name="color">
				<xsl:value-of select="'black'"/>
			</xsl:attribute>
			<fo:table-column column-width="11cm"/>
			<fo:table-column column-width="7.5cm"/>
			<fo:table-body>
				<fo:table-row text-align="left" height="1.5cm" display-align="center">
					<fo:table-cell padding="0pt" number-columns-spanned="2">
						<xsl:attribute name="font-size">
							<xsl:value-of select="'18pt'"/>
						</xsl:attribute>
						<xsl:attribute name="border-width">
							<xsl:value-of select="'0'"/>
						</xsl:attribute>
						<xsl:attribute name="border-style">
							<xsl:value-of select="'solid'"/>
						</xsl:attribute>
						<fo:block xml:lang="de-DE">
							<xsl:call-template name="berechne_quartal">
								<xsl:with-param name="zeitraum" select="//ehd:header/ehd:service_tmr/@V"/>
							</xsl:call-template>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
				<fo:table-row text-align="left" height="1.5cm" display-align="auto">
					<fo:table-cell padding="0pt">
						<fo:block xml:lang="de-DE">
							<xsl:attribute name="font-size">
								<xsl:value-of select="'10pt'"/>
							</xsl:attribute>
							<xsl:value-of select="//ehd:header/ehd:provider//ehd:organization.nm//@V"/>
						</fo:block>
						<xsl:for-each select="//ehd:header/ehd:provider/ehd:person">
							<fo:block xml:lang="de-DE">
								<xsl:value-of select="ehd:person_name//ehd:PFX/@V"/>&#160;
								<xsl:value-of select="ehd:person_name//ehd:GIV/@V"/>&#160;
								<xsl:value-of select="ehd:person_name//ehd:FAM/@V"/>
								<xsl:for-each select="ehd:local_header/ehd:fachgruppenbezeichnung">
									<fo:block>
										<xsl:attribute name="color">
											<xsl:value-of select="'#808080'"/>
										</xsl:attribute>
										<xsl:value-of select="./@V"/>
									</fo:block>
								</xsl:for-each>
							</fo:block>
						</xsl:for-each>
						<fo:block xml:lang="de-DE">
							<xsl:attribute name="color">
								<xsl:value-of select="'#808080'"/>
							</xsl:attribute>
							<xsl:value-of select="//ehd:provider/ehd:organization/ehd:addr/ehd:STR/@V"/>&#160;
							<xsl:value-of select="//ehd:provider/ehd:organization/ehd:addr/ehd:HNR/@V"/>
							<fo:block/>
							<xsl:choose>
								<xsl:when test="//ehd:provider/ehd:organization/ehd:addr/ehd:ZIP">
									<xsl:value-of select="//ehd:provider/ehd:organization/ehd:addr/ehd:ZIP/@V"/>&#160;
								</xsl:when>
								<xsl:when test="//ehd:provider/ehd:organization/ehd:addr/ehd:POB">
									<xsl:value-of select="//ehd:provider/ehd:organization/ehd:addr/ehd:POB/@V"/>&#160;
								</xsl:when>
							</xsl:choose>
							<xsl:value-of select="//ehd:provider/ehd:organization/ehd:addr/ehd:CTY/@V"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell padding="0pt">
						<xsl:attribute name="font-size">
							<xsl:value-of select="'14pt'"/>
						</xsl:attribute>
						<xsl:attribute name="border-width">
							<xsl:value-of select="'0'"/>
						</xsl:attribute>
						<xsl:attribute name="border-style">
							<xsl:value-of select="'solid'"/>
						</xsl:attribute>
						<xsl:attribute name="font-weight">
							<xsl:value-of select="'normal'"/>
						</xsl:attribute>
						<fo:block xml:lang="de-DE">
							<xsl:text>BSNR: </xsl:text>
							<xsl:value-of select="//ehd:header/ehd:provider/ehd:organization/ehd:id/@EX"/>
						</fo:block>
						<fo:block>
							<xsl:attribute name="padding-after">
								<xsl:value-of select=" '6pt' "/>
							</xsl:attribute>
						</fo:block>
						<fo:block xml:lang="de-DE">
							<xsl:text>Fallzahl: </xsl:text>
							<xsl:value-of select="//ehd:body/kvno:ese_data/kvno:fall_statistik/kvno:anzahl_gesamt/@V"/>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
		<xsl:call-template name="Block_Sammelerklaerung"/>
	</xsl:template>

	<!-- Beginn Stempel Ermächtige Ärzte -->
	<xsl:template name="Ermaechtigtestempel">
		<fo:block text-align="right" padding-top="-1cm">
			<fo:external-graphic src="./Stylesheet/KVNO_Logo_FIN_RGB_Claim.jpg" width="20%" content-width="scale-to-fit" content-height="45%" fox:alt-text="KVNO Logo"/>
		</fo:block>
		<fo:table margin-top="0cm" text-align="center" table-layout="fixed" width="100%">
			<xsl:attribute name="space-before">
				<xsl:value-of select="'20pt'"/>
			</xsl:attribute>
			<xsl:attribute name="font-size">
				<xsl:value-of select="'9pt'"/>
			</xsl:attribute>
			<xsl:attribute name="font-weight">
				<xsl:value-of select="'bold'"/>
			</xsl:attribute>
			<xsl:attribute name="color">
				<xsl:value-of select="'black'"/>
			</xsl:attribute>
			<fo:table-column column-width="11cm"/>
			<fo:table-column column-width="7.5cm"/>
			<fo:table-body>
				<fo:table-row text-align="left" height="1.5cm" display-align="center">
					<fo:table-cell padding="0pt" number-columns-spanned="2">
						<xsl:attribute name="font-size">
							<xsl:value-of select="'18pt'"/>
						</xsl:attribute>
						<xsl:attribute name="border-width">
							<xsl:value-of select="'0'"/>
						</xsl:attribute>
						<xsl:attribute name="border-style">
							<xsl:value-of select="'solid'"/>
						</xsl:attribute>
						<xsl:variable name="quartal">
							<xsl:call-template name="berechne_quartal">
								<xsl:with-param name="zeitraum" select="//ehd:header/ehd:service_tmr/@V"/>
							</xsl:call-template>
						</xsl:variable>
						<fo:block xml:lang="de-DE">
							<xsl:value-of select="concat($quartal, ' | Ermächtigte Ärzte')"/>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
				<fo:table-row text-align="left" height="1.5cm" display-align="auto">
					<fo:table-cell padding="0pt">
						<fo:block xml:lang="de-DE">
							<xsl:attribute name="font-size">
								<xsl:value-of select="'10pt'"/>
							</xsl:attribute>
							<xsl:value-of select="//ehd:header/ehd:provider//ehd:organization.nm//@V"/>
						</fo:block>
						<xsl:for-each select="//ehd:header/ehd:provider/ehd:person">
							<fo:block xml:lang="de-DE">
								<xsl:value-of select="ehd:person_name//ehd:PFX/@V"/>&#160;
								<xsl:value-of select="ehd:person_name//ehd:GIV/@V"/>&#160;
								<xsl:value-of select="ehd:person_name//ehd:FAM/@V"/>
								<xsl:for-each select="ehd:local_header/ehd:fachgruppenbezeichnung">
									<fo:block>
										<xsl:attribute name="color">
											<xsl:value-of select="'#808080'"/>
										</xsl:attribute>
										<xsl:value-of select="./@V"/>
									</fo:block>
								</xsl:for-each>
							</fo:block>
						</xsl:for-each>
						<fo:block xml:lang="de-DE">
							<xsl:attribute name="color">
								<xsl:value-of select="'#808080'"/>
							</xsl:attribute>
							<xsl:value-of select="//ehd:provider/ehd:organization/ehd:addr/ehd:STR/@V"/>&#160;
							<xsl:value-of select="//ehd:provider/ehd:organization/ehd:addr/ehd:HNR/@V"/>
							<fo:block/>
							<xsl:choose>
								<xsl:when test="//ehd:provider/ehd:organization/ehd:addr/ehd:ZIP">
									<xsl:value-of select="//ehd:provider/ehd:organization/ehd:addr/ehd:ZIP/@V"/>&#160;
								</xsl:when>
								<xsl:when test="//ehd:provider/ehd:organization/ehd:addr/ehd:POB">
									<xsl:value-of select="//ehd:provider/ehd:organization/ehd:addr/ehd:POB/@V"/>&#160;
								</xsl:when>
							</xsl:choose>
							<xsl:value-of select="//ehd:provider/ehd:organization/ehd:addr/ehd:CTY/@V"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell padding="0pt">
						<xsl:attribute name="font-size">
							<xsl:value-of select="'14pt'"/>
						</xsl:attribute>
						<xsl:attribute name="border-width">
							<xsl:value-of select="'0'"/>
						</xsl:attribute>
						<xsl:attribute name="border-style">
							<xsl:value-of select="'solid'"/>
						</xsl:attribute>
						<xsl:attribute name="font-weight">
							<xsl:value-of select="'normal'"/>
						</xsl:attribute>
						<fo:block xml:lang="de-DE">
							<xsl:text>BSNR: </xsl:text>
							<xsl:value-of select="//ehd:header/ehd:provider/ehd:organization/ehd:id/@EX"/>
						</fo:block>
						<fo:block>
							<xsl:attribute name="padding-after">
								<xsl:value-of select=" '6pt' "/>
							</xsl:attribute>
						</fo:block>
						<fo:block xml:lang="de-DE">
							<xsl:text>Fallzahl: </xsl:text>
							<xsl:value-of select="//ehd:body/kvno:ese_data/kvno:fall_statistik/kvno:anzahl_gesamt/@V"/>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
		<xsl:call-template name="Block_Sammelerklaerung"/>
	</xsl:template>

	<!-- Beginn Stempel Krankenhäuser -->
	<xsl:template name="Krankenhausstempel">
		<fo:block text-align="right" padding-top="-1cm">
			<fo:external-graphic src="./Stylesheet/KVNO_Logo_FIN_RGB_Claim.jpg" width="20%" content-width="scale-to-fit" content-height="45%" fox:alt-text="KVNO Logo"/>
		</fo:block>
		<fo:table margin-top="0cm" text-align="center" table-layout="fixed" width="100%">
			<xsl:attribute name="space-before">
				<xsl:value-of select="'20pt'"/>
			</xsl:attribute>
			<xsl:attribute name="font-size">
				<xsl:value-of select="'9pt'"/>
			</xsl:attribute>
			<xsl:attribute name="font-weight">
				<xsl:value-of select="'bold'"/>
			</xsl:attribute>
			<xsl:attribute name="color">
				<xsl:value-of select="'black'"/>
			</xsl:attribute>
			<fo:table-column column-width="11cm"/>
			<fo:table-column column-width="7.5cm"/>
			<fo:table-body>
				<fo:table-row text-align="left" height="1.5cm" display-align="center">
					<fo:table-cell padding="0pt" number-columns-spanned="2">
						<xsl:attribute name="font-size">
							<xsl:value-of select="'18pt'"/>
						</xsl:attribute>
						<xsl:attribute name="border-width">
							<xsl:value-of select="'0'"/>
						</xsl:attribute>
						<xsl:attribute name="border-style">
							<xsl:value-of select="'solid'"/>
						</xsl:attribute>
						<xsl:variable name="quartal">
							<xsl:call-template name="berechne_quartal">
								<xsl:with-param name="zeitraum" select="//ehd:header/ehd:service_tmr/@V"/>
							</xsl:call-template>
						</xsl:variable>
						<fo:block xml:lang="de-DE">
							<xsl:value-of select="concat($quartal, ' | Krankenhäuser')"/>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
				<fo:table-row text-align="left" height="1.5cm" display-align="auto">
					<fo:table-cell padding="0pt">
						<fo:block xml:lang="de-DE">
							<xsl:attribute name="font-size">
								<xsl:value-of select="'10pt'"/>
							</xsl:attribute>
							<xsl:value-of select="//ehd:header/ehd:provider//ehd:organization.nm//@V"/>
						</fo:block>
						<xsl:for-each select="//ehd:header/ehd:provider/ehd:person">
							<fo:block xml:lang="de-DE">
								<xsl:value-of select="ehd:person_name//ehd:PFX/@V"/>&#160;
								<xsl:value-of select="ehd:person_name//ehd:GIV/@V"/>&#160;
								<xsl:value-of select="ehd:person_name//ehd:FAM/@V"/>
								<xsl:for-each select="ehd:local_header/ehd:fachgruppenbezeichnung">
									<fo:block>
										<xsl:attribute name="color">
											<xsl:value-of select="'#808080'"/>
										</xsl:attribute>
										<xsl:value-of select="./@V"/>
									</fo:block>
								</xsl:for-each>
							</fo:block>
						</xsl:for-each>
						<fo:block xml:lang="de-DE">
							<xsl:attribute name="color">
								<xsl:value-of select="'#808080'"/>
							</xsl:attribute>
							<xsl:value-of select="//ehd:provider/ehd:organization/ehd:addr/ehd:STR/@V"/>&#160;
							<xsl:value-of select="//ehd:provider/ehd:organization/ehd:addr/ehd:HNR/@V"/>
							<fo:block/>
							<xsl:choose>
								<xsl:when test="//ehd:provider/ehd:organization/ehd:addr/ehd:ZIP">
									<xsl:value-of select="//ehd:provider/ehd:organization/ehd:addr/ehd:ZIP/@V"/>&#160;
								</xsl:when>
								<xsl:when test="//ehd:provider/ehd:organization/ehd:addr/ehd:POB">
									<xsl:value-of select="//ehd:provider/ehd:organization/ehd:addr/ehd:POB/@V"/>&#160;
								</xsl:when>
							</xsl:choose>
							<xsl:value-of select="//ehd:provider/ehd:organization/ehd:addr/ehd:CTY/@V"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell padding="0pt">
						<xsl:attribute name="font-size">
							<xsl:value-of select="'14pt'"/>
						</xsl:attribute>
						<xsl:attribute name="border-width">
							<xsl:value-of select="'0'"/>
						</xsl:attribute>
						<xsl:attribute name="border-style">
							<xsl:value-of select="'solid'"/>
						</xsl:attribute>
						<xsl:attribute name="font-weight">
							<xsl:value-of select="'normal'"/>
						</xsl:attribute>
						<fo:block xml:lang="de-DE">
							<xsl:text>BSNR: </xsl:text>
							<xsl:value-of select="//ehd:header/ehd:provider/ehd:organization/ehd:id/@EX"/>
						</fo:block>
						<fo:block>
							<xsl:attribute name="padding-after">
								<xsl:value-of select=" '6pt' "/>
							</xsl:attribute>
						</fo:block>
						<fo:block xml:lang="de-DE">
							<xsl:text>Fallzahl: </xsl:text>
							<xsl:value-of select="//ehd:body/kvno:ese_data/kvno:fall_statistik/kvno:anzahl_gesamt/@V"/>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
		<xsl:call-template name="Block_Sammelerklaerung"/>
	</xsl:template>



	<!--  Sammelerklärung (Version für Ärzte, ermächtigte Ärzte und Krankenhäuser)
-->
	<xsl:template name="Block_Sammelerklaerung">
		<fo:table border="0pt solid black" table-layout="fixed"  space-before="20pt" font-size="{$schriftgroesse_festerText}" width="100%">
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell padding="0pt" font-weight="bold">
						<xsl:choose>
							<xsl:when test="$sammeltyp='Arzt' ">
								<fo:block xml:lang="de-DE">Ich versichere/Wir versichern:</fo:block>
							</xsl:when>
							<xsl:when test="$sammeltyp='Ermächtigt' ">
								<fo:block xml:lang="de-DE">Ich versichere:</fo:block>
							</xsl:when>
							<xsl:when test="$sammeltyp='Krankenhaus' ">
								<fo:block xml:lang="de-DE">Ich versichere:</fo:block>
							</xsl:when>
						</xsl:choose>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
	</xsl:template>



	<!--  Block 1  - Text zur Vollständigkeit der Abrechnung
-->
	<xsl:template name="Block_1">
		<xsl:param name="lfd-nummer"/>
		<fo:table border="0pt solid black" table-layout="fixed"  space-before="15pt" font-size="{$schriftgroesse_festerText}" width="100%">
			<fo:table-column column-width="1cm"/>
			<fo:table-column column-width="17.5cm"/>
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell padding="0pt" font-weight="normal" text-align="center">
						<fo:block xml:lang="de-DE">
							<xsl:value-of select="concat($lfd-nummer, '.')"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell padding="0pt" font-weight="'normal'">
						<fo:block xml:lang="de-DE">Die Abrechnung ist vollständig; die maßgeblichen Regelungen und Bestimmungen, besonders die des Sozialgesetzbuchs V, des Bundesmantelvertrages (BMV-Ä), des Einheitlichen Bewertungsmaßstabs und des Honorarverteilungsmaßstabs, der IT-Richtlinien der KV Nordrhein sowie der Richtlinien des Gemeinsamen Bundesausschusses in der jeweils geltenden Fassung wurden beachtet.</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
	</xsl:template>


	<!--  Block 2  - Text zu Leistungen
-->
	<xsl:template name="Block_2">
		<xsl:param name="lfd-nummer"/>
		<fo:table border="0pt solid black" table-layout="fixed"  space-before="15pt" font-size="{$schriftgroesse_festerText}" width="100%">
			<fo:table-column column-width="1cm"/>
			<fo:table-column column-width="17.5cm"/>
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell padding="0pt" font-weight="normal" text-align="center">
						<fo:block xml:lang="de-DE">
							<xsl:value-of select="concat($lfd-nummer, '.')"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell padding="0pt" font-weight="'normal'">
						<xsl:choose>
							<xsl:when test="$sammeltyp='Arzt' ">
								<fo:block xml:lang="de-DE">Die in Rechnung gestellten Leistungen habe(n) ich/wir selbst oder nichtärztliche Hilfskräfte unter meiner/unserer Aufsicht ausgeführt oder sie wurden von einem Vertreter (vgl. § 32 Ärzte-ZV) erbracht. Sofern ärztliche Assistenten und/oder angestellte Ärzte Leistungen erbracht haben, sind diese Ärzte durch die KV Nordrhein genehmigt. Alle Leistungen wurden an für alle beteiligten Ärzte genehmigten Standorten ausgeführt. Haben Vertreter/innen qualifikationsgebundene Leistungen erbracht, habe ich mich davon überzeugt, dass die Qualifikationsvoraussetzungen in der Person des Vertreters/der Vertreterin erfüllt waren.</fo:block>
							</xsl:when>
							<xsl:when test="$sammeltyp='Ermächtigt' ">
								<fo:block xml:lang="de-DE">Die in Rechnung gestellten Leistungen habe ich selbst (persönlich) oder durch nichtärztliche Hilfskräfte unter meiner Aufsicht ausgeführt.</fo:block>
							</xsl:when>
							<xsl:when test="$sammeltyp='Krankenhaus' ">
								<fo:block xml:lang="de-DE">Die in Rechnung gestellten Leistungen haben ausschließlich zur Leistungserbringung berechtigte Personen erbracht.</fo:block>
							</xsl:when>
						</xsl:choose>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
	</xsl:template>


	<!--  Block 3  - Text zu den Abrechnungsvoraussetzungen
-->
	<xsl:template name="Block_3">
		<xsl:param name="lfd-nummer"/>
		<fo:table border="0pt solid black" table-layout="fixed"  space-before="15pt" font-size="{$schriftgroesse_festerText}" width="100%">
			<fo:table-column column-width="1cm"/>
			<fo:table-column column-width="17.5cm"/>
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell padding="0pt" font-weight="normal" text-align="center">
						<fo:block xml:lang="de-DE">
							<xsl:value-of select="concat($lfd-nummer, '.')"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell padding="0pt" font-weight="'normal'">
						<xsl:choose>
							<xsl:when test="$sammeltyp='Arzt' ">
								<fo:block xml:lang="de-DE">Die Abrechnungsvoraussetzungen sind erfüllt bzw. ich/wir habe(n) mich/uns von deren Erfüllung persönlich überzeugt.</fo:block>
							</xsl:when>
							<xsl:when test="$sammeltyp='Ermächtigt' ">
								<fo:block xml:lang="de-DE">Ich erfülle alle Abrechnungsvoraussetzungen.</fo:block>
							</xsl:when>
							<xsl:when test="$sammeltyp='Krankenhaus' ">
								<fo:block xml:lang="de-DE">Ich trage die Verantwortung für die Erfüllung aller Abrechnungsvoraussetzungen.</fo:block>
							</xsl:when>
						</xsl:choose>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
	</xsl:template>


	<!--  Block 4  - Text zum Notfalldienst
-->
	<xsl:template name="Block_4">
		<xsl:param name="lfd-nummer"/>
		<fo:table border="0pt solid black" table-layout="fixed"  space-before="15pt" font-size="{$schriftgroesse_festerText}" width="100%" keep-with-next="always">
			<fo:table-column column-width="1cm"/>
			<fo:table-column column-width="17.5cm"/>
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell padding="0pt" font-weight="normal" text-align="center">
						<fo:block xml:lang="de-DE">
							<xsl:value-of select="concat($lfd-nummer, '.')"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell padding="0pt" font-weight="'normal'">
						<fo:block xml:lang="de-DE">
							An folgenden Tagen war(en) ich/wir zum organisierten ärztlichen Notfalldienst eingeteilt und habe(n)
							die abgerechneten Leistungen persönlich oder durch einen Vertreter in eigener Praxis bzw. in einer von
							der KV Nordrhein und der Ärztekammer Nordrhein genehmigten Notfallpraxis erbracht:
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
		<xsl:call-template name="TeilnahmeNotfalldienst"/>
	</xsl:template>


	<!--  Block 4K  - Text zu Notfallleistungen im Krankenhaus
-->
	<xsl:template name="Block_4K">
		<xsl:param name="lfd-nummer"/>
		<fo:table border="0pt solid black" table-layout="fixed"  space-before="15pt" font-size="{$schriftgroesse_festerText}" width="100%" keep-with-next="always">
			<fo:table-column column-width="1cm"/>
			<fo:table-column column-width="17.5cm"/>
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell padding="0pt" font-weight="normal" text-align="center">
						<fo:block xml:lang="de-DE">
							<xsl:value-of select="concat($lfd-nummer, '.')"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell padding="0pt" font-weight="'normal'">
						<fo:block xml:lang="de-DE">Die ambulanten Notfallleistungen werden ausschließlich durch das Krankenhaus und nicht durch einen ermächtigten Krankenhausarzt abgerechnet.</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
	</xsl:template>


	<!--  Block 4K2  - Text zur Notfallbehandlung im Krankenhaus
-->
	<xsl:template name="Block_4K2">
		<xsl:param name="lfd-nummer"/>
		<fo:table border="0pt solid black" table-layout="fixed"  space-before="15pt" font-size="{$schriftgroesse_festerText}" width="100%" keep-with-next="always">
			<fo:table-column column-width="1cm"/>
			<fo:table-column column-width="17.5cm"/>
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell padding="0pt" font-weight="normal" text-align="center">
						<fo:block xml:lang="de-DE">
							<xsl:value-of select="concat($lfd-nummer, '.')"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell padding="0pt" font-weight="'normal'">
						<fo:block xml:lang="de-DE">Datum und Uhrzeit der ambulanten Notfallbehandlung sind angegeben. Die abgerechneten Notfallleistungen umfassen nur die medizinische Erstversorgung.</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
	</xsl:template>



	<!--  Block Text: Ferner bestätige ich/...
-->
	<xsl:template name="Bestaetige_ich">
		<xsl:variable name="anzahl_komplex" select="count(//kvno:org_notdienstzeit_liste/kvno:bool_komplex/kvno:true/kvno:komplex)"/>
		<fo:table border="0pt solid black" table-layout="fixed"  space-before="40pt" font-size="{$schriftgroesse_festerText}" width="100%">
			<fo:table-column column-width="18.5cm"/>
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell padding="0pt" font-weight="bold" text-align="left">
						<xsl:choose>
							<xsl:when test="$sammeltyp='Arzt' ">
								<xsl:if test="$anzahl_komplex &lt; 6">
									<fo:block break-before="page" xml:lang="de-DE"></fo:block>
									<!-- Seitenumbruch -->
								</xsl:if>
								<fo:block xml:lang="de-DE">Ferner bestätige ich/bestätigen wir:</fo:block>
							</xsl:when>
							<xsl:when test="$sammeltyp='Ermächtigt' ">
								<fo:block xml:lang="de-DE">Ferner bestätige ich:</fo:block>
							</xsl:when>
							<xsl:when test="$sammeltyp='Krankenhaus' ">
								<fo:block xml:lang="de-DE">Ferner bestätige ich:</fo:block>
							</xsl:when>
						</xsl:choose>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
	</xsl:template>


	<!--  Block 5  - Text zu qualitätsgebundenen Leistungen
-->
	<xsl:template name="Block_5">
		<xsl:param name="lfd-nummer"/>
		<fo:table border="0pt solid black" table-layout="fixed"  space-before="15pt" font-size="{$schriftgroesse_festerText}" width="100%">
			<fo:table-column column-width="1cm"/>
			<fo:table-column column-width="17.5cm"/>
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell padding="0pt" font-weight="normal" text-align="center">
						<fo:block xml:lang="de-DE">
							<xsl:value-of select="concat($lfd-nummer, '.')"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell padding="0pt" font-weight="'normal'">
						<xsl:choose>
							<xsl:when test="$sammeltyp='Arzt' or $sammeltyp='Ermächtigt' ">
								<fo:block xml:lang="de-DE">Für alle qualitätsgebundenen Leistungen liegen die erforderlichen Genehmigungen bzw. Nachweise im Rahmen der erfolgreichen Teilnahme an den Ringversuchen vor. Es wurden nur die Materialien (Serum und/oder Urin und/oder Liquor) abgerechnet, für die ein gültiger Nachweis einer erfolgreichen Ringversuchsteilnahme vorliegt.</fo:block>
							</xsl:when>
							<xsl:when test="$sammeltyp='Krankenhaus' ">
								<fo:block xml:lang="de-DE">Für alle qualitätsgebundenen Leistungen liegen die Voraussetzungen bzw. Nachweise im Rahmen der erfolgreichen Teilnahme an den Ringversuchen vor. Es wurden nur die Materialien (Serum und/oder Urin und/oder Liquor) abgerechnet, für die ein gültiger Nachweis einer erfolgreichen Ringversuchsteilnahme vorliegt.</fo:block>
							</xsl:when>
						</xsl:choose>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
	</xsl:template>


	<!--  Block 6  - Text zu laboratoriumsmedizinische Leistungen
-->
	<xsl:template name="Block_6">
		<xsl:param name="lfd-nummer"/>
		<fo:table border="0pt solid black" table-layout="fixed"  space-before="15pt" font-size="{$schriftgroesse_festerText}" width="100%">
			<fo:table-column column-width="1cm"/>
			<fo:table-column column-width="17.5cm"/>
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell padding="0pt" font-weight="normal" text-align="center">
						<fo:block xml:lang="de-DE">
							<xsl:value-of select="concat($lfd-nummer, '.')"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell padding="0pt" font-weight="'normal'">
						<xsl:choose>
							<xsl:when test="$sammeltyp='Arzt' ">
								<fo:block xml:lang="de-DE">Die Befunderhebung für Untersuchungen des Abschnitts 32.3 und entsprechende laboratoriumsmedizinische Leistungen der Abschnitte 1.7, 11.3 und 11.4 des EBM wurden durch mich persönlich erbracht.</fo:block>
							</xsl:when>
							<xsl:when test="$sammeltyp='Ermächtigt' ">
								<fo:block xml:lang="de-DE">Die Befunderhebung für Untersuchungen des Abschnitts 32.3 und entsprechende laboratoriumsmedizinische Leistungen der Abschnitte 1.7, 11.3 und 11.4 des EBM wurden durch mich persönlich erbracht.</fo:block>
							</xsl:when>
							<xsl:when test="$sammeltyp='Krankenhaus' ">
								<fo:block xml:lang="de-DE">Die Befunderhebung für Untersuchungen des Abschnitts 32.3 und entsprechende laboratoriumsmedizinische Leistungen der Abschnitte 1.7, 11.3 und 11.4 des EBM wurden unter persönlicher Überwachung des verantwortlichen Arztes erbracht.</fo:block>
							</xsl:when>
						</xsl:choose>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
	</xsl:template>



	<!--  Block 7  - Text zu Leistungen durch mehrere Ärzte
-->
	<xsl:template name="Block_7">
		<xsl:param name="lfd-nummer"/>
		<fo:table border="0pt solid black" table-layout="fixed"  space-before="15pt" font-size="{$schriftgroesse_festerText}" width="100%">
			<fo:table-column column-width="1cm"/>
			<fo:table-column column-width="17.5cm"/>
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell padding="0pt" font-weight="normal" text-align="center">
						<fo:block xml:lang="de-DE">
							<xsl:value-of select="concat($lfd-nummer, '.')"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell padding="0pt" font-weight="'normal'">
						<xsl:choose>
							<xsl:when test="$sammeltyp='Arzt' ">
								<fo:block xml:lang="de-DE">In den Fällen, in denen mehrere Ärzte bzw. Arztpraxen in demselben Arztfall die Leistung erbracht haben, besteht Einigkeit unter den beteiligten Ärzten/Praxen, dass nur ich allein/nur die unterzeichnende Arztpraxis die Leistungen abrechne(t) und/oder ich allein der behandlungsführende Arzt bin.</fo:block>
							</xsl:when>
							<xsl:when test="$sammeltyp='Ermächtigt' ">
								<fo:block xml:lang="de-DE">In denjenigen Fällen, in denen mehrere Ärzte, auch Vertragsärzte, in demselben Arztfall die Leistung erbracht haben, besteht Einigkeit unter den beteiligten Ärzten, dass nur ich allein die Leistungen abrechne und/oder ich allein der behandlungsführende Arzt bin.</fo:block>
							</xsl:when>
						</xsl:choose>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
	</xsl:template>


	<!--  Block 8  - Text zu Kosten für Materialien
-->
	<xsl:template name="Block_8">
		<xsl:param name="lfd-nummer"/>
		<fo:table border="0pt solid black" table-layout="fixed"  space-before="15pt" font-size="{$schriftgroesse_festerText}" width="100%">
			<fo:table-column column-width="1cm"/>
			<fo:table-column column-width="17.5cm"/>
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell padding="0pt" font-weight="normal" text-align="center">
						<fo:block xml:lang="de-DE">
							<xsl:value-of select="concat($lfd-nummer, '.')"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell padding="0pt" font-weight="'normal'">
						<fo:block xml:lang="de-DE">Bei den Kosten für Materialien, die gemäß Abschnitt I Punkt 7.3 der Allgemeinen Bestimmungen des EBM nicht in den berechnungsfähigen Leistungen enthalten sind, sind die tatsächlich realisierten Preise gegenüber der KV Nordrhein in Rechnung gestellt worden. Rückvergütungen, wie Preisnachlässe, Rabatte, Umsatzbeteiligung, Bonifikation und rückvergütungsgleiche Gewinnbeteiligungen (mit Ausnahme von Barzahlungsrabatten) habe ich an die KV Nordrhein weitergegeben.</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
	</xsl:template>


	<!--  Block 9  - Text zu GOP 06225
-->
	<xsl:template name="Block_9">
		<xsl:param name="lfd-nummer"/>
		<fo:table border="0pt solid black" table-layout="fixed"  space-before="15pt" font-size="{$schriftgroesse_festerText}" width="100%">
			<fo:table-column column-width="1cm"/>
			<fo:table-column column-width="17.5cm"/>
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell padding="0pt" font-weight="normal" text-align="center">
						<fo:block xml:lang="de-DE">
							<xsl:value-of select="concat($lfd-nummer, '.')"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell padding="0pt" font-weight="'normal'">
						<fo:block xml:lang="de-DE">Die Voraussetzungen zur Abrechnung der GOP 06225 EBM sind für alle Behandlungsfälle erfüllt.</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
	</xsl:template>


	<!--  Block 10  - Text zu Softwarezertifizierung
-->
	<xsl:template name="Block_10">
		<xsl:param name="lfd-nummer"/>
		<fo:table border="0pt solid black" table-layout="fixed"  space-before="15pt" font-size="{$schriftgroesse_festerText}" width="100%">
			<fo:table-column column-width="1cm"/>
			<fo:table-column column-width="17.5cm"/>
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell padding="0pt" font-weight="normal" text-align="center">
						<fo:block xml:lang="de-DE">
							<xsl:value-of select="concat($lfd-nummer, '.')"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell padding="0pt" font-weight="'normal'">
						<fo:block xml:lang="de-DE">Die eingesetzte Software ist zertifiziert.</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
	</xsl:template>


	<!--  Block 11  - Text: Mir/uns ist bekannt ...
-->
	<xsl:template name="Block_11">
		<fo:table border="0pt solid black" table-layout="fixed"  space-before="15pt" font-size="{$schriftgroesse_festerText}" width="100%">
			<fo:table-column column-width="0.6cm"/>
			<fo:table-column column-width="17.9cm"/>
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell padding="0pt" font-weight="'normal'" number-columns-spanned="2">
						<xsl:choose>
							<xsl:when test="$sammeltyp='Arzt' ">
								<fo:block xml:lang="de-DE">Mir/Uns ist bekannt, dass Honorarrückforderungen seitens der KV Nordrhein entstehen,</fo:block>
							</xsl:when>
							<xsl:when test="$sammeltyp='Ermächtigt' ">
								<fo:block xml:lang="de-DE">Mir ist bekannt, dass Honorarrückforderungen seitens der KV Nordrhein entstehen,</fo:block>
							</xsl:when>
							<xsl:when test="$sammeltyp='Krankenhaus' ">
								<fo:block xml:lang="de-DE">Mir ist bekannt, dass Honorarrückforderungen seitens der KV Nordrhein entstehen,</fo:block>
							</xsl:when>
						</xsl:choose>
					</fo:table-cell>
				</fo:table-row>
				<fo:table-row>
					<fo:table-cell padding="0pt" font-weight="normal" text-align="center">
						<fo:block text-align="left" xml:lang="de-DE">
							<fo:external-graphic src="./Stylesheet/aufzaehlung.JPG" width="20%" content-width="scale-to-fit" content-height="100%" fox:alt-text="Zeichen"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell padding="0pt" font-weight="'normal'">
						<fo:block xml:lang="de-DE">wenn die Abrechnung nicht den genannten Bestimmungen entspricht und/oder</fo:block>
					</fo:table-cell>
				</fo:table-row>
				<fo:table-row>
					<fo:table-cell padding="0pt" font-weight="normal" text-align="center">
						<fo:block text-align="left" xml:lang="de-DE">
							<fo:external-graphic src="./Stylesheet/aufzaehlung.JPG" width="20%" content-width="scale-to-fit" content-height="100%" fox:alt-text="Zeichen"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell padding="0pt" font-weight="'normal'">
						<fo:block xml:lang="de-DE">wenn durch die Beschäftigung eines nicht genehmigten Assistenten/Vertreters Leistungen abgerechnet wurden.</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
	</xsl:template>


	<!--  Block 12  - Text zu Softwarezertifizierung
-->
	<xsl:template name="Block_12">
		<fo:table border="0pt solid black" table-layout="fixed"  space-before="15pt" font-size="{$schriftgroesse_festerText}" width="100%">
			<fo:table-column column-width="18.5cm"/>
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell padding="0pt" font-weight="'normal'">
						<fo:block xml:lang="de-DE">Eine Veränderung des Erklärungstextes führt zur Unwirksamkeit der Erklärung mit der Folge, dass die KV Nordrhein die Abrechnung ablehnen kann.</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
	</xsl:template>


	<!--  Block 13  veraltet - Text Uhrzeitangaben zu Leistungen im Notdienst
		mit dem Update vom 19.06.2017 ist dieser Block entfallen
-->
	<!-- xsl:template name="Block_13">
	<xsl:param name="lfd-nummer"/>
	<fo:table border="0pt solid black" table-layout="fixed"  space-before="15pt" font-size="{$schriftgroesse_festerText}" width="100%">
		<fo:table-column column-width="1cm"/>
		<fo:table-column column-width="17.5cm"/>
		<fo:table-body>
			<fo:table-row>
				<fo:table-cell padding="0pt" font-weight="normal" text-align="center">
					<fo:block xml:lang="de-DE"><xsl:value-of select="concat($lfd-nummer, '.')"/></fo:block>
				</fo:table-cell>
				<fo:table-cell padding="0pt" font-weight="'normal'">
					<xsl:choose>
						<xsl:when test="$sammeltyp='Arzt' ">
							<fo:block xml:lang="de-DE">Für die Leistungen im organisierten Notdienst wurden die erforderlichen Uhrzeitangaben eingetragen.</fo:block>
						</xsl:when>
					</xsl:choose>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-body>
	</fo:table>
</xsl:template -->


	<!--  Block 14  veraltet - Text zu Arzneimittel-Datenbanken
		mit dem Update vom 19.06.2017 ist dieser Block entfallen
-->
	<!-- xsl:template name="Block_14">
	<xsl:param name="lfd-nummer"/>
	<fo:table border="0pt solid black" table-layout="fixed"  space-before="15pt" font-size="{$schriftgroesse_festerText}" width="100%">
		<fo:table-column column-width="1cm"/>
		<fo:table-column column-width="17.5cm"/>
		<fo:table-body>
			<fo:table-row>
				<fo:table-cell padding="0pt" font-weight="normal" text-align="center">
					<fo:block xml:lang="de-DE"><xsl:value-of select="concat($lfd-nummer, '.')"/></fo:block>
				</fo:table-cell>
				<fo:table-cell padding="0pt" font-weight="'normal'">
					<fo:block xml:lang="de-DE">Zur Verordnung von Arzneimitteln wurden ausschließlich Arzneimittel-Datenbanken und Software-Versionen eingesetzt, die im Sinne der Vorschriften des BMV-Ä zertifiziert sind.</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-body>
	</fo:table>
</xsl:template -->




	<!--  Sammelerklärung (Version für Ärzte, ermächtigte Ärzte und Krankenhäuser)
-->
	<xsl:template name="check_PageBreak">
		<fo:table border="0pt solid black" table-layout="fixed"  space-before="20pt" font-size="{$schriftgroesse_festerText}" width="100%">
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell padding="0pt" font-weight="bold">
						<xsl:choose>
							<xsl:when test="$sammeltyp='Arzt' ">
								<fo:block xml:lang="de-DE"></fo:block>
							</xsl:when>
							<xsl:when test="$sammeltyp='Ermächtigt' ">
								<fo:block break-after="page" xml:lang="de-DE"></fo:block>
							</xsl:when>
							<xsl:when test="$sammeltyp='Krankenhaus' ">
								<fo:block break-after="page" xml:lang="de-DE"></fo:block>
							</xsl:when>
						</xsl:choose>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
	</xsl:template>



	<!--  Füllzeile
-->
	<xsl:template name="Fueller">
		<fo:table space-before="15pt" table-layout="fixed" width="100%">
			<fo:table-body text-align="left" font-size="{$schriftgroesse_festerText}">
				<fo:table-row>
					<fo:table-cell border-bottom="1pt solid black">
						<fo:block xml:lang="de-DE">Bitte gegebenenfalls ausfüllen:</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
	</xsl:template>



	<!--  Assistenten
-->
	<xsl:template name="Assistenten">
		<xsl:param name="persontyp"  select="." />
		<fo:table space-before="15pt" table-layout="fixed" width="100%">
			<xsl:attribute name="font-size">
				<xsl:value-of select="$schriftgroesse_variablerText"/>
			</xsl:attribute>
			<xsl:attribute name="font-weight">
				<xsl:value-of select="'normal'"/>
			</xsl:attribute>
			<fo:table-column column-width="9.5cm"/>
			<fo:table-column column-width="4.5cm"/>
			<fo:table-column column-width="4.5cm"/>
			<fo:table-body>
				<fo:table-row text-align="center">
					<fo:table-cell>
						<fo:block>&#160;</fo:block>
					</fo:table-cell>
					<fo:table-cell number-columns-spanned="2">
						<fo:block xml:lang="de-DE">Tätigkeit in der Praxis</fo:block>
					</fo:table-cell>
				</fo:table-row>
				<fo:table-row text-align="left">
					<fo:table-cell>
						<fo:block xml:lang="de-DE">&#160; Name des/der genehmigten Assistenten</fo:block>
					</fo:table-cell>
					<fo:table-cell text-align="center">
						<fo:block xml:lang="de-DE">von</fo:block>
					</fo:table-cell>
					<fo:table-cell text-align="center">
						<fo:block xml:lang="de-DE">bis</fo:block>
					</fo:table-cell>
				</fo:table-row>
				<xsl:choose>
					<xsl:when test="$persontyp/kvno:bool_komplex/kvno:true">
						<xsl:apply-templates select="$persontyp/kvno:bool_komplex/kvno:true/kvno:komplex"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="keinePerson"/>
					</xsl:otherwise>
				</xsl:choose>
			</fo:table-body>
		</fo:table>
	</xsl:template>


	<!--  angestellter Arzt
-->
	<xsl:template name="AngestellterArzt">
		<xsl:param name="persontyp"  select="." />
		<fo:table space-before="15pt" table-layout="fixed" width="100%">
			<xsl:attribute name="font-size">
				<xsl:value-of select="$schriftgroesse_variablerText"/>
			</xsl:attribute>
			<xsl:attribute name="font-weight">
				<xsl:value-of select="'normal'"/>
			</xsl:attribute>
			<fo:table-column column-width="9.5cm"/>
			<fo:table-column column-width="4.5cm"/>
			<fo:table-column column-width="4.5cm"/>
			<fo:table-body>
				<fo:table-row text-align="center">
					<fo:table-cell>
						<fo:block>&#160;</fo:block>
					</fo:table-cell>
					<fo:table-cell number-columns-spanned="2">
						<fo:block xml:lang="de-DE">Tätigkeit in der Praxis</fo:block>
					</fo:table-cell>
				</fo:table-row>
				<fo:table-row text-align="left">
					<fo:table-cell>
						<fo:block xml:lang="de-DE">&#160; Name des/der angestellten Arztes/Ärzte</fo:block>
					</fo:table-cell>
					<fo:table-cell text-align="center">
						<fo:block xml:lang="de-DE">von</fo:block>
					</fo:table-cell>
					<fo:table-cell text-align="center">
						<fo:block xml:lang="de-DE">bis</fo:block>
					</fo:table-cell>
				</fo:table-row>
				<xsl:choose>
					<xsl:when test="$persontyp/kvno:bool_komplex/kvno:true">
						<xsl:apply-templates select="$persontyp/kvno:bool_komplex/kvno:true/kvno:komplex"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="keinePerson"/>
					</xsl:otherwise>
				</xsl:choose>
			</fo:table-body>
		</fo:table>
	</xsl:template>


	<!--  Vertretung
-->
	<xsl:template name="Vertretung">
		<xsl:param name="persontyp"  select="." />
		<fo:table space-before="15pt" table-layout="fixed" width="100%">
			<xsl:attribute name="font-size">
				<xsl:value-of select="$schriftgroesse_variablerText"/>
			</xsl:attribute>
			<xsl:attribute name="font-weight">
				<xsl:value-of select="'normal'"/>
			</xsl:attribute>
			<fo:table-column column-width="9.5cm"/>
			<fo:table-column column-width="4.5cm"/>
			<fo:table-column column-width="4.5cm"/>
			<fo:table-body>
				<fo:table-row text-align="center">
					<fo:table-cell>
						<fo:block>&#160;</fo:block>
					</fo:table-cell>
					<fo:table-cell number-columns-spanned="2">
						<fo:block xml:lang="de-DE">vertreten</fo:block>
					</fo:table-cell>
				</fo:table-row>
				<fo:table-row text-align="left">
					<fo:table-cell >
						<fo:block xml:lang="de-DE">&#160; Name des/der Vertreters/Vertreter</fo:block>
					</fo:table-cell>
					<fo:table-cell text-align="center">
						<fo:block xml:lang="de-DE">von</fo:block>
					</fo:table-cell>
					<fo:table-cell text-align="center">
						<fo:block xml:lang="de-DE">bis</fo:block>
					</fo:table-cell>
				</fo:table-row>
				<xsl:choose>
					<xsl:when test="$persontyp/kvno:bool_komplex/kvno:true">
						<xsl:apply-templates select="$persontyp/kvno:bool_komplex/kvno:true/kvno:komplex"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="keinePerson"/>
					</xsl:otherwise>
				</xsl:choose>
			</fo:table-body>
		</fo:table>
	</xsl:template>


	<!--  Teilnahme am organisierten ärztlichen Notfalldienst
-->
	<xsl:template name="TeilnahmeNotfalldienst">
		<fo:table table-layout="fixed" width="100%">
			<xsl:attribute name="font-size">
				<xsl:value-of select="$schriftgroesse_variablerText"/>
			</xsl:attribute>
			<xsl:attribute name="font-weight">
				<xsl:value-of select="'normal'"/>
			</xsl:attribute>
			<xsl:attribute name="space-after.optimum">
				<xsl:value-of select="'15pt'"/>
			</xsl:attribute>
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell>
						<fo:block xml:lang="de-DE">&#160;</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block xml:lang="de-DE">&#160;</fo:block>
					</fo:table-cell>
					<!-- Hinzufügung am 10.06.2015 aus Dimensionsgründen -->
					<fo:table-cell>
						<fo:block xml:lang="de-DE">&#160;</fo:block>
					</fo:table-cell>
					<!-- Hinzufügung am 10.06.2015 aus Dimensionsgründen -->
				</fo:table-row>

				<xsl:call-template name="tage">
					<xsl:with-param name="list" select="//ehd:body/kvno:ese_data/kvno:org_notdienstzeit_liste/kvno:bool_komplex/kvno:true/kvno:komplex"/>
				</xsl:call-template>

			</fo:table-body>
		</fo:table>
	</xsl:template>


	<xsl:template name="tage">
		<xsl:param name="list"/>

		<xsl:for-each select="$list">
			<xsl:variable name="t" select="position() mod 3"/>
			<xsl:if test="$t = 1">
				<xsl:call-template name="inSpaltenPositionieren">
					<xsl:with-param name="feld1" select="kvno:zeitraum_tmr/@V"/>
					<xsl:with-param name="pos1" select="position()"/>
					<xsl:with-param name="feld2" select="following-sibling::*[1]/kvno:zeitraum_tmr/@V"/>
					<xsl:with-param name="pos2" select="position()+1"/>
					<xsl:with-param name="feld3" select="following-sibling::*[2]/kvno:zeitraum_tmr/@V"/>
					<xsl:with-param name="pos3" select="position()+2"/>
				</xsl:call-template>
			</xsl:if>
		</xsl:for-each>
		<xsl:if test="not($list)">
			<fo:table-row>
				<fo:table-cell>
					<fo:block>
						<xsl:value-of select=" '1.) ________________ ' "/>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell>
					<fo:block>
						<xsl:value-of select=" '2.) ________________ ' "/>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell>
					<fo:block>
						<xsl:value-of select=" '3.) ________________ ' "/>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</xsl:if>
	</xsl:template>

	<xsl:template name="inSpaltenPositionieren">
		<xsl:param name="feld1"/>
		<xsl:param name="pos1"/>
		<xsl:param name="feld2"/>
		<xsl:param name="pos2"/>
		<xsl:param name="feld3"/>
		<xsl:param name="pos3"/>

		<xsl:variable name="date1">
			<xsl:call-template name="zerlege_datum">
				<xsl:with-param name="feld" select="$feld1"/>
			</xsl:call-template>
		</xsl:variable>

		<xsl:variable name="date2">
			<xsl:choose>
				<xsl:when test="$feld2">
					<xsl:call-template name="zerlege_datum">
						<xsl:with-param name="feld" select="$feld2"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="date3">
			<xsl:choose>
				<xsl:when test="$feld3">
					<xsl:call-template name="zerlege_datum">
						<xsl:with-param name="feld" select="$feld3"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<fo:table-row>
			<fo:table-cell>
				<fo:block xml:lang="de-DE">
					<xsl:value-of select="concat($pos1, '.)  ', $date1, ' ')"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell>
				<fo:block xml:lang="de-DE">
					<xsl:value-of select="concat($pos2, '.)  ', $date2, ' ')"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell>
				<fo:block xml:lang="de-DE">
					<xsl:value-of select="concat($pos3, '.)  ', $date3)"/>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>



	<!--  Block Erstellungsdatum der Sammelerklärung
-->
	<xsl:template name="Erstellungsdatum_Sammelerklaerung">
		<fo:table table-layout="fixed" width="100%">
			<xsl:attribute name="space-before">
				<xsl:value-of select="'50pt'"/>
			</xsl:attribute>
			<xsl:attribute name="font-size">
				<xsl:value-of select="$schriftgroesse_festerText"/>
			</xsl:attribute>
			<fo:table-column column-width="6cm"/>
			<fo:table-column column-width="0.5cm"/>
			<fo:table-column column-width="12cm"/>
			<fo:table-body>
				<fo:table-row  keep-with-next="always">
					<fo:table-cell padding="0pt" border-bottom="1pt solid black" text-align="center">
						<fo:block xml:lang="de-DE">
							<xsl:call-template name="Datum">
								<xsl:with-param name="Date" select="//ehd:header/ehd:origination_dttm/@V"/>
							</xsl:call-template>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell padding="0pt">
						<fo:block xml:lang="de-DE"></fo:block>
					</fo:table-cell>
					<fo:table-cell padding="0pt" border-bottom="1pt solid black" text-align="center">
						<fo:block xml:lang="de-DE"></fo:block>
					</fo:table-cell>
				</fo:table-row>
				<fo:table-row>
					<fo:table-cell padding-top="0.25cm">
						<fo:block xml:lang="de-DE">Datum</fo:block>
					</fo:table-cell>
					<fo:table-cell padding="0pt">
						<fo:block xml:lang="de-DE"></fo:block>
					</fo:table-cell>
					<fo:table-cell padding-top="0.25cm" text-align="justify">
						<xsl:choose>
							<xsl:when test="$sammeltyp='Arzt'">
								<fo:block xml:lang="de-DE">Unterschrift des Vertragsarztes/Vertragspsychotherapeuten</fo:block>
							</xsl:when>
							<xsl:when test="$sammeltyp='Ermächtigt'">
								<fo:block xml:lang="de-DE">Unterschrift des ermächtigten Arztes</fo:block>
							</xsl:when>
							<xsl:when test="$sammeltyp='Krankenhaus'">
								<fo:block xml:lang="de-DE">Unterschrift des ärztlichen Leiters</fo:block>
							</xsl:when>
						</xsl:choose>
						<fo:block xml:lang="de-DE"> (bei Berufsausübungsgemeinschaften ggf. eines Partners - ansonsten auf gesondertem Blatt - bzw. für ein Medizinisches Versorgungszentrum der ärztliche Leiter bzw. für Notfallpraxen der jeweils verantwortliche Arzt)</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
	</xsl:template>







	<!-- Namensbestandteile
-->
	<xsl:template match="kvno:komplex">
		<xsl:variable name="zeitraum" select="./kvno:zeitraum_tmr/@V"/>
		<xsl:variable name="von" select="substring-before($zeitraum, '..')"/>
		<xsl:variable name="bis" select="substring-after($zeitraum, '..')"/>
		<fo:table-row border="1pt solid black">
			<fo:table-cell padding="2pt">
				<fo:block xml:lang="de-DE">
					<xsl:for-each select="kvno:provider/kvno:person/kvno:person_name/kvno:nm/kvno:PFX |
				kvno:provider/kvno:person/kvno:person_name/kvno:nm/kvno:GIV |
				kvno:provider/kvno:person/kvno:person_name/kvno:nm/kvno:MID |
				kvno:provider/kvno:person/kvno:person_name/kvno:nm/kvno:SFX |
				kvno:provider/kvno:person/kvno:person_name/kvno:nm/kvno:DEL |
				kvno:provider/kvno:person/kvno:person_name/kvno:nm/kvno:FAM">
						<xsl:value-of select="./@V"/>&#160;
					</xsl:for-each>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell text-align="center" padding="2pt" border-left="1pt solid black" border-right="1pt solid black">
				<fo:block xml:lang="de-DE">
					<fo:inline font-weight="normal">
						<xsl:call-template name="Datum">
							<xsl:with-param name="Date" select="$von"/>
						</xsl:call-template>
					</fo:inline>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell text-align="center" padding="2pt">
				<fo:block xml:lang="de-DE">
					<fo:inline font-weight="normal">
						<xsl:call-template name="Datum">
							<xsl:with-param name="Date" select="$bis"/>
						</xsl:call-template>
					</fo:inline>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>


	<xsl:template name="keinePerson">
		<fo:table-row border="1pt solid black">
			<fo:table-cell padding="2pt">
				<fo:block xml:lang="de-DE">&#160;</fo:block>
			</fo:table-cell>
			<fo:table-cell padding="2pt" border-left="1pt solid black" border-right="1pt solid black">
				<fo:block xml:lang="de-DE">&#160;</fo:block>
			</fo:table-cell>
			<fo:table-cell padding="2pt">
				<fo:block xml:lang="de-DE">&#160;</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>






	<!-- Nachfolgend einige Templates
-->

	<xsl:template name="Datum">
		<xsl:param name="Date"/>
		<xsl:variable name="Time" select="substring-after($Date, 'T')"/>
		<xsl:choose>
			<xsl:when test="$Date">
				<xsl:value-of select="substring($Date,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($Date,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($Date,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>&#160;</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:if test="$Time">
			<xsl:text>&#160;&#160;</xsl:text>
			<xsl:value-of select="concat($Time, ' Uhr')"/>
		</xsl:if>
	</xsl:template>

	<xsl:template name="quartalende">
		<xsl:param name="q_ende"/>
		<xsl:choose>
			<xsl:when test="$q_ende">
				<xsl:value-of select="substring($q_ende,6,2)"/>
				<xsl:text>. Quartal </xsl:text>
				<xsl:value-of select="substring($q_ende,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>&#160;</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>


	<xsl:template name="berechne_quartal">
		<xsl:param name="zeitraum"/>
		<xsl:variable name="von" select="substring-before($zeitraum, '..')"/>
		<xsl:variable name="bis" select="substring-after($zeitraum, '..')"/>
		<xsl:variable name="monat_von" select="substring($von,6,2)"/>
		<xsl:variable name="monat_bis" select="substring($bis,6,2)"/>

		<xsl:choose>
			<xsl:when test="((0 &lt; $monat_von) and ($monat_von &lt; 4))">
				<xsl:text>Sammelerklärung 1. Quartal </xsl:text>
				<xsl:value-of select="substring($bis,1,4)"/>
			</xsl:when>
			<xsl:when test="((3 &lt; $monat_von) and ($monat_von &lt; 7))">
				<xsl:text>Sammelerklärung 2. Quartal </xsl:text>
				<xsl:value-of select="substring($bis,1,4)"/>
			</xsl:when>
			<xsl:when test="((6 &lt; $monat_von) and ($monat_von &lt; 10))">
				<xsl:text>Sammelerklärung 3. Quartal </xsl:text>
				<xsl:value-of select="substring($bis,1,4)"/>
			</xsl:when>
			<xsl:when test="((9 &lt; $monat_von) and ($monat_von &lt; 13))">
				<xsl:text>Sammelerklärung 4. Quartal </xsl:text>
				<xsl:value-of select="substring($bis,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>keine korrekte Quartalsangabe im Feld [ehd/service_tmr]</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>


	<xsl:template match="kvno:komplex" mode="N">
		<xsl:variable name="von" select="substring-before(kvno:zeitraum_tmr/@V, '..')"/>
		<xsl:variable name="bis" select="substring-after(kvno:zeitraum_tmr/@V, '..')"/>
		<xsl:variable name="vondate" select="substring-before($von, '+')"/>
		<xsl:variable name="bisdate" select="substring-before($bis, '+')"/>

		<xsl:choose>
			<xsl:when test="$vondate and $bisdate">
				<xsl:value-of select="substring($vondate,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($vondate,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($vondate,1,4)"/>
				<xsl:text> - </xsl:text>
				<xsl:value-of select="substring($bisdate,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($bisdate,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($bisdate,1,4)"/>
			</xsl:when>
			<xsl:when test="$vondate and not($bisdate)">
				<xsl:value-of select="substring($vondate,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($vondate,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($vondate,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>keine korrekte Datumsangabe im Feld [org_notdienstzeit_liste//zeitraum_tmr]</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>


	<xsl:template name="zerlege_datum">
		<xsl:param name="feld"/>
		<xsl:variable name="von" select="substring-before($feld, '..')"/>
		<xsl:variable name="bis" select="substring-after($feld, '..')"/>
		<xsl:variable name="vondate" select="substring-before($von, '+')"/>
		<xsl:variable name="bisdate" select="substring-before($bis, '+')"/>

		<xsl:choose>
			<xsl:when test="not($von) and not($bis)">
				<xsl:value-of select="substring($feld,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($feld,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($feld,1,4)"/>
			</xsl:when>
			<xsl:when test="$vondate and not($bisdate)">
				<xsl:value-of select="substring($vondate,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($vondate,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($vondate,1,4)"/>
			</xsl:when>
			<xsl:when test="not($vondate) and not($bisdate)">
				<xsl:value-of select="substring($von,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($von,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($von,1,4)"/>
				<xsl:text> - </xsl:text>
				<xsl:value-of select="substring($bis,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($bis,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($bis,1,4)"/>
			</xsl:when>
			<xsl:when test="$vondate and $bisdate">
				<xsl:value-of select="substring($vondate,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($vondate,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($vondate,1,4)"/>
				<xsl:text> - </xsl:text>
				<xsl:value-of select="substring($bisdate,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($bisdate,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($bisdate,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>keine korrekte Datumsangabe im Feld [org_notdienstzeit_liste//zeitraum_tmr]: </xsl:text>
				<xsl:value-of select="$feld"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>



</xsl:stylesheet>
