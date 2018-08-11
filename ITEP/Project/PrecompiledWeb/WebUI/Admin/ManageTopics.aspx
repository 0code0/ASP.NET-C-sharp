<%@ page title="" language="C#" masterpagefile="~/Admin.master" autoeventwireup="true" inherits="Admin_ManageTopics, App_Web_it5qycdx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
   
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
          <h2>Manage Topics</h2>
    <h3>All Topics</h3>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        SelectMethod="GetAllByTopics" TypeName="BusinessLogic.TopicsBL">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList7" Name="ParentId" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>

Select Branch:
        <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" 
              OldValuesParameterFormatString="original_{0}" SelectMethod="GetAll" 
              TypeName="BusinessLogic.BranchBL"></asp:ObjectDataSource>
        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" 
              DataSourceID="ObjectDataSource4" DataTextField="Name" DataValueField="Id">
        </asp:DropDownList>
 Select Subject: 
         <asp:DropDownList ID="DropDownList1" runat="server" 
        AutoPostBack="True" Width="150px" DataSourceID="ObjectDataSource3" DataTextField="Name" 
        DataValueField="Id" onselectedindexchanged="DropDownList1_SelectedIndexChanged">

    </asp:DropDownList>
      Topic: <asp:DropDownList 
            ID="DropDownList7" Width="150px" runat="server" 
            DataSourceID="ObjectDataSource9" DataTextField="Name" DataValueField="Id" 
            AutoPostBack="True" ondatabound="DropDownList7_DataBound">
        </asp:DropDownList>
         
        <asp:ObjectDataSource ID="ObjectDataSource9" runat="server" 
            SelectMethod="GetAllBySubjectsandTopics" TypeName="BusinessLogic.TopicsBL">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="SubjectId" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" 
        SelectMethod="GetAllByBranch" TypeName="BusinessLogic.SubjectsBL" 
              OldValuesParameterFormatString="original_{0}">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList2" Name="BranchId" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
    </asp:ObjectDataSource>
    <br />
    <br />
    <asp:GridView ID="GridView1" DataKeyNames="Id" runat="server" 
             AutoGenerateColumns="False" Width="100%"
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
        DataObjectTypeName="BusinessObject.Topics" InsertMethod="Add" 
        SelectMethod="GetSingle" TypeName="BusinessLogic.TopicsBL" 
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
    <asp:DetailsView ID="DetailsView1" DataKeyNames="Id"  runat="server" AutoGenerateRows="False" 
        DataSourceID="ObjectDataSource2" Height="50px" Width="100%" 
        ondatabound="DetailsView1_DataBound" 
            oniteminserted="DetailsView1_ItemInserted" 
            onitemupdated="DetailsView1_ItemUpdated" CellPadding="4" 
             ForeColor="#333333" GridLines="None" 
             oniteminserting="DetailsView1_ItemInserting" 
             onitemupdating="DetailsView1_ItemUpdating">
        <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
        <Fields>
           
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            
            <asp:TemplateField HeaderText = "Select Branch">
            
            
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList8" runat="server" 
                        DataSourceID="ObjectDataSource10" DataTextField="Name" DataValueField="Id" 
                        AutoPostBack="True">
                    </asp:DropDownList>
                    <asp:ObjectDataSource ID="ObjectDataSource10" runat="server" 
                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetAll" 
                        TypeName="BusinessLogic.BranchBL"></asp:ObjectDataSource>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList9" runat="server" 
                        DataSourceID="ObjectDataSource11" DataTextField="Name" DataValueField="Id">
                    </asp:DropDownList>
                    <asp:ObjectDataSource ID="ObjectDataSource11" runat="server" 
                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetAll" 
                        TypeName="BusinessLogic.BranchBL"></asp:ObjectDataSource>
                </InsertItemTemplate>
                <ItemTemplate>
                    <%# Eval("Name") %>
                </ItemTemplate>
            
            
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Select Subject">
            
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList3" runat="server" 
                        DataSourceID="ObjectDataSource5" DataTextField="Name" DataValueField="Id" 
                        SelectedValue='<%# Bind("SubjectId") %>'>
                    </asp:DropDownList>
                    <asp:ObjectDataSource ID="ObjectDataSource5" runat="server" 
                        SelectMethod="GetAll" TypeName="BusinessLogic.SubjectsBL">
                    </asp:ObjectDataSource>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList4" runat="server" 
                        DataSourceID="ObjectDataSource6" DataTextField="Name" DataValueField="Id" 
                        SelectedValue='<%# Bind("SubjectId") %>'>
                    </asp:DropDownList>
                    <asp:ObjectDataSource ID="ObjectDataSource6" runat="server" 
                        SelectMethod="GetAll" TypeName="BusinessLogic.SubjectsBL">
                    </asp:ObjectDataSource>
                </InsertItemTemplate>
            
                <ItemTemplate>
                    
                    <%#   ((BusinessObject.Subjects)Eval("Subjects")).Name %>


                </ItemTemplate>
               
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Parent Topic">
            
               
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList5" runat="server" 
                        DataSourceID="ObjectDataSource7" DataTextField="Name" DataValueField="Id" 
                        ondatabound="DropDownList5_DataBound">
                    </asp:DropDownList>
                    <asp:ObjectDataSource ID="ObjectDataSource7" runat="server" 
                        SelectMethod="GetAllBySubjectsandTopics" TypeName="BusinessLogic.TopicsBL">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList1" Name="SubjectId" 
                                PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:ObjectDataSource ID="ObjectDataSource8" runat="server" 
                        SelectMethod="GetAll" TypeName="BusinessLogic.TopicsBL">
                    </asp:ObjectDataSource>
                    <asp:DropDownList ID="DropDownList6" runat="server" 
                        DataSourceID="ObjectDataSource8" DataTextField="Name" DataValueField="Id" 
                        ondatabound="DropDownList6_DataBound">
                    </asp:DropDownList>
                </InsertItemTemplate>
              
              
              
                <ItemTemplate  >
                 
                 <%# ((BusinessObject.Topics)Eval("ParentTopics")).Name %>

                </ItemTemplate>
            
               
            </asp:TemplateField>



            

            <asp:CommandField ShowEditButton="True" ShowInsertButton="True" />
        </Fields>

        <AlternatingRowStyle BackColor="White" />
        <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
        <EditRowStyle BackColor="#2461BF" />

        <EmptyDataTemplate>
        
         Please select the above . To See .Data Detail 

        </EmptyDataTemplate>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
    </asp:DetailsView>

    
   
    </ContentTemplate>
    </asp:UpdatePanel>
    
    <asp:UpdateProgress AssociatedUpdatePanelID="UpdatePanel1" ID="UpdateProgress1" runat="server">
    
    <ProgressTemplate>
    
        <asp:Image ID="Image1" ImageUrl="~/App_Themes/Rational/images/ajax-loader.gif" runat="server" />
    </ProgressTemplate>
    
    </asp:UpdateProgress>
</asp:Content>

