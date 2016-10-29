<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetFill</span>
</h1>
<p class="dscr">
        Set the text color for the current text run.
    </p>
  <h5>Example</h5><pre class="prettyprint source linenums"><code>builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var oStroke, oFill;
oFill = Api.CreateSolidFill(Api.CreateRGBColor(104, 155, 104));
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
var oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 35 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000);
oDocContent = oShape.GetDocContent();
oParagraph = oDocContent.GetElement(0);
oRun = Api.CreateRun();
oRun.AddText("This is just a sample text. ");
oParagraph.AddElement(oRun);
oRun = Api.CreateRun();
oFill = Api.CreateSolidFill(Api.CreateRGBColor(0, 0, 255));
oRun.SetFill(oFill);
oRun.AddText("This is a text run with the font color set to blue.");
oParagraph.AddElement(oRun);
builder.SaveFile("xlsx", "SetFill.xlsx");
builder.CloseFile();</code></pre><h5>Resulting document</h5>