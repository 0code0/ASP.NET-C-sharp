<%@ page title="" language="C#" masterpagefile="~/Admin.master" autoeventwireup="true" inherits="Admin_ManageNewsCategory, App_Web_it5qycdx" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
 
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    
    <ContentTemplate>
    <h2>Manage NewsCategory</h2>
<h3>All NewsCategory</h3>

    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        DataObjectTypeName="BusinessObject.NewsCategory" DeleteMethod="Delete" 
        SelectMethod="GetAll" TypeName="BusinessLogic.NewsCategoryBL">
    </asp:ObjectDataSource>
    <br />
    <br />
    <asp:GridView ID="GridView1"  AutoGenerateColumns="False" runat="server" 
            DataKeyNames="Id" Width = "100%" 
        DataSourceID="ObjectDataSource1" BackColor="#DEBA84" BorderColor="#DEBA84" 
            BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
        <Columns>

            <asp:CommandField ShowDeleteButton="True" HeaderText="Action" ShowSelectButton="True" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />       
        </Columns>
        <EmptyDataTemplate>
        
        no data found please enter the data
        
        </EmptyDataTemplate>
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
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
        DataObjectTypeName="BusinessObject.NewsCategory" InsertMethod="Add" 
        SelectMethod="GetSingle" TypeName="BusinessLogic.NewsCategoryBL" 
        UpdateMethod="Update">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="Id" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
<asp:Button ID="Button1" runat="server" Text="Add New Item" 
        onclick="Button1_Click" />
        <br />
        <br />

    <h2>Details</h2>
    <asp:DetailsView ID="DetailsView1" DataKeyNames="Id" runat="server" 
        Height="50px"  Width="100%"  
        AutoGenerateRows="False" DataSourceID="ObjectDataSource2" 
        oniteminserted="DetailsView1_ItemInserted" 
        onitemupdated="DetailsView1_ItemUpdated" CellPadding="4" ForeColor="#333333" 
            GridLines="None">
        <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
        <Fields>
            
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:CommandField ShowEditButton="True" ShowInsertButton="True" />
        </Fields>
        <AlternatingRowStyle BackColor="White" />
        <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
        <EditRowStyle BackColor="#2461BF" />
        <EmptyDataTemplate>
        
        Select From above To See the Details 
        
        </EmptyDataTemplate>

        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />

    </asp:DetailsView>
   
    
    
    </ContentTemplate>
    </asp:UpdatePanel>


    <asp:UpdateProgress AssociatedUpdatePanelID="UpdatePanel1" ID="UpdateProgress1" runat="server">
    </asp:UpdateProgress>
</asp:Content>

