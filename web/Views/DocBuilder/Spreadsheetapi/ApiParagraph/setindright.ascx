<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetIndRight</span>
</h1>
<p class="dscr">
        Set the paragraph right side indentation.
    </p>
  <h5>Example</h5><pre class="prettyprint source linenums"><code>builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var oStroke, oFill, oParagraph;
oFill = Api.CreateSolidFill(Api.CreateRGBColor(104, 155, 104));
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
var oShape = oWorksheet.AddShape("flowChartOnlineStorage", 200 * 36000, 60 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000);
oDocContent = oShape.GetDocContent();
oParagraph = oDocContent.GetElement(0);
oParagraph.AddText("This is a paragraph with the right offset of 2 inches set to it. ");
oParagraph.AddText("We also aligned the text in it by the right side. ");
oParagraph.AddText("This sentence is used to add lines for demonstrative purposes.");
oParagraph.SetJc("right");
oParagraph.SetIndRight(2880);
oParagraph = Api.CreateParagraph();
oParagraph.AddText("This is a paragraph without any offset set to it. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes.");
oDocContent.Push(oParagraph);
builder.SaveFile("xlsx", "SetIndRight.xlsx");
builder.CloseFile();</code></pre><h5>Resulting document</h5>