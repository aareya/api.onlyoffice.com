﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SaveFile</span>
</h1>

                <h4 class="header-gray" id="SaveFile">bool SaveFile(nType, sPath, sParams);</h4>
                <p class="dscr">Save the file after all the changes are made. The type of the file which will be saved needs to be set.</p>
                
            <h2>Parameters:</h2>
            <table class="table">
                <thead>
                    <tr class="tablerow">
                        <td>Name</td>
                        <td>Type</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><em>nType</em></td>
                        <td>const&nbsp;int&
                        </td>
                        <td>The type of the file to be saved set as a hexadecimal integer for the C++ code; for the <em>.docbuilder</em> script file the following values are possible: <b>docx</b>, <b>odt</b>, <b>rtf</b>, <b>txt</b>, <b>pptx</b>, <b>xlsx</b>, <b>ods</b>, <b>csv</b>, <b>pdf</b>.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><em>sPath</em></td>
                        <td>const&nbsp;wchar_t*
                        </td>
                        <td>The path to the file to be saved together with its name and extension.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><em>sParams</em></td>
                        <td>const&nbsp;wchar_t*
                        </td>
                        <td>The parameters needed for the correct file saving (most commonly the encoding is used for the <em>txt</em> and <em>csv</em> file types or the delimiter for the <em>csv</em> files, for other file types this is just an empty string). The parameters are added in the form of XML tags, where <b>m_nCsvTxtEncoding</b> is used for the text encoding and <b>m_nCsvDelimiter</b> is used for the csv delimiter. You can find all the supported values for the encoding <a target="_blank" href="https://github.com/ONLYOFFICE/server/blob/master/Common/sources/commondefines.js">in this file</a>. The supported values for the csv delimiters include:
                            <ul>
                                <li><b>0</b> - no delimiter</li>
                                <li><b>1</b> - tab</li>
                                <li><b>2</b> - semicolon</li>
                                <li><b>3</b> - colon</li>
                                <li><b>4</b> - comma</li>
                                <li><b>5</b> - space</li>
                            </ul>
                            When saving into an image file (<b>png</b> or <b>jpg</b>) for creating thumbnails, the additional parameters are used. <a href="#SaveImage">See below</a> to find them out.
                    </tr>
                </tbody>
            </table>
<h2>Example</h2>
<h4 class="header-gray">C++</h4>
<pre>
#define OFFICESTUDIO_FILE_DOCUMENT          0x0040
#define OFFICESTUDIO_FILE_DOCUMENT_DOCX     OFFICESTUDIO_FILE_DOCUMENT + 0x0001
NSDoctRenderer::CDocBuilder::Initialize();
NSDoctRenderer::CDocBuilder oBuilder;
oBuilder.SaveFile(OFFICESTUDIO_FILE_DOCUMENT_DOCX, L"D:/TESTFILES/document.docx");
NSDoctRenderer::CDocBuilder::Dispose();
</pre>
<h4 class="header-gray">.docbuilder</h4>
<pre>
builder.SaveFile("docx", "D:/TESTFILES/document.docx");
</pre>

<h2 id="SaveImage">Saving into images</h2>
<p><b>ONLYOFFICE Document Builder</b> allows to save your document files into image files creating thumbnails of the first page or of all the pages in the document. This is done using the parameters of the <em>SaveFile()</em> method. The parameters are added in the form of XML tags, where the following tags can be used:</p>
<ul>
    <li><b>m_oThumbnail</b> - the core tag showing that the inner nodes will be used to create a thumbnail out of the document file;</li>
    <li><b>format</b> - the image file format used to create the thumbnail (can be of the following values: <b>3</b> - for a JPG file, <b>4</b> - for a PNG file);</li>
    <li><b>aspect</b> - the image aspect when creating the thumbnail from the document file (can be of the following values: <b>1</b> - will keep the original aspect, <b>0</b> - will stretch the image to fit the width and the height set below;</li>
    <li><b>first</b> - whether only the first page or all the pages should be converted into the thumbnail (can be of the following values: <b>true</b> - only the first page will serve as a thumbnail, <b>false</b> - all the document pages will be used to create thumbnails, in this case the file will be saved as an archive of images, one for each page);</li>
    <li><b>width</b> - the image width in pixels;</li>
    <li><b>height</b> - the image height in pixels.</li>
</ul>
<h2>Example</h2>
<h4 class="header-gray">C++</h4>
<pre>
oBuilder.SaveFile(OFFICESTUDIO_FILE_IMAGE, L"D:/TESTFILES/thumbnail.png", "&lt;m_oThumbnail&gt;&lt;format&gt;4&lt;/format&gt;&lt;aspect&gt;1&lt;/aspect&gt;&lt;first&gt;false&lt;/first&gt;&lt;width&gt;1000&lt;/width&gt;&lt;height&gt;1000&lt;/height&gt;&lt;/m_oThumbnail&gt;");
</pre>
<h4 class="header-gray">.docbuilder</h4>
<pre>
builder.SaveFile("image", "./thumbnail.png", "&lt;m_oThumbnail&gt;&lt;format&gt;4&lt;/format&gt;&lt;aspect&gt;1&lt;/aspect&gt;&lt;first&gt;false&lt;/first&gt;&lt;width&gt;1000&lt;/width&gt;&lt;height&gt;1000&lt;/height&gt;&lt;/m_oThumbnail&gt;");
</pre>