<%@ Page Language="C#" AutoEventWireup="true" CodeFile="jQueryFileUpload.aspx.cs" Inherits="jQueryFileUpload" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script src="javascript/jquery.js"></script>
    <script src="Handler/jquery.uploadify.min.js"></script>
    <script src="Handler/ajaxfileupload.js"></script>

    <script>
        var jq = jQuery.noConflict();
        jq(document).ready(function () {
            jq('#filetoupload').live('change', function () {
                imgerror = ajaxFileUpload();
            });
        });

        function ajaxFileUpload() {
            imgerror = '';

            var jq2 = jQuery.noConflict();
            jq2.ajaxFileUpload
           (
               {
                   url: 'Handler/imageupload.ashx',
                   secureuri: false,
                   fileElementId: 'filetoupload',
                   dataType: 'json',
                   async: 'false',
                   success: function (data, status) {
                       if (typeof (data.error) != 'undefined') {
                           if (data.error != '') {
                               imgerror = data.error;
                               jq("#hdnfiletoupload").val(data.msg);
                               jq('#lblfiletoupload').text('');
                               jq('#lblfiletouploadE').text('Please select jpeg or jpg file.!');
                           } else {
                               jq("#hdnfiletoupload").val(data.msg);
                               imgerror = "success";
                               jq('#lblfiletouploadE').text('');
                               jq('#lblfiletoupload').text('File Uploaded Successfully.');

                           }
                       }

                   },
                   error: function (data, status, e) {
                       alert(e);
                   }
               }
           );
            return imgerror;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h2>Fileupload using jQuery</h2>
    <input id="filetoupload" type="file" size="50" tabindex="12" name="filetoupload" class="inputUpload1">
        <br /><label id="lblfiletoupload" style="color:green;"></label><label id="lblfiletouploadE" style="color:red;"></label>
        <input type="hidden" id="hdnfiletoupload" value=""/>


    </div>
    </form>
</body>
</html>
