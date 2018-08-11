<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="ManageUploads, App_Web_q3lbdyzj" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    
    <div id="ManageAllUploads">
        <h2>Manage Uploads</h2>

    <h3>All Uploads</h3>
    
    <asp:HiddenField ID="hfUserName" runat="server" />
    
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
            SelectMethod="GetAllByUserName" TypeName="BusinessLogic.UploadsBL" 
            DataObjectTypeName="BusinessObject.Uploads" DeleteMethod="Delete" 
            OldValuesParameterFormatString="original_{0}">
            <SelectParameters>  
                <asp:ControlParameter ControlID="hfUserName" Name="username" 
                    PropertyName="Value" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:GridView ID="GridView1" DataKeyNames="Id" Width="100%" runat="server" 
            AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" 
            BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
            CellPadding="3" CellSpacing="2">
        

            <Columns>
                <asp:CommandField HeaderText="Action" ShowDeleteButton="True" ShowSelectButton="True" />
                
              
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                <asp:TemplateField HeaderText="Uploads Type" >
              
              <ItemTemplate>


                      <%# ((BusinessObject.UploadsType)Eval("UploadsType")).Name%>
                    
                    
                    </ItemTemplate>

              
              </asp:TemplateField>
              
              <asp:TemplateField HeaderText="Topic">
              
                  <ItemTemplate>


                     <%# ((BusinessObject.Topics)Eval("Topics")).Name%>                  
                    
                    </ItemTemplate>
                
              
              
              </asp:TemplateField>
              
            
            </Columns>
        

        <EmptyDataTemplate>
        
        No Data Found Please enter Data         
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
            SelectMethod="GetSingle" TypeName="BusinessLogic.UploadsBL" 
        OldValuesParameterFormatString="original_{0}" 
            DataObjectTypeName="BusinessObject.Uploads" InsertMethod="Add" 
            UpdateMethod="Update">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="Id" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
   
    <br />
    <br />
    <h2>Details</h2>
        <asp:DetailsView ID="DetailsView1"  DataKeyNames="Id" runat="server" 
            Height="50px" Width="100%" 
            AutoGenerateRows="False" DataSourceID="ObjectDataSource2" 
            oniteminserted="DetailsView1_ItemInserted1" 
            oniteminserting="DetailsView1_ItemInserting1" 
            onitemupdated="DetailsView1_ItemUpdated1" 
            onitemupdating="DetailsView1_ItemUpdating1" CellPadding="3" 
        BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
        CellSpacing="2">
            <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        <EmptyDataTemplate>
        
        Select the above to see data
        
        </EmptyDataTemplate>
        
            <Fields>
             
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                
                <asp:TemplateField HeaderText="Image">
                
                    <EditItemTemplate>
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                        <br />

                        <asp:HiddenField ID="ImagePath" Value='<%# Eval("Path") %>' runat="server" />
                       
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:FileUpload ID="FileUpload2" runat="server" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Path") %>' 
                            Height="131px" Width="148px" />
                    </ItemTemplate>
                
                </asp:TemplateField>

                <asp:TemplateField HeaderText="UploadType">
                
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" 
                            DataSourceID="ObjectDataSource3" DataTextField="Name" DataValueField="Id" 
                            SelectedValue='<%# Bind("UploadsTypeId") %>'>
                        </asp:DropDownList>
                        <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" 
                            SelectMethod="GetAll" TypeName="BusinessLogic.UploadsTypeBL">
                        </asp:ObjectDataSource>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" 
                            DataSourceID="ObjectDataSource4" DataTextField="Name" DataValueField="Id" 
                            SelectedValue='<%# Bind("UploadsTypeId") %>'>
                        </asp:DropDownList>
                        <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" 
                            SelectMethod="GetAll" TypeName="BusinessLogic.UploadsTypeBL">
                        </asp:ObjectDataSource>
                    </InsertItemTemplate>

                    <ItemTemplate>


                      <%# ((BusinessObject.UploadsType)Eval("UploadsType")).Name%>
                    
                    
                    </ItemTemplate>


                
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Topic">
                
                
                    <EditItemTemplate>
                        <asp:ObjectDataSource ID="ObjectDataSource5" runat="server" 
                            SelectMethod="GetAll" TypeName="BusinessLogic.TopicsBL">
                        </asp:ObjectDataSource>
                        <asp:DropDownList ID="DropDownList3" runat="server" 
                            DataSourceID="ObjectDataSource5" DataTextField="Name" DataValueField="Id" 
                            SelectedValue='<%# Bind("TopicsId") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:ObjectDataSource ID="ObjectDataSource6" runat="server" 
                            SelectMethod="GetAll" TypeName="BusinessLogic.TopicsBL">
                        </asp:ObjectDataSource>
                        <asp:DropDownList ID="DropDownList4" runat="server" 
                            DataSourceID="ObjectDataSource6" DataTextField="Name" DataValueField="Id" 
                            SelectedValue='<%# Bind("TopicsId") %>'>
                        </asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>


                     <%# ((BusinessObject.Topics)Eval("Topics")).Name%>                  
                    
                    </ItemTemplate>
                
                
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="Name">
                <EditItemTemplate>
                
                  <%# System.Web.Security.Membership.GetUser().UserName %>
                
                </EditItemTemplate>
                 
                    <InsertItemTemplate>

                        <%# System.Web.Security.Membership.GetUser().UserName %>
                
                </InsertItemTemplate>
                <ItemTemplate>
                <%# Eval("UserName") %>
                     
                </ItemTemplate>
                </asp:TemplateField>
                
                    <asp:TemplateField HeaderText="Approved" >
                    
                    <ItemTemplate>

                    <%# Eval("IsApproved") %>
                    
                    </ItemTemplate>
                    
                    </asp:TemplateField>

                 
                 <asp:TemplateField HeaderText="CreatedOn">
                 <ItemTemplate>
                 <%# Eval("CreatedOn") %>

                 </ItemTemplate>
                 
                 </asp:TemplateField>
                        
                          
                <asp:CommandField ShowEditButton="True" ShowInsertButton="True" />
            </Fields>
        
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
        
        </asp:DetailsView>


        <div style="height:70px;">
        
        </div>



    </div>
    
    </ContentTemplate>
    </asp:UpdatePanel>

  
    <asp:UpdateProgress  AssociatedUpdatePanelID="UpdatePanel1" ID="UpdateProgress1" runat="server">
    <ProgressTemplate>
        <asp:Image ID="Image1" ImageUrl="~/App_Themes/Rational/images/ajax-loader.gif" runat="server" />
    
    </ProgressTemplate>
    </asp:UpdateProgress>
    </asp:Content>

