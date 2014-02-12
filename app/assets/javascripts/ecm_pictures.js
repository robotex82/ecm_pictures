$(document).ready(function(){
    $('#picture_upload').on(
        'dragover',
        function(e) {
            e.preventDefault();
            e.stopPropagation();
        }
    )
    $('#picture_upload').on(
        'dragenter',
        function(e) {
            e.preventDefault();
            e.stopPropagation();
        }
    )
    $('#picture_upload').on(
        'drop',
        function(e){
            if(e.originalEvent.dataTransfer){
                if(e.originalEvent.dataTransfer.files.length) {
                    e.preventDefault();
                    e.stopPropagation();
                    /*UPLOAD FILES HERE*/
                    upload(e.originalEvent.dataTransfer.files);
                }   
            }
        }
    );

    function upload(files) {
        //alert('Upload '+files.length+' File(s).');
        for (var i = 0; i < files.length; i++) {
            var formData = new FormData();
            formData.append('file', files[i]);
            //var status = new createStatusbar(obj); //Using this we can set progress.
            //status.setFileNameSize(files[i].name,files[i].size);
            //sendFileToServer(fd,status);
            sendFileToServer(formData);
        }
    }

    function sendFileToServer(formData) {
      var uploadUrl = $('#picture_upload_url').text();
      
      var jqXHR = $.ajax({
        type: 'POST',
        url: uploadUrl,
        data: formData,
        processData: false,
        contentType: false //,
//        xhr: function() {
//          var xhr = new window.XMLHttpRequest();
//          xhr.upload.addEventListener(
//            "progress",
//            function(event) {
//              if(event.lengthComputable) {
//                var percentComplete = event.loaded / event.total;
//                // TODO
//              } // if
//            }, // function(event)
//          false);
//          return xhr;
//        } // xhr: function()
      }).done(
        function(message) {
          alert(message);
        } // function(message)
      );
      alert(uploadUrl);    
//    function sendFileToServer(formData,status)
//    {
//        var uploadURL ="http://hayageek.com/examples/jquery/drag-drop-file-upload/upload.php"; //Upload URL
//        var extraData ={}; //Extra Data.
//        var jqXHR=$.ajax({
//                xhr: function() {
//                var xhrobj = $.ajaxSettings.xhr();
//                if (xhrobj.upload) {
//                        xhrobj.upload.addEventListener('progress', function(event) {
//                            var percent = 0;
//                            var position = event.loaded || event.position;
//                            var total = event.total;
//                            if (event.lengthComputable) {
//                                percent = Math.ceil(position / total * 100);
//                            }
//                            //Set progress
//                            status.setProgress(percent);
//                        }, false);
//                    }
//                return xhrobj;
//            },
//            url: uploadURL,
//            type: "POST",
//            contentType:false,
//            processData: false,
//            cache: false,
//            data: formData,
//            success: function(data){
//                status.setProgress(100);
//     
//                //$("#status1").append("File upload Done<br>");          
//            }
//        });
//     
//        status.setAbort(jqXHR);
    }
});



