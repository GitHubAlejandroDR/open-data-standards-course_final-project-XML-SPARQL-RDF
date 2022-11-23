<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" indent="yes" />
    <xsl:template match="/">
        <html>
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>
                <title>CITIES</title>
                <style>
					th { background-color: #AAAAAA; }
                    tr.even td { background-color: #DDDDDD; }
                </style>
            </head>
            <body>
                <!-- Seleccion de las columnas a mostrar.  -->
                <h2>Scientific species information</h2>
                <table>
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Taxon</th>
                            <th>Class</th>
                            <th>Order</th>
                            <th>Family</th>
                            <th>Genus</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Iterar por los elementos ScientificClassification. A partir de los elementos coincidentes se puede obtener el resto de elemento del nodo padre. -->
                        <xsl:for-each select="//ScientificClassification">
                        <!-- Ordenar descendentemente a partir de los elementos Taxon. Selección y orden determinada desde la aplicación.  -->
                            <xsl:sort select="Taxon"  order="descending"/>
                            <!-- Entradas de búsqueda -->
                            <xsl:variable name="var1">
                                <xsl:text>Aves</xsl:text>
                            </xsl:variable>
                            <xsl:variable name="var2">
                                <xsl:text>RS</xsl:text>
                            </xsl:variable>
                            <!-- Concatena tantos contains() como ADD's o CheckList se añadan en la búsqueda-->
                            <xsl:if test="contains(./Class, $var1) and contains(../Location/Exporter, $var2)">
                                <tr>
                                    <td>
                                        <xsl:value-of select="../@id" />
                                    </td>
                                    <td>
                                        <xsl:value-of select="Taxon" />
                                    </td>
                                    <td>
                                        <xsl:value-of select="Class" />
                                    </td>
                                    <td>
                                        <xsl:value-of select="Order"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="Family"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="Genus"/>
                                    </td>
                                </tr>
                            </xsl:if>
                        </xsl:for-each>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>


</xsl:stylesheet>