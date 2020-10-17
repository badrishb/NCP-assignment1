<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/bank">
		<html>
			<body>
				<h1>
					1. Display all customer details
				</h1>
				<table border="1">
					<tr>
						<th>
							Customer ID
						</th>
						<th>
							Customer name
						</th>
						<th>
							Customer age
						</th>
						<th>
							Customer gender
						</th>
						<th>
							Customer address
						</th>
						<th>
							Customer Branch
						</th>
					</tr>
					<xsl:for-each select="customer/custdetails">
						<tr>
							<td>
								<xsl:value-of select=" custid"/>
							</td>
							<td>
								<xsl:value-of select=" custname"/>
							</td>
							<td>
								<xsl:value-of select=" custage"/>
							</td>
							<td>
								<xsl:value-of select=" custgen"/>
							</td>
							<td>
								<xsl:value-of select=" custadd"/>
							</td>
							<td>
								<xsl:value-of select=" custbranch"/>
							</td>
						</tr>
					</xsl:for-each>
				</table>
				
				<h1>
					1. Display all customer transaction data
				</h1>
				<table border="1">
					<tr>
						<th>
							Withdrawal amount
						</th>
						<th>
							Balance before
						</th>
						<th>
							Balance after
						</th>
						<th>
							Date of withdrawal
						</th>
					
					</tr>
					<xsl:for-each select="customer/custtransac/allwith/with">
						<tr>
							<td>
								<xsl:value-of select=" withamt"/>
							</td>
							<td>
								<xsl:value-of select=" wbalbef"/>
							</td>
							<td>
								<xsl:value-of select=" wbalaft"/>
							</td>
							<td>
								<xsl:value-of select=" wdate"/>
							</td>
			
						</tr>
					</xsl:for-each>
				</table>
				<h1>
					1. Display all customer account data
				</h1>
				<table border="1">
					<tr>
						<th>
							Account type
						</th>
						<th>
							Accout start
						</th>
						<th>
							Account Balance
						</th>
						<th>
							Loans taken
						</th>

					</tr>
					<xsl:for-each select="customer/custacc">
						<tr>
							<td>
								<xsl:value-of select=" acctype"/>
							</td>
							<td>
								<xsl:value-of select=" accstart"/>
							</td>
							<td>
								<xsl:value-of select=" accbal"/>
							</td>
							<td>
								<xsl:value-of select=" accloans"/>
							</td>

						</tr>
					</xsl:for-each>
				</table>
				<h1>
					2.Sort all customer account details by name
				</h1>
				<table border="1">
					<tr>
						<th>
							Customer ID
						</th>
						<th>
							Customer Name
						</th>
						<th>
							Customer age
						</th>
						<th>
							Customer Gender
						</th>
						<th>
							Customer address
						</th>
						<th>
							Customer branch
						</th>
					</tr>
					<xsl:for-each select="customer/custdetails">
						<xsl:sort select="custname"/>
						<tr>
							<td>
								<xsl:value-of select=" custid"/>
							</td>
							<td>
								<xsl:value-of select=" custname"/>
							</td>
							<td>
								<xsl:value-of select=" custage"/>
							</td>
							<td>
								<xsl:value-of select=" custgen"/>
							</td>
							<td>
								<xsl:value-of select=" custadd"/>
							</td>
							<td>
								<xsl:value-of select=" custbranch"/>
							</td>
						</tr>

					</xsl:for-each>
				</table>
				<h1>
					3.Display all customer details in blue colour if customer age is greater than 50. Else display in red colour
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
					<xsl:for-each select="customer/custdetails">
						<xsl:choose>
							<xsl:when test="custage>=20">
								<tr bgcolor="#99FFFF">
									<td>
										<xsl:value-of select=" custid"/>
									</td>
									<td>
										<xsl:value-of select=" custname"/>
									</td>
									<td>
										<xsl:value-of select=" custage"/>
									</td>
									<td>
										<xsl:value-of select=" custgen"/>
									</td>
									<td>
										<xsl:value-of select=" custadd"/>
									</td>
									<td>
										<xsl:value-of select=" custbranch"/>
									</td>
								</tr>
							</xsl:when>
							<xsl:otherwise>
								<tr bgcolor="#FFA07A">
									<td>
										<xsl:value-of select=" custid"/>
									</td>
									<td>
										<xsl:value-of select=" custname"/>
									</td>
									<td>
										<xsl:value-of select=" custage"/>
									</td>
									<td>
										<xsl:value-of select=" custgen"/>
									</td>
									<td>
										<xsl:value-of select=" custadd"/>
									</td>
									<td>
										<xsl:value-of select=" custbranch"/>
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