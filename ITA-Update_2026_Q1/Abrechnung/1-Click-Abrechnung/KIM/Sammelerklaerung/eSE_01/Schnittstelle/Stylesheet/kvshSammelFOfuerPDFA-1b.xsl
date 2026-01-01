<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:fo="http://www.w3.org/1999/XSL/Format"
				xmlns:fox="http://xmlgraphics.apache.org/fop/extensions"
				xmlns:kvsh="urn:ehd/ese/001"
				xmlns:ehd="urn:ehd/001"
				xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
				version="1.00">

	<!--
		Version: 03.06.2025 (UK)
		- Datei der KVNO genommen und angepasst

		Version: 10.06.2025 (UK)
		- Texte angepasst
		- Name des Arztes in unsichtbaren PDF-Header aufgenommen

		Version: 19.06.2025 (UK)
		- Fallzahl raus
		- BSNR, LANR, Quartal in unsichtbaren PDF-Header aufgenommen

		Version: 01.07.2025 (SG)
		- Versionsinfo sichtbar

		Version: 21.07.2025 (UK)
		- Versionsinfo unten

		Version: 01.08.2025 (UK)
		- Finale Texte, Praxisstempel

		Version: 05.08.2025 (UK)
		- Finale TelefonNr in Praxisstempel

		Version: 28.08.2025 (SG)
		- Weiche für Stempel

		Version: 03.09.25 (SG)
		- Etwas aufgeräumt
		- Unterschrift + Stempel in den Footer

		Version: 30.09.25 (SG)
		- Quartals-Trennzeichen geändert

		Version: 30.09.25 (UK)
		- Zeile 394ff den Barcode um die notwendigen Limiter * erweitert
		- ich bekomme den Barcode aber nicht zentriert!!!

		Version: 01.10.25 (SG)
		- Barcode wieder zentriert
		- Evtl. Warning gefixt...

		Version: 12.11.25 (UK)
		- Zeile 379 aus dem  Logo-Versweis das file: entfernt <fo:external-graphic src="./Sty...
		- Evtl. Warning gefixt...

		Version: 02.12.25 (SG)
		- Fix "URI is not absolute"

		Version: 03.12.25 (SG)
		- Fix "FIX XMP-Schema"

		Version: 08.12.25 (Frau Schäffer)
		- Fix "FIX XMP-Schema"

		Version: 10.12.25 (BL)
		- Fix "Remove XMP-Schema"
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
	<xsl:param name="version" select=" 'Version A 10.12.25' "/>
	<!-- Versionsangabe des Stylesheets -->

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
						<xsl:value-of select="'1.0cm'"/>
					</xsl:attribute>
					<xsl:attribute name="margin-bottom">
						<xsl:value-of select="'0.5cm'"/>
					</xsl:attribute>
					<xsl:attribute name="margin-left">
						<xsl:value-of select="'1.5cm'"/>
					</xsl:attribute>
					<xsl:attribute name="margin-right">
						<xsl:value-of select="'1cm'"/>
					</xsl:attribute>
					<xsl:element name="fo:region-body">
						<xsl:attribute name="margin-top">
							<xsl:value-of select="'0.0cm'"/>
						</xsl:attribute>
						<xsl:attribute name="margin-bottom">
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
							<xsl:value-of select="'35mm'"/>
						</xsl:attribute>
					</xsl:element>
					<xsl:element name="fo:region-end">

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
					</xsl:element>
				</xsl:element>
			</xsl:element>
			<!-- fo:layout-master-set -->


			<xsl:element name="fo:declarations">
				<x:xmpmeta xmlns:x="adobe:ns:meta/">
					<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
							 xmlns:pdfaid="http://www.aiim.org/pdfa/ns/id/"
							 xmlns:pdf="http://ns.adobe.com/pdf/1.3/"
							 xmlns:dc="http://purl.org/dc/elements/1.1/"
							 xmlns:kvsh="http://www.kvsh.de/xmp/1.0/">

						<!-- PDF/A-Identifikation -->
						<rdf:Description rdf:about="">
							<pdfaid:part>1</pdfaid:part>
							<pdfaid:conformance>B</pdfaid:conformance>
						</rdf:Description>

						<!-- Standardmetadaten -->
						<rdf:Description rdf:about="">
							<dc:title>
								<rdf:Alt>
									<rdf:li xml:lang="x-default">Sammelerklaerung im Format PDF/A-1b</rdf:li>
								</rdf:Alt>
							</dc:title>

							<dc:creator>
								<rdf:Seq>
									<rdf:li>KV Schleswig-Holstein</rdf:li>
								</rdf:Seq>
							</dc:creator>

							<dc:subject>
								<rdf:Bag>
									<rdf:li>PDF/A-1b</rdf:li>
								</rdf:Bag>
							</dc:subject>

							<pdf:Keywords>PDF FOP Apache XSL-FO</pdf:Keywords>
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
						<!-- Kein Logo auf Seite 2 ff
						<fo:external-graphic src="./Stylesheet/KVSH_Logo_FIN_RGB_Claim.jpg" width="20%" content-width="scale-to-fit" content-height="45%" fox:alt-text="KVSH Logo"/>
						-->
					</fo:block>
				</xsl:element>

				<xsl:element name="fo:static-content">
					<!-- rechte Randzeile -->
					<xsl:attribute name="flow-name">
						<xsl:value-of select="'xsl-region-end'"/>
					</xsl:attribute>
					<fo:block xml:lang="de-DE"></fo:block>
					<!-- keine Version am rechten Rand
					<fo:block-container height="10pt" font-size="8pt" font-weight="normal" text-align="center" border="0pt solid black" reference-orientation="90">
						<fo:block xml:lang="de-DE">
							<xsl:value-of select="$version" />
						</fo:block>
					</fo:block-container>
					-->
					<!-- <fo:block xml:lang="de-DE"></fo:block> -->
				</xsl:element>

				<xsl:element name="fo:static-content">
					<!-- Fusszeile -->
					<xsl:attribute name="flow-name">
						<xsl:value-of select="'xsl-region-after'"/>
					</xsl:attribute>
					<xsl:call-template name="Erstellungsdatum_Sammelerklaerung"/>
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
							<xsl:value-of select="/kvsh:anlage_hvv/kvsh:header/kvsh:empfaenger/@V"/>
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
							<xsl:call-template name="Block_3">
								<xsl:with-param name="lfd-nummer" select=" '3' "/>
							</xsl:call-template>
							<xsl:call-template name="Block_4">
								<xsl:with-param name="lfd-nummer" select=" '4' "/>
							</xsl:call-template>
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
							<!--
							<xsl:call-template name="Block_10">
								<xsl:with-param name="lfd-nummer" select=" '10' "/>
							</xsl:call-template>
							<xsl:call-template name="Block_11">
								<xsl:with-param name="lfd-nummer" select=" '11' "/>
							</xsl:call-template>
							<xsl:call-template name="Block_12"/>
							-->
						</xsl:when>
					</xsl:choose>



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
		<fo:table border="1pt solid black" table-layout="fixed" padding-top="-2cm" space-before="0pt" font-size="{$schriftgroesse_festerText}" width="100%">
			<fo:table-column column-width="65%"/>
			<fo:table-column column-width="35%"/>
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell padding="0pt" text-align="center" display-align="center" border="1pt solid black" >
						<xsl:attribute name="font-size">
							<xsl:value-of select="'20pt'"/>
						</xsl:attribute>
						<xsl:attribute name="font-weight">
							<xsl:value-of select="'bold'"/>
						</xsl:attribute>
						<fo:block xml:lang="de-DE">
							<xsl:text>Sammelerklärung</xsl:text>&#160;
							<xsl:call-template name="berechne_quartal_kurz">
								<xsl:with-param name="zeitraum" select="//ehd:header/ehd:service_tmr/@V"/>
							</xsl:call-template>
						</fo:block>
						<fo:block-container font-size="8pt" font-weight="normal" border="0pt solid black">
							<xsl:for-each select="//ehd:header/ehd:provider/ehd:person">
								<fo:block xml:lang="de-DE">
									<xsl:value-of select="ehd:person_name//ehd:PFX/@V"/>&#160;
									<xsl:value-of select="ehd:person_name//ehd:GIV/@V"/>&#160;
									<xsl:value-of select="ehd:person_name//ehd:FAM/@V"/>
								</fo:block>
							</xsl:for-each>
						</fo:block-container>
					</fo:table-cell>
					<fo:table-cell padding="0pt" text-align="center" display-align="center">
						<!-- KVSH-Logo -->
						<fo:block text-align="right" xml:lang="de-DE">
							<!-- <fo:external-graphic src="./Stylesheet/KVSH_Logo_FIN_RGB_Claim.jpg" width="40%" content-width="scale-to-fit" content-height="45%" fox:alt-text="KVSH Logo"/> -->
							<fo:external-graphic src="./Stylesheet/KVSH_Logo_FIN_RGB_Claim.jpg" width="6.0cm" content-width="scale-to-fit" fox:alt-text="KVSH Logo"/>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>

		<fo:table margin-top="0cm" border="1pt solid black" table-layout="fixed" width="100%">
			<fo:table-column column-width="24%"/>
			<fo:table-column column-width="24%"/>
			<fo:table-column column-width="52%"/>
			<fo:table-body>
				<fo:table-row >
					<fo:table-cell padding-top="0.25cm" text-align="center">
						<fo:block xml:lang="de-DE">
							<xsl:text>Hauptbetriebsstätte</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell padding-top="0.25cm" text-align="center">
						<fo:block xml:lang="de-DE">
							<xsl:text>Lebenslange Arzt-Nr.</xsl:text>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell padding-top="0cm" text-align="right" display-align="center" number-rows-spanned="2">
						<fo:block font-weight="normal" font-size="20pt" border="0pt solid black" font-family="'Bar-Code 39 lesbar'" xml:lang="de-DE" text-align="right">
							<xsl:variable name="bsnr" select="//ehd:header/ehd:provider/ehd:organization/ehd:id/@EX"/>
							<xsl:variable name="lanr" select="//ehd:header/ehd:provider/ehd:person/ehd:id/@EX"/>
							<xsl:variable name="quartal" select="//ehd:header/ehd:service_tmr/@V"/>
							<!-- Start * Barcode-Version "A" -->
							*A
							<!-- BSNr ohne 01 vorn und 00 am Ende: 019999900 -> 99999 -->
							<xsl:value-of select="substring($bsnr,3,5)"/>
							<!-- LANr ohne zweistelliges Fachgruppendende : 123456789 -> 1234567 -->
							<xsl:value-of select="substring($lanr,1,7)"/>
							<!-- Quartal im Format QJJ mit Jahr=2000+JJ -->
							<xsl:call-template name="berechne_quartal_barcode">
								<xsl:with-param name="zeitraum" select="$quartal"/>
							</xsl:call-template>
							<!-- Ende * -->
							*
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
				<fo:table-row >
					<fo:table-cell padding-bottom="0.25cm" text-align="center" font-weight="bold">
						<fo:block xml:lang="de-DE">
							<!-- BSNr -->
							<xsl:value-of select="//ehd:header/ehd:provider/ehd:organization/ehd:id/@EX"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell text-align="center" font-weight="bold">
						<fo:block xml:lang="de-DE">
							<!-- LANr -->
							<xsl:value-of select="//ehd:header/ehd:provider/ehd:person/ehd:id/@EX"/>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
		<xsl:call-template name="Block_Sammelerklaerung"/>
	</xsl:template>


	<!--  Sammelerklärung (Version für Ärzte) //, ermächtigte Ärzte und Krankenhäuser)
