<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">ApiImage</span>
</h1>
<p class="dscr"></p>
  <h5>Example</h5><pre class="prettyprint source linenums"><code>builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
var oSlide = oPresentation.GetSlideByIndex(0);
oSlide.RemoveAllObjects();
oImage = Api.CreateImage("http://helpcenter.onlyoffice.com/images/Help/Guides/big/guide59/step2_1.png", 100 * 36000, 50 * 36000);
oSlide.AddObject(oImage);
oSchemeColor = Api.CreateSchemeColor("accent6");
oGs1 = Api.CreateGradientStop(oSchemeColor, 0);
oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(61, 74, 107), 100000);
oFill = Api.CreateRadialGradientFill([oGs1, oGs2]);
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
var oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke);
oShape.SetPosition(608400, 1267200);
oDocContent = oShape.GetDocContent();
var oClassType = oImage.GetClassType();
oParagraph = oDocContent.GetElement(0);
oParagraph.SetJc("left");
oParagraph.AddText("Class Type = " + oClassType);
oSlide.AddObject(oShape);
builder.SaveFile("pptx", "ApiImage.pptx");
builder.CloseFile();</code></pre><h5>Resulting document</h5>