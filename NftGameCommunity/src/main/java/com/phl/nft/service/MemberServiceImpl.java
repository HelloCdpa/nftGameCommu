package com.phl.nft.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.phl.nft.dto.MemberDTO;
import com.phl.nft.dto.PageDTO;
import com.phl.nft.dto.PointDTO;
import com.phl.nft.repository.MemberRepository;


@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberRepository mr;
	
	@Autowired
	private HttpSession session;
	
	@Override
	public void join(MemberDTO member) {
		
		mr.join(member);
		
		}
	
	@Override
	public String idDuplicate(String m_id) {
		String result = mr.idDuplicate(m_id);
		 
		 if(result == null) {
			 return "ok";
		 } else {
			 return "no";
		 }	 
		}
	@Override
	public List<MemberDTO> findAll() {
		return mr.findAll();
	}
	


	private static final int PAGE_LIMIT = 5; // 한페이지에 보여질 글 개수
	private static final int BLOCK_LIMIT = 3; // 한화면에 보여질 페이지 개수

	@Override
	public List<MemberDTO> pagingList(int page) {
		// TODO Auto-generated method stub
		int pagingStart = (page-1) * PAGE_LIMIT;
		Map<String, Integer> pagingParam = new HashMap<String, Integer>();
		pagingParam.put("start", pagingStart);
		pagingParam.put("limit", PAGE_LIMIT);

//			List<BoardDTO> pagingList = br.pagingList(pagingStart);
	List<MemberDTO> pagingList = mr.memberPagingList1(pagingParam);
	for(MemberDTO b: pagingList) {
	System.out.println(b.toString());
	}
	return pagingList;
	}

	@Override
	public PageDTO paging(int page) {
		int memberCount = mr.memberCount();
		int maxPage = (int)(Math.ceil((double)memberCount / PAGE_LIMIT));
		int startPage = (((int)(Math.ceil((double)page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
		int endPage = startPage + BLOCK_LIMIT - 1;
		if(endPage > maxPage)
			endPage = maxPage;
		PageDTO paging = new PageDTO();
		paging.setPage(page);
		paging.setStartPage(startPage);
		paging.setEndPage(endPage);
		paging.setMaxPage(maxPage);

		
		System.out.println("paging.toString(): "+ paging.toString());

		return paging;
	}

	@Override
	public void delete(long m_number) {
		mr.memberDelete(m_number);
	}

	@Override
	public String login(MemberDTO member) {
		
		MemberDTO loginMember = mr.login(member);
		
		if(loginMember != null) {
			session.setAttribute("loginId", member.getM_id());
			session.setAttribute("loginNumber", member.getM_number());
			return "redirect:/board/paging";
		} else {
			return "/member/login";
		}
		
	}
	@Override
	public MemberDTO mypage(String m_id) {
		return mr.mypage(m_id);
	}
	
	@Override
	public void memberUpdate(MemberDTO member) throws IllegalStateException, IOException {
		MultipartFile m_profile = member.getM_profile();
		String m_profilename = m_profile.getOriginalFilename();
		m_profilename = System.currentTimeMillis() + "-" + m_profilename;
		System.out.println("m_profilename: " + m_profilename);
		String savePath = "D:\\development_Phl\\source\\spring\\MemberBoardProject\\src\\main\\webapp\\resources\\nft\\"+m_profilename;
		if(!m_profile.isEmpty()) {
			m_profile.transferTo(new File(savePath));
		}
		
		member.setM_profilename(m_profilename);
		mr.memberUpdate(member);
	}

	@Override
	public List<PointDTO> pointView(String m_id) {
		return mr.pointView(m_id);
	}
	@Override
	public MemberDTO pointAll(String m_id) {
		return mr.pointAll(m_id);
	}
	
	@Override
	public void pointCharge(String m_id, int m_point) {

		mr.pointCharge(m_id,m_point);
		mr.memberPointCharge(m_id,m_point,"포인트 충전");
	}
	@Override
	public void nftprofile(MemberDTO member) {
		mr.nftprofile(member);
	}
	@Override
	public String getAccessToken(String authorize_code) {
	   String access_Token = "";
	   String refresh_Token = "";
	   String reqURL = "https://kauth.kakao.com/oauth/token";

	    try {
	      URL url = new URL(reqURL);

	      HttpURLConnection conn = (HttpURLConnection) url.openConnection();

	                //    POST 요청을 위해 기본값이 false인 setDoOutput을 true로

	      conn.setRequestMethod("POST");
	      conn.setDoOutput(true);

	                //    POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
	       BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
	                StringBuilder sb = new StringBuilder();
	                sb.append("grant_type=authorization_code");
	                sb.append("&client_id=caed560457f6ecf1485bfe5ba2eb1ce4");  //본인이 발급받은 key
	                sb.append("&redirect_uri=http://localhost:8081/");     // 본인이 설정해 놓은 경로
	                sb.append("&code=" + authorize_code);
	                bw.write(sb.toString());
	                bw.flush();

	                //    결과 코드가 200이라면 성공
	                int responseCode = conn.getResponseCode();
	                System.out.println("responseCode : " + responseCode);

	                //    요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
	                BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	                String line = "";
	                String result = "";

	                while ((line = br.readLine()) != null) {
	                    result += line;
	                }
	                System.out.println("response body : " + result);

	                //    Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
	                JsonParser parser = new JsonParser();
	                JsonElement element = parser.parse(result);

	                access_Token = element.getAsJsonObject().get("access_token").getAsString();
	                refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

	                System.out.println("access_token : " + access_Token);
	                System.out.println("refresh_token : " + refresh_Token);

	                br.close();
	                bw.close();
	            } catch (IOException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            }

	            return access_Token;
	        }
	@Override
	  public HashMap<String, Object> getUserInfo (String access_Token) {

          //    요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
          HashMap<String, Object> userInfo = new HashMap<>();
          String reqURL = "https://kapi.kakao.com/v2/user/me";
          try {
              URL url = new URL(reqURL);
              HttpURLConnection conn = (HttpURLConnection) url.openConnection();
              conn.setRequestMethod("GET");

              //    요청에 필요한 Header에 포함될 내용
              conn.setRequestProperty("Authorization", "Bearer " + access_Token);

              int responseCode = conn.getResponseCode();
              System.out.println("responseCode : " + responseCode);

              BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

              String line = "";
              String result = "";

              while ((line = br.readLine()) != null) {
                  result += line;
              }
              System.out.println("response body : " + result);

              JsonParser parser = new JsonParser();
              JsonElement element = parser.parse(result);

              JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
              JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

              String nickname = properties.getAsJsonObject().get("nickname").getAsString();
              String email = kakao_account.getAsJsonObject().get("email").getAsString();

              userInfo.put("nickname", nickname);
              userInfo.put("email", email);

          } catch (IOException e) {
              // TODO Auto-generated catch block
              e.printStackTrace();
          }

          return userInfo;
      }
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	}
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


