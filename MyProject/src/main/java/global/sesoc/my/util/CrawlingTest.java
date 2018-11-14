package global.sesoc.my.util;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.impl.client.HttpClientBuilder;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;



public class CrawlingTest {	
	
	public static String getCurrentData(){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
        return sdf.format(new Date());
	}

	public static void main(String[] args) throws ClientProtocolException, IOException {

		
		

		// 1. 가져오기전 시간 찍기

		System.out.println(" Start Date : " + getCurrentData());

		//1-1. 각 주소를 arrayList에 담아서 반복문 수행
		String fileName = "src/main/resources/rakutenURL.txt";
		FileReader fr = new FileReader(fileName);
		BufferedReader br =  new BufferedReader(fr);
		List<String> list = new ArrayList<String>();
		String address = "";
		while((address=br.readLine()) != null) {
			list.add(address);
		}
		
		System.out.println("주소가 들어간 방의 갯수::"+list.size());
		
		// 2. 가져올 HTTP 주소 세팅
	    HttpPost http = new HttpPost("https://osaka-info.jp/ko/page/hotel-crossover");

	    // 3. 가져오기를 실행할 클라이언트 객체 생성

	    HttpClient httpClient = HttpClientBuilder.create().build();

	    

	    // 4. 실행 및 실행 데이터를 Response 객체에 담음

	    HttpResponse response = httpClient.execute(http);

	    

	    // 5. Response 받은 데이터 중, DOM 데이터를 가져와 Entity에 담음

	    HttpEntity entity = response.getEntity();

	    

	    // 6. Charset을 알아내기 위해 DOM의 컨텐트 타입을 가져와 담고 Charset을 가져옴 

	    ContentType contentType = ContentType.getOrDefault(entity);

        Charset charset = contentType.getCharset();

        

        // 7. DOM 데이터를 한 줄씩 읽기 위해 Reader에 담음 (InputStream / Buffered 중 선택은 개인취향) 

	    br = new BufferedReader(new InputStreamReader(entity.getContent(), charset));

	    // 8. 가져온 DOM 데이터를 담기위한 그릇
	    
	    StringBuffer sb = new StringBuffer();

	    // 9. DOM 데이터 가져오기

	    String line = "";

	    while((line=br.readLine()) != null){
	    	sb.append(line+"\n");
	    }
	    
	    int menuStartNumber = sb.indexOf("<title>");
	    
	    int menuEndNumber = sb.indexOf("by");
	    
	    //String menuName = sb.substring(menuStartNumber+7, menuEndNumber);	    
	    
	    // 10. 가져온 아름다운 DOM을 보자

	    //System.out.println(sb.toString());

	    

	    // 11. Jsoup으로 파싱해보자.
	    
	    Document doc = Jsoup.parse(sb.toString());
	    
	    // 참고 - Jsoup에서 제공하는 Connect 처리
	    File file = new File("src/main/resources/jkh.txt");
 	    
 	    FileWriter fw = new FileWriter(file);
 	    BufferedWriter bw = new BufferedWriter(fw);
	    
	    
	    for(String URL : list) {
	    	Connection.Response response1 = Jsoup.connect(URL).method(Connection.Method.GET).execute();
	 	    Document doc3 = response1.parse();
	 	    
	 	   org.jsoup.select.Elements menu = doc3.select("h1");
	 	    org.jsoup.select.Elements ingredients = doc3.select("a#material_link");
	 	    org.jsoup.select.Elements amounts = doc3.select("p.amount");
	 	    org.jsoup.select.Elements steps = doc3.select("p.stepmemo");
	 	    org.jsoup.select.Elements image = doc3.select("div.rcpPhotoBox");
	 	    org.jsoup.select.Elements tip = doc3.select("div.howtoPointBox");
	 	    
	 	    String menuName = "";
	 	    String ingredientInfo = "";
	 	    String amountInfo = "";
	 	    String stepInfo = "";
	 	    String tipInfo = "";
	 	    
	 	    menuName = menu.text();
	 	    
	 	    for(Element ingredient : ingredients) {
	 	    	ingredientInfo+= ingredient.text()+" ";
	 	    }
	 	    
	 	    for(Element amount : amounts) {
	 	    	amountInfo += amount.text()+" ";
	 	    }
	 	    
	 	    for(Element step : steps) {
	 	    	stepInfo += step.text()+" ";
	 	    }
	 	    
	 	   menuName = menuName.replace('♡', ' ');
	 	   menuName = menuName.replace('♥', ' ');	    
	 	   menuName = menuName.replace(',', '、');
	 	   menuName = menuName.replace('❤', '、');
	 	   menuName = menuName.replaceAll("レシピ・作り方", "");
	 	   menuName = menuName.replaceAll("<br>", "");
	 	    
	 	   ingredientInfo = ingredientInfo.replace('♡', ' ');
	 	   ingredientInfo = ingredientInfo.replace('♥', ' ');	    
	 	   ingredientInfo = ingredientInfo.replace(',', '、');
	 	   ingredientInfo = ingredientInfo.replace('❤', '、');
	 	   ingredientInfo = ingredientInfo.replace('・', '.');
	 	  ingredientInfo = ingredientInfo.replaceAll("<br>", "");
	 	   
	 	   amountInfo = amountInfo.replace('♡', ' ');
	 	   amountInfo = amountInfo.replace('♥', ' ');	    
	 	   amountInfo = amountInfo.replace(',', '、');
	 	   amountInfo = amountInfo.replace('❤', '、');
	 	   amountInfo = amountInfo.replace('・', '.');
	 	   amountInfo = amountInfo.replaceAll("<br>", "");
	 	   
	 	    stepInfo = stepInfo.replace('♡', ' ');
	 	    stepInfo = stepInfo.replace('♥', ' ');	    
	 	    stepInfo = stepInfo.replace(',', '、');
	 	    stepInfo = stepInfo.replace('❤', '、');
	 	    stepInfo = stepInfo.replace('・', '.');
	 	    stepInfo = stepInfo.replaceAll("<br>", "");
	 	    
	 	    String imageTag = image.html();
	 	    int startNum = imageTag.lastIndexOf("https");
	 	    int endNum = imageTag.lastIndexOf("alt");
	 	    String imageUrl = imageTag.substring(startNum, endNum-2);
	 	    
	 	    tipInfo = tip.html();
	 	    int startTip = tipInfo.lastIndexOf("<p>");
	 	    int endTip = tipInfo.lastIndexOf("</p>");
	 	    //System.out.println(startTip);
	 	    //System.out.println(endTip);
	 	    String tipDetail = tipInfo.substring(startTip+3, endTip);
	 	    
	 	    tipDetail = tipDetail.replace('♡', ' ');
	 	    tipDetail = tipDetail.replace('♥', ' ');	    
	 	    tipDetail = tipDetail.replace(',', '、');
	 	    tipDetail = tipDetail.replace('❤', '、');
	 	    tipDetail = tipDetail.replace('・', '.');
	 	   tipDetail = tipDetail.replaceAll("<br>", "");
	 	   
	 	    //System.out.println("메뉴::"+menuName);
	 	    //System.out.println("재료::"+ingredientInfo);
	 	    //System.out.println("용량::"+amountInfo);
	 	    //System.out.println("레시피::"+stepInfo);
	 	    //System.out.println("이미지URL::"+imageUrl);
	 	    //System.out.println("팁::"+tipDetail);
	 	    
	 	    String insertQuery = "insert into recipeboard";
	 	    String columnName = "(boardnum, title, material, amount, recipe, category, imglink, tips)"; 
	 	    String valuesQuery = " values"+" ("+"boardseq.nextval, '"+ menuName 
	 	    										+ "', '" + ingredientInfo+ "', '" + amountInfo + "', '"
	 	    										+stepInfo+ "', 'バレンタイン', '"+imageUrl+ "', '"+tipDetail+"');";
	 	    bw.write(insertQuery);
	 	    bw.write(columnName);
	 	    bw.write(valuesQuery+'\n');
	    }
	    bw.close();
	    
	    //String URL = "https://recipe.rakuten.co.jp/recipe/1340010595/?l-id=recipe_list_detail_recipe";
	   
	    
	    //System.out.println(doc2.data());
	    
	    
	    // 12. 얼마나 걸렸나 찍어보자
	    System.out.println("End Date : " + getCurrentData());

	}

}



