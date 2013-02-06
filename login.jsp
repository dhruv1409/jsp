
<%@ page errorPage="error.jsp" %>
<%
    String nickname = (String)session.getAttribute("nickname");
    if (nickname != null)
    {
        response.sendRedirect("listrooms.jsp");
    }
%>
<HTML>
  <HEAD>
  <!-- I added those lines =>==============================================
  ===============================================================================-->
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
    <TITLE>
      Secret Chat - Login
    </TITLE>
     <META http-equiv="pragma" content="no-cache">
     <meta name="Author" content="Resm gigahertz@hotmail.com">
     <script language="JavaScript">
     <!--
     if(window.top != window.self)
     {
         window.top.location = window.location;
     }
     //-->
     </script>
     <LINK rel="stylesheet" href="<%=request.getContextPath()%>/chat.css">
     <META name="author" content="Resm gigahertz">
    </HEAD>
    <!-- ====================I change the background so we can't see the freaking white rectangle============-->
    <BODY onLoad="document.login.nickname.focus();">

    <%@ include file="/header.jsp" %>
        <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <TABLE width="40%" border="0" cellspacing="1" cellpadding="1" align="center">
      <%
      String d=request.getParameter("d");
      String n=request.getParameter("n");
      String ic = request.getParameter("ic");

          if (d!=null && d.equals("t"))
          {
      %>
      <TR>
        <TD>
          <TABLE width="100%" border="0" cellspacing="1" cellpadding="1" align="center">
            <TR>
              <TD colspan="2" align="center">
                <SPAN class="error">Nickname exists</SPAN><BR>
              </TD>
            </TR>
                <TR>
              <TD colspan="2">
                Nickname <B><%=n%></B> has already been taken please select some other nick.
              </TD>
            </TR>
          </TABLE>
        </TD>
      </TR>
      <%
        }
        else if (ic!=null && ic.equals("t"))
        {
      %>
      <TR>
        <TD colspan="2">
          <TABLE width="100%" border="0" cellspacing="1" cellpadding="1" align="center">
            <TR>
              <TD colspan="2" align="center">
                <SPAN class="error">Incomplete information</SPAN>
              </TD>
            </TR>
                <TR>
              <TD colspan="2"><font color="white">
                <b>Sex</b> and <b>Nickname</b> must be entered and nickname must be atleast <b>4</b> characters long and must not contain any <b>space</b>.
              </TD>
              </font>
            </TR>
          </TABLE>
        </TD>
      </TR>
      <%
        }
      %>
      <TR>
        <TD colspan="2" class="panel">
          <FORM name="login" method="post" action="<%=request.getContextPath()%>/servlet/login">
            <TABLE width="100%" border="0">
              <TR>
                <TD width="30%" class="white">
                  Nickname
                </TD>
                <TD width="70%">
                  <INPUT type="text" name="nickname" size="15">
                </TD>
              </TR>
              <TR>
                <TD width="30%" class="white">
                  Sex
                </TD>
                <TD width="70%">
                  <SELECT size="1" name="sex">
                    <OPTION value="m">
                      Male
                    </OPTION>
                    <OPTION value="f">
                      Female
                    </OPTION>
                  </SELECT>
                </TD>
              </TR>
              <TR>
                <TD>
                 &nbsp;  
                </TD>
                <TD>
                  <INPUT type="submit" name="Submit" value="Submit">
                </TD>
              </TR>
            </TABLE>
          </FORM>
        </TD>
      </TR>
    </TABLE>
  </BODY>
</HTML>
