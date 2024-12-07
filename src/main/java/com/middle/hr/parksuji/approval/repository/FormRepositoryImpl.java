package com.middle.hr.parksuji.approval.repository;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.middle.hr.parkjinuk.staff.vo.Staff;
import com.middle.hr.parksuji.approval.vo.Forms;

@Repository
public class FormRepositoryImpl implements FormRepository{

	@Autowired
	private SqlSessionTemplate mybatis; 
	
	@Override
	public void insertForm(Forms forms) {
		System.out.println("===> Mybatis insertForm() 호출");
		System.out.println(forms.toString());
		mybatis.insert("FormRepository.insertForm", forms);
		
	}

	@Override
	public void updateForm(Forms forms) {
		System.out.println("===> Mybatis updateForm() 호출");
		mybatis.update("FormRepository.updateForm", forms);
		
	}

	@Override
	public List<Integer> deleteById(List<Integer> formIds) {
		System.out.println("===> [Repository] Mybatis deleteById() 호출");
		// 삭제할 레코드 번호로 해당 path 정보를 검색
		List<String> paths = mybatis.selectList("FormRepository.selectPathsByIds", formIds);
		System.out.println("===> [Repository] path 정보 :" + paths);
		// 가져온 path 값으로 실제 파일 지우기
		if(paths != null && !paths.isEmpty()) {
			for(String path : paths) {
				System.out.println("===> [Repository] 경로 정보 :" + path);
				try {
					// 경로 구분자를 '/'로 변경하여 처리
	                String normalizedPath = path.replace("\\", "/");  // 경로 구분자 변경
	                System.out.println("===> [Repository 경로 구분자 변경 후]" + normalizedPath);
	                Path file = Paths.get(normalizedPath);
					
					//Path file = Paths.get(path);
					// 파일이 존재하면 삭제
					System.out.println("===> [Repository] 삭제될 파일 :" + file);
					if(Files.exists(file)) {
						Files.delete(file);
						System.out.println("삭제된 파일 : " + path); 
					}
					
				}catch(IOException e) {
					System.err.println("파일 삭제 중 오류 발생 : " + e.getMessage());
				}
			}
		}else {
			System.out.println("===> [Repository] 경로 정보가 없음.");
		}
		
		// 데이터베이스 레코드를 삭제
		mybatis.delete("FormRepository.deleteForm", formIds);
		return formIds;
	}

	@Override
	public Forms getFormById(Integer id) {
		System.out.println("===> Mybatis getFormById() 호출 [" + id + "]");
		return mybatis.selectOne("FormRepository.getFormById", id);
	}
	
	@Override
	public Integer getRecentFormId(String loginId) {
		System.out.println("===> Mybatis getRecentFormId() 호출 0 [" +  loginId + "]");
		Integer result = mybatis.selectOne("FormRepository.getRecentFormId", loginId);
		System.out.println("===> Mybatis getRecentFormId() 호출 1 [" +  result + "]");
		return result;
	}

//	@Override
//	public List<Forms> getFormList() {
//		System.out.println("===> Mybatis getFormList() 호출");
//		List<Forms> result = mybatis.selectList("FormRepository.getFormList"); // selectList : 여러개 받을거야 => 리턴값 List<BoardVO>  // mapper의 namespace를 적어준다(BoardDAO).
//		// DB로부터 받은 데이터를 확인 
//		for(Forms forms : result) {
//			System.out.println(forms.toString());
//		}
//		return result; 
//	}

	@Override
	public Map<String, Object> getFormList(String loginId, String documentType,String searchOption, String searchKeyword,
			Integer pageNum, Integer pageSize) {
		// 검색 조건에 맞는 전체 레코드 수 조회
		Map<String, Object> params = new HashMap<>();
		params.put("searchOption", searchOption);
		params.put("searchKeyword", searchKeyword);
		params.put("loginId", loginId);
		params.put("documentType", documentType);
		
		int totalCount = mybatis.selectOne("FormRepository.selectFormCount", params);

		// 전체 페이지 수 계산
		int totalPages = (int) Math.ceil((double) totalCount / pageSize);

		// RowBounds를 사용하여 페이지네이션 적용
		RowBounds rowBounds = new RowBounds((pageNum - 1) * pageSize, pageSize);

		// 사원 조회
		List<Forms> formList = mybatis.selectList("FormRepository.getFormList", params, rowBounds);

		// 결과를 맵으로 반환
		Map<String, Object> result = new HashMap<>();
		result.put("formList", formList); // 페이지네이션된 결과
		result.put("totalCount", totalCount); // 전체 레코드 수
		result.put("totalPages", totalPages); // 전체 페이지 수

		return result;
	}

	@Override
	public List<Forms> getApprovalForm() {
		System.out.println("===> Mybatis getApprovalForm() 호출");
		List<Forms> result = mybatis.selectList("FormRepository.getApprovalForm");
		return result;
	}


}
