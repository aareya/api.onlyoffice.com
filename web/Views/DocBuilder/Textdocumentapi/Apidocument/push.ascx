<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">Push</span>
</h1>
<p class="dscr"></p>
  <h5>Example</h5><pre class="prettyprint source linenums"><code>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph0, oParagraph;
oParagraph0 = oDocument.GetElement(0);
oParagraph0.AddText("This is paragraph #0, you must not push it to take effect.");
var oParaNum;
for (var nParaIncrease = 0; nParaIncrease < 5; ++nParaIncrease)
{
oParagraph = Api.CreateParagraph();
oParagraph.AddText("This is paragraph #" + (nParaIncrease + 1) + ", you must push it to take effect.");
oDocument.Push(oParagraph);
}
builder.SaveFile("docx", "Push.docx");
builder.CloseFile();</code></pre><h5>Resulting document</h5>