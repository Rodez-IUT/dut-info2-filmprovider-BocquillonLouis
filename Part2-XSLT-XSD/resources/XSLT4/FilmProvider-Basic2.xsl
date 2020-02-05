<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html"/>

	<!-- Template pour films (l'élément racine) -->
	<xsl:template match="/films">
		<html>
			<head>
				<title>Films</title>
			</head>

			<body>
				<h1>Films</h1>

				<!-- Tableau contenant titre et résumé de chaque film -->
				<table>
					<!-- Colonne titre du tableau -->
					<thead>
						<tr>
							<th>Titre</th><th>Resume</th><th>Nom / Prénom réalisateur</th>
						</tr>
					</thead>
					<!-- Corps du tableau -->
					<tbody>
						<xsl:apply-templates select="film" />
					</tbody>

				</table>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="/films/film">

		<xsl:variable name="idReal" select="@id_realisateur"/>
		<!-- Pour chaque film : 1 ligne avec titre + résumé -->
		<tr>
			<td><xsl:value-of select="titre"/></td>
			<td><xsl:value-of select="resume/text"/></td>
			<td><xsl:value-of select="/films/realisateur[@id_realisateur = $idReal]"/></td>
		</tr>
	</xsl:template>

</xsl:stylesheet>