package net.lele.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MungController {
	
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
}
