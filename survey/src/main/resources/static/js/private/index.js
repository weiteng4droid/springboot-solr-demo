
! function($) {

	var handleData = {
		templateData: "",
		getHtml: function(data) {
			handleData.templateData = data.map(function(item, index) {
				var idex = index;
				var items = item.items.map(function(value, index) {
					var sigleItem = "<input type='radio' name=" + idex + " id=" + idex + "_" + index + ">" +
						"<label for=" + idex + "_" + index + ">" + value + "</label>"
					return "<p>" + sigleItem + "</p>";
				})
				items = items.join(" ");
				return "<div>" + "<h3>" + (index + 1) + "." + item.answer + "</h3>" + items + "</div>";

			})
		}
	};

	var serverData = {

		getQuestionData: function() {
			$.ajax({
				url: "",
				type: "get",
				beforeSend: function() {
					//校验手机号
				},
				success: function(data) {

					handleData.getHtml(data);

					var templateHTML = "<div>" + handleData.templateData.join(" ") + "</div>";

					var details = document.getElementById("details");

					details.innerHTML = templateHTML;

				}
			})
		},

		submitData: function() {
			var content = document.getElementById("content");
			//提交form表单  
			content.submit();
		}

	};

	/*
	//从服务器取数据
	serverData.getQuestionData();
	
	
	//提交数据
	var submitData = document.getElementById('submitData');

	submitData.onclick = function() {
		serverData.submitData();
	}
	
 */





	//下面的代码只为测试用，上面注释的代码为正式版所用
	
	var questionData = [/*{
		answer: "你所在的民族？",
		id: 1,
		items: ["汉族", "少数民族"]

	}, {
		answer: "你最喜欢的动物？",
		id: 2,
		items: ["猫咪", "小狗", "小绵羊"]
	}*/];
	

	/*handleData.getHtml(questionData);
  
 
	var templateHTML = "<div>" + handleData.templateData.join(" ") + "</div>";

	var details = document.getElementById("details");

	details.innerHTML = templateHTML;*/

	//提交数据
	var submitData = document.getElementById('submitData');

	submitData.onclick = function() {
		serverData.submitData();
	}

}(jQuery);