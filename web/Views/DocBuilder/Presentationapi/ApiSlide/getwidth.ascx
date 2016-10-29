<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetWidth</span>
</h1>
<p class="dscr"></p>
  <h5>Example</h5><pre class="prettyprint source linenums"><code>builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
oPresentation.SetSizes(254 * 36000, 190 * 36000);
var oSlide = oPresentation.GetCurrentSlide();
oSlide.RemoveAllObjects();
oFill = Api.CreateSolidFill(Api.CreateRGBColor(61, 74, 107));
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
var oShape = Api.CreateShape("rect", 200 * 36000, 130 * 36000, oFill, oStroke);
oShape.SetPosition(608400, 1267200);
oDocContent = oShape.GetDocContent();
oParagraph = oDocContent.GetElement(0);
var oSlideWidth = oSlide.GetWidth();
oParagraph.AddText("The slide width = " + oSlideWidth/36000 + " mm");
oSlide.AddObject(oShape);
builder.SaveFile("pptx", "GetWidth.pptx");
builder.CloseFile();</code></pre><h5>Resulting document</h5>