-->
	<xsl:template name="Block_Sammelerklaerung">
		<fo:table border="0pt solid black" table-layout="fixed" space-before="15pt" font-size="{$schriftgroesse_festerText}" width="100%">
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell padding="0pt" font-weight="normal">
						<xsl:choose>
							<xsl:when test="$sammeltyp='Arzt' ">
								<fo:block xml:lang="de-DE">
									Diese Erklärung ist Bestandteil Ihrer Quartalsabrechnung und gilt für die Hauptbetriebsstätte inklusive aller Nebenbetriebsstätten.
									Soweit in dieser Sammelerklärung die Bezeichnung Arzt/Ärztin verwendet wird, ist auch der Psychotherapeut / die Psychotherapeutin gemeint.
								</fo:block>
							</xsl:when>
						</xsl:choose>
					</fo:table-cell>
				</fo:table-row>
				<!--
				<fo:table-row>
					<fo:table-cell padding="0pt" padding-top="0.25cm" font-weight="normal">
						<xsl:choose>
							<xsl:when test="$sammeltyp='Arzt' ">
								<fo:block xml:lang="de-DE">Soweit in dieser Sammelerklärung die Bezeichnung Arzt/Ärztin verwendet wird, ist auch der Psychotherapeut / die Psychotherapeutin gemeint.</fo:block>
							</xsl:when>
						</xsl:choose>
					</fo:table-cell>
				</fo:table-row>
				-->
			</fo:table-body>
		</fo:table>
	</xsl:template>



	<!--  Block 1  - Leistungserbringung
