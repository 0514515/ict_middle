package com.middle.hr.parksuji.approval.repository;

import java.util.List;
import java.util.Map;

import com.middle.hr.parkjinuk.staff.vo.RootCompany;
import com.middle.hr.parksuji.approval.vo.Approval;
import com.middle.hr.parksuji.approval.vo.ApprovalLine;
import com.middle.hr.parksuji.approval.vo.Forms;
import com.middle.hr.parksuji.approval.vo.StaffInfo;

public interface FormRepository {

	public void insertForm(Forms forms);

	public void updateForm(Forms forms);

	List<Integer> deleteById(List<Integer> formIds);

	public Forms getFormById(Integer id);

	public Integer getRecentFormId(String loginId);

	// List<Forms> getFormList();

	// 목록 검색
	Map<String, Object> getFormList(String loginId, String searchOption, String documentType, String searchKeyword,
			Integer pageNum, Integer pageSize);

	// 양식 폼 목록 가져오기
	List<Forms> getApprovalForm();

	// 로그인 아이디로 사원 정보 조회
	public StaffInfo getStaffByLoginId(String loginId);

	// 회사 조직 트리구조 데이터 조회용
	RootCompany selectCompanyTreeDataByLoginId(String loginId);

	public Integer saveApproval(Approval approval); // 결재 관련

	public void saveApprovalLine(List<ApprovalLine> approvalLineList); // 결재 라인 배열

	public void updateApprovalCurrentSigningStaff(Approval approval); // 현재 결재 순번 업데이트

	public Approval getApprovalById(Integer approvalId);

	public List<ApprovalLine> getApprovalLineById(Integer approvalId);

	Map<String, Object> selectApprovalList(String loginId, String searchOption, String documentType,
			String searchKeyword, Integer pageNum, Integer pageSize);

}
