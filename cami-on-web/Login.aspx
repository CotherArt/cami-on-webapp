<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="cami_on_web.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #Button1 {
            height: 21px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            User:<asp:TextBox ID="tbUsuario" runat="server"></asp:TextBox>
            <br />
            Password:<asp:TextBox ID="tbPassword" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Log-in" />
            <br />
            </div>
    </form>
    <p>
        &nbsp;</p>
</body>
</html>
