$(function() {

	//검색 버튼 클릭 이벤트
	$("#searchButton").on("click", function() {

		//검색옵션
		let searchOption = $("#searchOption").val();

		//검색키워드
		let searchKeyword = $("#searchKeyword").val();

		//보낼 Json
		let parameter = {
			"searchOption": searchOption
			, "searchKeyword": searchKeyword
		};

		$.ajax({
			url: "/super/company/list"
			, method: "get"
			, dataType: "json"
			, data: parameter
			, success: function(result) {
				removeAllRow();
				generateRows(result);
			}
			, error: function(error) {
				console.log(error);
			}
		});
	});
});

//테이블의 행을 전부 지우는 메소드
let removeAllRow = function(){
	$("#tableBody").empty();
};

//검색 결과 리스트를 테이블 행으로 만드는 메소드
let generateRows = function(companies){
	let tableBody = $("#tableBody");
	
	for(let company of companies){
		let tr = $("<tr/>");	//행 하나 정의
		let th = $("<th/>");	//회사 번호 열
		let nameTd = $("<td/>");	//회사 이름 열
		let phoneNumberTd = $("<td/>");	//회사 전화번호 열
		let foundedDateTd = $("<td/>");	//회사 창립일 열
		
		th.attr("scope","row");	//회사 번호에 볼드처리
		th.text(company.id);
		nameTd.text(company.name);	//회사 이름 텍스트 주입
		phoneNumberTd.text(company.phoneNumber);	//회사 전화번호 텍스트 주
		foundedDateTd.text(company.foundedDate);	//회사 창립일 텍스트 주입
		
		//행에 열 주입
		tr.append(th);	
		tr.append(nameTd);
		tr.append(phoneNumberTd);
		tr.append(foundedDateTd);
		
		//테이블에 행 주입
		tableBody.append(tr);
	}
}