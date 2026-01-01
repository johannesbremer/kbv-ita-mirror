<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- Version 1.01 -->
<xsl:stylesheet 	version="1.0" 
				xmlns:cda="urn::hl7-org/cda" 
				xmlns:sciphox="urn::sciphox-org/sciphox" 
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
				exclude-result-prefixes="cda sciphox">
				
	<xsl:output method="xml" encoding="ISO-8859-15" indent="yes" standalone="yes"/>
	<xsl:template match="*|@*|processing-instruction()|text()">
		<xsl:choose>
			<!-- header -->
			<!-- document_type_cd anpassen gilt für alle EDMPs mit Kodeanfang: EDMP_ -->
			<xsl:when test="name()='V' and contains(../@V, 'EDMP_')"><xsl:attribute name="V"><xsl:value-of select="."/>_A</xsl:attribute></xsl:when>
			<xsl:when test="name()='DN' and contains(../@V, 'EDMP_')"><xsl:attribute name="DN"><xsl:value-of select="."/> a-Datensatz</xsl:attribute></xsl:when>
			<xsl:when test="name()='V' and contains(../@V, 'DMP_BRK_')"><xsl:attribute name="V"><xsl:value-of select="."/>_4A</xsl:attribute></xsl:when>
			<xsl:when test="name()='DN' and contains(../@V, 'DMP_BRK_')"><xsl:attribute name="DN"><xsl:value-of select="."/> 4a-Datensatz</xsl:attribute></xsl:when>
			<!-- provider und patient Personaldaten entfernen -->
			<xsl:when test="name()='person_name' and (name(../../.)='patient' or name(../../.)='provider')"/>
			<xsl:when test="name()='addr' and (name(../../.)='patient' or name(../../.)='provider')"/>
			<xsl:when test="name()='telecom' and (name(../../.)='patient' or name(../../.)='provider')"/>
			
			<!-- insurance_ssu KVK-Elemente entfernen -->
			<xsl:when test="name()='sciphox:KostentraegerAbrechnungsbereich'"/>
			<xsl:when test="name()='sciphox:KVBereich'"/>
			<xsl:when test="name()='sciphox:AbrechnungsVKNR'"/>
			<xsl:when test="name()='sciphox:SKTZusatzangabe'"/>
			<xsl:when test="name()='sciphox:VersichertenstatusKVK'"/>
			<xsl:when test="name()='sciphox:VersichertenartMFR'"/>
			<xsl:when test="name()='sciphox:Statusergaenzung'"/>
			<xsl:when test="name()='sciphox:BisDatumderGueltigkeit'"/>
			<xsl:when test="name()='sciphox:KVKEinlesedatum'"/>

			<!-- insurance_ssu EGK-Elemente entfernen -->
			<xsl:when test="name()='sciphox:KostentraegerAbrechnungsbereich'"/>
			<xsl:when test="name()='sciphox:AbrechnungsVKNR'"/>
			<xsl:when test="name()='sciphox:WOP'"/>
			<xsl:when test="name()='sciphox:SKTZusatzangabe'"/>
			<xsl:when test="name()='sciphox:BesonderePersonengruppe'"/>
			<xsl:when test="name()='sciphox:Versichertenart'"/>
			<xsl:when test="name()='sciphox:DMP_Kennzeichnung'"/>
			<xsl:when test="name()='sciphox:VersicherungsschutzBeginn'"/>
			<xsl:when test="name()='sciphox:VersicherungsschutzEnde'"/>
			<xsl:when test="name()='sciphox:Einlesedatum'"/>

			
			<!-- SoftwareName und SoftwareVersion der Schema -->
			<xsl:when test="name()='V' and contains(../@V, 'XSD_E')"><xsl:attribute name="V"><xsl:value-of select="."/>_A</xsl:attribute></xsl:when>
			<!-- SoftwareName und SoftwareVersion des XPMPrufmoduls -->
			<xsl:when test="name()='V' and contains(../@V, 'XPM_E')"><xsl:attribute name="V"><xsl:value-of select="."/>_A</xsl:attribute></xsl:when>
			<xsl:otherwise>
				<xsl:copy>
					<xsl:apply-templates select="*|@*|processing-instruction()|text()"/>
				</xsl:copy>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
