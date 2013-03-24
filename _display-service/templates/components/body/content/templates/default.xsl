<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:php="http://php.net/xsl"
>
	<xsl:output method="html" encoding="utf-8" indent="yes" />

	<xsl:template match="/component">
		<div class="grid-body">
			<div class="page-header">
				<h1>Wojtek Olędzki</h1>
				
				<xsl:if test="data/slug">
					<ul class="breadcrumb">
						<xsl:for-each select="data/slug">
							<xsl:choose>
								<xsl:when test="position() = last()">
									<li class="active">
										<xsl:value-of select="." />
									</li>
								</xsl:when>
								<xsl:otherwise>
									<li>
										<a href="{@href}">
											<xsl:value-of select="." />
										</a>
										<span class="divider">/</span>
									</li>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:for-each>
					</ul>
				</xsl:if>
			</div>
			
			<xsl:if test="data/tag">
				<ul class="inline" style="border: 1px solid #eee; border-width: 0px 0 1px 0; padding: 0 0 6px 0">
					<xsl:for-each select="data/tag">
						<li class="active">
							<i class="icon icon-tag"></i> <xsl:value-of select="." />
						</li>
					</xsl:for-each>
				</ul>
			</xsl:if>
			<xsl:value-of select="$H_SUB_COMPONENTS" disable-output-escaping="yes" />
		</div>
	</xsl:template>

	<xsl:template match="text">
		<xsl:value-of select="." disable-output-escaping="yes" />
	</xsl:template>
</xsl:stylesheet>
