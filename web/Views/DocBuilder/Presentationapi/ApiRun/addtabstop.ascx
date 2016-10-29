<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">AddTabStop</span>
</h1>
<p class="dscr">
        Add a tab stop to the current run.
    </p>
  <h5>Example</h5><pre class="prettyprint source linenums"><code>builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
var oSlide = oPresentation.GetSlideByIndex(0);
oSlide.RemoveAllObjects();
oFill = Api.CreateSolidFill(Api.CreateRGBColor(61, 74, 107));
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
var oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke);
oShape.SetPosition(608400, 1267200);
oDocContent = oShape.GetDocContent();
oParagraph = oDocContent.GetElement(0);
oRun = Api.CreateRun();
oRun.SetFontSize(30);
oRun.AddText("This is just a sample text. After it three tab stops will be added.");
oRun.AddTabStop();
oRun.AddTabStop();
oRun.AddTabStop();
oRun.AddText("This is the text which starts after the tab stops.");
oParagraph.AddElement(oRun);
oSlide.AddObject(oShape);
builder.SaveFile("pptx", "AddTabStop.pptx");
builder.CloseFile();</code></pre><h5>Resulting document</h5>