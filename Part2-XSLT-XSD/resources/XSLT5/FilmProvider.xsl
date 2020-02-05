<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"/>

    <!-- Élément racine -->
    <xsl:template match="/films">
        <html>
        <head>
            <title>Films</title>
        </head>

        <body>
            <h1>Liste des films.</h1>
            <xsl:apply-templates select="film" />
        </body>
        </html>
    </xsl:template>


    <xsl:template match="films/film">
        <!-- ID du réalisateur -->
        <xsl:variable name="idReal" select="@id_realisateur"/>
        <!-- Prénom du réalisateur -->
        <xsl:variable name="prenom" select="/films/realisateur[@id_realisateur = $idReal]/prenom"/>
        <!-- Nom du réalisateur -->
        <xsl:variable name="nom" select="/films/realisateur[@id_realisateur = $idReal]/nom"/>

        <table>
            <tr>
                <td colspan="2">
                    <b><xsl:value-of select="titre"/></b>
                    <i> (<xsl:value-of select="$prenom"/>, <xsl:value-of select="$nom"/>)</i>
                </td>
            </tr>
            <tr>
                <!-- Le film n'a pas image-->
                <xsl:if test="resume/image=false()">
                    <td colspan="2"><xsl:value-of select="resume/text"/></td>
                </xsl:if>

                <!-- Le film a une image -->
                <xsl:if test="resume/image=true()">
                    <!-- On récupère le lien relatif de l'image -->
                    <xsl:variable name="image" select="resume/image/@source"/>

                    <!-- Définition attribut img -->
                    <!-- <td>
                    <xsl:element name="img">
                        <xsl:attribute name="src">
                            <xsl:value-of select="$image"/>
                        </xsl:attribute>
                    </xsl:element>
                    </td> -->

                    <!-- Utilisation des '{' pour que la variable soit interprétée. -->
                    <td><img src="{$image}"/></td>
                    <td><xsl:value-of select="resume/text"/></td>
                </xsl:if>
            </tr>
        </table>
        <hr/>
    </xsl:template>

</xsl:stylesheet>