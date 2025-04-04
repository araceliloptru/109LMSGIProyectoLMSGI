<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="#all"
    expand-text="yes"
    version="3.0">
    <xsl:output method="html" indent="yes"/>  
    <xsl:template match="/pedido">
        <html>
            <head> 
                <title>Pedido Araceli López Trujillo</title>
                <meta charset="UTF-8"/>
            </head>
            <body>
            <header>
                <h1></h1>
                <h2>Fecha:<xsl:value-of select="dia/fecha/anyo"/></h2>
                <h2>Fabricante:</h2>
                </header>
                <main>
                <h2></h2>
                <div></div>
                </main>

            </body>
            
        </html>
        </xsl:template>

</xsl:stylesheet>