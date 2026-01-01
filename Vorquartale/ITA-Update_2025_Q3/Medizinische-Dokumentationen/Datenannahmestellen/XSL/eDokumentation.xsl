<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:n1="urn::hl7-org/cda" xmlns:sciphox="urn::sciphox-org/sciphox" xmlns:n2="urn:hl7-org:v3/meta/voc" xmlns:voc="urn:hl7-org:v3/voc" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:output method="html" indent="yes" version="4.01" encoding="ISO-8859-15" doctype-public="-//W3C//DTD HTML 4.01//EN"/>
	<xsl:template match="/">
		<xsl:apply-templates select="n1:levelone"/>
	</xsl:template>
	<xsl:template match="n1:levelone">
		<html>
			<head>
				<style type="text/css">
		
		
        @media print {
        
	            .value{
				border-style:solid;
				border-width:1px;;
				border-color:#EE1B21 !important;;
				background-color:#FFFFFF;
				margin-left:10px;
				margin-right:10px;
				margin-bottom:2px;
				padding:2px;
				min-width:70%;
            }       
			body { 
				color: #000000; 
				font-size: 10px; 
				line-height: normal; 
				font-family: Verdana, Arial, sans-serif;
				vertical-align:top;
			}              
			h1 {
				color:#EE1B21;
				font-size: 14pt; 
				width:100%;
				text-align:right;
			} 
           td {
				vertical-align:top;
            }
            
			.box{
				border-style:solid;
				border-width:1px;
				border-color:#EE1B21;
            }
            
			.caption{
				color:#EE1B21;
				font-weight:bolder;
				white-space:normal;
				margin-left:5px;
				margin-right:5px;
				overflow:hidden;
            }			
           .header_value{
				margin-left:10px;
            }
            
            td {
				padding-left:10px;
            }
            
            .leftborder td{
				border-left-style:solid;
				border-left-width:1px;
				border-left-color:#EE1B21;
            }
            .DMP-Body{
				background-color:#fee4e5;
				font-size:10px;
            }
            
            .fieldset{
				margin-left:10px;
				margin-top:10px;
				margin-right:0px;
				padding-bottom:1em;
				border:1px solid #EE1B21;
				clear:both;
			}
            
            .legend{
				width:90%;
				background-color:#EE1B21;
				color:#FFFFFF;
				font-weight:bold;
				padding:2px;
				padding-left:10px;
				padding-right:10px;
				font-size:11px;
				clear:both;
            }
            
            hr{
				color:#EE1B21;
            }            
		}