-->
	<xsl:template name="Block_1">
		<xsl:param name="lfd-nummer"/>
		<fo:table border="0pt solid black" table-layout="fixed" space-before="5pt" font-size="{$schriftgroesse_festerText}" width="100%">
			<fo:table-column column-width="0.5cm"/>
			<fo:table-column column-width="18.0cm"/>
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell padding="0pt" font-weight="bold" text-align="left">
						<fo:block xml:lang="de-DE">
							<xsl:value-of select="concat($lfd-nummer, '.')"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell padding="0pt" font-weight="bold" text-align="left">
						<fo:block xml:lang="de-DE">Leistungserbringung</fo:block>
					</fo:table-cell>
				</fo:table-row>
				<fo:table-row>
					<fo:table-cell padding="0pt" font-weight="bold" text-align="center">
						<fo:block xml:lang="de-DE"> </fo:block>
					</fo:table-cell>
					<fo:table-cell padding="0pt" font-weight="normal">
						<fo:block xml:lang="de-DE">
							Sämtliche abgerechneten Leistungen sind entsprechend den bestehenden Bestimmungen zur vertragsärztlichen Versorgung (insbesondere SGB V,
							Bundesmantelvertrag-Ärzte, Einheitlicher Bewertungsmaßstab, Richtlinien des Gemeinsamen Bundesausschusses und der Kassenärztlichen Bundesvereinigung,
							Verträge auf Bundes- und Landesebene, Abrechnungsbestimmungen (insbesondere Honorarabrechnungsordnung) sowie sonstiges Satzungsrecht der KVSH) erbracht.
							Insbesondere setzt eine korrekte Abrechnung eine persönliche Leistungserbringung gemäß §§ 14, 14 a und 15 sowie Anlage 8 und 24 BMV-Ä voraus.
						</fo:block>
						<fo:block xml:lang="de-DE">
							Unabhängig vom Status wurde die vertragsärztliche Tätigkeit persönlich ausgeübt. Im Rahmen von Ermächtigungen wurden - abgesehen von zulässigen Vertretungen
							- keine ärztlichen Leistungen von anderen Ärzten/Ärztinnen erbracht. Meine Pflichten im Rahmen der Beschäftigung von angestellten Ärzten und der Delegation
							an nicht ärztliche Mitarbeiter habe ich beachtet und eingehalten.
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
	</xsl:template>


	<!--  Block 2  - Zusammenwirken
