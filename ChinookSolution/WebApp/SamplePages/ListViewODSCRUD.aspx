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
        <asp:ListView ID="ListView1" runat="server"></asp:ListView>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server"></asp:ObjectDataSource>
    </div>
</asp:Content>
