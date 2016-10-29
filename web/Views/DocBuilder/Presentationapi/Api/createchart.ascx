<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CreateChart</span>
</h1>
<p class="dscr">
        Create a chart with the parameters specified.
    </p>
  <h5>Example</h5><pre class="prettyprint source linenums"><code>builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
var oSlide = oPresentation.GetSlideByIndex(0);
oSlide.RemoveAllObjects();
oShape = Api.CreateChart("bar3D", [[200, 240, 280],[250, 260, 280]], ["Projected Revenue", "Estimated Costs"], [2014, 2015, 2016], 4051300, 2347595, 24);
oShape.SetSize(300 * 36000, 130 * 36000);
oShape.SetPosition(608400, 1267200);
oSlide.AddObject(oShape);
builder.SaveFile("pptx", "CreateChart.pptx");
builder.CloseFile();</code></pre><h5>Resulting document</h5>