-->
	<xsl:template name="Block_2">
		<xsl:param name="lfd-nummer"/>
		<fo:table border="0pt solid black" table-layout="fixed" space-before="5pt" font-size="{$schriftgroesse_festerText}" width="100%">
			<fo:table-column column-width="0.5cm"/>
			<fo:table-column column-width="18.0cm"/>
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell padding="0pt" font-weight="bold" text-align="left">
						<fo:block xml:lang="de-DE">
							<xsl:value-of select="concat($lfd-nummer, '.')"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell padding="0pt" font-weight="bold" text-align="left">
						<fo:block xml:lang="de-DE">Zusammenwirken</fo:block>
					</fo:table-cell>
				</fo:table-row>
				<fo:table-row>
					<fo:table-cell padding="0pt" font-weight="normal" text-align="center">
						<fo:block xml:lang="de-DE"> </fo:block>
					</fo:table-cell>
					<fo:table-cell padding="0pt" font-weight="normal">
						<xsl:choose>
							<xsl:when test="$sammeltyp='Arzt' ">
								<fo:block xml:lang="de-DE">
									Sofern Leistungen erbracht wurden, bei denen mehrere Ärzte/Ärztinnen mitgewirkt haben, erkläre ich, dass mit den anderen an der Erbringung dieser Leistungen
									beteiligten Ärzten/Ärztinnen eine Vereinbarung getroffen wurde, dass diese nur einmalig abgerechnet werden.
								</fo:block>
							</xsl:when>
						</xsl:choose>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
	</xsl:template>


	<!--  Block 3  - EDV-Abrechnung
-->
	<xsl:template name="Block_3">
		<xsl:param name="lfd-nummer"/>
		<fo:table border="0pt solid black" table-layout="fixed" space-before="5pt" font-size="{$schriftgroesse_festerText}" width="100%">
			<fo:table-column column-width="0.5cm"/>
			<fo:table-column column-width="18.0cm"/>
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell padding="0pt" font-weight="bold" text-align="left">
						<fo:block xml:lang="de-DE">
							<xsl:value-of select="concat($lfd-nummer, '.')"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell padding="0pt" font-weight="bold" text-align="left">
						<fo:block xml:lang="de-DE">EDV-Abrechnung</fo:block>
					</fo:table-cell>
				</fo:table-row>
				<fo:table-row>
					<fo:table-cell padding="0pt" font-weight="normal" text-align="center">
						<fo:block xml:lang="de-DE"> </fo:block>
					</fo:table-cell>
					<fo:table-cell padding="0pt" font-weight="normal">
						<xsl:choose>
							<xsl:when test="$sammeltyp='Arzt' ">
								<fo:block xml:lang="de-DE">
									Ich bestätige, dass die Bestimmungen der Richtlinien der Kassenärztlichen Bundesvereinigung für den Einsatz von IT-Systemen in der Arztpraxis, sowie die
									Bestimmungen des Bundesmantelvertrages-Ärzte zur Nutzung von Datenverarbeitungssystemen in der Arztpraxis beachtet und eingehalten werden und dass durch
									entsprechende organisatorische und technische Maßnahmen eine Erfassung jeder einzelnen Leistung erst nach deren vollständiger Erbringung erfolgt ist und
									ausschließlich eine zertifizierte Software Anwendung gefunden hat.
								</fo:block>
							</xsl:when>
						</xsl:choose>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
	</xsl:template>


	<!--  Block 4  - Verordnung von Arzneimitteln
-->
	<xsl:template name="Block_4">
		<xsl:param name="lfd-nummer"/>
		<fo:table border="0pt solid black" table-layout="fixed" space-before="5pt" font-size="{$schriftgroesse_festerText}" width="100%" keep-with-next="always">
			<fo:table-column column-width="0.5cm"/>
			<fo:table-column column-width="18.0cm"/>
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell padding="0pt" font-weight="bold" text-align="left">
						<fo:block xml:lang="de-DE">
							<xsl:value-of select="concat($lfd-nummer, '.')"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell padding="0pt" font-weight="bold" text-align="left">
						<fo:block xml:lang="de-DE">Verordnung von Arzneimitteln</fo:block>
					</fo:table-cell>
				</fo:table-row>
				<fo:table-row>
					<fo:table-cell padding="0pt" font-weight="normal" text-align="center">
						<fo:block xml:lang="de-DE"> </fo:block>
					</fo:table-cell>
					<fo:table-cell padding="0pt" font-weight="normal">
						<xsl:choose>
							<xsl:when test="$sammeltyp='Arzt' ">
								<fo:block xml:lang="de-DE">
									Zur Verordnung von Arzneimitteln wurden ausschließlich von der KBV zertifizierte Arzneimitteldatenbanken und Softwareversionen
									gemäß § 29 Abs. 3 und § 30 Abs. 6 BMV-Ä eingesetzt. Die Übermittlung der KBV-Prüfnummer erfolgt über den KVDT.
								</fo:block>
							</xsl:when>
						</xsl:choose>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
	</xsl:template>


	<!--  Block 5  - ..
