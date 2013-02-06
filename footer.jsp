<DIV align="center">
<CENTER>

    <TR>
        <TD width="100%" align="center"><%
        String n = (String)session.getAttribute("nickname");
        if (n != null && n.length() > 0)
        {
            out.write("<a href=\"logout.jsp\">Logout</a>");
            out.write(" <a href=\"listrooms.jsp\">List of Rooms</a>");
        }
        %> </TD>
    </TR>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<font color="blue">Made By Resm</font>

</CENTER>
</DIV>
