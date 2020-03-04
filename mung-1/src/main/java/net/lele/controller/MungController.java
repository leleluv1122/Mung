package net.lele.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import net.lele.domain.Files;
import net.lele.service.FilesService;

@Controller
public class MungController {
	
	@Autowired
	FilesService filesService;
	
	@RequestMapping("mung/index")
	public String index() {
		
		return "mung/index";
	} //현재위치 지도로 바로

	@RequestMapping("mung/index2")
	public String index2() {
		
		return "mung/index2";
	} //우리집으로 일단기본위치 / 검색하면 나옴

	@RequestMapping("mung/index3")
	public String index3() {
		
		return "mung/index3";
	} //우리집주소찾기
	
	@RequestMapping("mung/index4")
	public String index4() {
		
		return "mung/index4";
	} // ++우편번호까지
	
	@RequestMapping("mung/index5")
	public String index5(Model model) {
		model.addAttribute("file", filesService.findByFno(8));
		return "mung/index5";
	}
	
	@RequestMapping("mung/insert")
	public String Insert() {
		
		return "mung/insert";
	}
	
	@RequestMapping("mung/fileinsert")
	public String fileinsert(HttpServletRequest request, @RequestPart MultipartFile files) throws Exception{
		Files file = new Files();
		
		String sourceFileName = files.getOriginalFilename(); 
        String sourceFileNameExtension = FilenameUtils.getExtension(sourceFileName).toLowerCase(); 
        File destinationFile; 
        String destinationFileName;
        String fileUrl = "D:/Mung/Mung/mung-1/src/main/resources/static/images/";
        do { 
            destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + sourceFileNameExtension; 
            destinationFile = new File(fileUrl + destinationFileName); 
        } while (destinationFile.exists()); 
        
        destinationFile.getParentFile().mkdirs(); 
        files.transferTo(destinationFile);
        
        file.setFilename(destinationFileName);
        file.setFileOriName(sourceFileName);
        file.setFileurl(fileUrl);
        filesService.save(file);
		return "redirect:/mung/insert";
	}
}
