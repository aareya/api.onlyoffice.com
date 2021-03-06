﻿<%@ 
    Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl<string>"
%>

<% var data = Model as string; %>

<h4 class="header-gray" id="GetClassType">GetClassType() &rarr; {"document"}</h4>

<dl class="details">
        <dt>Overrides:</dt>
        <dd>
            <ul>
                <li>
                    <a href="<%= Url.Action(data + "/apiparapr/getclasstype") %>">ApiParaPr.GetClassType</a>
                </li>
            </ul>
        </dd>
</dl>         
<p class="dscr">
Get the type of this class.
</p>

<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <em>"document"</em>
    </dd>
</dl>
