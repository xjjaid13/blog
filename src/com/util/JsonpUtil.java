package com.util;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class JsonpUtil {
	public static void main(String[] args) throws IOException{
		
		String html = "https://api.steampowered.com/IDOTA2Match_570/GetMatchHistory/V001/?start_at_match_id=557526294&key=CF67E6A05C3946E9524FAD353CD0E5B1";
		Document doc = Jsoup.connect(html).get();

		System.out.println(doc.toString());
		
	}
}
