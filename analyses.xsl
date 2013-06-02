<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text" encoding="UTF-8" />

  <xsl:key name="exparteien" match="mandat[@type='transfer']" use="@from" />

  <xsl:template match="/">
    <xsl:text>Zahl der Mandate: </xsl:text>
    <xsl:value-of select="count(//mandat)" />
    <xsl:text>&#10;Davon </xsl:text>
    <xsl:value-of select="count(//mandat[@type='pirat'])" />
    <xsl:text> gewählte Piraten und </xsl:text>
    <xsl:value-of select="count(//mandat[@type='transfer'])" />
    <xsl:text> Übertritte.&#10;</xsl:text>

    <xsl:text>&#10;Übertritte von:&#10;</xsl:text>
    <xsl:for-each select="//mandat[@type='transfer'][generate-id() = generate-id(key('exparteien', @from)[1])]">
    <xsl:sort select="count(key('exparteien', @from))" data-type="number"  order="descending" />
      <xsl:value-of select="@from" /><xsl:text> </xsl:text><xsl:value-of select="count(key('exparteien', @from))" /><xsl:text>&#10;</xsl:text>
    </xsl:for-each>

    <xsl:text>&#10;Zahl der Fraktionen: </xsl:text>
    <xsl:value-of select="count(//fraktion[@type!='none'])" />
    <xsl:text>&#10;Davon </xsl:text>
    <xsl:value-of select="count(//fraktion[@type='PIRATEN'])" />
    <xsl:text> PIRATEN-Fraktionen und </xsl:text>
    <xsl:value-of select="count(//fraktion[@type='gemeinsam'])" />
    <xsl:text> gemeinsame Fraktionen.&#10;</xsl:text>
    <xsl:value-of select="count(//parlament[not(fraktion)]/mandat)" />
    <xsl:text> Mandate in </xsl:text>
    <xsl:value-of select="count(//parlament[not(fraktion)])" />
    <xsl:text> Vertretungen mit unbekanntem Fraktionsstatus.&#10;</xsl:text>

  </xsl:template>

</xsl:transform>
