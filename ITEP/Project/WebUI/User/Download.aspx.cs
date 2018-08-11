using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessObject;
using BusinessLogic;

public partial class Download : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Literal1.Visible = false;
        if (!Page.IsPostBack && Request.QueryString["branch"] != null)
        {
            DropDownList1.SelectedValue = Request.QueryString["branch"];
            CreateTree();
        }
    }

    protected void btnGetSubjects_Click(object sender, EventArgs e)
    
    {
        Literal1.Visible = true;
        CreateTree();
    }

    int branchId = 0;
    
    private void CreateTree()
    {
        TreeView1.Nodes.Clear();

        if (!string.IsNullOrEmpty(DropDownList1.SelectedValue))
            branchId = Convert.ToInt16(DropDownList1.SelectedValue);
        else
            branchId = Convert.ToInt16(Request.QueryString["branch"]);
        
        
        List<Subjects> branchSubjects = BusinessLogic.SubjectsBL.GetAllByBranch(branchId);

        foreach (Subjects subject in branchSubjects)
        {
            AddSubjectNode(subject, TreeView1.Nodes);
        }
    }

    
    private void AddSubjectNode(Subjects subject, TreeNodeCollection nodes)
    {
        TreeNode node = new TreeNode();
        node.Text = subject.Name;
        node.NavigateUrl = "";

        nodes.Add(node);

        // Get all the topics for the current subject
        List<Topics> subjectParentTopics = TopicsBL.GetAllBySubjectsandTopics(subject.Id);

        if (subjectParentTopics.Count > 0)
        {
            foreach (Topics topic in subjectParentTopics)
            {
                AddTopics(topic, node.ChildNodes);
            }
        }
    }



    private void AddTopics(Topics topic, TreeNodeCollection nodes)
    {
        TreeNode node = new TreeNode();
        node.Text = topic.Name;
        int TopicId = topic.Id;
        node.NavigateUrl = string.Format("~/User/Download.aspx?Id={0}&branch={1}", TopicId, branchId);

        nodes.Add(node);

        // Get current topic's children
        List<Topics> children = TopicsBL.GetAllByTopics(topic.Id);

        if (children.Count > 1)
        {
            foreach (Topics childTopic in children)
            {
                AddTopics(childTopic, node.ChildNodes);
            }
        }
    }

    
}