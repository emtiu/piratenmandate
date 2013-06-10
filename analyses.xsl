<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text" encoding="UTF-8" />

  <xsl:key name="exparteien" match="mandat[@type='transfer']" use="@from" />
  <xsl:key name="fraktionspartner" match="partner" use="@partei" />

  <xsl:template match="/">
    <xsl:text>-- Zahl der Mandate: </xsl:text>
    <xsl:value-of select="count(//mandat)" />
    <xsl:text>&#10;Davon </xsl:text>
    <xsl:value-of select="count(//mandat[@type='pirat'])" />
    <xsl:text> gewählte Piraten und </xsl:text>
    <xsl:value-of select="count(//mandat[@type='transfer'])" />
    <xsl:text> Übertritte.</xsl:text>

    <xsl:text>&#10;&#10;Übertritte von:&#10;</xsl:text>
    <xsl:for-each select="//mandat[@type='transfer'][generate-id() = generate-id(key('exparteien', @from)[1])]">
    <xsl:sort select="count(key('exparteien', @from)) - (count(//mandat[@from=current()/@from and @double='yes']) div 2)" data-type="number"  order="descending" />
      <xsl:value-of select="@from" /><xsl:text> </xsl:text><xsl:value-of select="count(key('exparteien', @from)) - (count(//mandat[@from=current()/@from and @double='yes']) div 2)" /><xsl:text>&#10;</xsl:text>
    </xsl:for-each>

    <xsl:text>&#10;-- Zahl der Fraktionen: </xsl:text>
    <xsl:value-of select="count(//fraktion[@type!='fremd' and @type!='none' and @type!='impossible'])" />
    <xsl:text>&#10;Davon </xsl:text>
    <xsl:value-of select="count(//fraktion[@type='piraten'])" />
    <xsl:text> PIRATEN-Fraktionen und </xsl:text>
    <xsl:value-of select="count(//fraktion[@type='gemeinsam'])" />
    <xsl:text> gemeinsame Fraktionen.</xsl:text>

    <xsl:text>&#10;&#10;Gemeinsame Fraktionen mit:&#10;</xsl:text>
    <xsl:for-each select="//partner[generate-id() = generate-id(key('fraktionspartner', @partei)[1])]">
    <xsl:sort select="count(key('fraktionspartner', @partei))" data-type="number"  order="descending" />
      <xsl:value-of select="@partei" /><xsl:text> </xsl:text><xsl:value-of select="count(key('fraktionspartner', @partei))" /><xsl:text>&#10;</xsl:text>
    </xsl:for-each>

    <xsl:text>&#10;</xsl:text><xsl:value-of select="count(//parlament[fraktion[@type!='none' and @type!='impossible']]/mandat)" />
    <xsl:text> Fraktionsmitglieder (davon </xsl:text>
    <xsl:value-of select="count(//parlament[fraktion[@type='fremd']]/mandat)" />
    <xsl:text> in fremden Fraktionen) und </xsl:text>
    <xsl:value-of select="count(//parlament[fraktion[@type='none']]/mandat)" />
    <xsl:text> Fraktionslose.&#10;</xsl:text>
    <xsl:value-of select="count(//parlament[fraktion[@type='impossible']]/mandat)" />
    <xsl:text> Mandate in Vertretungen ohne Fraktionen.&#10;</xsl:text>
    <xsl:value-of select="count(//parlament[not(fraktion)]/mandat)" />
    <xsl:text> Mandate mit unbekanntem Fraktionsstatus.&#10;</xsl:text>

  </xsl:template>

</xsl:transform>
