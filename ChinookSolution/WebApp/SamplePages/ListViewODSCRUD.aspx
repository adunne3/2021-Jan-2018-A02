<%@ Page Title="ListViewODSCRUDS" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListViewODSCRUD.aspx.cs" Inherits="WebApp.SamplePages.ListViewODSCRUD" %>

<%@ Register Src="~/UserControls/MessageUserControl.ascx" TagPrefix="uc1" TagName="MessageUserControl" %>

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
        <div class="offset-2">
            <uc1:MessageUserControl runat="server" ID="MessageUserControl" />
            <asp:ValidationSummary ID="ValidationSummaryEdit" runat="server" HeaderText="Following concerns are with your data while editing" ValidationGroup="egroup"/>
            <asp:ValidationSummary ID="ValidationSummaryInsert" runat="server" HeaderText="Following concerns are with your data while adding" ValidationGroup="igroup"/>

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
                        <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="DeleteButton" OnClientClick="return confirm('Are you sure wish to remove this album?')"/>
                        <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton" />
                    </td>
                    <td>
                        <asp:Label Text='<%# Eval("AlbumId") %>' runat="server" ID="AlbumIdLabel" /></td>
                    <td>
                        <asp:Label Text='<%# Eval("Title") %>' runat="server" ID="TitleLabel" /></td>
                    <td>
                        <%--<asp:Label Text='<%# Eval("ArtistId") %>' runat="server" ID="ArtistIdLabel" />--%>
                        <asp:DropDownList ID="ArtistList" runat="server" 
                            DataSourceID="ArtistListODS"
                            DataTextField="DisplayField" 
                            DataValueField="ValueField" 
                            selectedvalue='<%#Eval("ArtistId") %>' 
                            Enabled="false"
                            Width="300px">

                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:Label Text='<%# Eval("ReleaseYear") %>' runat="server" ID="ReleaseYearLabel" /></td>
                    <td>
                        <asp:Label Text='<%# Eval("ReleaseLabel") %>' runat="server" ID="ReleaseLabelLabel" /></td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <%-- Validation controls will be placed inside associate template
                    The id of the validated control needs to be unique
                    THe validation controls for  particular template needs to be grouped ***
                    The validation executes ONLY on the use of the template where 
                    teh grouped i stied to the button--%>
                <asp:RequiredFieldValidator ID="RequiredTitleE" runat="server" 
                    ErrorMessage="Album Title is required when editing"
                    ControlToValidate="TitleTextBoxE"
                    Display="None"
                    ValidationGroup="egroup"
                    >

                </asp:RequiredFieldValidator>
                <tr style="background-color: #999999;">
                    <td>
                        <%-- Tie button to validation group
                            FAILURE to do so will cause ALL validation on page to execute--%>
                        <asp:Button runat="server" CommandName="Update" Text="Update" ID="UpdateButton" ValidationGroup="egroup" />
                        <asp:Button runat="server" CommandName="Cancel" Text="Cancel" ID="CancelButton" />
                    </td>
                    <td>
                        <asp:TextBox Text='<%# Bind("AlbumId") %>' runat="server" ID="AlbumIdTextBox" Enabled="false" /></td>
                    <td>
                        <asp:TextBox Text='<%# Bind("Title") %>' runat="server" ID="TitleTextBoxE" /></td>
                    <td>
                        <asp:DropDownList ID="ArtistList" runat="server" 
                            DataSourceID="ArtistListODS" 
                            DataTextField="DisplayField" 
                            DataValueField="ValueField" 
                            selectedvalue='<%#Bind("ArtistId") %>'
                            Enabled="true"
                            Width="300px">

                        </asp:DropDownList>

                    </td>
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
                <asp:RequiredFieldValidator ID="RequiredTitleE" runat="server" 
                    ErrorMessage="Album Title is required when inserting"
                    ControlToValidate="TitleTextBoxI"
                    Display="None"
                    ValidationGroup="igroup"
                    ></asp:RequiredFieldValidator>
                <tr style="">
                    <td>
                        <asp:Button runat="server" CommandName="Insert" Text="Insert" ID="InsertButton" ValidationGroup="igroup" />
                        <asp:Button runat="server" CommandName="Cancel" Text="Clear" ID="CancelButton" />
                    </td>
                    <td>
                        <asp:TextBox Text='<%# Bind("AlbumId") %>' runat="server" ID="AlbumIdTextBox" Enabled="false"/></td>
                    <td>
                        <asp:TextBox Text='<%# Bind("Title") %>' runat="server" ID="TitleTextBoxI" /></td>
                    <td>
                        <asp:DropDownList ID="ArtistList" runat="server" 
                            DataSourceID="ArtistListODS" 
                            DataTextField="DisplayField" 
                            DataValueField="ValueField" 
                            selectedvalue='<%#Bind("ArtistId") %>'
                            Enabled="true"
                            Width="300px">

                        </asp:DropDownList></td>
                    <td>
                        <asp:TextBox Text='<%# Bind("ReleaseYear") %>' runat="server" ID="ReleaseYearTextBox" /></td>
                    <td>
                        <asp:TextBox Text='<%# Bind("ReleaseLabel") %>' runat="server" ID="ReleaseLabelTextBox" /></td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="background-color: #E0FFFF; color: #333333;">
                    <td>
                        <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="DeleteButton" OnClientClick="return confirm('Are you sure wish to remove this album?')"/>
                        <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton" />
                    </td>
                    <td>
                        <asp:Label Text='<%# Eval("AlbumId") %>' runat="server" ID="AlbumIdLabel" /></td>
                    <td>
                        <asp:Label Text='<%# Eval("Title") %>' runat="server" ID="TitleLabel" /></td>
                    <td>
                        <asp:DropDownList ID="ArtistList" runat="server" 
                            DataSourceID="ArtistListODS" 
                            DataTextField="DisplayField" 
                            DataValueField="ValueField" 
                            selectedvalue='<%#Eval("ArtistId") %>'
                            Enabled="false"
                            Width="300px">

                        </asp:DropDownList></td>
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
                                    <th runat="server">Id</th>
                                    <th runat="server">Title</th>
                                    <th runat="server">Artist</th>
                                    <th runat="server">Year</th>
                                    <th runat="server">Label</th>
                                </tr>
                                <tr runat="server" id="itemPlaceholder"></tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center; background-color: #808080; font-family: Verdana, Arial, Helvetica, sans-serif; color: #FFFFFF">
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
                        <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="DeleteButton" OnClientClick="return confirm('Are you sure wish to remove this album?')"/>
                        <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton" />
                    </td>
                    <td>
                        <asp:Label Text='<%# Eval("AlbumId") %>' runat="server" ID="AlbumIdLabel" /></td>
                    <td>
                        <asp:Label Text='<%# Eval("Title") %>' runat="server" ID="TitleLabel" /></td>
                    <td>
                        <asp:DropDownList ID="ArtistList" runat="server" 
                            DataSourceID="ArtistListODS" 
                            DataTextField="DisplayField" 
                            DataValueField="ValueField" 
                            selectedvalue='<%#Eval("ArtistId") %>'
                            Enabled="false"
                            Width="300px">

                        </asp:DropDownList>

                    </td>
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
            OnSelected="SelectCheckForException"
            OnDeleted="DeleteCheckForException"
            OnUpdated="UpdateCheckForException"
            OnInserted="InsertCheckForException"
            OldValuesParameterFormatString="original_{0}" 
            TypeName="ChinookSystem.BLL.AlbumController" 
           ></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ArtistListODS" 
            runat="server" 
            OldValuesParameterFormatString="original_{0}" 
            SelectMethod="Artists_DDLList" 
            OnSelected="SelectCheckForException"
            TypeName="ChinookSystem.BLL.ArtistController"
            ></asp:ObjectDataSource>
    </div>
</asp:Content>
