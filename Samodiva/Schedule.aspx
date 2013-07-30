<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Schedule.aspx.cs" Inherits="Samodiva.Schedule" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>График</title>
    <script type="text/javascript" src="Scripts/animation.js"></script>
    <script type="text/javascript">

    </script>
</head>
<body>
    <form runat="server">
        <div class="ScheduleText">
            <asp:Literal ID="litSchedule" runat="server"></asp:Literal>
        </div>
        <div style="display:none" id="Schedule"></div>
    </form>
</body>
</html>
