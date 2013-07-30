<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Samodiva.Admin.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="phAdminHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phAdminContent" runat="server">
    <asp:LoginView ID="lvAdmin" runat="server">
    <AnonymousTemplate>
        <asp:Login ID="LoginForm" runat="server" RememberMeSet="false" DisplayRememberMe="false" OnAuthenticate="Login_Authenticate" DestinationPageUrl="~/Admin/Default.aspx">
        </asp:Login>
    </AnonymousTemplate>
    <LoggedInTemplate>
        <h5 style="font-size:2em; display:table; margin:10px auto;">Wellcome to Samodiva's admin panel</h5>
        <br />
        <h3 style="font-size:1em;">Options:</h3>
        <br />
        <asp:ListView runat="server" DataSourceID="EntityDataSourceOptions" DataKeyNames="Id" InsertItemPosition="LastItem" OnItemUpdated="Unnamed_ItemUpdated" OnItemInserted="Unnamed_ItemInserted"
            OnItemDeleted="Unnamed_ItemDeleted">
            <AlternatingItemTemplate>
                <span style="">
                    Key:
                    <asp:Label Text='<%# Eval("Key") %>' runat="server" ID="KeyLabel" /><br />
                    Value:
                    <asp:Label Text='<%# Eval("Value") %>' runat="server" ID="ValueLabel" /><br />
                    <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton" />
                    <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="DeleteButton" />
                    <br />
                    <br />
                </span>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <span style="">
                    Key:
                    <asp:TextBox Text='<%# Bind("Key") %>' runat="server" ID="KeyTextBox" /><br />
                    Value:
                    <asp:TextBox Text='<%# Bind("Value") %>' runat="server" ID="ValueTextBox" /><br />
                    <asp:Button runat="server" CommandName="Update" Text="Update" ID="UpdateButton" /><asp:Button runat="server" CommandName="Cancel" Text="Cancel" ID="CancelButton" /><br />
                </span>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <span>No data was returned.</span>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <span style="">
                    Key:
                    <asp:TextBox Text='<%# Bind("Key") %>' runat="server" ID="KeyTextBox" /><br />
                    Value:
                    <asp:TextBox Text='<%# Bind("Value") %>' runat="server" ID="ValueTextBox" /><br />
                    <asp:Button runat="server" CommandName="Insert" Text="Insert" ID="InsertButton" /><asp:Button runat="server" CommandName="Cancel" Text="Clear" ID="CancelButton" /><br />
                </span>
            </InsertItemTemplate>
            <ItemTemplate>
                <span style="">
                    Key:
                    <asp:Label Text='<%# Eval("Key") %>' runat="server" ID="KeyLabel" /><br />
                    Value:
                    <asp:Label Text='<%# Eval("Value") %>' runat="server" ID="ValueLabel" /><br />
                    <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton" />
                    <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="DeleteButton" />
                    <br />
                    <br />
                </span>
            </ItemTemplate>
            <LayoutTemplate>
                <div runat="server" id="itemPlaceholderContainer" style=""><span runat="server" id="itemPlaceholder" /></div>
                <div style="">
                </div>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <span style="">
                    Key:
                    <asp:Label Text='<%# Eval("Key") %>' runat="server" ID="KeyLabel" /><br />
                    Value:
                    <asp:Label Text='<%# Eval("Value") %>' runat="server" ID="ValueLabel" /><br />
                    <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton" />
                    <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="DeleteButton" />
                    <br />
                    <br />
                </span>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:EntityDataSource runat="server" ID="EntityDataSourceOptions" ConnectionString="name=SamodivaDBEntities" DefaultContainerName="SamodivaDBEntities" EnableFlattening="False" EntitySetName="Options" EntityTypeFilter="Option" EnableDelete="True" EnableInsert="True" EnableUpdate="True"></asp:EntityDataSource>
    </LoggedInTemplate>
    </asp:LoginView>
</asp:Content>
