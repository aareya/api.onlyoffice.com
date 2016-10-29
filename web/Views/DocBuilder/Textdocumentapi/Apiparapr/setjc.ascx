<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetJc</span>
</h1>
<p class="dscr">
        Set paragraph contents justification.
    </p>
  <h5>Example</h5><pre class="prettyprint source linenums"><code>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oParaPr;
var oMyStyleLeft = oDocument.CreateStyle("My style with left text alignment");
oParaPr = oMyStyleLeft.GetParaPr();
oParaPr.SetJc("left");
var oMyStyleRight = oDocument.CreateStyle("My style with right text alignment");
oParaPr = oMyStyleRight.GetParaPr();
oParaPr.SetJc("right");
var oMyStyleCenter = oDocument.CreateStyle("My style with center text alignment");
oParaPr = oMyStyleCenter.GetParaPr();
oParaPr.SetJc("center");
var oMyStyleBoth = oDocument.CreateStyle("My style with justify text alignment");
oParaPr = oMyStyleBoth.GetParaPr();
oParaPr.SetJc("both");
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("This is a paragraph with the text in it aligned by the left side. ");
oParagraph.AddText("The justification is specified in the paragraph style. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes.");
oParagraph.SetStyle(oMyStyleLeft);
oParagraph = Api.CreateParagraph();
oParagraph.AddText("This is a paragraph with the text in it aligned by the right side. ");
oParagraph.AddText("The justification is specified in the paragraph style. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes.");
oParagraph.SetStyle(oMyStyleRight);
oDocument.Push(oParagraph);
oParagraph = Api.CreateParagraph();
oParagraph.AddText("This is a paragraph with the text in it aligned by the center. ");
oParagraph.AddText("The justification is specified in the paragraph style. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes.");
oParagraph.SetStyle(oMyStyleCenter);
oDocument.Push(oParagraph);
oParagraph = Api.CreateParagraph();
oParagraph.AddText("This is a paragraph with the text in it aligned by both sides (justified). ");
oParagraph.AddText("The justification is specified in the paragraph style. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes.");
oParagraph.SetStyle(oMyStyleBoth);
oDocument.Push(oParagraph);
builder.SaveFile("docx", "SetJc.docx");
builder.CloseFile();</code></pre><h5>Resulting document</h5>