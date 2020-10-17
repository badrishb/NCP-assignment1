<?xml version="1.0" encoding="UTF-8"?> 
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"> 
<xsl:template match="/"> 
    <html> 
        <body> 
            <h1 align="center">Survey Results</h1> 
            <table border="3" align="center" > 
                <tr> 
                    <th>Region</th> 
                    <th>Location</th> 
                    <th>Feature type</th> 
                    <th>ROV Dives</th> 
                    <th>Area covered (ha)</th>
                    <th>Depth range surveyed (m)</th>
                    <th>Distance from land (km)</th>
                    <th>Shipping activity proxy</th>
                    <th>Items (per ha)</th>
                </tr> 
                <xsl:for-each select="/survey/isro"> 
                <tr> 
                    <td><xsl:value-of select="region"/></td> 
                    <td><xsl:value-of select="location"/></td> 
                    <td><xsl:value-of select="feature_type"/></td> 
                    <td><xsl:value-of select="ROV_dives"/></td> 
                    <td><xsl:value-of select="area_covered"/></td> 
                    <td><xsl:value-of select="depth_surveyed"/></td> 
                    <td><xsl:value-of select="distance_from_land"/></td> 
                    <td><xsl:value-of select="shipping_activity"/></td> 
                    <td><xsl:value-of select="items"/></td> 
                </tr> 
                </xsl:for-each> 
            </table> 
        </body> 
    </html> 
</xsl:template> 
</xsl:stylesheet> 
