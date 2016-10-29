<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">RemoveAllElements</span>
</h1>
<p class="dscr">
        Remove all elements from the current paragraph.
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
oRun.AddText("This is the first document paragraph. We removed all the elements to get the number of paragraph elements at this point: ");
oRun.AddText("" + oParagraph.GetElementsCount() + ". If we had not done that the number before this sentence would be '1'.");
oParagraph.AddElement(oRun);
oParagraph = Api.CreateParagraph();
oRun = Api.CreateRun();
oRun.AddText("This is the second paragraph. It is created without any elements, so there is no need to remove them. The number of paragraph elements at this point: ");
oRun.AddText("" + oParagraph.GetElementsCount() + ". It is '0' and should be that way.");
oParagraph.AddElement(oRun);
oDocContent.Push(oParagraph);
builder.SaveFile("xlsx", "RemoveAllElements.xlsx");
builder.CloseFile();</code></pre><h5>Resulting document</h5>