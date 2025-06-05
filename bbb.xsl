<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>Vista del feed</title>
        <style type="text/css">
          body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            color: #333;
            padding: 20px;
          }
          h2 {
            color: #2c3e50;
            border-bottom: 2px solid #3498db;
            padding-bottom: 5px;
          }
          .item {
            background: white;
            margin: 15px 0;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
          }
          .item-title {
            font-size: 1.2em;
            font-weight: bold;
            color: #2980b9;
          }
          .item-date {
            font-size: 0.9em;
            color: #888;
          }
          .item-description {
            margin-top: 10px;
          }
        </style>
      </head>
      <body>
        <h2>
          TITULO: <xsl:value-of select="rss/channel/title"/>
        </h2>

        <!-- Ejemplo para mostrar ítems del feed -->
        <xsl:for-each select="rss/channel/item">
          <div class="item">
            <div class="item-title">
              <xsl:value-of select="title"/>
            </div>
            <div class="item-date">
              <xsl:value-of select="pubDate"/>
            </div>
            <div class="item-description">
              <xsl:value-of select="description"/>
            </div>
          </div>
        </xsl:for-each>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>