-->
	<xsl:template name="Block_5">
		<xsl:param name="lfd-nummer"/>
		<fo:table border="0pt solid black" table-layout="fixed" space-before="5pt" font-size="{$schriftgroesse_festerText}" width="100%">
			<fo:table-column column-width="0.5cm"/>
			<fo:table-column column-width="18.0cm"/>
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell padding="0pt" font-weight="bold" text-align="left">
						<fo:block xml:lang="de-DE">
							<xsl:value-of select="concat($lfd-nummer, '.')"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell padding="0pt" font-weight="bold" text-align="left">
						<fo:block xml:lang="de-DE">Abwesenheitszeiten</fo:block>
					</fo:table-cell>
				</fo:table-row>
				<fo:table-row>
					<fo:table-cell padding="0pt" font-weight="normal" text-align="center">
						<fo:block xml:lang="de-DE"> </fo:block>
					</fo:table-cell>
					<fo:table-cell padding="0pt" font-weight="normal">
						<xsl:choose>
							<xsl:when test="$sammeltyp='Arzt' ">
								<fo:block xml:lang="de-DE">
									Die Abwesenheitszeiten und -gründe, auch die der bei mir angestellten Ärzte und Ärztinnen, sind zum Zeitpunkt der Einreichung
									dieser Sammelerklärung vollständig und wahrheitsgemäß im elektronischen Mitgliederportal der KVSH hinterlegt und sind Bestandteil
									dieser Sammelerklärung.
								</fo:block>
							</xsl:when>
						</xsl:choose>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
	</xsl:template>


	<!--  Block 6  - ...
-->
	<xsl:template name="Block_6">
		<xsl:param name="lfd-nummer"/>
		<fo:table border="0pt solid black" table-layout="fixed" space-before="5pt" font-size="{$schriftgroesse_festerText}" width="100%">
			<fo:table-column column-width="0.5cm"/>
			<fo:table-column column-width="18.0cm"/>
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell padding="0pt" font-weight="bold" text-align="left">
						<fo:block xml:lang="de-DE"  font-weight="bold">
							<xsl:value-of select="concat($lfd-nummer, '.')"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell padding="0pt" font-weight="'normal'">
						<xsl:choose>
							<xsl:when test="$sammeltyp='Arzt' ">
								<fo:block xml:lang="de-DE"  font-weight="bold">elektronische Gesundheitskarte</fo:block>
								<fo:block xml:lang="de-DE">
									Sofern kein vom Versicherten unterschriebener Abrechnungsschein vorliegt, bestätige ich, dass im betreffenden Quartal die
									elektronische Gesundheitskarte vorgelegen hat (§ 35 Abs. 3 BMV-Ä).
								</fo:block>
							</xsl:when>
						</xsl:choose>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
	</xsl:template>



	<!--  Block 7  - ...
-->
	<xsl:template name="Block_7">
		<xsl:param name="lfd-nummer"/>
		<fo:table border="0pt solid black" table-layout="fixed" space-before="5pt" font-size="{$schriftgroesse_festerText}" width="100%">
			<fo:table-column column-width="18.5cm"/>
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell padding="0pt" font-weight="'normal'">
						<xsl:choose>
							<xsl:when test="$sammeltyp='Arzt' ">
								<fo:block xml:lang="de-DE">
									Ich erkläre, dass für dieses Quartal im Sinne dieser Vorschriften die abgerechneten vertragsärztlichen Leistungen
									ordnungsgemäß und vollständig im Rahmen erteilter Genehmigungen erbracht wurden.
								</fo:block>
							</xsl:when>
						</xsl:choose>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
	</xsl:template>


	<!--  Block 8  - ...
-->
	<xsl:template name="Block_8">
		<xsl:param name="lfd-nummer"/>
		<fo:table border="0pt solid black" table-layout="fixed" space-before="5pt" font-size="{$schriftgroesse_festerText}" width="100%">
			<fo:table-column column-width="18.5cm"/>
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell padding="0pt" font-weight="'normal'">
						<xsl:choose>
							<xsl:when test="$sammeltyp='Arzt' ">
								<fo:block xml:lang="de-DE">
									Ich erkläre, auf Grundlage dieser Vorschriften eine sachlich richtige und vollständige Abrechnung eingereicht zu haben.
								</fo:block>
							</xsl:when>
						</xsl:choose>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
	</xsl:template>


	<!--  Block 9  - ...
