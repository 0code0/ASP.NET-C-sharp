<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="ManageSubjects.aspx.cs" Inherits="Admin_ManageSubjects" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    
    <h2>Manage Subjects</h2>
    <h3>All Subjects 
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
            SelectMethod="GetAll" TypeName="BusinessLogic.BranchBL">
        </asp:ObjectDataSource>
        </h3>
   
    
    
       Branch:
    <asp:DropDownList ID="DropDownList1" runat="server" Width="150px" 
        AutoPostBack="True" DataSourceID="ObjectDataSource1" DataTextField="Name" 
        DataValueField="Id">
    </asp:DropDownList>
    <br />
    <br />
    <br />
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
        DataObjectTypeName="BusinessObject.Subjects" DeleteMethod="Delete" 
        SelectMethod="GetAllByBranch" TypeName="BusinessLogic.SubjectsBL">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="BranchId" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:GridView ID="GridView1" runat="server" Width="100%"  DataKeyNames="Id" AutoGenerateColumns="False"
        DataSourceID="ObjectDataSource2" BackColor="#DEBA84" BorderColor="#DEBA84" 
            BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
        <Columns>
            
            <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" HeaderText="Action" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
        </Columns>
        <EmptyDataTemplate>
        
        No Record to Display Add New Record 
        
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
    <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" 
        DataObjectTypeName="BusinessObject.Subjects" InsertMethod="Add" 
        SelectMethod="GetSingle" TypeName="BusinessLogic.SubjectsBL" 
        UpdateMethod="Update">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="Id" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
   
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click1" Text="Add New Subjects" />
    <br />
    <br />
 <h2>Details</h2>
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False"  Height="50px"
        DataKeyNames="Id" Width="100%" DataSourceID="ObjectDataSource3" 
        oniteminserted="DetailsView1_ItemInserted" 
        onitemupdated="DetailsView1_ItemUpdated" CellPadding="4" ForeColor="#333333" 
            GridLines="None">
        <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
        <Fields>
            
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            
            
            <asp:TemplateField HeaderText="Branch">
            
            
            
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" 
                        DataSourceID="ObjectDataSource4" DataTextField="Name" DataValueField="Id" 
                        SelectedValue='<%# Bind("BranchId") %>'>
                    </asp:DropDownList>
                    <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" 
                        SelectMethod="GetAll" TypeName="BusinessLogic.BranchBL">
                    </asp:ObjectDataSource>
                </EditItemTemplate>

                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList3" runat="server" 
                        DataSourceID="ObjectDataSource5" DataTextField="Name" DataValueField="Id" 
                        SelectedValue='<%# Bind("BranchId") %>'>
                    </asp:DropDownList>
                    <asp:ObjectDataSource ID="ObjectDataSource5" runat="server" 
                        SelectMethod="GetAll" TypeName="BusinessLogic.BranchBL">
                    </asp:ObjectDataSource>
                </InsertItemTemplate>

                <ItemTemplate>
                   
                   <%#    ((BusinessObject.Branch)Eval("Branch")).Name %>


                </ItemTemplate>
            
            
            
            </asp:TemplateField>
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

