$(function(){
	
	$("#tableBody tr").on("click",function(){
		let salaryHistoryId = $(this).find("#salaryHistoryId").text();
		let title = $(this).find("#salaryHistoryName").text();
		let totalAmount = $(this).find("#totalAmount").text();
		$.ajax({
			
			url: '/salary/specification/detail',
			type: 'get',
			data: {
				id:salaryHistoryId
			},
			success:function(result){
				$("#detailModalTitle").text(title);
				
				$("#modalTableBody").empty();
				
				let tr = $("<tr/>");
				let basicSalaryNameTd = $("<td/>").text("기본급");
				let basicSalaryTd = $("<td/>").text(result.basicSalaryAmount);
				
				tr.append(basicSalaryNameTd);
				tr.append(basicSalaryTd);
				$("#modalTableBody").append(tr);
				
				console.log(result.detailCommissions);
				
				$("#modalTableBody").append(tr);
				for(let detailCommission of result.detailCommissions){
					let tr1 = $("<tr/>");
					
					let detailCommissionNameTd = $("<td/>").text(detailCommission.name);
					let detailCommissionAmountTd = $("<td/>").text(detailCommission.amount);
					
					tr1.append(detailCommissionNameTd);
					tr1.append(detailCommissionAmountTd);
					$("#modalTableBody").append(tr1);
				}
				
				let tr2=$("<tr/>");
				let totalTd = $("<th/>").text("총 금액").attr("scope","row");
				let totalAmountTd = $("<th/>").text(result.totalAmount).attr("scope","row");
				
				tr2.append(totalTd);
				tr2.append(totalAmountTd);
				
				$("#modalTableBody").append(tr2);
				$("#detailModal").modal("show");
			}
		});
	});
});