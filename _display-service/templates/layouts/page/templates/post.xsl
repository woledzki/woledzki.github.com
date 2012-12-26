<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:php="http://php.net/xsl">
	<xsl:output method="html"
		encoding="utf-8"
		media-type="text/html"
		doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
		doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
		cdata-section-elements="script style"
		indent="yes" 
	/>

	<xsl:template match="/component">
		<html>
			<head>
				<meta http-equiv="content-type" content="text/html; charset=utf-8" />
				<title>
					<xsl:value-of select="data/title" />
				</title>
				<meta name="keywords" content="" />
				<meta name="description" content="" />

				<link rel="shortcut icon"
					href="{$H_BASE_PATH}/favicon.ico"
					type="image/x-icon" />
				<link rel="icon"
					href="{$H_BASE_PATH}/favicon.ico"
					type="image/x-icon" />

				<link rel="stylesheet" type="text/css" media="all"
					href="{$H_BASE_PATH}/static/styles/css/main.css"
				/>
			</head>
			<body>
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
						<div class="span-body">
							<div class="article">
								<xsl:value-of
									select="$H_SUB_COMPONENTS"
									disable-output-escaping="yes" />
							</div>
						</div>
						<div class="span-side">
							<p>Cześć, nazywam się Wojtek i zawodowo jestem inżynierem wydajności
								oprogramowania w BSkyB w Wielkiej Brytani. Lubię fotografię, dobre
								jedzenenie, muzykę i marnować czas przed PS3 czy telewizorem.
							</p>
						</div>
					</div>
				</div>
				<script
					src="{$H_BASE_PATH}/static/scripts/app.js"
					type="text/javascript"></script>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
