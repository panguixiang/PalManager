var paramSource = {
		sourceSizeByte:31457280,
		sourceType:'.APK',
		isShotFile:'no'
};

function openDiv(newParamSource) {
	paramSource = $.extend(paramSource,newParamSource);
	var sourceSizeN = formatFileSize(paramSource.sourceSizeByte,0,'KB');
	paramSource = $.extend(paramSource,{sourceSize:sourceSizeN});
	$(".white_content").css("display","block");
}

function closeDivBut() {
	$(".white_content").css("display","");
}
$(document).ready(function(){
	var parsedJson;
	$("#file_upload").uploadify(
		{
			'buttonText' : '选择文件',
			'swf' : '../uploadify/uploadify.swf',
			'uploader' : '/PalmplayUpload/upload/source', 
		    'removeTimeout':1,
		    'multi' : true,
		    'auto' : false,
		    'method': 'post',
		    'sizeLimit' : paramSource.sourceSizeByte,//byte-->30M
		    'onUploadStart' : function(file) {
		    	if((paramSource.sourceType).indexOf(file.type.toUpperCase())<=-1 ) {
		    		$.messager.alert('错误提示',"文件类型必须为"+paramSource.sourceType+",请重新选择!");
		    		destroy();
		    		return;
		    	}
		    	if(file.size>paramSource.sourceSizeByte) {
		    		$.messager.alert('错误提示',"文件最大不能超过"+paramSource.sourceSize+",但当前文件大小为" + formatFileSize(file.size,0,'KB'));
			    	destroy();
			    	return;
		    	}
		    	
		    },
		    'onUploadSuccess':function(file,data,response)
		     {
		    	 parsedJson = jQuery.parseJSON(data);
		    	 if((paramSource.sourceType).indexOf(".APK")>-1) {
					   var oldPackage = $("#oldPackageId").val(); 
					   var oldVersion = $("#oldVersionId").val();
					   if(oldPackage != '' && oldPackage!=parsedJson.packageName) {
						   $.messager.alert('错误提示',"请上传同一产品的不同版本！");
						   return;
					   }
					   if(oldVersion != '' && oldVersion>=parsedJson.versionCode) {
						   $.messager.alert('错误提示',"目前入库产品的版本小于或等于库中的同包名的产品版本！");
						   return;
					   }
			    	   $("#packageNameId").val(parsedJson.packageName);
			    	   $("#versionId").val(parsedJson.versionCode);
			    	   $("#versionNameId").val(parsedJson.versionName);
				  }
		    	 var packSize = formatFileSize(file.size,0,'KB');
		    	 if(paramSource.isShotFile=='yes') {
			    	 	$("#resourceShotId").val(parsedJson.resourceId);
			    	 	$("#sourceShotNameId").val(parsedJson.fileName+"   "+packSize);
			    } else { 
			    		$("#resourceId").val(parsedJson.resourceId);
			    	 	$("#sourceNameId").val(parsedJson.fileName+"   "+packSize);
			    	 	$("#sourceSizeId").val(file.size);
			    }
		     },
		     'onUploadError': function(event, queueID, fileObj) {
		    	 if (errorObj.type === "File Size"){
		    		 $.messager.alert('错误提示','超过文件上传大小限制'+paramSource.sourceSize+'！');
		    		  destroy();
					   return;
				 }
			},
			'onCancel': function(event, queueID, fileObj){
			}
		});
});

 $("#toRight").click(function(){
		($('input[name="tagCheck"]:checked').parent()).appendTo("#rightDiv");
		$("#rightDiv :[name = tagCheck]:checkbox").attr("name", "tagCheckRight");
		var shtml = $("#rightDiv div");
		$("#rightDiv").empty();
		$(shtml).each(function(){
			$(this).appendTo($("#rightDiv"));
		});
	});

$("#toLeft").click(function(){
	$("#lefDiv").append($('input[name="tagCheckRight"]:checked').parent());
	$("#lefDiv :[name = tagCheckRight]:checkbox").attr("name", "tagCheck");
	var shtml = $("#lefDiv div");
	$("#lefDiv").empty();
	$(shtml).each(function(index){
			$(this).appendTo($("#lefDiv"));
	});
});

$("#descId").mouseout(function(){
	var num = $(this).val().length;
	var surplusNum = 1000 - num;
	if(surplusNum<=0) {
		$("#descNumId").css("color","red").text("最多可输入1000个字符，现在已输入"+num+"个字符，已经超过1000个字符。");
	} else {
		$("#descNumId").css("color","#999").text("最多可输入1000个字符，现在已输入"+num+"个字符，还可以输入"+surplusNum+"个字符。");
	}
});

