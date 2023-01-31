<!--#include file="./templates/header.asp"-->

<link rel="stylesheet" type="text/css" href="./assets/css/doc.css">

<h3>Document Lists</h3>



<%

set cn= server.createobject("adodb.connection")
cn.connectionstring="Driver={MySQL ODBC 8.0 UNICODE Driver}; Server=localhost; Database=arram_dms; User=root; Password=root; Port=3306; Option=3;"
cn.open

set rs =server.createobject("adodb.recordset")
rs.open "SELECT * FROM doc_master", cn

If Not rs.EOF Then
        Response.Write("<table>")
        Response.Write("<tr>")
        For Each x In rs.Fields
            Response.Write("<th>" & x.Name & "</th>")
        Next
        Response.Write("</tr>")
        Do While Not rs.EOF
            Response.Write("<tr>")
            For Each x In rs.Fields
                Response.Write("<td>" & x.Value & "</td>")
            Next
            Response.Write("</tr>")
            rs.MoveNext
        Loop
        Response.Write("</table>")
    Else
        Response.Write("No data found.")
    End If
    rs.Close
    Set rs = Nothing
    
    Set conn = Nothing

%>


<!--#include file="./templates/footer.asp"-->