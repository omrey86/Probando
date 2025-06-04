<?xml version="1.0" encoding="UTF-8"?>

<!-- Declaración de la hoja de estilos XSLT -->
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:itunes="http://www.itunes.com/dtds/podcast-1.0.dtd">

  <!-- Define el tipo de salida: HTML, con codificación UTF-8 e indentación -->
  <xsl:output method="html" encoding="UTF-8" indent="yes" />

  <!-- Plantilla principal que se aplica al nodo raíz (/) -->
  <xsl:template match="/">
    <html>
      <head>
        <title>
          <!-- Extrae el título del canal RSS y lo usa como título de la página -->
          <xsl:value-of select="rss/channel/title" />
        </title>

        <!-- Estilos CSS embebidos para el formato visual -->
        <style>
          body { font-family: sans-serif; max-width: 800px; margin: auto; }
          img { max-width: 100%; height: auto; margin: 20px 0; }
          .episode { margin: 20px 0; padding: 10px; border-bottom: 1px solid #ccc; }
          .episode h3 { margin-bottom: 5px; }
          audio { width: 100%; margin-top: 5px; }
        </style>
      </head>

      <body>
      	<p>¿Título? <xsl:value-of select="rss/channel/title" /></p>
        <!-- Título principal de la página, tomado del título del canal -->
        <h1><xsl:value-of select="rss/channel/title" /></h1>
        
        <!-- Imagen del podcast (verifica si existe la etiqueta itunes:image) -->
        <xsl:choose>
          <xsl:when test="rss/channel/itunes:image">
            <img>
              <!-- Atributo src con la URL de la imagen del podcast -->
              <xsl:attribute name="src">
                <xsl:value-of select="rss/channel/itunes:image/@href" />
              </xsl:attribute>
              <!-- Atributo alt con el título del podcast como texto alternativo -->
              <xsl:attribute name="alt">
                <xsl:value-of select="rss/channel/title" />
              </xsl:attribute>
            </img>
          </xsl:when>
        </xsl:choose>

        <!-- Bucle que recorre todos los ítems del canal (los episodios) -->
        <xsl:for-each select="rss/channel/item">
          <div class="episode">
            <!-- Título del episodio -->
            <h3><xsl:value-of select="title" /></h3>

            <!-- Descripción del episodio, permitiendo contenido HTML interno -->
            <div><xsl:value-of select="description" disable-output-escaping="yes" /></div>

            <!-- Si existe una URL de archivo de audio (enclosure), se muestra un reproductor -->
            <xsl:if test="enclosure/@url">
<xsl:if test="enclosure/@url">
  <xsl:element name="audio">
    <xsl:attribute name="controls" />
    <xsl:attribute name="src">
      <xsl:value-of select="enclosure/@url" />
    </xsl:attribute>
  </xsl:element>
</xsl:if>
            </xsl:if>
          </div>
        </xsl:for-each>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>