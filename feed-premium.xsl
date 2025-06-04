<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:feedpress="https://feed.press/xmlns" version="1.0">

    <xsl:variable name="freeVersion">false</xsl:variable>

    <xsl:include href="common.xsl" />

    <xsl:template match="/">
        <xsl:element name="html">
            <xsl:copy-of select="$html_TemplateHeader"/>
            <xsl:apply-templates select="rss/channel"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="channel">
        <body onload="checkFeed('{$feedUrl}'); go_decoding(); strip_tags();">
            <div id="cometestme" style="display:none;">
                <xsl:text disable-output-escaping="yes">&amp;amp;</xsl:text>
            </div>
            <div id="feedpress"><a href="https://feedpress.com" target="_blank" title="FeedPress"></a></div>
            <div id="main">
                <div id="header" class="cf">
                    <xsl:apply-templates select="image"/>
                    <xsl:copy-of select="$html_FeedHeader"/>
                </div>
                <xsl:copy-of select="$html_Subscribe"/>
                <ul id="items">
                    <xsl:apply-templates select="item"/>
                </ul>
            </div>
            <xsl:copy-of select="$html_FeedFooterScripts"/>
        </body>
    </xsl:template>

</xsl:stylesheet>
