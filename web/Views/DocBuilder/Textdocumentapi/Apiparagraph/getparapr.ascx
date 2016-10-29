<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetParaPr</span>
</h1>
<p class="dscr">
        Get paragraph properties.
    </p>
  <h5>Example</h5><pre class="prettyprint source linenums"><code>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oParaPr;
oParagraph = oDocument.GetElement(0);
var oParaStyle = oDocument.GetDefaultStyle("paragraph");
oParagraph = oDocument.GetElement(0);
oParagraph.SetStyle(oParaStyle);
oParaPr = oParagraph.GetParaPr();
oParaPr.SetSpacingLine(480, "auto");
oParaPr.SetJc("both");
oParaPr.SetIndFirstLine(720);
oParagraph.AddText("This is a paragraph with the line spacing, text justification and indent set using the paragraph style. ");
oParagraph.AddText("We do not change the style of the paragraph itself. ");
oParagraph.AddText("Only document-wide paragraph styles are applied.");
builder.SaveFile("docx", "GetParaPr.docx");
builder.CloseFile();</code></pre><h5>Resulting document</h5>