<%@ include file="/html/portlet/document_library/init.jsp" %>

<script src="/html/portlet/document_library/mediaelement/jquery.js"></script>
<script src="/html/portlet/document_library/mediaelement/mediaelement-and-player.min.js"></script>
<link rel="stylesheet" href="/html/portlet/document_library/mediaelement/mediaelementplayer.css" />
<link rel="stylesheet" href="/html/portlet/document_library/mediaelement/mejs-skins.css" />

<%
FileEntry fileEntry = (FileEntry) request.getAttribute("view_file_entry.jsp-fileEntry");
FileVersion fileVersion = fileEntry.getFileVersion();
Boolean hasAudio = (Boolean) request.getAttribute("view_file_entry.jsp-hasAudio");
Boolean hasVideo = (Boolean) request.getAttribute("view_file_entry.jsp-hasVideo");
String mimeType = (String) request.getAttribute("view_file_entry.jsp-mimeType");

%>

<div width="50%" style="width: 100%; position: relative;">
    <% if(hasVideo) { %>
        <video style="max-width: 100%; height: 100%;" controls="true" src="<%= DLUtil.getPreviewURL(fileEntry, fileVersion, themeDisplay, "") %>" type="<%= mimeType %>"></video>
    <% } %>
    <% if (hasAudio) { %>
        <audio style="max-width: 100%; height: 100%;" controls="true" src="<%= DLUtil.getPreviewURL(fileEntry, fileVersion, themeDisplay, "") %>" type="<%= mimeType %>"></audio>
    <% } %> 
</div>

<script>
    $('audio,video').mediaelementplayer({
	success: function(player, node) {
		$('#' + node.id + '-mode').html('mode: ' + player.pluginType);
	}
    });
</script>