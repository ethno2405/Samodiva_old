<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="Samodiva.AboutUs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>За нас</title>
    <script type="text/javascript" src="Scripts/animation.js"></script>
    <script type="text/javascript">
            
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="AboutUsText">
        <asp:Literal ID="litAboutUs" runat="server" />
    </div>
        <div style="display:none" id="AboutUs"></div>
    </form>
</body>
</html>
