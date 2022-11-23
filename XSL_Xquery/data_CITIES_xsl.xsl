<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" indent="yes" />

    <xsl:template match="/">
        <CITIES>
            <xsl:for-each select="//row">
                <Capture>
                    <xsl:attribute name="id">
                        <xsl:value-of select="index" />
                    </xsl:attribute>
                    <xsl:apply-templates select="." mode="ScientificClassification"/>
                    <xsl:apply-templates select="." mode="Location"/>
                    <xsl:apply-templates select="." mode="CommercialInformation"/>
                </Capture>
            </xsl:for-each>
        </CITIES>
    </xsl:template>

    <xsl:template match="row" mode="ScientificClassification">
        <ScientificClassification>
            <App>
                <xsl:value-of select="App."/>
            </App>
            <Taxon>
                <xsl:value-of select="Taxon"/>
            </Taxon>
            <Class>
                <xsl:value-of select="Class"/>
            </Class>
            <Order>
                <xsl:value-of select="Order"/>
            </Order>
            <Family>
                <xsl:value-of select="Family"/>
            </Family>
            <Genus>
                <xsl:value-of select="Genus"/>
            </Genus>
        </ScientificClassification>
    </xsl:template>

    <xsl:template match="row" mode="Location">
        <Location>
            <Importer>
                <xsl:value-of select="Importer"/>
            </Importer>
            <Exporter>
                <xsl:value-of select="Exporter"/>
            </Exporter>
            <Origin>
                <xsl:value-of select="Origin"/>
            </Origin>
        </Location>
    </xsl:template>

    <xsl:template match="row" mode="CommercialInformation">
        <CommercialInformation>
            <Imported_reported_quantity>
                <xsl:value-of select="Imported_reported_quantity"/>
            </Imported_reported_quantity>
            <Exported_reported_quantity>
                <xsl:value-of select="Exported_reported_quantity"/>
            </Exported_reported_quantity>
            <Term>
                <xsl:value-of select="Term"/>
            </Term>
            <Unit>
                <xsl:value-of select="Unit"/>
            </Unit>
            <Purpose>
                <xsl:apply-templates select="Purpose" mode="PurposeTranslation"/>
            </Purpose>
            <Source>
                <xsl:value-of select="Source"/>
            </Source>
        </CommercialInformation>
    </xsl:template>

    <xsl:template match="Purpose" mode="PurposeTranslation">
        <xsl:variable name="purpose">
            <xsl:value-of select="."/>
        </xsl:variable>
        <xsl:if test="$purpose = 'B'">
            <xsl:text>BreedingArtificial</xsl:text>
        </xsl:if>
        <xsl:if test="$purpose = 'T'">
            <xsl:text>Commercial</xsl:text>
        </xsl:if>
        <xsl:if test="$purpose = 'E'">
            <xsl:text>Educational</xsl:text>
        </xsl:if>
        <xsl:if test="$purpose = 'G'">
            <xsl:text>BotanicalGarde</xsl:text>
        </xsl:if>
        <xsl:if test="$purpose = 'H'">
            <xsl:text>HuntingTrophy</xsl:text>
        </xsl:if>
        <xsl:if test="$purpose = 'L'">
            <xsl:text>LawEnforcement</xsl:text>
        </xsl:if>
        <xsl:if test="$purpose = 'M'">
            <xsl:text>Medical</xsl:text>
        </xsl:if>
        <xsl:if test="$purpose = 'N'">
            <xsl:text>ReintroductionWild</xsl:text>
        </xsl:if>
        <xsl:if test="$purpose = 'P'">
            <xsl:text>personal</xsl:text>
        </xsl:if>
        <xsl:if test="$purpose = 'Q'">
            <xsl:text>Circus</xsl:text>
        </xsl:if>
        <xsl:if test="$purpose = 'S'">
            <xsl:text>Scientific</xsl:text>
        </xsl:if>
        <xsl:if test="$purpose = 'Z'">
            <xsl:text>Zoo</xsl:text>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>