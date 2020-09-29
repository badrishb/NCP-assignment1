<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/hospital">
		<html>
			<body>
				<h1>
					1. Display all 15 records
				</h1>
				<table border="1">
					<tr>
						<th>
							Patient Name
						</th>
						<th>
							Patient ID
						</th>
						<th>
							Patient age
						</th>
						<th>
							Disease
						</th>
						<th>
							Treating Doctor name
						</th>
						<th>
							Room Number
						</th>
					</tr>
					<xsl:for-each select="patient">
						<tr>
							<td>
								<xsl:value-of select=" patname"/>
							</td>
							<td>
								<xsl:value-of select=" patid"/>
							</td>
							<td>
								<xsl:value-of select=" patage"/>
							</td>
							<td>
								<xsl:value-of select=" disease"/>
							</td>
							<td>
								<xsl:value-of select=" tdname"/>
							</td>
							<td>
								<xsl:value-of select=" roomno"/>
							</td>
						</tr>
					</xsl:for-each>
				</table>
				<h1>
					2.Sort all the records based on patient name
				</h1>
				<table border="1">
					<tr>
						<th>
							Patient Name
						</th>
						<th>
							Patient ID
						</th>
						<th>
							Patient age
						</th>
						<th>
							Disease
						</th>
						<th>
							Treating Doctor name
						</th>
						<th>
							Room Number
						</th>
					</tr>
						<xsl:for-each select="patient">
							<xsl:sort select="patname"/>
							<tr>
								<td>
									<xsl:value-of select=" patname"/>
								</td>
								<td>
									<xsl:value-of select=" patid"/>
								</td>
								<td>
									<xsl:value-of select=" patage"/>
								</td>
								<td>
									<xsl:value-of select=" disease"/>
								</td>
								<td>
									<xsl:value-of select=" tdname"/>
								</td>
								<td>
									<xsl:value-of select=" roomno"/>
								</td>
							</tr>

						</xsl:for-each>
				</table>
				<h1>
					3.Display all patient records in blue colour if patient age is greater than 50. Else display in red colour
				</h1>
				<table border="1">
					<tr>
						<th>
							Patient Name
						</th>
						<th>
							Patient ID
						</th>
						<th>
							Patient age
						</th>
						<th>
							Disease
						</th>
						<th>
							Treating Doctor name
						</th>
						<th>
							Room Number
						</th>
					</tr>
					<xsl:for-each select="patient">
						<xsl:choose>
							<xsl:when test="patage>50">
								<tr bgcolor="#99FFFF">
									<td>
										<xsl:value-of select=" patname"/>
									</td>
									<td>
										<xsl:value-of select=" patid"/>
									</td>
									<td>
										<xsl:value-of select=" patage"/>
									</td>
									<td>
										<xsl:value-of select=" disease"/>
									</td>
									<td>
										<xsl:value-of select=" tdname"/>
									</td>
									<td>
										<xsl:value-of select=" roomno"/>
									</td>	
								</tr>
							</xsl:when>
							<xsl:otherwise>
								<tr bgcolor="#FFA07A">
									<td>
										<xsl:value-of select=" patname"/>
									</td>
									<td>
										<xsl:value-of select=" patid"/>
									</td>
									<td>
										<xsl:value-of select=" patage"/>
									</td>
									<td>
										<xsl:value-of select=" disease"/>
									</td>
									<td>
										<xsl:value-of select=" tdname"/>
									</td>
									<td>
										<xsl:value-of select=" roomno"/>
									</td>
								</tr>
								
							</xsl:otherwise>
							
						</xsl:choose>
					</xsl:for-each>
				</table>
			</body>
		</html>
</xsl:template>
</xsl:stylesheet>