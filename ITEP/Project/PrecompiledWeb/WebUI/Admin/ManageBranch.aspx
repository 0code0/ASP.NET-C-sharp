<%@ page title="" language="C#" masterpagefile="~/Admin.master" autoeventwireup="true" inherits="Admin_ManageBranch, App_Web_it5qycdx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">

    <ContentTemplate>
    
    <h2>Manage Branch</h2>
    <h3>All Branches</h3>
    
    <p>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
            DataObjectTypeName="BusinessObject.Branch" DeleteMethod="Delete" 
            SelectMethod="GetAll" TypeName="BusinessLogic.BranchBL">
        </asp:ObjectDataSource>
        <asp:GridView ID="GridView1" runat="server" Width="100%" DataKeyNames="Id" AutoGenerateColumns="False"
            DataSourceID="ObjectDataSource1" BackColor="#DEBA84" BorderColor="#DEBA84" 
            BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
            <Columns>

                
                <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" HeaderText="Action" />
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
            DataObjectTypeName="BusinessObject.Branch" InsertMethod="Add" 
            SelectMethod="GetSingle" TypeName="BusinessLogic.BranchBL" 
            UpdateMethod="Update">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="Id" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
     <asp:Button ID="Button1" runat="server" Text="Add New Branch" 
            onclick="Button1_Click" />
            <br />
            <br />

        <h2>Details</h2>
        <asp:DetailsView ID="DetailsView1" runat="server" DataKeyNames="Id" 
            Height="50px" Width="100%" 
            AutoGenerateRows="False" DataSourceID="ObjectDataSource2" 
            oniteminserted="DetailsView1_ItemInserted" 
            onitemupdated="DetailsView1_ItemUpdated" CellPadding="4" 
            ForeColor="#333333" GridLines="None">
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
        <p>
        </p>
    </p>
    
    
    </ContentTemplate>

    </asp:UpdatePanel>

    <asp:UpdateProgress AssociatedUpdatePanelID="UpdatePanel1" ID="UpdateProgress1" runat="server">

    <ProgressTemplate>
    
        <img alt="Loading..." src="../App_Themes/Rational/images/ajax-loader.gif" />

    </ProgressTemplate>

    </asp:UpdateProgress>

    </asp:Content>
