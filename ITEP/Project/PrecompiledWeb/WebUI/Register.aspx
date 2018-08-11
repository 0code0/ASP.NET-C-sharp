<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Register, App_Web_ta3bonb0" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    
    <div id="RegisterStyle">
    <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" CssClass="Register" 
            oncreateduser="CreateUserWizard1_CreatedUser" BackColor="#FFFBD6"  
            
            BorderColor="#FFDFAD" BorderStyle="Solid" CellPadding="30" 
            CellSpacing="30" BorderWidth="5px" 
            
            Font-Names="Verdana" Font-Size="1.5em" LabelStyle-Font-Italic="true" LabelStyle-Height="30"
            
            LabelStyle-VerticalAlign="Middle" LabelStyle-HorizontalAlign="Left"  
            HeaderStyle-Font-Size="XX-Large">
            
        <ContinueButtonStyle BackColor="White" BorderColor="#CC9966" 
            BorderStyle="Solid" BorderWidth="2px"  Font-Names="Verdana" 
            ForeColor="#990000" />
        <CreateUserButtonStyle BackColor="White" BorderColor="#CC9966" 
            BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" 
            ForeColor="#990000" />
        <TitleTextStyle BackColor="#990000" Font-Bold="True" Font-Size="Small" Height="40px" VerticalAlign="Top" ForeColor="White" />
        
        <WizardSteps>
            <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                <CustomNavigationTemplate>
                    <table border="0"  >
                        <tr >
                            <td >
                                <asp:Button ID="StepNextButton" runat="server" CommandName="MoveNext" 
                                    Text="Create User" ValidationGroup="CreateUserWizard1" />
                            </td>
                        </tr>
                    </table>
                </CustomNavigationTemplate>
            </asp:CreateUserWizardStep>
            <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">


            </asp:CompleteWizardStep>

            <asp:WizardStep ID="WizardStep1" runat="server">
            </asp:WizardStep>

        </WizardSteps>
        <FinishNavigationTemplate>
            <asp:Button ID="FinishPreviousButton" runat="server" CausesValidation="False" 
                CommandName="MovePrevious" Text="Previous" />
            <asp:Button ID="FinishButton" runat="server" CommandName="MoveComplete" 
                Text="Finish" />
        </FinishNavigationTemplate>
        <HeaderStyle BackColor="#FFCC66" BorderColor="#FFFBD6" BorderStyle="Solid" 
            BorderWidth="2px" Font-Bold="True" Font-Size="0.9em" ForeColor="#333333" 
            HorizontalAlign="Center" />
        <NavigationButtonStyle BackColor="White" BorderColor="#CC9966" 
            BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" 
            ForeColor="#990000" />
        <SideBarButtonStyle ForeColor="White" />
        <SideBarStyle BackColor="#990000" Font-Size="0.9em" VerticalAlign="Top" />
        <StartNavigationTemplate>
            <asp:Button ID="StartNextButton" runat="server" CommandName="MoveNext" 
                Text="Next" />
        </StartNavigationTemplate>
        <StepNavigationTemplate>
            <asp:Button ID="StepPreviousButton" runat="server" CausesValidation="False" 
                CommandName="MovePrevious" Text="Previous" />
            <asp:Button ID="StepNextButton" runat="server" CommandName="MoveNext" 
                Text="Next" />
        </StepNavigationTemplate>
    </asp:CreateUserWizard>

    
    </div>

</asp:Content>

