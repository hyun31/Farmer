package project.utils.kakaopay;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.HashMap;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

@Component
public class KakaoPay {
	
	private static final String HOST = "https://kapi.kakao.com";
	private KakaoPayReadyVO kakaoPayReadyVO;
	private KakaoPayApprovalVO kakaoPayApprovalVO;
	
	public String kakaoPayReady(HashMap<String, String> map) {
		 
        RestTemplate restTemplate = new RestTemplate();
 
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "4449cef4382a0231020046f951e34669");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
        
        // 서버로 요청할 Body
        String order_id = map.get("partner_order_id");
        String user_id = map.get("partner_user_id");
        
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("partner_order_id", order_id);
        params.add("partner_user_id", user_id);
        params.add("item_name", map.get("item_name"));
        params.add("quantity", map.get("quantity"));
        params.add("total_amount", map.get("total_amount"));
        params.add("tax_free_amount", "100");
        params.add("approval_url", "http://localhost:8090/devD/ep/ep001_d007/kakaoPaySuccess?order_id="+order_id+"&user_id="+user_id);
        params.add("cancel_url", "http://localhost:8090/devD/ep/ep001_d007/kakaoPayCancel");
        params.add("fail_url", "http://localhost:8090/devD/ep/ep001_d007/kakaoPaySuccessFail");
 
         HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
 
        try {
            kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReadyVO.class);
            return kakaoPayReadyVO.getNext_redirect_pc_url();
 
        } catch (RestClientException e) {
        	System.out.println("REST "+e);
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (URISyntaxException e) {
        	System.out.println("URISYNTAX"+e);
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return "/pay";
    }
	
	public KakaoPayApprovalVO kakaoPayInfo(String pg_token, String order_id, String user_id) {
        RestTemplate restTemplate = new RestTemplate();
 
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "4449cef4382a0231020046f951e34669");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
 
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("tid", kakaoPayReadyVO.getTid());
        params.add("partner_order_id", order_id);
        params.add("partner_user_id", user_id);
        params.add("pg_token", pg_token);
        
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
        
        try {
            kakaoPayApprovalVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, KakaoPayApprovalVO.class);
            System.out.println(kakaoPayApprovalVO);
            
            return kakaoPayApprovalVO;
        
        } catch (RestClientException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return null;
    }
}
