<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:php="http://php.net/xsl"
>
	<xsl:output method="html" encoding="utf-8" indent="yes" />

	<xsl:template match="/component">
		<ul class="unstyled posts-list">
			<xsl:apply-templates select="data/post" />
			<xsl:apply-templates select="data/tag" />
		</ul>
	</xsl:template>
	
	<xsl:template match="post">
		<li>
			<span class="post-date"><xsl:value-of select="./@date" /></span> - 
			<b><a href="{@href}"><xsl:value-of select="." /></a></b>
		</li>
	</xsl:template>
	
	<xsl:template match="tag">
		<h4><xsl:value-of select="./@name" /></h4>
		<ul class="unstyled posts-list">
			<xsl:apply-templates select="./post" />
		</ul>
	</xsl:template>

</xsl:stylesheet>
