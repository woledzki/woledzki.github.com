<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:php="http://php.net/xsl"
>
	<xsl:output method="html" encoding="utf-8" indent="yes" />

	<xsl:template match="/component">
		<div class="tile {data/size}">
			<xsl:choose>
				<xsl:when test="boolean(number(data/withsection))">
					<section>
						<xsl:apply-templates select="data/text" />
					</section>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="data/text" />
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</xsl:template>

	<xsl:template match="text">
		<xsl:value-of select="." disable-output-escaping="yes" />
	</xsl:template>
</xsl:stylesheet>
