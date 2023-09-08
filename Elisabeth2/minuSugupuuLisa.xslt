<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>

	<xsl:template match="/">
		<strong>1. Trüki välja vanaema nimi, pärast semikoolon ja tema lapsed</strong>
		<br></br>
		<xsl:value-of select="concat(nimi,';')"/>
		<xsl:for-each select="lapsed/inimene">
			<xsl:value-of select="nimi"/>
			<xsl:text>, </xsl:text>
		</xsl:for-each>
		<br></br>
		<strong>2. Vormista kõik xml andmed tabelina</strong>
		<strong>6. Värvi tabelis kõik nimed mis sisaldavad ... täht punasena (... asemel pane oma täht)</strong>
		<strong>7. Värvi kõik nimed, kellel on vähemalt kaks last kollasena (taustavärv on kollane)</strong>
		<table>
			<tr>
				<td>Nimi</td>
				<td>Vanem</td>
				<td>Synniaasta</td>
				<td>Vanus</td>
				<td>Too</td>
			</tr>
			<xsl:for-each select="//inimene">
				<tr>
					<xsl:choose>
						<xsl:when test="count(lapsed/inimene) &gt; 1">
							<td bgcolor="yellow">
								<xsl:value-of select="nimi"/>
							</td>
						</xsl:when>
						<xsl:when test="contains(nimi,'j')">
							<td bgcolor="red">
								<xsl:value-of select="nimi"/>
							</td>
						</xsl:when>
						<xsl:when test="contains(nimi,'J')">
							<td bgcolor="red">
								<xsl:value-of select="nimi"/>
							</td>
						</xsl:when>
						<xsl:otherwise>
							<td>
								<xsl:value-of select="nimi"/>
							</td>
						</xsl:otherwise>
					</xsl:choose>
					<td>
						<xsl:value-of select="../../nimi"/>
					</td>
					<td>
						<xsl:value-of select="concat(@synd,' - ',@surm)"/>
					</td>
					<td>
						<xsl:value-of select="@surm - @synd"/>
					</td>
					<td>
						<xsl:value-of select="too"/>
					</td>
				</tr>
			</xsl:for-each>
		</table>

		<strong>4. Arvuta mitu inimest elavad igas elukohas</strong>
		<br></br>
		Elanud Berlinis:
		<xsl:value-of select="count(//inimene[@aadress='Berlin'])"/>
		<br></br>
		Elanud Oberhausen:
		<xsl:value-of select="count(//inimene[@aadress='Oberhausen'])"/>
		<br></br>
		Elanud Dortmund:
		<xsl:value-of select="count(//inimene[@aadress='Dortmund'])"/>
		<br></br>
		
		<strong>5. Leia iga inimesele mitu last temal on</strong>
		<ul>
			<xsl:for-each select="//inimene[lapsed]">
				<li>
					<xsl:if test="count(lapsed/inimene)&gt;=1">
						<xsl:value-of select="concat(nimi,' (',@synd,') ')" />
						<xsl:value-of select="count(lapsed/inimene)"/>-last
					</xsl:if>
				</li>
			</xsl:for-each>
		</ul>

		

	</xsl:template>
</xsl:stylesheet>
