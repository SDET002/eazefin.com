
getData();
function getData(){
	var data = [
		{
			"id": "1",
			"name": "Mr. Maheswaran S",
			"rank": 51,
			"salary": 51000,
			"salesData": [
				{
					"date": "30/11/23",
					"amount": "30000",
					"status": "Approved"
				},
				{
					"date": "30/11/23",
					"amount": "20000",
					"status": "Rejected"
				}
			]
		}
	];
	
	for(var i=0; i<data.length; i++){
		if(data[i].id==getParameterId()){
			document.getElementById("name").innerHTML = data[i].name;
			document.getElementById("rank").innerHTML = data[i].rank;
			document.getElementById("salary").innerHTML = data[i].salary;
			
			var tableData = "";
			for(var j=0; j<data[i].salesData.length; j++){
				tableData = tableData + '<tr>';
				tableData = tableData + '<td><span class="tab">'+data[i].salesData[j].date+'</span></td>';
				tableData = tableData + '<td><span class="tab">'+data[i].salesData[j].amount+'</span></td>';
				if(data[i].salesData[j].status=="Approved")
					tableData = tableData + '<td><span class="tab-approved">'+data[i].salesData[j].status+'</span></td>';
				else
					tableData = tableData + '<td><span class="tab-rejected">'+data[i].salesData[j].status+'</span></td>';
				tableData = tableData + '</tr>';
			}
			
			document.getElementById("table-body").innerHTML = tableData;
		}
	}
}

function getParameterId(){
	const queryString = window.location.search;
	const urlParams = new URLSearchParams(queryString);

	const value = 1;
	return value;
}