@media screen{
			body { 
				color: #000000; 
				font-size: 10px; 
				line-height: normal; 
				font-family: Verdana, Arial, sans-serif;
				vertical-align:top;
			} 
			h1 {
				color:#EE1B21;
				font-size: 14pt; 
				width:100%;
				text-align:right;
			} 
			
            .DMP-Header{
				background-color:#ffffff:
				border:none;
				margin-right:10px;
            }
            .DMP-Headerprint{
				background-color:#ffffff:
				border:none;
				margin-right:10px;
				display:none;
            }            
            
            td {
				vertical-align:top;
            }
            
			.box{
				border-style:solid;
				border-width:1px;
				border-color:#EE1B21;
            }
            
			.caption{
				color:#EE1B21;
				font-weight:bolder;
				white-space:normal;
				margin-left:5px;
				margin-right:5px;
				overflow:hidden;
            }
            
            .value{
				border-style:solid;
				border-width:1px;;
				border-color:#fee4e5;
				background-color:#FFFFFF;
				margin-left:10px;
				margin-right:10px;
				margin-bottom:2px;
				padding:2px;
				min-width:70%;
            }
            
            .header_value{
				margin-left:10px;
            }
            
            td {
				padding-left:10px;
            }
            
            .leftborder td{
				border-left-style:solid;
				border-left-width:1px;
				border-left-color:#EE1B21;
            }
            .DMP-Body{
				background-color:#fee4e5;
				font-size:10px;
            }
            
            .fieldset{
				margin-left:10px;
				margin-top:10px;
				margin-right:10px;
				padding-bottom:1em;
				border:1px solid #EE1B21;
				clear:both;
			}
            
            .legend{
				width:90%;
				background-color:#EE1B21;
				color:#FFFFFF;
				font-weight:bold;
				padding:2px;
				padding-left:10px;
				padding-right:10px;
				font-size:11px;
				clear:both;
            }
            
            hr{
				color:#EE1B21;
            }
}
        </style>
				<!-- 	color:#EE1B21; -->
			</head>
			<body>
				<div class="DMP-Header">
					<xsl:call-template name="DMP-Header"/>
				</div>
				<div class="DMP-Body">
					<xsl:apply-templates select="n1:body/n1:section"/>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="DMP-Header">
		<h1>
			<xsl:value-of select="/n1:levelone/n1:clinical_document_header/n1:document_type_cd/@DN"/>
		</h1>
		<table width="100%">
			<tbody>
				<tr>
					<td style="width:55%">
						<table class="box">
							<tbody>
								<tr>
									<td colspan="3">
										<div class="caption">Krankenkasse bzw. Kostenträger</div>
										<div class="header_value">
											<xsl:value-of select="/n1:levelone/n1:clinical_document_header/n1:patient/n1:local_header/sciphox:sciphox-ssu/sciphox:GesetzlicheKrankenversicherung/sciphox:Kostentraegerbezeichnung/@V"/>
											<xsl:if test="//sciphox:AbrechnungsVKNR/@V">
												<xsl:text> (</xsl:text>
												<xsl:value-of select="/n1:levelone/n1:clinical_document_header/n1:patient/n1:local_header/sciphox:sciphox-ssu/sciphox:GesetzlicheKrankenversicherung/sciphox:AbrechnungsVKNR/@V"/>
												<xsl:text>)</xsl:text>
											</xsl:if>
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<div class="caption">Name, Vorname des Versicherten</div>
										<div class="header_value">
											<xsl:call-template name="getName">
												<xsl:with-param name="name" select="/n1:levelone/n1:clinical_document_header/n1:patient/n1:person/n1:person_name/n1:nm"/>
											</xsl:call-template>
											<xsl:call-template name="getAddr">
												<xsl:with-param name="addr" select="/n1:levelone/n1:clinical_document_header/n1:patient/n1:person/n1:addr"/>
											</xsl:call-template>
										</div>
									</td>
									<td>
										<div class="caption">geb. am</div>
										<div class="header_value">
											<xsl:call-template name="formatDate">
												<xsl:with-param name="date" select="/n1:levelone/n1:clinical_document_header/n1:patient/n1:birth_dttm/@V"/>
											</xsl:call-template>
										</div>
									</td>
								</tr>
								<tr>
									<td width="40%">
										<div class="caption">Kostentraegerkennung</div>
										<div class="header_value">
											<xsl:value-of select="/n1:levelone/n1:clinical_document_header/n1:patient/n1:local_header/sciphox:sciphox-ssu/sciphox:GesetzlicheKrankenversicherung/sciphox:Kostentraegerkennung/@V"/>
										</div>
									</td>
									<td class="leftborder" width="50%">
										<div class="caption">Versicherten-Nr.</div>
										<div class="header_value">
											<xsl:value-of select="/n1:levelone/n1:clinical_document_header/n1:patient/n1:local_header/sciphox:sciphox-ssu/sciphox:GesetzlicheKrankenversicherung/sciphox:Versichertennummer/@V"/>
										</div>
									</td>
									<td class="leftborder" width="10%">
										<div class="caption">Versichertenart</div>
										<div class="header_value">
											<xsl:value-of select="/n1:levelone/n1:clinical_document_header/n1:patient/n1:local_header/sciphox:sciphox-ssu/sciphox:GesetzlicheKrankenversicherung/sciphox:Versichertenart/@V"/>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="caption">DMP_Kennzeichnung</div>
										<div class="header_value">
											<xsl:value-of select="/n1:levelone/n1:clinical_document_header/n1:patient/n1:local_header/sciphox:sciphox-ssu/sciphox:GesetzlicheKrankenversicherung/sciphox:DMP_Kennzeichnung/@V"/>
										</div>
									</td>
									<td>
										<div class="caption">Besondere Personengruppe</div>
										<div class="header_value">
											<xsl:value-of select="/n1:levelone/n1:clinical_document_header/n1:patient/n1:local_header/sciphox:sciphox-ssu/sciphox:GesetzlicheKrankenversicherung/sciphox:BesonderePersonengruppe/@V"/>
										</div>
									</td>
									<td class="leftborder" colspan="1">
										<div class="caption">Einlesedatum</div>
										<div class="header_value">
											<xsl:call-template name="formatDate">
												<xsl:with-param name="date" select="/n1:levelone/n1:clinical_document_header/n1:patient/n1:local_header/sciphox:sciphox-ssu/sciphox:GesetzlicheKrankenversicherung/sciphox:Einlesedatum/@V"/>
											</xsl:call-template>
										</div>
									</td>
								</tr>
								<tr>
									<td>
									<div class="caption">Versicherungsschutz Beginn</div>
										<div class="header_value">
											<xsl:variable name="vkgueltig_von" select="/n1:levelone/n1:clinical_document_header/n1:patient/n1:local_header/sciphox:sciphox-ssu/sciphox:GesetzlicheKrankenversicherung/sciphox:VersicherungsschutzBeginn/@V"/>
											<xsl:if test="$vkgueltig_von">
												<xsl:value-of select="substring ($vkgueltig_von, 6, 2)"/>
												<xsl:text>/</xsl:text>
												<xsl:value-of select="substring ($vkgueltig_von, 3, 2)"/>
											</xsl:if>
										</div>
									</td>
									<td>
									<div class="caption">Versicherungsschutz Ende</div>
										<div class="header_value">
											<xsl:variable name="vkgueltig_bis" select="/n1:levelone/n1:clinical_document_header/n1:patient/n1:local_header/sciphox:sciphox-ssu/sciphox:GesetzlicheKrankenversicherung/sciphox:VersicherungsschutzEnde/@V"/>
											<xsl:if test="$vkgueltig_bis">
												<xsl:value-of select="substring ($vkgueltig_bis, 6, 2)"/>
												<xsl:text>/</xsl:text>
												<xsl:value-of select="substring ($vkgueltig_bis, 3, 2)"/>
											</xsl:if>
										</div>
									</td>
									<td>
										<div class="caption">Geschlecht</div>
										<div class="header_value">
											<xsl:value-of select="/n1:levelone/n1:clinical_document_header/n1:patient/n1:administrative_gender_cd/@V"/>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
					<td style="width:45%;">
						<div class="box">
							<div/>
							<div class="caption">Fallnummer</div>
							<div class="header_value">
								<xsl:value-of select="/n1:levelone/n1:clinical_document_header/n1:patient/n1:person/n1:id/@EX"/>
							</div>
							<xsl:for-each select="/n1:levelone/n1:clinical_document_header/n1:provider/n1:person/n1:id">
								<div class="caption">
									<xsl:variable name="id_rt" select="@RT"/>
									<xsl:choose>
										<xsl:when test="$id_rt='LANR'">Arztnummer</xsl:when>
										<xsl:when test="$id_rt='NBSNR'">Nebenbetriebsstättennummer</xsl:when>
										<xsl:when test="$id_rt='BSNR'">Betriebsstättennummer</xsl:when>
										<xsl:when test="$id_rt='Krankenhaus-IK'">Krankenhaus-IK</xsl:when>
										<xsl:when test="$id_rt='Vertragsarztnummer'">Vertragsarztnummer</xsl:when>
										<xsl:otherwise>unbekannt</xsl:otherwise>
									</xsl:choose>
								</div>
								<div class="header_value">
									<xsl:value-of select="@EX"/>
								</div>
							</xsl:for-each>
							<div class="caption">Behandelnder Arzt</div>
							<div class="header_value">
								<xsl:choose>
									<xsl:when test="/n1:levelone/n1:clinical_document_header/n1:provider/n1:person/n1:person_name/n1:nm">
										<xsl:call-template name="getName">
											<xsl:with-param name="name" select="/n1:levelone/n1:clinical_document_header/n1:provider/n1:person/n1:person_name/n1:nm"/>
										</xsl:call-template>
									</xsl:when>
								</xsl:choose>
								<xsl:call-template name="getAddr">
									<xsl:with-param name="addr" select="/n1:levelone/n1:clinical_document_header/n1:provider/n1:person/n1:addr"/>
								</xsl:call-template>
							</div>
							<div class="caption">Datum (origination_dttm)</div>
							<div class="header_value">
								<xsl:call-template name="formatDate">
									<xsl:with-param name="date" select="/n1:levelone/n1:clinical_document_header/n1:origination_dttm/@V"/>
								</xsl:call-template>
							</div>
							<div class="caption">Datum (service_tmr)</div>
							<div class="header_value">
								<xsl:call-template name="formatDate">
									<xsl:with-param name="date" select="/n1:levelone/n1:clinical_document_header/n1:service_tmr/@V"/>
								</xsl:call-template>
							</div>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<!-- StructuredBody -->
	<xsl:template match="n1:body/n1:section">
		<xsl:for-each select="n1:paragraph">
			<xsl:call-template name="paragraph"/>
		</xsl:for-each>
	</xsl:template>
	<!-- paragraph -->
	<xsl:template name="paragraph">
		<xsl:variable name="currentposition" select="position()"/>
		<xsl:if test="(contains(//n1:document_type_cd/@V,'EDMP_DIABETES1_EV') and position()=4) or
							 (contains(//n1:document_type_cd/@V,'KOL_38a') and position()=7)">
			<p style="page-break-after:always"/>
			<div class="DMP-Headerprint">
				<xsl:call-template name="DMP-Header"/>
			</div>
		</xsl:if>
		<fieldset class="fieldset">
			<legend class="legend">
				<xsl:value-of select="n1:caption/n1:caption_cd/@DN"/>
			</legend>
			<xsl:apply-templates select="n1:content/n1:local_markup/sciphox:sciphox-ssu/sciphox:Beobachtungen"/>
		</fieldset>
	</xsl:template>
	<!-- 
    Beobachtungen
-->
	<xsl:template match="sciphox:Beobachtungen">
		<xsl:for-each select="sciphox:Beobachtung">
			<!--Sonderfälle-->
			<xsl:choose>
				<xsl:when test="sciphox:Parameter/@DN='Dokumentationsintervall'"/>
				<xsl:when test="sciphox:Parameter/@DN='Blutdruck systolisch'"/>
				<xsl:otherwise>
					<div style="float:left;width:33%">
						<xsl:call-template name="Beobachtung"/>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		<!--Behandlungsdatum der letzten zwei Elemente in Behandlungsplanung in fester Reihenfolge setzen-->
		<xsl:if test="position()=last()">
			<xsl:if test="../../../../n1:caption/n1:caption_cd[@DN='Behandlungsplanung']">
				<br style="clear:both;"/>
				<hr/>
				<!--Dokuintervall-->
				<div style="float:left;width:33%">
					<div class="caption">Dokumentationsintervall</div>
					<div class="value">
						<xsl:call-template name="writeInLineText">
							<xsl:with-param name="path" select="sciphox:Beobachtung/sciphox:Parameter[@DN='Dokumentationsintervall']/../sciphox:Ergebnistext"/>
						</xsl:call-template>
					</div>
				</div>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template name="Beobachtung">
		<xsl:choose>
			<!--Sonderfälle-->
			<xsl:when test="sciphox:Parameter/@DN='Blutdruck diastolisch'">
				<div class="caption">Blutdruck</div>
				<div class="value">
					<xsl:call-template name="writeInLineWertOhneEinheit">
						<xsl:with-param name="path" select="../sciphox:Beobachtung/sciphox:Parameter[@DN='Blutdruck systolisch']/../sciphox:Ergebniswert"/>
					</xsl:call-template>
					<xsl:text>/</xsl:text>
					<xsl:call-template name="writeInLineWert">
						<xsl:with-param name="path" select="sciphox:Ergebniswert"/>
					</xsl:call-template>
				</div>
			</xsl:when>
			<xsl:otherwise>
				<div class="caption">
					<xsl:value-of select="sciphox:Parameter/@DN"/>
				</div>
				<xsl:if test="sciphox:Ergebnistext">
					<div class="value">
						<xsl:call-template name="writeInLineText">
							<xsl:with-param name="path" select="sciphox:Ergebnistext"/>
						</xsl:call-template>
					</div>
				</xsl:if>
				<xsl:if test="sciphox:Ergebniswert">
					<div class="value">
						<xsl:call-template name="writeInLineWert">
							<xsl:with-param name="path" select="sciphox:Ergebniswert"/>
						</xsl:call-template>
					</div>
				</xsl:if>
				<xsl:if test="sciphox:Zeitpunkt_dttm">
					<div class="value">
						<xsl:for-each select="sciphox:Zeitpunkt_dttm">
							<xsl:call-template name="formatDate">
								<xsl:with-param name="date" select="@V"/>
							</xsl:call-template>
						</xsl:for-each>
					</div>
				</xsl:if>
				<xsl:if test="sciphox:Beobachtungen">
					<xsl:for-each select="sciphox:Beobachtungen/sciphox:Beobachtung">
						<div style="position:relative;left: 10px;">
							<xsl:call-template name="Beobachtung"/>
						</div>
					</xsl:for-each>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="writeInLineWertOhneEinheit">
		<xsl:param name="path"/>
		<xsl:variable name="count" select="count($path)"/>
		<xsl:choose>
			<xsl:when test="$count!=0">
				<xsl:for-each select="$path">
					<xsl:value-of select="@V"/>
					<xsl:text> </xsl:text>
					<xsl:if test="not(position()=last())">
						<xsl:text>,  </xsl:text>
					</xsl:if>
				</xsl:for-each>
			</xsl:when>
			<xsl:otherwise>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="writeInLineWert">
		<xsl:param name="path"/>
		<xsl:variable name="count" select="count($path)"/>
		<xsl:choose>
			<xsl:when test="$count!=0">
				<xsl:for-each select="$path">
					<xsl:value-of select="@V"/>
					<xsl:text> </xsl:text>
					<xsl:if test="not(@U='Anzahl')">
						<xsl:value-of select="@U"/>
					</xsl:if>
					<xsl:if test="not(position()=last())">
						<xsl:text>,  </xsl:text>
					</xsl:if>
				</xsl:for-each>
			</xsl:when>
			<xsl:otherwise>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="writeInLineText">
		<xsl:param name="path"/>
		<xsl:variable name="count" select="count($path)"/>
		<xsl:choose>
			<xsl:when test="$count!=0">
				<xsl:for-each select="$path">
					<xsl:value-of select="@V"/>
					<xsl:if test="not(position()=last())">
						<xsl:text>,  </xsl:text>
					</xsl:if>
					<xsl:text> </xsl:text>
				</xsl:for-each>
			</xsl:when>
			<xsl:otherwise>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="getAddr">
		<xsl:param name="addr"/>
		<br/>
		<xsl:value-of select="$addr/n1:STR/@V"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="$addr/n1:HNR/@V"/>
		<br/>
		<xsl:value-of select="$addr/n1:ZIP/@V"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="$addr/n1:CTY/@V"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="$addr/n1:CNT/@V"/>
	</xsl:template>
	<!-- Get a Name  -->
	<xsl:template name="getName">
		<xsl:param name="name"/>
		<xsl:choose>
			<xsl:when test="$name/n1:FAM">
				<xsl:value-of select="$name/n1:FAM/@V"/>
				<br/>
				<xsl:if test="$name/n1:PFX">
					<xsl:value-of select="$name/n1:PFX/@V"/>
					<xsl:text> </xsl:text>
				</xsl:if>
				<xsl:value-of select="$name/n1:GIV/@V"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$name"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!--  Format Date 
    
    outputs a date in Month Day, Year form
    e.g., 19991207  ==>  7. Dezember 1999
    -->
	<xsl:template name="formatDate">
		<xsl:param name="date"/>
		<xsl:if test="$date">
			<xsl:choose>
				<xsl:when test="substring ($date, 9, 1)='0'">
					<xsl:value-of select="substring ($date, 10, 1)"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="substring ($date, 9, 2)"/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="string-length($date)>7">
					<xsl:text>.</xsl:text>
				</xsl:when>
			</xsl:choose>
			<xsl:variable name="month" select="substring ($date, 6, 2)"/>
			<xsl:value-of select="$month"/>
			<xsl:text>.</xsl:text>
		</xsl:if>
		<!--
		<xsl:choose>
			<xsl:when test="$month='01'">
				<xsl:text>Januar </xsl:text>
			</xsl:when>
			<xsl:when test="$month='02'">
				<xsl:text>Februar </xsl:text>
			</xsl:when>
			<xsl:when test="$month='03'">
				<xsl:text>März </xsl:text>
			</xsl:when>
			<xsl:when test="$month='04'">
				<xsl:text>April </xsl:text>
			</xsl:when>
			<xsl:when test="$month='05'">
				<xsl:text>Mai </xsl:text>
			</xsl:when>
			<xsl:when test="$month='06'">
				<xsl:text>Juni </xsl:text>
			</xsl:when>
			<xsl:when test="$month='07'">
				<xsl:text>Juli </xsl:text>
			</xsl:when>
			<xsl:when test="$month='08'">
				<xsl:text>August </xsl:text>
			</xsl:when>
			<xsl:when test="$month='09'">
				<xsl:text>September </xsl:text>
			</xsl:when>
			<xsl:when test="$month='10'">
				<xsl:text>Oktober </xsl:text>
			</xsl:when>
			<xsl:when test="$month='11'">
				<xsl:text>November </xsl:text>
			</xsl:when>
			<xsl:when test="$month='12'">
				<xsl:text>Dezember </xsl:text>
			</xsl:when>
		</xsl:choose>-->
		<xsl:value-of select="substring ($date, 1, 4)"/>
	</xsl:template>
</xsl:stylesheet>
