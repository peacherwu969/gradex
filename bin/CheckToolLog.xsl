<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:template match="/">

     <html>
     <body bgcolor="Lightyellow">

     <center>
     <u>
     <h1>Check Tool Log</h1>
     </u>
     </center>
     
     <u>
     <h2>Checking start point</h2>
     </u>
     <p>
     <dd /><xsl:value-of select="CHECK-TOOL-LOG/CHECK-START-OBJECT/ID"/>
     </p>
     
     <u>
     <h2>Totals</h2>
     </u>
     <p>
     <dd />Objects checked : <xsl:value-of select="CHECK-TOOL-LOG/TOTALS/OBJECTS-CHECKED"/>
     </p>
     <p>
     <dd />Errors found : <xsl:value-of select="CHECK-TOOL-LOG/TOTALS/ERRORS-FOUND"/>
     </p>
     
     
     <!-- Check if there are any errors -->
     <xsl:if test="CHECK-TOOL-LOG/TOTALS/ERRORS-FOUND &gt; 0">

     <!-- Add table of errors if there are any -->
     <u>
     <h2>Error details</h2>
     </u>

          <center>
          <table bgcolor="Azure" width="95%" border="2" cellpadding="5">
          <tr bgcolor="Skyblue">
               <th width="20%">Identifier</th>
               <th width="40%">Error(s)</th>                    
               <th>URL</th>
          </tr>
          
          <xsl:for-each select="CHECK-TOOL-LOG/ERRONEOUS-OBJECT">
          <tr>
               <!-- THIS IS A HYPER LINK TO THE ERROR NODE.
                COULD BE USED IF LOG WAS VIEWED FROM WITHIN
                GRADEX ON AN HTML PANEL TO JUMP STRAIGHT THE THE ERROR NODE
                <td><A HREF="{URL}"><xsl:value-of select="ID"/></A></td> -->
                
               <!-- Append the identifier for the error if the tag is not empty -->
               <xsl:choose>
                    <xsl:when test="ID[.!='']">
                        <td><xsl:value-of select="ID"/></td>
                    </xsl:when>
                    <xsl:otherwise>
                        <td>Information not available</td>
                    </xsl:otherwise>                    
               </xsl:choose>

                              
               <!-- Add the errors as a numbered list -->
               <td>
               <ol>
                    <xsl:for-each select="ERRORS">
                         <xsl:apply-templates/>
                    </xsl:for-each>
               </ol>
               </td>
               
               <!-- Append the URL for the error if the tag is not empty -->
               <xsl:choose>
                    <xsl:when test="URL[.!='']">
                        <td><xsl:value-of select="URL"/></td>
                    </xsl:when>
                    <xsl:otherwise>
                        <td>Information not available</td>
                    </xsl:otherwise>                    
               </xsl:choose>
          </tr>
          </xsl:for-each>
          </table>
          </center>
     
     
     </xsl:if>

     </body>
     </html>
</xsl:template>

<!-- Add the numbered error -->
<xsl:template match="ERROR-MESSAGE">
  <li><xsl:apply-templates/></li>
</xsl:template>                    

</xsl:stylesheet>