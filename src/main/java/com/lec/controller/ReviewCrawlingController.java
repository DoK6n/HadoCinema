package com.lec.controller;

import java.io.IOException;
import javax.inject.Inject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.lec.dto.ReviewDTO2;
import com.lec.service.ReviewService;


@Controller
public class ReviewCrawlingController {
   

   @Inject
   ReviewService service;

   
   @ResponseBody
   @RequestMapping(value = "crawling.do", method = {RequestMethod.GET, RequestMethod.POST}, produces="text/plain;charset=UTF-8")
   public String getCrawling() throws Exception {
      Document doc;


      
      for(int p=1; p<1001; p++) {
         
         String url = "https://movie.naver.com/movie/point/af/list.nhn?&page="+ p;

      try {
         // 영화 리뷰 정보 스크래핑
          doc = Jsoup.connect(url).get();
         /* Elements */
           Elements reviewInfo = doc.select(".title");
           
           Elements movieN = doc.select(".movie");
           
            for (int i = 0; i < reviewInfo.size(); i++) {
               
               Element reviewInfo_el = reviewInfo.get(i);
               Element mmm = movieN.get(i);
               String movie = reviewInfo_el.text();

               int s = movie.indexOf("별점 - 총 10점 중");
               String rMovieName2 = mmm.text();
               
               String rrr = movie.substring(s+12,s+14).trim();
               int reviewGrade2 = Integer.parseInt(rrr);
               
               String reviewContent2 = movie.substring(s+14,movie.length()-2);
               
               ReviewDTO2 reviewDTO2 = new ReviewDTO2(rMovieName2, reviewContent2, reviewGrade2);
                
               service.writeReviewC(reviewDTO2); 
            }
            

	      } catch (IOException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
      }
      
      return "성공";
   }
   
   
}