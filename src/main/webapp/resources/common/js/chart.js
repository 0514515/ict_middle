$(function(){
	// 입사 년도
	$.ajax({
		url:"/chart/hiredDate",
		method:"GET",
		success:function(result){
			let labels = [];
			let datas = [];
			for(let data of result){
				labels.push(data.hiredDate);
				datas.push(data.staffCount);
			}
			renderSingleLineChart("#hiredDateChart","입사년도",labels,datas);
		},error:function(result){
			renderSingleLineChart("#hiredDateChart",[],[]);
		}
	});

	// 월별 휴가 신청
	$.ajax({
		url:"/chart/monthlyLeave",
		method:"GET",
		success:function(result){
			let labels = [];
			let datas = [];
			console.log(result);
			for(let data of result){
				labels.push(data.month);
				datas.push(data.rate);
			}
			renderPieChart("#monthlyLeaveChart",labels,datas);
		},error:function(result){
			renderPieChart("#monthlyLeaveChart",[],[]);
		}
	});
	
	// 연령대
	$.ajax({
		url:"/chart/age",
		method:"GET",
		success:function(result){
			let labels = [];
			let datas = [];
			console.log(result);
			for(let data of result){
				labels.push(data.age);
				datas.push(data.count);
			}
			renderDoughnutChart("#ageChart",labels,datas);
		},error:function(result){
			renderDoughnutChart("#ageChart",[],[]);
		}
	});
	
	// 부서별 기안 수
	$.ajax({
		url:"chart/approval",
		method:"GET",
		success:function(result){
			let labels = [];
			let datas = [];
			console.log(result);
			for(let data of result){
				labels.push(data.departmentName);
				datas.push(data.count);
			}
			
			renderSingleBarChart("#approvalChart",labels,datas);
		}
	});
});

let renderSingleLineChart = function(component,label,labels,data){
    let ctx = $(component).get(0).getContext("2d");
    let myChart = new Chart(ctx, {
        type: "line",
        data: {
            labels: labels,
            datasets: [{
                label: label,
                fill:false,
                backgroundColor: "rgba(0, 156, 255, .3)",
                data: data
            }]
        },
        options: {
            responsive: true
        }
    });
}

let renderPieChart = function(component,labels,data){
    let ctx = $(component).get(0).getContext("2d");
    let myChart = new Chart(ctx, {
        type: "pie",
        data: {
            labels: labels,
            datasets: [{
                backgroundColor: [
                    "rgba(0, 156, 255, .7)",
                    "rgba(0, 156, 255, .6)",
                    "rgba(0, 156, 255, .5)",
                    "rgba(0, 156, 255, .4)",
                    "rgba(0, 156, 255, .3)"
                ],
                data: data
            }]
        },
        options: {
            responsive: true
        }
    });
}

let renderDoughnutChart = function(component,labels,data){
    let ctx = $(component).get(0).getContext("2d");
    let myChart = new Chart(ctx, {
        type: "doughnut",
        data: {
            labels: labels,
            datasets: [{
                backgroundColor: [
                    "rgba(0, 156, 255, .7)",
                    "rgba(0, 156, 255, .6)",
                    "rgba(0, 156, 255, .5)",
                    "rgba(0, 156, 255, .4)",
                    "rgba(0, 156, 255, .3)"
                ],
                data: data
            }]
        },
        options: {
            responsive: true
        }
    });
}

let renderSingleBarChart = function(component,labels,data,datasets){
    var ctx = $(component).get(0).getContext("2d");
    var myChart = new Chart(ctx, {
        type: "bar",
        data: {
            labels: labels,
            datasets: datasets
        },
        options: {
            responsive: true
        }
    });
}