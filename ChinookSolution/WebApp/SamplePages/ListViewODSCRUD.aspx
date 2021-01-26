<%@ Page Title="ListViewODSCRUDS" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListViewODSCRUD.aspx.cs" Inherits="WebApp.SamplePages.ListViewODSCRUD" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Single record CRUD using ODS: ListView</h1>
    <div class="row">
        <div class="offset-2">
            <blockquote class="alert alert-info">
                This sample will use asp:ListView Control <br />
                This sample will use ODS for Listview control <br />
                This sample will use minimal code behind<br />
                This sample will use the course MessageUserControl for error handling<br />
                This sample will use validation on the listview control
            </blockquote>
        </div>
    </div>
    <div class="row">
        <%-- REMINDER: TO use the attribute DataKeyNames to get the DELETE 
            function of your listview crud to work
            
            The DataKeyNames attribute is set to your pkey field--%>
        <asp:ListView ID="AlbumList" 
            runat="server" 
            DataSourceID="AlbumListODS" 
            InsertItemPosition="FirstItem"
            DataKeyNames="AlbumId">
            <AlternatingItemTemplate>
                <tr style="background-color: #FFFFFF; color: #284775;">
                    <td>
                        <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="DeleteButton" />
                        <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton" />
                    </td>
                    <td>
                        <asp:Label Text='<%# Eval("AlbumId") %>' runat="server" ID="AlbumIdLabel" /></td>
                    <td>
                        <asp:Label Text='<%# Eval("Title") %>' runat="server" ID="TitleLabel" /></td>
                    <td>
                        <asp:Label Text='<%# Eval("ArtistId") %>' runat="server" ID="ArtistIdLabel" /></td>
                    <td>
                        <asp:Label Text='<%# Eval("ReleaseYear") %>' runat="server" ID="ReleaseYearLabel" /></td>
                    <td>
                        <asp:Label Text='<%# Eval("ReleaseLabel") %>' runat="server" ID="ReleaseLabelLabel" /></td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="background-color: #999999;">
                    <td>
                        <asp:Button runat="server" CommandName="Update" Text="Update" ID="UpdateButton" />
                        <asp:Button runat="server" CommandName="Cancel" Text="Cancel" ID="CancelButton" />
                    </td>
                    <td>
                        <asp:TextBox Text='<%# Bind("AlbumId") %>' runat="server" ID="AlbumIdTextBox" /></td>
                    <td>
                        <asp:TextBox Text='<%# Bind("Title") %>' runat="server" ID="TitleTextBox" /></td>
                    <td>
                        <asp:TextBox Text='<%# Bind("ArtistId") %>' runat="server" ID="ArtistIdTextBox" /></td>
                    <td>
                        <asp:TextBox Text='<%# Bind("ReleaseYear") %>' runat="server" ID="ReleaseYearTextBox" /></td>
                    <td>
                        <asp:TextBox Text='<%# Bind("ReleaseLabel") %>' runat="server" ID="ReleaseLabelTextBox" /></td>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button runat="server" CommandName="Insert" Text="Insert" ID="InsertButton" />
                        <asp:Button runat="server" CommandName="Cancel" Text="Clear" ID="CancelButton" />
                    </td>
                    <td>
                        <asp:TextBox Text='<%# Bind("AlbumId") %>' runat="server" ID="AlbumIdTextBox" /></td>
                    <td>
                        <asp:TextBox Text='<%# Bind("Title") %>' runat="server" ID="TitleTextBox" /></td>
                    <td>
                        <asp:TextBox Text='<%# Bind("ArtistId") %>' runat="server" ID="ArtistIdTextBox" /></td>
                    <td>
                        <asp:TextBox Text='<%# Bind("ReleaseYear") %>' runat="server" ID="ReleaseYearTextBox" /></td>
                    <td>
                        <asp:TextBox Text='<%# Bind("ReleaseLabel") %>' runat="server" ID="ReleaseLabelTextBox" /></td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="background-color: #E0FFFF; color: #333333;">
                    <td>
                        <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="DeleteButton" />
                        <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton" />
                    </td>
                    <td>
                        <asp:Label Text='<%# Eval("AlbumId") %>' runat="server" ID="AlbumIdLabel" /></td>
                    <td>
                        <asp:Label Text='<%# Eval("Title") %>' runat="server" ID="TitleLabel" /></td>
                    <td>
                        <asp:Label Text='<%# Eval("ArtistId") %>' runat="server" ID="ArtistIdLabel" /></td>
                    <td>
                        <asp:Label Text='<%# Eval("ReleaseYear") %>' runat="server" ID="ReleaseYearLabel" /></td>
                    <td>
                        <asp:Label Text='<%# Eval("ReleaseLabel") %>' runat="server" ID="ReleaseLabelLabel" /></td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table runat="server" id="itemPlaceholderContainer" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;" border="1">
                                <tr runat="server" style="background-color: #E0FFFF; color: #333333;">
                                    <th runat="server"></th>
                                    <th runat="server">AlbumId</th>
                                    <th runat="server">Title</th>
                                    <th runat="server">ArtistId</th>
                                    <th runat="server">ReleaseYear</th>
                                    <th runat="server">ReleaseLabel</th>
                                </tr>
                                <tr runat="server" id="itemPlaceholder"></tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center; background-color: #5D7B9D; font-family: Verdana, Arial, Helvetica, sans-serif; color: #FFFFFF">
                            <asp:DataPager runat="server" ID="DataPager1">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False"></asp:NextPreviousPagerField>
                                    <asp:NumericPagerField></asp:NumericPagerField>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False"></asp:NextPreviousPagerField>
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="background-color: #E2DED6; font-weight: bold; color: #333333;">
                    <td>
                        <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="DeleteButton" />
                        <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton" />
                    </td>
                    <td>
                        <asp:Label Text='<%# Eval("AlbumId") %>' runat="server" ID="AlbumIdLabel" /></td>
                    <td>
                        <asp:Label Text='<%# Eval("Title") %>' runat="server" ID="TitleLabel" /></td>
                    <td>
                        <asp:Label Text='<%# Eval("ArtistId") %>' runat="server" ID="ArtistIdLabel" /></td>
                    <td>
                        <asp:Label Text='<%# Eval("ReleaseYear") %>' runat="server" ID="ReleaseYearLabel" /></td>
                    <td>
                        <asp:Label Text='<%# Eval("ReleaseLabel") %>' runat="server" ID="ReleaseLabelLabel" /></td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:ObjectDataSource ID="AlbumListODS" runat="server" 
            DataObjectTypeName="ChinookSystem.ViewModels.AlbumItem" 
            SelectMethod="Albums_List" 
            UpdateMethod="Album_Update"
            DeleteMethod="Album_Delete" 
            InsertMethod="Album_Add" 
            OldValuesParameterFormatString="original_{0}" 
            TypeName="ChinookSystem.BLL.AlbumController" 
           ></asp:ObjectDataSource>
    </div>
</asp:Content>
