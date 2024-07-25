<?xml version="1.0" encoding="UTF-8" ?>
<!--
   New Perspectives on XML, 3rd Edition
   Tutorial 5
   Case Problem 4

   Cairn Camping Store XSLT Style Sheet
   Author: Melissa Coates
   Date:   7/24/2024

   Filename:         camping.xsl
   Supporting Files: 
-->

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Output method for HTML5 -->
    <xsl:output method="html" indent="yes"/>

    <!-- Template for the root element -->
    <xsl:template match="/">
        <!DOCTYPE html>
        <html>
            <head>
                <title>Cairn Camping Store Report</title>
                <link rel="stylesheet" type="text/css" href="camping.css"/>
            </head>
            <body>
                <h1>Cairn Camping Store</h1>
                <xsl:apply-templates select="customers/customer">
                    <xsl:sort select="name" order="ascending" />
                </xsl:apply-templates>
            </body>
        </html>
    </xsl:template>

    <!-- Template for each customer -->
    <xsl:template match="customer">
        <h2>Customer ID: <xsl:value-of select="@cid" /></h2>
        <table class="customer-table">
            <tr>
                <th>Name</th>
                <th>Address</th>
                <th>Customer ID</th>
            </tr>
            <tr>
                <td><xsl:value-of select="name" /></td>
                <td>
                    <xsl:value-of select="street" /><br />
                    <xsl:value-of select="city" />, <xsl:value-of select="state" /> <xsl:value-of select="zip" />
                </td>
                <td><xsl:value-of select="@cid" /></td>
            </tr>
        </table>
        <xsl:apply-templates select="orders/order">
            <xsl:sort select="@oid" order="descending" />
        </xsl:apply-templates>
    </xsl:template>

    <!-- Template for each order -->
    <xsl:template match="order">
        <h3>Order ID: <xsl:value-of select="@oid" /> - Date: <xsl:value-of select="date" /></h3>
        <table class="order-table">
            <tr>
                <th>Item ID</th>
                <th>Description</th>
                <th>Quantity</th>
            </tr>
            <xsl:apply-templates select="item">
                <xsl:sort select="qty" data-type="number" order="descending" />
                <xsl:sort select="@iid" order="ascending" />
            </xsl:apply-templates>
        </table>
    </xsl:template>

    <!-- Template for each item -->
    <xsl:template match="item">
        <tr>
            <td><xsl:value-of select="@iid" /></td>
            <td><xsl:value-of select="description" /></td>
            <td><xsl:value-of select="qty" /></td>
        </tr>
    </xsl:template>

</xsl:stylesheet>
