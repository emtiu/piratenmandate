<?xml version="1.0"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/">
    <xsl:value-of select="count(//mandat)" /> Mandate, davon <xsl:value-of select="count(//mandat[@type='pirat'])" /> gewählte Piraten und <xsl:value-of select="count(//mandat[@type='transfer'])" /> Übertritte.
  </xsl:template>

</xsl:transform>