function uploadButton(sourId,screenShotId,pSize,fileId) {
	var validatemesage = validateImage($("#"+fileId));
	if(validatemesage.length>0) {
		alert(validatemesage);
		return false;
	}
	$("#imgSd").attr("src","../images/loading.gif");
	$.ajaxFileUpload({
	    fileElementId: 'iconId',
	    secureuri: false,
	    dataType:'json',
	    url: '/PalmplayUpload/upload/static?iScreenshot=72*72&pSize='+pSize,
	    success: function (data, textStatus) {
	    	if(data.imageSizeError) {
	    		 $("#imgSd").attr("src","../images/addPic.jpg");
	    		 $.messager.alert('错误提示',data.imageSizeError);
	    	}
	    	else if(screenShotId.length>0) {
		      	$("#"+screenShotId).val(data.screenShotId);
		      	$("#imgSd").attr("src",data.SourceUrl+data.resourceId);
	    	}
    		$("#"+sourId).val(data.resourceId);
	    },
	    error: function (XMLHttpRequest, textStatus, errorThrown) {
	      $("#imgSd").attr("src","../images/addPic.jpg");
	     // $.messager.showWin({ msg: msg, title: '错误提示', color: 'red' });  
	    }
	  });
}

/**
* 选择图片后自动开始上传 
**/
	function zidongMehtohd(sourId,screenShotId,pSize,fileId,resourceSizeId,yasuo) {
		var file = $("#"+fileId);
		var validatemesage = validateImage(file);
		if(validatemesage.length>0) {
			 $.messager.alert('错误提示',validatemesage);
			return false;
		}
		var img = $(file).prev();
		var deleteDiv = $(file).next();
		$(img).attr("src","../images/loading.gif");
		var purl = "";
		if(resourceSizeId.length>0) {
			purl = '/PalmplayUpload/upload/static?iScreenshot='+yasuo+'&pSize='+pSize+"&isResourceFile=resourceFile";
		} else {
			purl = '/PalmplayUpload/upload/static?iScreenshot='+yasuo+'&pSize='+pSize;
		}
		$.ajaxFileUpload({
		    fileElementId: fileId,
		    url: purl,
		    dataType:'json',
		    success: function(data, textStatus) {
		    	if(data.imageSizeError) {
		    		$(img).attr("src","../images/addPic.jpg");
		    		$.messager.alert('错误提示',data.imageSizeError);
		    	}
		    	else if(screenShotId.length>0) {
		    		$("#"+screenShotId).val(data.screenShotId);
		    		$(img).attr("src",data.SourceUrl+data.resourceId);
		    	} else {
		    		$("#"+sourId).val(data.resourceId);
		    		$(img).attr("src",data.SourceUrl+data.resourceId);
		    	}
		    	if(resourceSizeId.length>0) {//上传资源文件
		    		$("#"+sourId).val(data.resourceId);
		    		$("#"+resourceSizeId).val(data.resourceSize);
		    	}
		    	if(!data.imageSizeError && deleteDiv) {
			     	$(deleteDiv).css("display","");
		    	}
		    },
		    error: function (XMLHttpRequest, textStatus, errorThrown) {
		    	$(img).attr("src","../images/addPic.jpg");
		    }
		  });
	}

function delPic1(showImg, hiddenImgId) {
		 $("#"+showImg).attr("src","../images/addPic.jpg");
		 $("#"+hiddenImgId).val("");
		 $("#"+showImg).next().next().css("display","none");
}
	
function saveSoft(url) {
		if(!checkForm()) {
			return;
		}
		$("#logdingSubId").css("display","");
		 $.ajax({
				url:url,
				type:'post',
				data:$("#itemFormId").serialize(),
				secureuri: false,
				dataType:'json',
				success:function(data){
					$("#logdingSubId").css("display","none");
					if(data.message) {
						$.messager.alert('错误提示',data.message);
					} else {
						location.href='../item/optSuccess?itemID='+data.itemId;
					}
				},
				error:function(XMLHttpRequest, textStatus) {
					$("#logdingSubId").css("display","none");
					$.messager.alert('错误提示',"系统发生异常，添加产品失败！");
				}
			 });
	}

/**
 * 校验image格式
 */
function validateImage(obj) {
        var file = obj;
        var tmpFileValue = $(file).val();
        if(/^.*?\.(gif|png|jpg|jpeg)$/.test(tmpFileValue.toLowerCase())){
            return "";
        } else {
            return "只能上传gif、jpg、jpeg或png格式的图片！";
        }
}