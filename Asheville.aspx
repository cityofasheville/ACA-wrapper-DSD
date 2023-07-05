<!--*** Language declaration goes ***-->
<%@ Page Language="C#" AutoEventWireup="true" ValidateRequest="false" %>
<!--*** Language declaration end ***-->

<%@ Import namespace="Accela.ACA.Web" %>

<html >
<head id="Head1" runat="server">
    <title>
        City of Asheville - Citizen Portal
    </title>
    <script runat="server">
        protected override void OnLoad(EventArgs e)
        {
          Response.Redirect("Welcome.aspx");
        }
    </script>
    <script type="text/JavaScript" language="JavaScript">
<!--
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
    </script>
</head>
     
<link type="text/css" rel="stylesheet" href="<%=BasePage.CustomizeFolderRoot %>stylesheet.css" />
<link type="text/css" rel="Stylesheet" href="Customize/font.css" />
<body style="margin: 0 0 0 0; background-image: url(<%=BasePage.CustomizeFolderRoot %>images/page_pinstripe_bg.gif);"
    onload="MM_preloadImages('<%=BasePage.CustomizeFolderRoot %>images/nav_business-over.gif','<%=BasePage.CustomizeFolderRoot %>images/nav_residents-over.gif','<%=BasePage.CustomizeFolderRoot %>images/nav_visitors-over.gif','<%=BasePage.CustomizeFolderRoot %>images/button_search-over.gif','<%=BasePage.CustomizeFolderRoot %>images/nav_home-over.gif','<%=BasePage.CustomizeFolderRoot %>images/nav_government-over.gif')">
    <form runat="server" id="theForm">
    <!--Section 508 Support goes-->
    <script type="text/JavaScript" language="JavaScript">
    <!--
        function skipTo(iframeID) {
            var expectedArgLength = skipTo.length;
            var oIframe = null;
            var oDoc = document;

            if (iframeID) {
                oIframe = window.frames[iframeID] ? window.frames[iframeID] : document.getElementById(iframeID);
                oDoc = oIframe ? oIframe.document || oIframe.contentDocument : null;
            }
            else {
                oIframe = window;
                oDoc = window.document;
            }

            var oAnchor = null;
            if (oDoc && arguments.length > expectedArgLength) {
                for (i = expectedArgLength; i < arguments.length; i++) {
                    oAnchor = oDoc.getElementById(arguments[i]);
                    if (oAnchor != null) {
                        break;
                    }
                }
            }

            var originalNeedAsk = oIframe && oIframe.NeedAsk ? oIframe.NeedAsk : null;
            if (originalNeedAsk != null) {
                oIframe.SetNotAsk(false);
            }
            if (oAnchor) {
                oAnchor.scrollIntoView();
                oAnchor.focus();
            }
            if (originalNeedAsk != null) {
                oIframe.SetNotAsk(originalNeedAsk);
            }
        }

        function skipToBeginningOfACA() {
            skipTo("ACAFrame", "ctl00_hlSkipToolBar", "SecondAnchorInACAMainContent");
        }

        function skipToMainContent() {
            skipTo("ACAFrame", "SecondAnchorInACAMainContent", "FirstAnchorInACAMainContent");
        }
    //-->
    </script>
    <ACA:AccelaHideLink ID="hlSkipNavigation" runat="server" AltKey="img_alt_externalmenu_skiplink" OnClientClick="skipToBeginningOfACA();"/>
    <ACA:AccelaHideLink ID="hlSkipToolBar" runat="server" AltKey="img_alt_modulemenu_skiplink" OnClientClick="skipToMainContent();" TabIndex="-1"/>
    <span style="display:none">
        <ACA:AccelaHideLink ID="hlFakeLink" runat="server" AltKey="img_alt_modulemenu_skiplink" IsSkippingToAnchor="true" NextControlClientID="targetFakeLink" TabIndex="-1"/>
        <a name="targetFakeLink" id="targetFakeLink" tabindex="-1"></a>
    </span>
    
    <script runat="server">
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                hlSkipNavigation.AccessKey = Accela.ACA.Common.Util.AccessibilityUtil.GetAccessKey(Accela.ACA.Common.AccessKeyType.SkipNavigation);
                
                hlSkipToolBar.AccessKey = Accela.ACA.Common.Util.AccessibilityUtil.GetAccessKey(Accela.ACA.Common.AccessKeyType.SkipToolBar);
                //to resolve the issue that Safari can't detect accesskey raised from another iframe page.
                hlSkipToolBar.Visible = Request.UserAgent.ToLowerInvariant().Contains("safari");
            }
        }
    </script>
    <!--Section 508 Support end-->

<table style="width:55em;" cellspacing="0" cellpadding="0" border="0">
    <tbody>
        <tr> 
            <td valign="top">
                <table cellspacing="0" cellpadding="0" border="0">
                    <tbody>
                        <tr> 
                            <td rowspan="2"><a href="./default.aspx" title="City of Asheville [home]"><img style="width:846px; border:0px;" height="90" id="header_logo" alt="City of Asheville [home]" src="<%=FileUtil.ApplicationRoot %>BANNIMAG.jpg" /></a></td>
                        </tr>
                    </tbody>
                </table>
            </td>
            </tr>
                    </tbody>
                </table>
            </td>
        </tr>
    </tbody>
</table>
	   		    </td>
                            </tr>
                            
                        </tbody>
                    </table>
                </td>
                <td style="margin-top: 0; background-color: #ffffff; vertical-align: top;">
                    <table cellspacing="0" cellpadding="0" border="0">
                        <tbody>
                            <tr>
                                <td style="vertical-align: top;">
                                    <table cellspacing="0" cellpadding="0" border="0">
                                        <tbody>
                                            
                                            <tr>
                                                <td valign="top" align="ACA_AlignLeftOrRight">
                                                    <!-- **** ACA iframe goes here ****-->
                                                    <iframe id="ACAFrame" name="ACAFrame" height="600" style="overflow-y:auto; width:52.9em;" scrolling="no" frameborder="0" marginwidth="15" title="<%=LabelUtil.GetGlobalTextByKey("iframe_bridgeview_title") %>"
                                                        src='<%=Accela.ACA.Web.Common.AppSession.CurrentURL%>'><%=String.Format(LabelUtil.GetGlobalTextByKey("iframe_nonsupport_message"), AppSession.CurrentURL)%></iframe>
                                                    <!-- **** ACA iframe end ****-->
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <img  style="width:52.9em;" height="24" alt="" src="<%=BasePage.CustomizeFolderRoot %>images/spacer.gif" /></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>
<table style="width:62.5em;" cellspacing="0" cellpadding="0" border="0">
        <tbody>
            <tr>
                <td>
                    <img  style="width:62.5em;" height="10" alt="" src="<%=BasePage.CustomizeFolderRoot %>images/spacer.gif" /></td>
            </tr>
            <tr>
                <td>
                    <p style="text-align: center">
                        <%=DateTime.Now.Year%> City of Asheville NC, All Rights Reserved.
                    </p>
                </td>
            </tr>
            <tr>
                <td>
                    <img  style="width:62.5em;" height="10" alt="" src="<%=BasePage.CustomizeFolderRoot %>images/spacer.gif" /></td>
            </tr>
        </tbody>
    </table>
    </form>
</body>
</html>