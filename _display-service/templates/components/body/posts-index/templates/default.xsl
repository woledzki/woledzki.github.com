<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:php="http://php.net/xsl"
>
	<xsl:output method="html" encoding="utf-8" indent="yes" />

	<xsl:template match="/component">
		<ul class="unstyled posts-list">
			<xsl:apply-templates select="data/post" />
		</ul>
	</xsl:template>
	
	<xsl:template match="post">
		<li>
			<span class="post-date"><xsl:value-of select="./@date" /></span>
			<h3><a href="{@href}"><xsl:value-of select="." /></a></h3>
		</li>
	</xsl:template>

</xsl:stylesheet>
