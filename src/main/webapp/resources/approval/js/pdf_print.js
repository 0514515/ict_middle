$(function(){

	// pdf 버튼 클릭시 
	$('.pdf_btn').click(function() {
		// html2canvas로 캡처 시 해상도를 높이기 위해 scale 옵션 추가
	    html2canvas($('#pdf_view')[0], { scale:2 }).then(function(canvas) {
	        // 캔버스를 이미지로 변환
	        let imgData = canvas.toDataURL('image/jpeg', 0.8); // 용량 조절 위해 jpeg로 변경하고 이미지 품질을 80%로 낮춤

	        let margin = 10; // 출력 페이지 여백설정
	        let imgWidth = 210 - (10 * 2); // 이미지 가로 길이(mm) A4 기준
	        let pageHeight = imgWidth * 1.414;  // 출력 페이지 세로 길이 계산 A4 기준
	        let imgHeight = canvas.height * imgWidth / canvas.width;
	        let heightLeft = imgHeight;

	        let doc = new jsPDF('p', 'mm');
	        let position = margin;

	        // 첫 페이지 출력
	        doc.addImage(imgData, 'JPEG', margin, position, imgWidth, imgHeight);
	        heightLeft -= pageHeight;

	        // 한 페이지 이상일 경우 루프 돌면서 출력
	        while (heightLeft >= 20) {
	            position = heightLeft - imgHeight;
	            doc.addImage(imgData, 'JPEG', 0, position, imgWidth, imgHeight);
	            doc.addPage();
	            heightLeft -= pageHeight;
	        }
	        
	        let today = new Date();
	        let year = today.getFullYear();
	        let month = ('0' + (today.getMonth() + 1)).slice(-2);
	        let day = ('0' + today.getDate()).slice(-2);
	        let hours = ('0' + today.getHours()).slice(-2);
	        let minutes = ('0' + today.getMinutes()).slice(-2);

	        let dateString = year + month + day + hours + minutes;

	        // 파일 저장
	        doc.save("approval_"+dateString+'.pdf');
	    });
	});
	
	
	// 인쇄하기 버튼 클릭시 
	
	$('.print_btn').click(function() {
		printPage(); 
	})
	
	
	function printPage(){
        
        var initBody;
        // 인쇄 전에 미리보기 내용으로 변경
        window.onbeforeprint = function(){
          // 기존 콘텐츠를 저장하고	
          initBody = document.body.innerHTML;
          // 인쇄할 부분만 별도로 설정 (#pdf_view)
          document.body.innerHTML = document.getElementById('pdf_view').innerHTML;
        };
        
        // 인쇄 후 원래 페이지 복원
        window.onafterprint = function(){
          // 페이지 복원
          document.body.innerHTML = initBody;
        }; 
        window.print();
        return false;
    }
	
	
})