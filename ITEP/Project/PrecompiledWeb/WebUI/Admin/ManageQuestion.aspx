<%@ page title="" language="C#" masterpagefile="~/Admin.master" autoeventwireup="true" inherits="Admin_ManageQuestion, App_Web_it5qycdx" %>

<script runat="server">

    
    
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">

    <ContentTemplate>
    <h2>Manage Question</h2>
<h3>All Question</h3>

    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        DataObjectTypeName="BusinessObject.Question" DeleteMethod="Delete" 
        SelectMethod="GetAll" TypeName="BusinessLogic.QuestionBL"></asp:ObjectDataSource>


        <asp:GridView ID="GridView1" runat="server" Width = "120px" DataKeyNames="Id" AutoGenerateColumns="False" 
        DataSourceID="ObjectDataSource1">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" />
               
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                <asp:BoundField DataField="Description" HeaderText="Description" 
                    SortExpression="Description" />
                <asp:BoundField DataField="ThumbNail" HeaderText="ThumbNail" 
                    SortExpression="ThumbNail" />
            </Columns>
                       
        <EmptyDataTemplate>
        
        no data found please enter the data
        
        </EmptyDataTemplate>
        
        </asp:GridView>
    
    <asp:Button ID="Button1" runat="server" Text="Add New Question" 
        onclick="Button1_Click" />

<h2>Details</h2>
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
        DataObjectTypeName="BusinessObject.Question" InsertMethod="Add" 
        SelectMethod="GetSingle" TypeName="BusinessLogic.QuestionBL" 
        UpdateMethod="Update" OldValuesParameterFormatString="original_{0}">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="Id" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" 
        DataKeyNames="Id" Width="100%" 
        AutoGenerateRows="False" DataSourceID="ObjectDataSource2" 
        oniteminserted="DetailsView1_ItemInserted" 
        oniteminserting="DetailsView1_ItemInserting" 
        onitemupdated="DetailsView1_ItemUpdated" 
        onitemupdating="DetailsView1_ItemUpdating">
        <Fields>
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="Description" HeaderText="Description" 
                SortExpression="Description" />

            <asp:TemplateField HeaderText="Number of Views">
                    <ItemTemplate>
                    <%# Eval("NoOfViews") %>
                    </ItemTemplate>
                    </asp:TemplateField>

                <asp:TemplateField HeaderText="UserName">
                    <ItemTemplate>

                    <%# Eval("UserName") %>
                    
                    </ItemTemplate>
                    </asp:TemplateField>

            <asp:TemplateField HeaderText="CreatedOn">
                    <ItemTemplate>
                    <%# Eval("CreatedOn")%>
                    </ItemTemplate>
                    </asp:TemplateField>

            <asp:BoundField DataField="ThumbNail" HeaderText="ThumbNail" 
                SortExpression="ThumbNail" />

                <asp:TemplateField HeaderText="Deleted">
                    <ItemTemplate>
                    
                    <%# Eval("IsDeleted")%>

                    </ItemTemplate>
                    </asp:TemplateField>

            <asp:TemplateField HeaderText="Approved">

                    <EditItemTemplate>
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" 
                            SelectedValue='<%# Bind("IsApproved") %>'>
                        <asp:ListItem Value="True" >True</asp:ListItem>
                        <asp:ListItem Value="False" >False</asp:ListItem>
                        </asp:RadioButtonList>
                    
                    </EditItemTemplate>

                    <ItemTemplate>
                    <%# Eval("IsApproved") %>
                    </ItemTemplate>
                    </asp:TemplateField>

            <asp:CommandField ShowEditButton="True" ShowInsertButton="True" />
        </Fields>

        
            <EmptyDataTemplate>
            
            Please Select the Above To See the Details  
            
            </EmptyDataTemplate>
    </asp:DetailsView>
    </ContentTemplate>
    </asp:UpdatePanel>
    
    <asp:UpdateProgress  AssociatedUpdatePanelID="UpdatePanel1" ID="UpdateProgress1" runat="server">
    <ProgressTemplate>
        <asp:Image ID="Image1" ImageUrl="~/App_Themes/Rational/images/ajax-loader.gif" runat="server" />
    
    </ProgressTemplate>
    </asp:UpdateProgress>
</asp:Content>



