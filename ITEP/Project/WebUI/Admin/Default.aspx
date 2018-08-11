<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server"></asp:ObjectDataSource>


				<h2>Welcome to Education Portal !</h2>
				<p><strong>ITEP(Information Technology Eduction Portal)</strong></p>
                <h3>This Site Provide List Of Study Materials to Download</h3>
				<ul>
					<li><a href="#">Ppts</a></li>
					<li><a href="#">Pdf</a></li>
					<li><a href="#">Videos Tutorial</a></li>
					<li><a href="#">Audio Lecture</a></li>
					<li><a href="#">Graphical Images</a></li>
				</ul>
				
				
    <asp:Xml ID="Xml1" runat="server"></asp:Xml>
			
</asp:Content>

