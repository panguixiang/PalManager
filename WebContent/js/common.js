var staticUrl = "http://localhost:9001/static/";
var sourceUrl = "http://localhost:9001/source/";
/**
 * 计算软件包大小及单位
 * @param size
 * @param oldSize
 * @param danwei
 * @returns {String}
 */
function formatFileSize(size, oldSize, danwei){
	if(danwei=='KB') {
		oldSize = parseFloat(oldSize*1024);
	} else if(danwei=='MB') {
		oldSize = parseFloat(oldSize*1024*1024);
	}else if(danwei=='GB') {
		oldSize = parseFloat(oldSize*1024*1024*1024);
	}else if(danwei=='GB') {
		oldSize = parseFloat(oldSize*1024*1024*1024*1024);
	}
    var sizF = 'Bytes';
    size+=parseFloat(oldSize);
    if(parseFloat(size) > 1024){
        //In KB
        size = parseFloat(size/1024).toFixed(4);
        sizF = 'KB';
        if(size > 1024){
            //In MB
            size = parseFloat(size/1024).toFixed(4);
            sizF = 'MB';
        }
        if(size > 1024*1024){
            //In GB
            size = parseFloat(size/1024/1024).toFixed(4);
            sizF = 'GB';
        }
        if(size > 1024*1024*1024){
            //In TB
            size = parseFloat(size/1024/1024/1024).toFixed(4);
            sizF = 'TB';
        }
    } else {
    	sizF = 'byte';
    }
    size = parseFloat(size).toFixed(1);
    return size+" "+sizF;
}
//计算长度
function ledd(str){
    return str.replace(/[^\x00-\xff]/g,"rr").length;//计算长度，让1个中文站2个字母 
}
var showMessage = function(title,message) {
	$.messager.show({  
	    title:title,  
	    msg:message,  
	    timeout:2000,  
	    showType:'slide'  
	});
};
