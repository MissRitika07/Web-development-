<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        <html lang="en">
            <head>
                <meta charset="UTF-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <title>experiment13 - Student Application</title>
                <style>
                    body { font-family: Arial, sans-serif; background: #f4f7fb; padding: 30px; }
                    .wrapper { max-width: 1000px; margin: 0 auto; }
                    h1 { color: #333; }
                    table { width: 100%; border-collapse: collapse; margin-top: 20px; }
                    th, td { border: 1px solid #ccc; padding: 12px 14px; }
                    th { background: #0066cc; color: #fff; text-align: left; }
                    tr:nth-child(even) { background: #eef3fb; }
                    .label { font-weight: bold; margin-top: 24px; }
                    .badge { background: #2f855a; color: white; padding: 4px 10px; border-radius: 12px; }
                    .remarks-excellent { color: #2f855a; font-weight: bold; }
                    .remarks-good { color: #3182ce; font-weight: bold; }
                    .remarks-improve { color: #c05621; font-weight: bold; }
                </style>
            </head>
            <body>
                <div class="wrapper">
                    <h1>experiment13: Student Application using XSLT</h1>
                    <p>This example uses XSLT to transform XML student records into an HTML report with conditional remarks.</p>

                    <div class="label">Class Summary</div>
                    <ul>
                        <li>Total students: <xsl:value-of select="count(class/student)"/></li>
                        <li>Distinction students (90+): <xsl:value-of select="count(class/student[marks &gt;= 90])"/></li>
                        <li>Average marks: <xsl:value-of select="format-number(sum(class/student/marks) div count(class/student), '0.0')"/></li>
                    </ul>

                    <table>
                        <thead>
                            <tr>
                                <th>Roll No</th>
                                <th>First Name</th>
                                <th>Last Name</th>
                                <th>Nickname</th>
                                <th>Department</th>
                                <th>Marks</th>
                                <th>Remarks</th>
                            </tr>
                        </thead>
                        <tbody>
                            <xsl:for-each select="class/student">
                                <tr>
                                    <td><span class="badge"><xsl:value-of select="@rollno"/></span></td>
                                    <td><xsl:value-of select="firstname"/></td>
                                    <td><xsl:value-of select="lastname"/></td>
                                    <td><xsl:value-of select="nickname"/></td>
                                    <td><xsl:value-of select="department"/></td>
                                    <td><xsl:value-of select="marks"/></td>
                                    <td>
                                        <xsl:choose>
                                            <xsl:when test="marks &gt;= 90">
                                                <span class="remarks-excellent">Excellent</span>
                                            </xsl:when>
                                            <xsl:when test="marks &gt;= 80">
                                                <span class="remarks-good">Very Good</span>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <span class="remarks-improve">Needs Improvement</span>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </tbody>
                    </table>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