-->
	<xsl:template name="Block_9">
		<xsl:param name="lfd-nummer"/>
		<fo:table border="0pt solid black" table-layout="fixed" space-before="5pt" font-size="{$schriftgroesse_festerText}" width="100%">
			<fo:table-column column-width="18.5cm"/>
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell padding="0pt" font-weight="'normal'">
						<xsl:choose>
							<xsl:when test="$sammeltyp='Arzt' ">
								<fo:block xml:lang="de-DE">
									Ich trage die Verantwortung für die Erfüllung der Abrechnungsvoraussetzungen, weil ich sie entweder selbst erfülle oder
									ich mich von deren Erfüllung persönlich überzeugt habe. Bei einem Medizinischen Versorgungszentrum ist die Unterschrift
									der Ärztlichen Leitung erforderlich.
								</fo:block>
							</xsl:when>
						</xsl:choose>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
	</xsl:template>


	<!--  Block 10  - ...
-->
	<xsl:template name="Block_10">
		<xsl:param name="lfd-nummer"/>
		<fo:table border="0pt solid black" table-layout="fixed" space-before="5pt" font-size="{$schriftgroesse_festerText}" width="100%">
			<fo:table-column column-width="1cm"/>
			<fo:table-column column-width="17.5cm"/>
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell padding="0pt" font-weight="normal" text-align="center">
						<fo:block xml:lang="de-DE"  font-weight="bold">
							<xsl:value-of select="concat($lfd-nummer, '.')"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell padding="0pt" font-weight="'normal'">
						<fo:block xml:lang="de-DE"  font-weight="bold">Todo...</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
	</xsl:template>


	<!--  Block 11  - ...
-->
	<xsl:template name="Block_11">
		<xsl:param name="lfd-nummer"/>
		<fo:table border="0pt solid black" table-layout="fixed" space-before="5pt" font-size="{$schriftgroesse_festerText}" width="100%">
			<fo:table-column column-width="1cm"/>
			<fo:table-column column-width="17.5cm"/>
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell padding="0pt" font-weight="normal" text-align="center">
						<fo:block xml:lang="de-DE"  font-weight="bold">
							<xsl:value-of select="concat($lfd-nummer, '.')"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell padding="0pt" font-weight="'normal'">
						<fo:block xml:lang="de-DE"  font-weight="bold">Todo...</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
	</xsl:template>


	<!--  Block 12  - Unveränderter Text
-->
	<xsl:template name="Block_12">
		<fo:table border="0pt solid black" table-layout="fixed" space-before="5pt" font-size="{$schriftgroesse_festerText}" width="100%">
			<fo:table-column column-width="18.5cm"/>
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell padding="0pt" font-weight="'normal'">
						<fo:block xml:lang="de-DE">Todo...</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
	</xsl:template>


	<!--  Sammelerklärung (Version für Ärzte, ermächtigte Ärzte und Krankenhäuser)
-->
	<xsl:template name="check_PageBreak">
		<fo:table border="0pt solid black" table-layout="fixed"  space-before="5pt" font-size="{$schriftgroesse_festerText}" width="100%">
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell padding="0pt" font-weight="bold">
						<xsl:choose>
							<xsl:when test="$sammeltyp='Arzt' ">
								<fo:block xml:lang="de-DE"></fo:block>
							</xsl:when>
						</xsl:choose>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
	</xsl:template>


	<!--  Block Erstellungsdatum der Sammelerklärung
