<%@ page title="" language="C#" masterpagefile="~/Admin.master" autoeventwireup="true" inherits="Admin_ManageNews, App_Web_it5qycdx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server" >
    <h2>Manage News</h2>
    <h3>All News By Category</h3>
    
    <br/>
    
    Category:
    <asp:DropDownList ID="DropDownList1" Width="150px" runat="server" AutoPostBack="True" 
        DataSourceID="ObjectDataSource1" DataTextField="Name" DataValueField="Id">
    </asp:DropDownList>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        SelectMethod="GetAll" TypeName="BusinessLogic.NewsCategoryBL">
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
        SelectMethod="GetAllByCategory" TypeName="BusinessLogic.NewsBL" 
        DataObjectTypeName="BusinessObject.News" DeleteMethod="Delete">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="CategoryId" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <br/>
    <br/>
    <asp:GridView ID="GridView1" runat="server" DataKeyNames="Id" Width="100%" 
        AutoGenerateColumns="False" DataSourceID="ObjectDataSource2" 
        BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
        CellPadding="3" CellSpacing="2">
        <Columns>
            <asp:CommandField ShowSelectButton="True" HeaderText="Action" ShowDeleteButton="True" />
            
            <asp:BoundField DataField="HeadLines" HeaderText="HeadLines" 
                SortExpression="HeadLines" />

            <asp:BoundField DataField="TextArea" HeaderText="TextArea" 
                SortExpression="TextArea" />
            
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
    <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" 
        DataObjectTypeName="BusinessObject.News" InsertMethod="Add" 
        SelectMethod="GetSingle" TypeName="BusinessLogic.NewsBL" UpdateMethod="Update">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="Id" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:Button ID="Button1" runat="server" Text="Add new News" 
            onclick="Button1_Click1" />
    <h2>Details</h2>
    <asp:DetailsView ID="DetailsView1"  DataKeyNames="Id" runat="server" 
        Height="50px" Width="100%" 
        AutoGenerateRows="False" DataSourceID="ObjectDataSource3" 
        oniteminserting="DetailsView1_ItemInserting" 
        onitemupdating="DetailsView1_ItemUpdating" 
        oniteminserted="DetailsView1_ItemInserted" 
        onitemupdated="DetailsView1_ItemUpdated" CellPadding="4" 
        ForeColor="#333333" GridLines="None">
        <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
        <Fields>
            <asp:TemplateField HeaderText="Category">
            
            
                <EditItemTemplate>
                    <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" 
                        SelectMethod="GetAll" TypeName="BusinessLogic.NewsCategoryBL">
                    </asp:ObjectDataSource>
                    <asp:DropDownList ID="DropDownList3" runat="server" 
                        DataSourceID="ObjectDataSource4" DataTextField="Name" DataValueField="Id" 
                        SelectedValue='<%# Bind("CategoryId") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:ObjectDataSource ID="ObjectDataSource5" runat="server" 
                        SelectMethod="GetAll" TypeName="BusinessLogic.NewsCategoryBL">
                    </asp:ObjectDataSource>
                    <asp:DropDownList ID="DropDownList2" runat="server" 
                        DataSourceID="ObjectDataSource5" DataTextField="Name" DataValueField="Id" 
                        SelectedValue='<%# Bind("CategoryId") %>'>
                    </asp:DropDownList>
                </InsertItemTemplate>
                <ItemTemplate>
                   

                   <%# ((BusinessObject.NewsCategory)Eval("NewsCategory")).Name %>


                </ItemTemplate>
            
            
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Upload Type">
            
            
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList3" runat="server" 
                        DataSourceID="ObjectDataSource6" DataTextField="Name" DataValueField="Id" 
                        SelectedValue='<%# Bind("UploadTypeId") %>'>
                    </asp:DropDownList>
                    <asp:ObjectDataSource ID="ObjectDataSource6" runat="server" 
                        SelectMethod="GetAll" TypeName="BusinessLogic.UploadsTypeBL">
                    </asp:ObjectDataSource>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:ObjectDataSource ID="ObjectDataSource7" runat="server" 
                        SelectMethod="GetAll" TypeName="BusinessLogic.UploadsTypeBL">
                    </asp:ObjectDataSource>
                    <asp:DropDownList ID="DropDownList4" runat="server" 
                        DataSourceID="ObjectDataSource7" DataTextField="Name" DataValueField="Id">
                    </asp:DropDownList>
                </InsertItemTemplate>
                <ItemTemplate>
                   

                   <%# ((BusinessObject.UploadsType)Eval("UploadsType")).Name%>


                </ItemTemplate>
            
            
            </asp:TemplateField>


              <asp:BoundField DataField="HeadLines" HeaderText="HeadLines" 
                SortExpression="HeadLines" />
            
            
            <asp:TemplateField HeaderText="Image">
            
            
            
            
                <EditItemTemplate>

                    <asp:HiddenField ID="TmageReload" runat="server" Value='<%# Eval("ImagePath") %>' />

                    <asp:FileUpload ID="FileUpload1" runat="server" 
                       />
                
                  
                    <asp:Image ID="Image2" runat="server" Height="104px" 
                        ImageUrl='<%# Eval("ImagePath") %>' Width="225px" />
                
                </EditItemTemplate>

                <InsertItemTemplate>
                    <asp:FileUpload ID="FileUpload2" runat="server" />
                 
                </InsertItemTemplate>
                
                <ItemTemplate>

                    <asp:Image ID="Image1" runat="server" Width="255px" Height="125px" 
                        ImageUrl='<%# Eval("ImagePath") %>' />
                
                
                </ItemTemplate>
            
            </asp:TemplateField>



            <asp:BoundField DataField="TextArea" ControlStyle-Width="300px" 
                ControlStyle-Height="30px"  HeaderText="TextArea" 
                SortExpression="TextArea" >

<ControlStyle Height="30px" Width="300px"></ControlStyle>
            </asp:BoundField>

        
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
    </asp:Content>

