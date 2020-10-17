

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/survey">
        <html>
            <body>
                    <h1>1. -> xsl:for-each, xsl:value-of</h1>
                    <table>
                        <tr>
                            <th>Region</th>
                            <th>Location</th>
                            <th>Feature type</th>
                            <th>ROV Dives</th>
                            <th>Area covered (ha)</th>
                            <th>Depth range surveyed (m)</th>
                            <th>Distance from land (km)</th>
                            <th>Shipping activity proxy</th>
                            <th>Items (ha-1)</th>
                        </tr>
                        <xsl:for-each select="isro">
                            <tr>
                                <td>
                                    <xsl:value-of select=" Region" />
                                </td>
                                <td>
                                    <xsl:value-of select=" Location" />
                                </td>
                                <td>
                                    <xsl:value-of select=" FeatureType" />
                                </td>
                                <td>
                                    <xsl:value-of select=" ROVD" />
                                </td>
                                <td>
                                    <xsl:value-of select=" AreaCovered" />
                                </td>
                                <td>
                                    <xsl:value-of select=" DepthRange" />
                                </td>
                                <td>
                                    <xsl:value-of select=" DistanceFromLand" />
                                </td>
                                <td>
                                    <xsl:value-of select=" Shipping" />
                                </td>
                                <td>
                                    <xsl:value-of select=" Items" />
                                </td>
                            </tr>
                        </xsl:for-each>
                    </table>



                    <h1>2. -> xsl:if (Display if region = Indian)</h1>
                    <table>
                        <tr>
                            <th>Region</th>
                            <th>Location</th>
                            <th>Feature type</th>
                            <th>ROV Dives</th>
                            <th>Area covered (ha)</th>
                            <th>Depth range surveyed (m)</th>
                            <th>Distance from land (km)</th>
                            <th>Shipping activity proxy</th>
                            <th>Items (ha-1)</th>
                        </tr>
                        <xsl:for-each select="isro">
                            <xsl:if test="Region='Indian'">
                                <tr>
                                    <td>
                                        <xsl:value-of select=" Region" />
                                    </td>
                                    <td>
                                        <xsl:value-of select=" Location" />
                                    </td>
                                    <td>
                                        <xsl:value-of select=" FeatureType" />
                                    </td>
                                    <td>
                                        <xsl:value-of select=" ROVD" />
                                    </td>
                                    <td>
                                        <xsl:value-of select=" AreaCovered" />
                                    </td>
                                    <td>
                                        <xsl:value-of select=" DepthRange" />
                                    </td>
                                    <td>
                                        <xsl:value-of select=" DistanceFromLand" />
                                    </td>
                                    <td>
                                        <xsl:value-of select=" Shipping" />
                                    </td>
                                    <td>
                                        <xsl:value-of select=" Items" />
                                    </td>
                                </tr>
                            </xsl:if>
                        </xsl:for-each>
                    </table>


  
                    <h1>3. -> xsl:sort (Sort by AreaCovered )</h1>
                    <table>
                        <tr>
                            <th>Region</th>
                            <th>Location</th>
                            <th>Feature type</th>
                            <th>ROV Dives</th>
                            <th>Area covered (ha)</th>
                            <th>Depth range surveyed (m)</th>
                            <th>Distance from land (km)</th>
                            <th>Shipping activity proxy</th>
                            <th>Items (ha-1)</th>
                        </tr>
                        <xsl:for-each select="isro">
                            <xsl:sort select="AreaCovered" />
                            <tr>
                                <td>
                                    <xsl:value-of select=" Region" />
                                </td>
                                <td>
                                    <xsl:value-of select=" Location" />
                                </td>
                                <td>
                                    <xsl:value-of select=" FeatureType" />
                                </td>
                                <td>
                                    <xsl:value-of select=" ROVD" />
                                </td>
                                <td>
                                    <xsl:value-of select=" AreaCovered" />
                                </td>
                                <td>
                                    <xsl:value-of select=" DepthRange" />
                                </td>
                                <td>
                                    <xsl:value-of select=" DistanceFromLand" />
                                </td>
                                <td>
                                    <xsl:value-of select=" Shipping" />
                                </td>
                                <td>
                                    <xsl:value-of select=" Items" />
                                </td>
                            </tr>
                        </xsl:for-each>
                    </table>


 
                    <h1>4. ->xsl:choose ( Violet-Seamount;Red-Bank; Pink-Fracture Zone)</h1>
                    <table>
                        <tr>
                            <th>Region</th>
                            <th>Location</th>
                            <th>Feature type</th>
                            <th>ROV Dives</th>
                            <th>Area covered (ha)</th>
                            <th>Depth range surveyed (m)</th>
                            <th>Distance from land (km)</th>
                            <th>Shipping activity proxy</th>
                            <th>Items (ha-1)</th>
                        </tr>
                        <xsl:for-each select="isro">
                            <xsl:sort select="DistanceFromLand" />
                            <tr>
                                <td>
                                    <xsl:value-of select=" Region" />
                                </td>
                                <td>
                                    <xsl:value-of select=" Location" />
                                </td>
                                <xsl:choose>
                                    <xsl:when test="FeatureType='Seamount'">
                                        <td bgcolor="#F00FF0">
                                            <xsl:value-of select=" FeatureType" />
                                        </td>
                                    </xsl:when>
                                    <xsl:when test="FeatureType='Bank'">
                                        <td bgcolor="#F00B00">
                                            <xsl:value-of select=" FeatureType" />
                                        </td>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <td bgcolor="#FF0FA0">
                                            <xsl:value-of select=" FeatureType" />
                                        </td>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <td>
                                    <xsl:value-of select=" ROVD" />
                                </td>
                                <td>
                                    <xsl:value-of select=" AreaCovered" />
                                </td>
                                <td>
                                    <xsl:value-of select=" DepthRange" />
                                </td>
                                <td>
                                    <xsl:value-of select=" DistanceFromLand" />
                                </td>
                                <td>
                                    <xsl:value-of select=" Shipping" />
                                </td>
                                <td>
                                    <xsl:value-of select=" Items" />
                                </td>
                            </tr>
                        </xsl:for-each>
                    </table>

            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>