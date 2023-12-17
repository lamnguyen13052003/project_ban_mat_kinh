<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<!--
Copyright (c) 2003-2023, CKSource Holding sp. z o.o. All rights reserved.
For licensing, see LICENSE.md or https://ckeditor.com/legal/ckeditor-oss-license
-->
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>CKEditor Sample</title>
    <script src="ckeditor/ckeditor.js"></script>
    <script src="ckeditor/samples/js/sample.js"></script>
    <script src="ckfinder/ckfinder.js"></script>
    <link rel="stylesheet" href="ckeditor/samples/css/samples.css">
    <link rel="stylesheet" href="ckeditor/samples/toolbarconfigurator/lib/codemirror/neo.css">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta name="description"
          content="Try the latest sample of CKEditor 4 and learn more about customizing your WYSIWYG editor with endless possibilities.">
</head>
<body id="main">
<main>
    <textarea id="editor" name="editor"></textarea>
</main>

<script>
    const ckeditor = CKEDITOR.replace('editor');
    CKFinder.setupCKEditor(ckeditor, "ckfinder/ckfinder.html")
</script>

</body>
</html>
