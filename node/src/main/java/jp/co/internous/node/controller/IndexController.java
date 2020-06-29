package jp.co.internous.node.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import jp.co.internous.node.model.domain.MstCategory;
import jp.co.internous.node.model.domain.MstProduct;
import jp.co.internous.node.model.form.SearchForm;
import jp.co.internous.node.model.mapper.MstCategoryMapper;
import jp.co.internous.node.model.mapper.MstProductMapper;
import jp.co.internous.node.model.session.LoginSession;

@Controller
@RequestMapping("/node")
public class IndexController {

	@Autowired
	MstCategoryMapper mstCatMap;
	
	@Autowired
	MstProductMapper mstProMap;
	
	@Autowired
	LoginSession loginSession;
	
	//get all product
	@RequestMapping("/")
	public String index(Model m) {
		if(loginSession.getTmpUserId() == 0) {
			Random rand = new Random();
			loginSession.setTmpUserId(rand.nextInt(900000000)-1000000000+1);
		}
		//For debug
		//System.out.println("Now SessionID is " + loginSession.getTmpUserId());
		//For debug end
		
		List<MstCategory> categories = mstCatMap.findAll();
		if (categories != null && categories.size() >0) {
			m.addAttribute("categories", categories);
		}
		List<MstProduct> products = mstProMap.findAll();
		if (products != null && products.size() >0) {
			m.addAttribute("products", products);
		}
		//For debug
		//System.out.println("got /");
		//For debug end
		m.addAttribute("loginSession", loginSession);
		return "index";
	}
	
	@RequestMapping(value="/searchItem", method = RequestMethod.POST)
	public String search(SearchForm s, Model m) {
		
		List<MstCategory> categories = mstCatMap.findAll();
		if (categories != null && categories.size() >0) {
			m.addAttribute("categories", categories);
		}
		List<MstProduct> products = new ArrayList<MstProduct>();
		
		//For debug
		//System.out.println("got /searchItem");
		//For debug end
		

		char insChar;
		StringBuilder halvedName = new StringBuilder();
		StringBuilder corProName = new StringBuilder();
		boolean initialSpaceDetection = true;
		boolean spaceDetection = false;
		boolean actIgn = false;
		
		//Translation for full-width space to half-width space
		for(int i=0; i<s.getProductName().length(); i++) {
			insChar = s.getProductName().charAt(i);
			if (insChar == '　') {
				halvedName.append(' ');
			} else {
				halvedName.append(insChar);
			}
		}
		
		//Translation for double half-width space to single half-width space
		//		and Erasing of half-width space at starting or end point
		for(int i=0; i<halvedName.length(); i++) {
			actIgn = false;
			insChar = halvedName.charAt(i);
			if((initialSpaceDetection || spaceDetection) && (insChar==' ')) {
				actIgn = true;
			} else if(!spaceDetection && insChar==' ' && !actIgn){
				actIgn = true;
				spaceDetection=true;
			
			} else if(spaceDetection && !actIgn) {
				actIgn = true;
				spaceDetection=false;
				corProName.append(' ');
				corProName.append(insChar);
			} else {
				if(initialSpaceDetection)initialSpaceDetection=false;
				corProName.append(insChar);
			}
		}
		String[] proNameArray = corProName.toString().split(" ");

		products = mstProMap.findByCategoryIdAndProductName(s.getCategoryId(), proNameArray);
		
		if (products != null && products.size() >0) {
			m.addAttribute("products", products);
		}
		m.addAttribute("productName", corProName);
		m.addAttribute("selected", s.getCategoryId()); 
		m.addAttribute("loginSession", loginSession);
		return "index";
	}
	
}
