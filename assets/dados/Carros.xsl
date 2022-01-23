<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/Carros">
        <html>
            <body>
                <table border="1">
                    <tr>
                        <th>matricula</th>
                        <th>marca</th>
                        <th>modelo</th>
                        <th>preco</th>
                    </tr>
                <xsl:for-each select="carro">
                    <xsl:sort select="preco"/>
                <!-- <xsl:if test="preco &gt;3500"> -->
                    <tr>
                    <td><xsl:value-of select="//carro"/></td>
                    <!-- <td><xsl:value-of select="marca"/><br/></td>
                    <td><xsl:value-of select="modelo"/><br/></td>
                    <td><xsl:value-of select="preco"/><br/></td> -->
                    </tr>
                <!-- </xsl:if> -->
                </xsl:for-each>
            </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>