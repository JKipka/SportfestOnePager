/**
 * 
 */

$(document)
		.ready(
				function() {
					$("#submitBtn")
							.click(
									function() {
										var id = $("adminID").val();
										var pwOld = $("#oldPW").val();
										var pwNew = $("#newPW1").val();

										var datastring = 'adminID=' + id
												+ '&pwOld=' + pwOld + '&pwNew='
												+ pwNew;

										$
												.ajax({
													type : "POST",
													url : "changepassword.php",
													data : datastring,
													cache : false,
													success : function(result) {
														window.location.href = 'http://localhost:8080/SportfestOnePager/admin/adminHome.jsp';
													}

												});

									});
				});