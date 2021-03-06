﻿<%@ Page Title="Filter Search" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SearchByDDL.aspx.cs" Inherits="WebApp.SamplePages.SearchByDDL" %>

<%@ Register Src="~/UserControls/MessageUserControl.ascx" TagPrefix="uc1" TagName="MessageUserControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Search Albums by Artist</h1>
    <%-- Search area --%>
    <div class="row">
        <div class="offset-3">
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>&nbsp;&nbsp;
            <asp:DropDownList ID="ArtistList" runat="server"></asp:DropDownList>&nbsp;&nbsp;
            <asp:LinkButton ID="SearchAlbums" runat="server" OnClick="SearchAlbums_Click">Search</asp:LinkButton>
        </div>
        <br /><br />
        <div class="row">
            <div class="offset-3">

                <uc1:MessageUserControl runat="server" ID="MessageUserControl" />
            </div>
        </div>

        <div class="row">
            <div class="offset-3">
                <asp:GridView ID="ArtistAlbumList" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:TemplateField HeaderText="Album">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%#Eval("Title") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Left"></ItemStyle>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Released">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%#Eval("ReleaseYear") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Artist">
                            <ItemTemplate>
                                <asp:DropDownList ID="ArtistNameList" runat="server" 
                                    DataSourceID="ArtistListODS" 
                                    DataTextField="DisplayField" 
                                    DataValueField="ValueField"
                                    selectedValue='<%#Eval("ArtistId") %>'></asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:ObjectDataSource ID="ArtistListODS" runat="server" 
                    OldValuesParameterFormatString="original_{0}" 
                    SelectMethod="Artists_DDLList" 
                    OnSelected="SelectCheckForException"
                    TypeName="ChinookSystem.BLL.ArtistController">
                </asp:ObjectDataSource>
            </div>
        </div>
    </div>
</asp:Content>
