<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="#all"
                expand-text="yes"
                version="3.0">
    <xsl:param name="corregido" select="'no'"/>
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/examen">
        <html>
            <head> 
                <title> XSLT - Ticket Araceli López Trujillo</title>
                <meta charset="UTF-8"/>
            </head>
            <body>
                <header>
                    <h1><xsl:value-of select="datos/nombreCiclo"/></h1>
                    <h2><xsl:value-of select="document('../input/modulosdaw1.xml')/modulos/modulo[@codM=current()/datos/nombreModulo]"/></h2>
                    <h3>Fecha: <xsl:value-of select="datos/fecha/dia"/>
                        de <xsl:value-of select="document('../input/meses.xml')/meses/mes[@id=current()/datos/fecha/mes]"/> de <xsl:value-of select="datos/fecha/anyo"/>
                    </h3>
                </header>
                <main>
                    <form action="text.php" method="GET">
                        <xsl:for-each select="preguntas/pregunta">
                            <div class="pregunta">
                                <div><xsl:value-of select="@id"/>.-
                                    <xsl:value-of select="enunciado"/></div>
                                <xsl:for-each select="respuestas/respuesta">
                                    <div>
                                        <label>
                                            <xsl:element name="input">
                                                <xsl:attribute name="type" select="'radio'"/>
                                                <xsl:attribute name="name" select="concat('p',../@id)"/>
                                                <xsl:attribute name="value" select="position()"/>
                                                <xsl:if test="$corregido='si' and @correcta='correcta'">
                                                    <xsl:attribute name="checked"/>
                                                </xsl:if>
                                                <xsl:if test="$corregido='si'">
                                                    <xsl:attribute name="disabled"/>
                                                </xsl:if>
                                            </xsl:element>
                                            <xsl:value-of select="./text()"/>
                                        </label>
                                    </div>
                                </xsl:for-each>
                                <div>
                                </div>
                            </div>
                        </xsl:for-each>
                    </form>
                </main>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>