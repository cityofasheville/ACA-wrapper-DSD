<!-- ADD THIS SNIPPET TO ASHEVILLE.ASPX TO REDIRECT AWAY FROM TERRIBLE IFRAME -->
<script runat="server">
    protected override void OnLoad(EventArgs e)
    {
      Response.Redirect("Welcome.aspx");
    }
  </script>