-->
	<xsl:template name="Erstellungsdatum_Sammelerklaerung">
		<fo:table table-layout="fixed" width="100%">
			<xsl:attribute name="font-size">
				<xsl:value-of select="$schriftgroesse_festerText"/>
			</xsl:attribute>
			<fo:table-column column-width="2cm"/>
			<fo:table-column column-width="0.5cm"/>
			<fo:table-column column-width="7.5cm"/>
			<fo:table-column column-width="0.5cm"/>
			<fo:table-column column-width="7.5cm"/>
			<fo:table-body>
				<fo:table-row  keep-with-next="always">
					<fo:table-cell padding="0pt" border-bottom="1pt solid black" text-align="center" display-align="after">
						<fo:block xml:lang="de-DE" font-size="8pt" >
							<xsl:call-template name="Datum">
								<xsl:with-param name="Date" select="//ehd:header/ehd:origination_dttm/@V"/>
							</xsl:call-template>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell padding="0pt">
						<fo:block xml:lang="de-DE"></fo:block>
					</fo:table-cell>
					<fo:table-cell padding="0pt" border-bottom="1pt solid black" text-align="center" display-align="after">
						<fo:block-container font-size="8pt" font-weight="normal" border="0pt solid black">
							<xsl:for-each select="//ehd:header/ehd:provider/ehd:person">
								<fo:block xml:lang="de-DE">
									<xsl:value-of select="ehd:person_name//ehd:PFX/@V"/>&#160;
									<xsl:value-of select="ehd:person_name//ehd:GIV/@V"/>&#160;
									<xsl:value-of select="ehd:person_name//ehd:FAM/@V"/>
								</fo:block>
							</xsl:for-each>
						</fo:block-container>
					</fo:table-cell>
					<fo:table-cell padding="0pt">
						<fo:block xml:lang="de-DE"></fo:block>
					</fo:table-cell>
					<fo:table-cell padding="0pt" border-bottom="1pt solid black" text-align="center" display-align="after">
						<fo:block-container font-size="8pt" font-weight="normal" border="0pt solid black">
							<!-- Mit Praxisstempel -->
							<fo:block xml:lang="de-DE">
								BSNr:
								<!-- BSNr -->
								<xsl:value-of select="//ehd:header/ehd:provider/ehd:organization/ehd:id/@EX"/>
								&#160;LANr:
								<!-- LANr -->
								<xsl:value-of select="//ehd:header/ehd:provider/ehd:person/ehd:id/@EX"/>
							</fo:block>
							<xsl:for-each select="//ehd:header/ehd:provider/ehd:organization">
								<fo:block xml:lang="de-DE">
									<xsl:value-of select="ehd:organization.nm/@V"/>
								</fo:block>
							</xsl:for-each>
							<xsl:for-each select="//ehd:header/ehd:provider/ehd:person">
								<fo:block xml:lang="de-DE">
									<xsl:value-of select="ehd:person_name//ehd:PFX/@V"/>&#160;
									<xsl:value-of select="ehd:person_name//ehd:GIV/@V"/>&#160;
									<xsl:value-of select="ehd:person_name//ehd:FAM/@V"/>
								</fo:block>
							</xsl:for-each>
							<xsl:for-each select="//ehd:header/ehd:provider/ehd:person/ehd:local_header">
								<fo:block xml:lang="de-DE">
									<xsl:value-of select="ehd:fachgruppenbezeichnung/@V"/>
								</fo:block>
							</xsl:for-each>
							<xsl:for-each select="//ehd:header/ehd:provider/ehd:organization">
								<fo:block xml:lang="de-DE">
									<xsl:value-of select="ehd:addr//ehd:STR/@V"/>&#160;
									<xsl:value-of select="ehd:addr//ehd:HNR/@V"/>
								</fo:block>
							</xsl:for-each>
							<xsl:for-each select="//ehd:header/ehd:provider/ehd:organization">
								<fo:block xml:lang="de-DE">
									<xsl:value-of select="ehd:addr//ehd:POB/@V"/>&#160;
									<xsl:value-of select="ehd:addr//ehd:CTY/@V"/>
								</fo:block>
							</xsl:for-each>
							<xsl:for-each select="//ehd:header/ehd:provider/ehd:organization">
								<fo:block xml:lang="de-DE">
									<xsl:value-of select="ehd:telecom/@V"/> &#160;
								</fo:block>
							</xsl:for-each>
						</fo:block-container>
					</fo:table-cell>
				</fo:table-row>
				<fo:table-row>
					<fo:table-cell padding-top="0.1cm" text-align="center">
						<fo:block xml:lang="de-DE">Datum</fo:block>
					</fo:table-cell>
					<fo:table-cell padding="0pt">
						<fo:block xml:lang="de-DE"></fo:block>
					</fo:table-cell>
					<fo:table-cell padding-top="0.1cm" text-align="center">
						<fo:block xml:lang="de-DE">Unterschrift</fo:block>
					</fo:table-cell>
					<fo:table-cell padding="0pt">
						<fo:block xml:lang="de-DE"></fo:block>
					</fo:table-cell>
					<fo:table-cell padding-top="0.1cm" text-align="center">
						<fo:block xml:lang="de-DE">Praxisstempel</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
		<fo:table table-layout="fixed" width="100%">
			<fo:table-column column-width="18cm"/>
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell padding-top="0cm" text-align="right" border="0pt solid black">
						<fo:block xml:lang="de-DE" font-size="6pt" font-weight="normal" >
							<xsl:value-of select="$version" />
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
	</xsl:template>


	<!-- Namensbestandteile
