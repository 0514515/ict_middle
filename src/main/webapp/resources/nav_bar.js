$(function () {
    // 현재 날짜와 시간을 가져옴
    var now = new Date();
    var hours = now.getHours(); // 현재 시 (0-23)

    // base_date 계산 (자정일 경우 하루 전으로)
    var base_date = new Date(now); // 현재 날짜 복사
    if (hours === 0) { // 자정일 경우
        base_date.setDate(base_date.getDate() - 1); // 하루 전으로 설정
        hours = 23; // base_time은 23시
    } else {
        hours -= 1; // 한 시간 전
    }

    // base_date를 "YYYYMMDD" 형식으로 변환
    var base_date_str = base_date.getFullYear().toString() +
        String(base_date.getMonth() + 1).padStart(2, "0") +
        String(base_date.getDate()).padStart(2, "0");

    // base_time은 4자리 문자열 "HHMM" 형식
    var base_time = String(hours).padStart(2, "0") + "00";

    // AJAX 요청
    $.ajax({
        url: `/weather?base_date=${base_date_str}&base_time=${base_time}&nx=59&ny=126`,
        method: "GET",
        timeout: 0,
		success: function (response) {
		    if (typeof response === "string") {
		        response = JSON.parse(response); // 문자열을 JSON 객체로 변환
		    }
		    
			if (response && response.response && response.response.body) {
			    let items = response.response.body.items.item;
			    console.log("Items:", items);
			} else {
			    console.error("JSON 구조가 예상과 다릅니다:", response);
			}
		
		    console.log("Base Date:", base_date_str);
		    console.log("Base Time:", base_time);
		    console.log("Response:", response);
		
		    // JSON 구조에 맞게 접근
		    let items = response.response.body.items.item; // 올바른 JSON 구조 경로
		    console.log("Items:", items);
		
		    // category가 "T1H"인 항목 찾기
		    let t1hItem = items.find(item => item.category === "T1H");
			if (t1hItem) {
			    $("#weather").html('<i class="fas fa-thermometer-half"></i> ' + t1hItem.obsrValue + "°C");
			} else {
			    console.log("T1H 데이터를 찾을 수 없습니다.");
			}


		}
    });
});
