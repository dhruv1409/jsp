

<%@ page session="true" errorPage="error.jsp" import="java.util.Set,java.util.Iterator,java.util.Map,sukhwinder.chat.*"%>
<HTML>
<HEAD>
<TITLE>Select Room</TITLE>
<LINK rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/chat.css">
<meta name="Author" content="Resm gigahertz@hotmail.com">
<SCRIPT language="JavaScript">
     <!--
     if(window.top != window.self)
     {
         window.top.location = window.location;
     }
     //-->
</SCRIPT>
 <link rel="shortcut icon" href="favicon.ico">
    <link href='http://fonts.googleapis.com/css?family=Henny+Penny' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Press+Start+2P' rel='stylesheet' type='text/css'>
    <style>
        html {
        background: url(back2.jpg) no-repeat center center fixed;
        -webkit-background-size: cover;
        -moz-background-size: cover;
        -o-background-size: cover;
        background-size: cover;
        }
        td {
          font-family: 'Press Start 2P', serif;
          font-size: 15px;
          text-shadow: 5px 5px 5px #aaa;
        }
    </style>
</HEAD>

<BODY>
<%


String nickname = (String)session.getAttribute("nickname");
if (nickname == null || nickname == "")
{
    response.sendRedirect("login.jsp");
    //System.out.println("Redirecting");
}
else
{
    String roomname = request.getParameter("rn");
    String descr = request.getParameter("sd");
    boolean see = false;
    if (descr != null && descr.equals("y"))
    {
        see = true;
    }
%>
<%@ include file="header.jsp" %>
<TABLE width="80%" align="center">
    <tr>
    <br>
    <br>
    <br>
    <br>
        <td class="normal" style="margin-left:20px;text-align:center"><font color="white">Hello </font><span class="chattername"><%=nickname%></span></td>
    </tr>
    <br>

    <TR>
        <TD width="100%" style="margin-left:20px;text-align:center"><font color="white">Select the Secret_Room to participate in the discussion.</font></TD>
    </TR>
</TABLE>
<BR>
<font color="white">
    <%


        try
        {
            ChatRoomList roomlist = (ChatRoomList)application.getAttribute("chatroomlist");
            ChatRoom[] chatrooms = roomlist.getRoomListArray();
            if(roomname == null)
            {
                roomname = roomlist.getRoomOfChatter(nickname).getName();
            }
            roomname = roomname.trim();

    %>
<DIV align="center">
<CENTER>
    <FORM name="chatrooms" action="<%=request.getContextPath()%>/start.jsp" method="post">
    <TABLE width="80%" border="1" cellspacing="1" cellpadding="1" align="center">
    <TR>
    <TD colspan="2" class="pagetitle">Room List</TD>
    </TR>
    <%
            for (int i = 0; i < chatrooms.length; i++)
            {
                if (chatrooms[i].getName().equalsIgnoreCase("StartUp"))
                    continue;
    %>
        <TR>
        <TD width="50%"><font color="white">
        <INPUT type=radio name="rn" value="<%=chatrooms[i].getName()%>"
        <%if (chatrooms[i].getName().equals(roomname))
            out.write("checked");%>><%=chatrooms[i].getName()%></A>
            </font>
        </TD>
    <%
                if (see == true && chatrooms[i].getName().equals(roomname))
                {
    %>
            <TD width="50%"><font color="white"><%=chatrooms[i].getDescription()%></font></TD>
    <%
                }
                else
                {
    %>
            <TD width="50%"><font color="white"><A href="<%=request.getContextPath()%>/listrooms.jsp?rn=<%=chatrooms[i].getName()%>&sd=y">View Description</A></font></TD>
    <%
                }
    %>
        </TR>
    <%
            }
        }
        catch (Exception e)
        {
            System.out.println("Unable to get handle to Servlet Context: " + e.getMessage());
            e.printStackTrace();
        }
%>
<TR>

    <TD><INPUT type="Submit" value="Start"></TD>
</TR>
</TABLE>
</FORM>
</CENTER>
</DIV>
<%
    }
%>
<%@ include file="/footer.jsp"%>
</font>
</BODY>
</HTML>
