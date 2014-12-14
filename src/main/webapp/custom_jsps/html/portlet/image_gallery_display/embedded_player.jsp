<%--
/**
 * Copyright (c) 2000-2013 Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */
--%>

<%@ include file="/html/portlet/image_gallery_display/init.jsp" %>

<script src="/html/portlet/document_library/mediaelement/jquery.js"></script>
<script src="/html/portlet/document_library/mediaelement/mediaelement-and-player.min.js"></script>
<link rel="stylesheet" href="/html/portlet/document_library/mediaelement/mediaelementplayer.css" />
<link rel="stylesheet" href="/html/portlet/document_library/mediaelement/mejs-skins.css" />

<%
    String[] audioMimeTypes = {"audio/basic", "auido/L24", "audio/mid", "audio/mpeg", "audio/mp4",
        "audio/x-aiff", "audio/x-mpegurl", "audio/vnd.rn-realaudio", "audio/ogg", "audio/vorbis", "audio/vnd.wav"};
    String[] videoMimeTypes = {"video/mpeg", "video/x-flv", "video/mp4", "application/x-mpegURL", "video/MP2T",
        "video/3gpp", "video/quicktime", "video/x-msvideo", "video/x-ms-wmv"};

    Long fileEntryId = ParamUtil.getLong(request, "thumbnailURL");

    FileEntry fileEntry = DLAppLocalServiceUtil.getFileEntry(fileEntryId);
    
    FileVersion fileVersion = fileEntry.getFileVersion();
    String mimeType = fileVersion.getMimeType();
    
    boolean hasAudio = java.util.Arrays.asList(audioMimeTypes).contains(mimeType);
    boolean hasVideo = java.util.Arrays.asList(videoMimeTypes).contains(mimeType);
    
    request.setAttribute("view_file_entry.jsp-fileEntry", fileEntry);
    request.setAttribute("view_file_entry.jsp-hasAudio", hasAudio);
    request.setAttribute("view_file_entry.jsp-hasVideo", hasVideo);
    request.setAttribute("view_file_entry.jsp-mimeType", fileVersion.getMimeType());
%>

<% if (hasAudio) { %>
    <div style="text-align: center;"><img src="<%= themeDisplay.getPathThemeImages() + "/file_system/large/music.png" %>" /></div>
<% } %> 

<liferay-util:include page="/html/portlet/document_library/player.jsp" />