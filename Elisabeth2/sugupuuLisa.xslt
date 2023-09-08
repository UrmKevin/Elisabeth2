<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="@* | node()">
		<strong>1. Trüki välja sugupuu kõikide inimeste nimed ja sünniaastad</strong>
		<ul>
			<xsl:for-each select="//inimene">
				<xsl:sort select="@synd"/>
				<li>
					<xsl:value-of select="concat(nimi,' (',@synd,')')" />
				</li>
			</xsl:for-each>
		</ul>
		<strong>2. Väljasta nimed, kellel vähemalt 2 last</strong>
		<strong>3. Väljasta saadud andmed tabelina</strong>
		<strong>4. Leia vanused, lisa tebelisse</strong>
		<ul>
			<xsl:for-each select="//inimene[lapsed]">
				<li>
					<xsl:if test="count(lapsed/inimene)&gt;=2">
						<xsl:value-of select="concat(nimi,' (',@synd,') ')" />
						<xsl:value-of select="count(lapsed/inimene)"/>-last
					</xsl:if>
				</li>
			</xsl:for-each>
		</ul>
		<style>
			table 
			{
			border-collapse: collapse;
			}
			tr
			{
			border: 1pt solid black;
			}
			td
			{
			border: 1pt solid black;
			}
		</style>
		<table>
			<tr>
				<td>Nimi</td>
				<td>Vanem</td>
				<td>Synniaasta</td>
				<td>Vanus</td>
			</tr>
			<xsl:for-each select="//inimene">
				<tr>
					<xsl:choose>
						<xsl:when test="string-length(nimi) &gt; 10">
							<td bgcolor="#ff00ff">
								<xsl:value-of select="nimi"/>
							</td>
						</xsl:when>
						<xsl:when test="string-length(nimi) &gt; 9">
							<td bgcolor="#cccccc">
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
						<xsl:value-of select="@synd"/>
					</td>
					<td>
						<xsl:value-of select="2023 - @synd"/>
					</td>
				</tr>
			</xsl:for-each>
		</table>
		<strong>5. Väljasta iga inimese juures mitmendal oma vanema sünniaastal ta sündis, lisa tabelisse</strong>
		<ul>
			<xsl:for-each select="//inimene">
				<xsl:sort select="@synd"/>
				<li>
					<xsl:value-of select="nimi"/>
					<xsl:if test="../..">
						- lapsevanema vanus oli
						<xsl:value-of select="@synd - ../../@synd"/>
						aastat vana
					</xsl:if>
				</li>
			</xsl:for-each>
		</ul>
		<strong>6. Värvida tabelis kõik nimed pikkusega rohkem kui 10 tähte rohelise taustavärviga</strong>
    </xsl:template>
</xsl:stylesheet>
