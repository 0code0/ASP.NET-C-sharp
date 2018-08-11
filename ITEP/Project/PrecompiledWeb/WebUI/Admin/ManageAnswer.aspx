<%@ page title="" language="C#" masterpagefile="~/Admin.master" autoeventwireup="true" inherits="Admin_ManageAnswer, App_Web_it5qycdx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>


    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    <h2>Manage Answers </h2>

<h3>All Answers</h3>

    <p>
      Select Question:  <asp:DropDownList ID="DropDownList1" Width="150px" runat="server" AutoPostBack="True" 
            DataSourceID="ObjectDataSource3" DataTextField="Title" DataValueField="Id">
        </asp:DropDownList>
        <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" 
            SelectMethod="GetAll" TypeName="BusinessLogic.QuestionBL" 
            OldValuesParameterFormatString="original_{0}">
        </asp:ObjectDataSource>
    </p>

    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
    DataObjectTypeName="BusinessObject.Answers" DeleteMethod="Delete" 
    SelectMethod="GetAllQuestion" TypeName="BusinessLogic.AnswerBL" 
            OldValuesParameterFormatString="original_{0}">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="QuestionId" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:GridView ID="GridView1" DataKeyNames = "Id" AutoGenerateColumns="False" Width="100%" runat="server" 
    DataSourceID="ObjectDataSource1">
        <Columns>
            
            <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" />
            
            <asp:BoundField DataField="Ans" HeaderText="Ans" SortExpression="Ans" />
            <asp:BoundField DataField="UserName" HeaderText="UserName" 
                SortExpression="UserName" />
            
        </Columns>
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
        DataObjectTypeName="BusinessObject.Answers" InsertMethod="Add" 
        SelectMethod="GetSingle" TypeName="BusinessLogic.AnswerBL" 
        UpdateMethod="Update" OldValuesParameterFormatString="original_{0}">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="Id" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:Button ID="Button1" runat="server" Text="Add New Answer" 
        onclick="Button1_Click" />
    <br /><br />
    <br />
    <br />
    <h2> Details</h2>
    

        <asp:DetailsView ID="DetailsView1" runat="server" DataKeyNames ="Id" Height="50px" Width="100%" 
            AutoGenerateRows="False" DataSourceID="ObjectDataSource2" 
            oniteminserted="DetailsView1_ItemInserted" 
            oniteminserting="DetailsView1_ItemInserting" 
            onitemupdated="DetailsView1_ItemUpdated" 
            onitemupdating="DetailsView1_ItemUpdating">


            <Fields>

                
                <asp:BoundField DataField="Ans" HeaderText="Ans" SortExpression="Ans" />
                <asp:TemplateField HeaderText = "Question Title">
                
                
                    <EditItemTemplate>
                        
                        <asp:DropDownList ID="DropDownList2" runat="server" 
                            DataSourceID="ObjectDataSource4" DataTextField="Title" DataValueField="Id" 
                            SelectedValue='<%# Bind("QuestionId") %>'>
                        </asp:DropDownList>
                        <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" 
                            SelectMethod="GetAll" TypeName="BusinessLogic.QuestionBL">
                        </asp:ObjectDataSource>
                        
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList3" runat="server" 
                            DataSourceID="ObjectDataSource5" DataTextField="Title" DataValueField="Id" 
                            SelectedValue='<%# Bind("QuestionId") %>'>
                        </asp:DropDownList>
                    <asp:ObjectDataSource ID="ObjectDataSource5" runat="server" SelectMethod="GetAll" 
                            TypeName="BusinessLogic.QuestionBL"></asp:ObjectDataSource>
                    </InsertItemTemplate>

                    <ItemTemplate>
                        <%# ((BusinessObject.Question)Eval("Question")).Title%>
                    </ItemTemplate>
                                      
                
                </asp:TemplateField>
                
                 <asp:TemplateField HeaderText="UserName">
                             
                 <ItemTemplate>
            
                    <%# Eval("UserName") %>
                    </ItemTemplate>
            
            </asp:TemplateField>

                <asp:TemplateField HeaderText = "Votes">
                <ItemTemplate>
                <%# Eval("Votes")%>
                </ItemTemplate>
                
                </asp:TemplateField>

                <asp:TemplateField HeaderText = "UserName">
                
                <ItemTemplate>
                <%# Eval("UserName")%>
                </ItemTemplate>

                </asp:TemplateField>

                <asp:TemplateField HeaderText = "CreatedOn">
                
                <ItemTemplate>
                <%# Eval("CreatedOn")%>
                </ItemTemplate>
                </asp:TemplateField>
                
                <asp:BoundField DataField="ThumbNail" HeaderText="ThumbNail" 
                    SortExpression="ThumbNail" />
                
                <asp:TemplateField HeaderText = "Deleted">
                <ItemTemplate>
                <%# Eval("IsDeleted")%>
                </ItemTemplate>
                </asp:TemplateField>
                

                <asp:TemplateField HeaderText = "Approved">
                <ItemTemplate>
                <%# Eval("IsApproved")%>
                </ItemTemplate>

                <EditItemTemplate>
                

                    <asp:RadioButtonList ID="RadioButtonList2" runat="server" AutoPostBack="True" 
                        SelectedValue='<%# Bind("IsApproved") %>'>
                       <asp:ListItem Value="True" >True</asp:ListItem>
                        <asp:ListItem Value="False" >False</asp:ListItem>
                    </asp:RadioButtonList>
                

                </EditItemTemplate>
                </asp:TemplateField>
                

                <asp:CommandField ShowEditButton="True" ShowInsertButton="True" />
            </Fields>


        </asp:DetailsView>
    </ContentTemplate>

    </asp:UpdatePanel>

    <asp:UpdateProgress AssociatedUpdatePanelID="UpdatePanel1" ID="UpdateProgress1" runat="server">
   <ProgressTemplate>
   
       <asp:Image ID="Image1" ImageUrl="~/App_Themes/Rational/images/ajax-loader.gif" runat="server" />
   </ProgressTemplate>

    </asp:UpdateProgress>
</asp:Content>

