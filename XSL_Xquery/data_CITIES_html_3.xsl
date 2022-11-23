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
                <h2>Scientific species information</h2>
                <table>
                    <thead>
                        <tr>
                            <th>Class</th>
                            <th>CountTotal </th>
                            <th>CountPurpose </th>
                            <th>CountSource </th>
                            <th>CountTerms</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="odd">
                            <td>
                                <xsl:value-of>Aves</xsl:value-of>
                            </td>
                            <td>
                                <xsl:value-of select="count(//ScientificClassification[Class = 'Aves'])"/>
                            </td>
                            <td>
                                <xsl:value-of select="count(distinct-values(//ScientificClassification[Class = 'Aves']/../CommercialInformation/Purpose))"/>
                            </td>
                            <td>
                                <xsl:value-of select="count(distinct-values(//ScientificClassification[Class = 'Aves']/../CommercialInformation/Source))"/>
                            </td>
                            <td>
                                <xsl:value-of select="count(distinct-values(//ScientificClassification[Class = 'Aves']/../CommercialInformation/Term))"/>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>