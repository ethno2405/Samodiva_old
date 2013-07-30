<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true"
    CodeBehind="EditCatogories.aspx.cs" Inherits="Samodiva.Admin.Content.EditCatogories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="phAdminHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phAdminContent" runat="server">
    <asp:ListView ID="ListViewCategories" runat="server" DataSourceID="dsCategory" DataKeyNames="Id"
        InsertItemPosition="LastItem" OnItemInserting="ListViewCategories_ItemInserting" OnItemUpdating="ListViewCategories_ItemEditing">
        <AlternatingItemTemplate>
            <span style="">Name:
                <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                <br />
                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                <br />
                <br />
            </span>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <span style="">Name:
                <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                <asp:RequiredFieldValidator ID="rfvNameTextBox" runat="server" ControlToValidate="NameTextBox"
                    Display="Dynamic" ValidationGroup="RequiredOnEdit" ErrorMessage="This is requred!"></asp:RequiredFieldValidator>
                <br />
                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                <br />
                <br />
            </span>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <span>No data was returned.</span>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <span style="">Name:
                <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                <asp:RequiredFieldValidator ID="rfvNameTextBox" runat="server" ControlToValidate="NameTextBox"
                    Display="Dynamic" ValidationGroup="RequiredOnAdd" ErrorMessage="This is requred!"></asp:RequiredFieldValidator>
                <br />
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                <br />
                <br />
            </span>
        </InsertItemTemplate>
        <ItemTemplate>
            <span style="">Name:
                <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                <br />
                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                <br />
                <br />
            </span>
        </ItemTemplate>
        <LayoutTemplate>
            <div id="itemPlaceholderContainer" runat="server" style="">
                <span runat="server" id="itemPlaceholder" />
            </div>
            <div style="">
            </div>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <span style="">Name:
                <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                <br />
                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                <br />
                <br />
            </span>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:EntityDataSource ID="dsCategory" runat="server" ConnectionString="name=SamodivaDBEntities"
        DefaultContainerName="SamodivaDBEntities" EnableFlattening="False" EntitySetName="Categories"
        EntityTypeFilter="Category" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
    </asp:EntityDataSource>
</asp:Content>
