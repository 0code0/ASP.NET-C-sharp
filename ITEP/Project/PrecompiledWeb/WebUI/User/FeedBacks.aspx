<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="User_FeedBacks, App_Web_btwqd1v2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

         <center><h2 style="margin-top:20px; margin-bottom:-15px;">FeedBack Form</h2></center>
                    
                        <table  style="margin-left: 260px; margin-bottom: 20px;" class="freecontactform" id="ContactForm">
	 
    <tr>
	 <td colspan="2">
	  
	 <div class="freecontactformheader">Fill the Form</div>
	  
	 <div class="freecontactformmessage"></div>
	  
	 </td>
	</tr>
	<tr>
	 <td valign="top">
	  <label for="Full_Name" class="required">Full Name<span class="required_star"> * </span></label>
	 </td>
	 <td valign="top">
	  <asp:TextBox ID="FullName"  runat="server" maxlength="100" style="width:230px"></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
             ErrorMessage="Fill" ControlToValidate="FullName"></asp:RequiredFieldValidator>
	 </td>
	</tr>
	<tr>
	 <td valign="top">
	  <label for="Email_Address" class="required">Email Address<span class="required_star"> * </span></label>
	 </td>
	 <td valign="top">
         <asp:TextBox ID="EmailAddress"  runat="server" maxlength="100" style="width:230px"></asp:TextBox>
	 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
             ErrorMessage="Fill" ControlToValidate="EmailAddress"></asp:RequiredFieldValidator>
     </td>
	</tr>
	<tr>
	 <td valign="top">
	  <label for="Telephone_Number" class="not-required">Telephone Number</label>
	 </td>
	 <td valign="top">
	 <asp:TextBox ID="Number"  runat="server" maxlength="100" style="width:230px"></asp:TextBox>

     </td>
	</tr>
	<tr>
	 <td valign="top">
	  <label for="Your_Message" class="required">Message Title<span class="required_star"> * </span></label>
	 </td>
	 <td valign="top">
	   <asp:TextBox ID="MsgTitle"   runat="server" maxlength="2000" style="width:230px"></asp:TextBox>
       <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
             ErrorMessage="Fill" ControlToValidate="MsgTitle"></asp:RequiredFieldValidator>
	 </td>
	</tr>
    <tr>
	 <td valign="top">
	  <label for="Your_Message" class="required">Your Message<span class="required_star"> * </span></label>
	 </td>
	 <td valign="top">
         <asp:TextBox ID="Body" TextMode="MultiLine"  runat="server" maxlength="2000" style="width:230px;height:160px" ></asp:TextBox>
	  <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
             ErrorMessage="Fill" ControlToValidate="Body"></asp:RequiredFieldValidator>
	 </td>
	</tr>
	<tr>
	 <td colspan="2" style="text-align:center" >
	  <div class="antispammessage">
	  We Respond to ur answer with in few days
	  <br /><br />
		  <div class="antispamquestion">
		  
		   
		  </div>
	  </div>
	 </td>
	</tr>
	<tr>
	 <td colspan="2" style="text-align:center" >
	 <br /><br />
         <asp:Button ID="Submit" runat="server" Text="Submit Form " 
             style="width:200px;height:40px" onclick="Submit_Click" />
	  
	  <br /><br />
	  
	  <div>
      
      </div>
	  <br /><br />
	 </td>
	</tr>
	</table>

</asp:Content>

