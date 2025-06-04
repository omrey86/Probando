<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:itunes="http://www.itunes.com/dtds/podcast-1.0.dtd">

  <xsl:output method="html" encoding="UTF-8" indent="yes" />

  <xsl:template match="/">
    <html>
      <head>
        <title>
          <xsl:value-of select="rss/channel/title" />
        </title>
        <style>
          body { font-family: sans-serif; max-width: 800px; margin: auto; }
          img { max-width: 100%; height: auto; margin: 20px 0; }
          .episode { margin: 20px 0; padding: 10px; border-bottom: 1px solid #ccc; }
          .episode h3 { margin-bottom: 5px; }
          audio { width: 100%; margin-top: 5px; }
        </style>
      </head>
      <body>
        <h1><xsl:value-of select="rss/channel/title" /></h1>
        
        <!-- Imagen del podcast (usando etiqueta itunes:image o media:thumbnail) -->
        <xsl:choose>
          <xsl:when test="rss/channel/itunes:image">
            <img>
              <xsl:attribute name="src">
                <xsl:value-of select="rss/channel/itunes:image/@href" />
              </xsl:attribute>
              <xsl:attribute name="alt">
                <xsl:value-of select="rss/channel/title" />
              </xsl:attribute>
            </img>
          </xsl:when>
        </xsl:choose>

        <!-- Episodios -->
        <xsl:for-each select="rss/channel/item">
          <div class="episode">
            <h3><xsl:value-of select="title" /></h3>
            <div><xsl:value-of select="description" disable-output-escaping="yes" /></div>
            <xsl:if test="enclosure/@url">
              <audio controls>
                <xsl:attribute name="src">
                  <xsl:value-of select="enclosure/@url" />
                </xsl:attribute>
              </audio>
            </xsl:if>
          </div>
        </xsl:for-each>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>