-->
	<xsl:template match="kvsh:komplex">
		<xsl:variable name="zeitraum" select="./kvsh:zeitraum_tmr/@V"/>
		<xsl:variable name="von" select="substring-before($zeitraum, '..')"/>
		<xsl:variable name="bis" select="substring-after($zeitraum, '..')"/>
		<fo:table-row border="1pt solid black">
			<fo:table-cell padding="2pt">
				<fo:block xml:lang="de-DE">
					<xsl:for-each select="kvsh:provider/kvsh:person/kvsh:person_name/kvsh:nm/kvsh:PFX |
				kvsh:provider/kvsh:person/kvsh:person_name/kvsh:nm/kvsh:GIV |
				kvsh:provider/kvsh:person/kvsh:person_name/kvsh:nm/kvsh:MID |
				kvsh:provider/kvsh:person/kvsh:person_name/kvsh:nm/kvsh:SFX |
				kvsh:provider/kvsh:person/kvsh:person_name/kvsh:nm/kvsh:DEL |
				kvsh:provider/kvsh:person/kvsh:person_name/kvsh:nm/kvsh:FAM">
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


	<!-- Ausgabe der Abrechungsquartals in der Form  QJJ mit Jahr =2000+JJ -->
	<xsl:template name="berechne_quartal_barcode">
		<xsl:param name="zeitraum"/>
		<xsl:variable name="von" select="substring-before($zeitraum, '..')"/>
		<xsl:variable name="bis" select="substring-after($zeitraum, '..')"/>
		<xsl:variable name="monat_von" select="substring($von,6,2)"/>
		<xsl:variable name="monat_bis" select="substring($bis,6,2)"/>

		<xsl:choose>
			<xsl:when test="((0 &lt; $monat_von) and ($monat_von &lt; 4))">
				<xsl:text>1</xsl:text>
				<xsl:value-of select="substring($bis,3,2)"/>
			</xsl:when>
			<xsl:when test="((3 &lt; $monat_von) and ($monat_von &lt; 7))">
				<xsl:text>2</xsl:text>
				<xsl:value-of select="substring($bis,3,2)"/>
			</xsl:when>
			<xsl:when test="((6 &lt; $monat_von) and ($monat_von &lt; 10))">
				<xsl:text>3</xsl:text>
				<xsl:value-of select="substring($bis,3,2)"/>
			</xsl:when>
			<xsl:when test="((9 &lt; $monat_von) and ($monat_von &lt; 13))">
				<xsl:text>4</xsl:text>
				<xsl:value-of select="substring($bis,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>keine korrekte Quartalsangabe im Feld [ehd/service_tmr]</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>


	<!-- Ausgabe der Abrechungsquartals in der Form  Q-JJJJ -->
	<xsl:template name="berechne_quartal_kurz">
		<xsl:param name="zeitraum"/>
		<xsl:variable name="von" select="substring-before($zeitraum, '..')"/>
		<xsl:variable name="bis" select="substring-after($zeitraum, '..')"/>
		<xsl:variable name="monat_von" select="substring($von,6,2)"/>
		<xsl:variable name="monat_bis" select="substring($bis,6,2)"/>

		<xsl:choose>
			<xsl:when test="((0 &lt; $monat_von) and ($monat_von &lt; 4))">
				<xsl:text>1/</xsl:text>
				<xsl:value-of select="substring($bis,1,4)"/>
			</xsl:when>
			<xsl:when test="((3 &lt; $monat_von) and ($monat_von &lt; 7))">
				<xsl:text>2/</xsl:text>
				<xsl:value-of select="substring($bis,1,4)"/>
			</xsl:when>
			<xsl:when test="((6 &lt; $monat_von) and ($monat_von &lt; 10))">
				<xsl:text>3/</xsl:text>
				<xsl:value-of select="substring($bis,1,4)"/>
			</xsl:when>
			<xsl:when test="((9 &lt; $monat_von) and ($monat_von &lt; 13))">
				<xsl:text>4/</xsl:text>
				<xsl:value-of select="substring($bis,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>keine korrekte Quartalsangabe im Feld [ehd/service_tmr]</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>


	<!-- Ausgabe der Abrechungsquartals in der Form  Q. Quartal JJJJ -->
	<xsl:template name="berechne_quartal_lang">
		<xsl:param name="zeitraum"/>
		<xsl:variable name="von" select="substring-before($zeitraum, '..')"/>
		<xsl:variable name="bis" select="substring-after($zeitraum, '..')"/>
		<xsl:variable name="monat_von" select="substring($von,6,2)"/>
		<xsl:variable name="monat_bis" select="substring($bis,6,2)"/>

		<xsl:choose>
			<xsl:when test="((0 &lt; $monat_von) and ($monat_von &lt; 4))">
				<xsl:text>1. Quartal </xsl:text>
				<xsl:value-of select="substring($bis,1,4)"/>
			</xsl:when>
			<xsl:when test="((3 &lt; $monat_von) and ($monat_von &lt; 7))">
				<xsl:text>2. Quartal </xsl:text>
				<xsl:value-of select="substring($bis,1,4)"/>
			</xsl:when>
			<xsl:when test="((6 &lt; $monat_von) and ($monat_von &lt; 10))">
				<xsl:text>3. Quartal </xsl:text>
				<xsl:value-of select="substring($bis,1,4)"/>
			</xsl:when>
			<xsl:when test="((9 &lt; $monat_von) and ($monat_von &lt; 13))">
				<xsl:text>4. Quartal </xsl:text>
				<xsl:value-of select="substring($bis,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>keine korrekte Quartalsangabe im Feld [ehd/service_tmr]</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>



	<xsl:template match="kvsh:komplex" mode="N">
		<xsl:variable name="von" select="substring-before(kvsh:zeitraum_tmr/@V, '..')"/>
		<xsl:variable name="bis" select="substring-after(kvsh:zeitraum_tmr/@V, '..')"/>
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
