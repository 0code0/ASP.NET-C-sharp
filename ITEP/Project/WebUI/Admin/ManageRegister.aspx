<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="ManageRegister.aspx.cs" Inherits="Admin_ManageRegister" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h2>Manage Users</h2>
<h3>All Users</h3>
<!--
    <p>
        <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" 
            DataObjectTypeName="BusinessObject.Registration" DeleteMethod="Delete" 
            SelectMethod="GetAll" TypeName="BusinessLogic.RegisterBL">
        </asp:ObjectDataSource>
        <asp:GridView ID="GridView1" runat="server" DataKeyNames="UserName" 
            Width="100%" AutoGenerateColumns="False" 
            DataSourceID="ObjectDataSource3" BackColor="#DEBA84" BorderColor="#DEBA84" 
            BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" HeaderText="Action" ShowSelectButton="True" />
               
                <asp:BoundField DataField="UserName" HeaderText="UserName" 
                    SortExpression="UserName" />
                
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                
                <asp:BoundField DataField="PhoneNumber" HeaderText="PhoneNumber" 
                    SortExpression="PhoneNumber" />
               
                <asp:BoundField DataField="UserRole" HeaderText="UserRole" 
                    SortExpression="UserRole" />
                
            </Columns>
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FFF1D4" />
            <SortedAscendingHeaderStyle BackColor="#B95C30" />
            <SortedDescendingCellStyle BackColor="#F1E5CE" />
            <SortedDescendingHeaderStyle BackColor="#93451F" />
        </asp:GridView>
    </p>
    
    <asp:Button ID="Button1" runat="server" Text="Add New User" 
            onclick="Button1_Click" />
            <br />
            <br />

    <h2>Details</h2>

        <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" 
            DataObjectTypeName="BusinessObject.Registration" InsertMethod="Add" 
            SelectMethod="GetSingle" TypeName="BusinessLogic.RegisterBL" 
            UpdateMethod="Update">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="UserName" 
                    PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:DetailsView ID="DetailsView1" DataKeyNames="UserName" runat="server" AutoGenerateRows="False" 
            DataSourceID="ObjectDataSource4" Height="50px" Width="100%" 
            oniteminserted="DetailsView1_ItemInserted" 
            onitemupdated="DetailsView1_ItemUpdated" 
            oniteminserting="DetailsView1_ItemInserting" 
            onitemupdating="DetailsView1_ItemUpdating" CellPadding="4" 
        ForeColor="#333333" GridLines="None">
           
            <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
            <Fields>
           
                <asp:BoundField DataField="UserName" HeaderText="UserName" 
                    SortExpression="UserName" />
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" 
                    SortExpression="FirstName" />
                <asp:BoundField DataField="LastName" HeaderText="LastName" 
                    SortExpression="LastName" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Password" HeaderText="Password" 
                    SortExpression="Password" />
                <asp:BoundField DataField="PhoneNumber" HeaderText="PhoneNumber" 
                    SortExpression="PhoneNumber" />
                <asp:BoundField DataField="Gender" HeaderText="Gender" 
                    SortExpression="Gender" />
                <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
                <asp:BoundField DataField="UserRole" HeaderText="UserRole" 
                    SortExpression="UserRole" />
               <asp:TemplateField HeaderText="User Image">
               
               
               
               
                   <EditItemTemplate>
                       <asp:FileUpload ID="FileUpload1" runat="server" />
                   </EditItemTemplate>
                   <InsertItemTemplate>
                       <asp:FileUpload ID="FileUpload2" runat="server" />
                   </InsertItemTemplate>
                   <ItemTemplate>
                       <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("ImagePath") %>' 
                           Height="131px" Width="146px" />
                   </ItemTemplate>
               
               
               
               
               </asp:TemplateField>


                <asp:CommandField ShowEditButton="True" ShowInsertButton="True" />
                
            </Fields>

            
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
            <EditRowStyle BackColor="#2461BF" />

            
            <EmptyDataTemplate>
            
            Please Select Above To See The Details
            
            </EmptyDataTemplate>

            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />

        </asp:DetailsView>
    


    -->




</asp:Content>

