<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetLevelIndex</span>
</h1>
<p class="dscr"></p>
  <h5>Example</h5><pre class="prettyprint source linenums"><code>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oNumbering, oNumLvl, oNumLvl1;
oNumbering = oDocument.CreateNumbering("numbered");
oNumLvl = oNumbering.GetLevel(0);
oNumLvl1 = oNumbering.GetLevel(1);
oNumLvl1.SetRestart(false);
oParagraph = oDocument.GetElement(0);
oParagraph.SetNumbering(oNumLvl);
oParagraph.AddText("This is the first element of a parent numbered list which starts with '1'");
oParagraph = Api.CreateParagraph();
oParagraph.SetNumbering(oNumLvl1);
oParagraph.AddText("This is the first element of a child numbered list which starts with 'a'");
oDocument.Push(oParagraph);
oParagraph = Api.CreateParagraph();
oParagraph.SetNumbering(oNumLvl1);
oParagraph.AddText("This is the second element of a child numbered list which starts with 'b'");
oDocument.Push(oParagraph);
oParagraph = Api.CreateParagraph();
var oLevelIndex = oNumLvl.GetLevelIndex();
oParagraph.AddText("Level index for the parent numbered list = " + oLevelIndex);
oDocument.Push(oParagraph);
oParagraph = Api.CreateParagraph();
var oLevelIndex = oNumLvl1.GetLevelIndex();
oParagraph.AddText("Level index for the element of a child numbered list  = " + oLevelIndex);
oDocument.Push(oParagraph);
builder.SaveFile("docx", "GetLevelIndex.docx");
builder.CloseFile();</code></pre><h5>Resulting document</h5>