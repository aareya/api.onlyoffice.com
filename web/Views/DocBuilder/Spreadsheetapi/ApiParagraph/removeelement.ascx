<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">RemoveElement</span>
</h1>
<p class="dscr">
        Remove the element using the position specified.
    </p>
  <h5>Example</h5><pre class="prettyprint source linenums"><code>builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var oStroke, oFill, oParagraph, oRun;
oFill = Api.CreateSolidFill(Api.CreateRGBColor(104, 155, 104));
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
var oShape = oWorksheet.AddShape("flowChartOnlineStorage", 200 * 36000, 60 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000);
oDocContent = oShape.GetDocContent();
oParagraph = oDocContent.GetElement(0);
oParagraph.RemoveAllElements();
oRun = Api.CreateRun();
oRun.AddText("This is the first paragraph element. ");
oParagraph.AddElement(oRun);
oRun = Api.CreateRun();
oRun.AddText("This is the second paragraph element. ");
oParagraph.AddElement(oRun);
oRun = Api.CreateRun();
oRun.AddText("This is the third paragraph element (it will be removed from the paragraph and we will not see it). ");
oParagraph.AddElement(oRun);
oParagraph.AddLineBreak();
oRun = Api.CreateRun();
oRun.AddText("This is the fourth paragraph element - it became the third, because we removed the previous run from the paragraph. ");
oParagraph.AddElement(oRun);
oParagraph.AddLineBreak();
oRun = Api.CreateRun();
oRun.AddText("Please note that line breaks are not counted into paragraph elements!");
oParagraph.AddElement(oRun);
oParagraph.RemoveElement(2);
builder.SaveFile("xlsx", "RemoveElement.xlsx");
builder.CloseFile();</code></pre><h5>Resulting document</h5>