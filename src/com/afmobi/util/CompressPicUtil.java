package com.afmobi.util;

import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;

import javax.imageio.ImageIO;

/**
 * 图片按比例压缩工具类
 * @author panguixiang
 * 可能会有所失真
 */
public class CompressPicUtil {

	public static void main(String args[]) {
		try {
			compressImage("E:/s.JPG", "E:/news.gif", 72, 72);
		} catch (Exception ex) {
		}
		System.out.println("ok");
	}

	
	/**
	 * 将图片按照指定的图片尺寸压缩 
	 * @param srcImgPath :源图片路径 
	 * @param outImgPath :输出的压缩图片的路径 
	 * @param new_w :压缩后的图片宽
	 * @param new_h :压缩后的图片高
	 */
	public static void compressImage(String srcImgPath, String outImgPath,
			int new_w, int new_h) throws Exception {
		FileInputStream in = new FileInputStream(srcImgPath);
		BufferedImage src = javax.imageio.ImageIO.read(in);
		disposeImage(src, outImgPath, new_w, new_h);
	}

	/**
	 * 将图片按照指定的图片尺寸压缩 
	 * @param srcImgPath :源文件图片流
	 * @param outImgPath :输出的压缩图片的路径 
	 * @param new_w :压缩后的图片宽
	 * @param new_h :压缩后的图片高
	 */
	public static void compressImageByStream(FileInputStream in, String outImgPath,
			int new_w, int new_h) throws Exception {
		BufferedImage src = javax.imageio.ImageIO.read(in);
		disposeImage(src, outImgPath, new_w, new_h);
	}
	
	/** * 处理图片
	 * @param src
	 * @param outImgPath
	 * @param new_w
	 * @param new_h 
	 **/
	private static void disposeImage(BufferedImage src, String outImgPath,
			int new_w, int new_h) throws Exception{
		int old_w = src.getWidth();// 得到源图宽度
		int old_h = src.getHeight();// 得到源图高度
		BufferedImage newImg = null;
		// 判断输入图片的类型
		switch (src.getType()) {
		case 13://gif
			newImg = new BufferedImage(new_w, new_h,
					BufferedImage.TYPE_4BYTE_ABGR);
			break;
		default:
			newImg = new BufferedImage(new_w, new_h, BufferedImage.TYPE_INT_RGB);
			break;
		}
		Graphics2D g = newImg.createGraphics();// 从原图上取颜色绘制新图
		g.drawImage(src, 0, 0, old_w, old_h, null);
		g.dispose();
		newImg.getGraphics().drawImage(
				src.getScaledInstance(new_w, new_h, Image.SCALE_SMOOTH), 0, 0,
				null);// 根据图片尺寸压缩比得到新图的尺寸
		OutImage(outImgPath, newImg);// 调用方法输出图片文件
	}

	/**
	 * 将图片文件输出到指定的路径，并可设定压缩质量
	 * @param outImgPath
	 * @param newImg
	 */
	private static void OutImage(String outImgPath, BufferedImage newImg)
			throws Exception {
		// 判断输出的文件夹路径是否存在，不存在则创建
		File file = new File(outImgPath);
		if (!file.getParentFile().exists()) {
			file.getParentFile().mkdirs();
		}// 输出到文件流
		ImageIO.write(newImg,
				outImgPath.substring(outImgPath.lastIndexOf(".") + 1),
				new File(outImgPath));
	}
}