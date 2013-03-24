<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:php="http://php.net/xsl"
>
	<xsl:output method="html" encoding="utf-8" indent="yes" />

	<xsl:template match="/component">
		<xsl:text disable-output-escaping="yes">&lt;!-- </xsl:text>
		<xsl:value-of select="$H_SUB_COMPONENTS" disable-output-escaping="yes" />
		<xsl:text disable-output-escaping="yes"> --&gt;</xsl:text>
	</xsl:template>

</xsl:stylesheet>
