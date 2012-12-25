<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:php="http://php.net/xsl">
	<xsl:output
		method="html"
		encoding="utf-8"
		indent="yes" />

	<xsl:template match="/component">
		<div class="container">
			<div class="row">
				<div class="span24">
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
				</div>
				<xsl:value-of
					select="$H_SUB_COMPONENTS"
					disable-output-escaping="yes" />
			</div>
		</div>
	</xsl:template>

</xsl:stylesheet>
