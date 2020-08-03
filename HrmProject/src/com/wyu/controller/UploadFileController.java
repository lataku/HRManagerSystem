package com.wyu.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UploadFileController {
	private String dir = "D:\\tick\\workspace20200717\\upload";
	
	@RequestMapping("/upload")
	@ResponseBody
	public String upload(@RequestParam("name") String name, @RequestParam("upload")List<MultipartFile>upload) {
		System.out.println("name===>"+ name);
		File dirPath = new File(dir);
		if(!dirPath.exists()) {
			dirPath.mkdirs();
		}
		if("".equals(name) || name == null) {
			return "0";
		}
		if(!upload.isEmpty()&&upload.size()>0) {
			for(MultipartFile file:upload) {
				String origin = file.getOriginalFilename();
				String sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());
				String newname = name + "_" + sdf + "_" +origin;
				try {
					file.transferTo(new File(dir+"\\"+newname));
				}catch(IllegalStateException e) {
					e.printStackTrace();
				}catch(IOException e) {
					e.printStackTrace();
				}
			}
			return "1";
		}
		return "0";
	}
	
	@RequestMapping(value="/getFiles")
	public String getFiles(Model model) {
		File dirPath = new File(dir);
		Queue<File> queue = new LinkedList<>();
		// 读取目录
		queue.offer(dirPath);
		List<String> list = new LinkedList<>();	// 存放文件名
		while(!queue.isEmpty()) {
			File root = queue.poll();
			File[] files = root.listFiles();
			for(File file:files) {
				list.add(file.getName());
			}
		}
		model.addAttribute("list", list);
		return "download";
	}
}
