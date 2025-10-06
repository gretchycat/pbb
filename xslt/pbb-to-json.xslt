<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="text" encoding="UTF-8"/>
  <xsl:param name="pretty" select="'true'"/>
  <xsl:param name="preserve_ns" select="'false'"/>
  <xsl:param name="mode" select="'standard'"/>
  <xsl:template match="/">
    <xsl:text>{"root":</xsl:text>
    <xsl:text>"</xsl:text><xsl:value-of select="local-name(/*)"/><xsl:text>"}</xsl:text>
  </xsl:template>
</xsl:stylesheet>