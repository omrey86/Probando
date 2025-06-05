<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" encoding="UTF-8" />

  <xsl:template match="/">
    <html>
      <head>
        <title>Vista del feed</title>
      </head>
      <body>
        <h2>
          TITULO: <xsl:value-of select="rss/channel/title"/>
        </h2>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>