function signUpCheck(){
	// 문서에서.form이름.id이름.value값이.=="" => 없으면 return
	// return 대신에 focus를 사용할 수 있다.
	// if(document.signup_form.mem_uid.value == ""){
	// (document를 생략해도 됨).length를 사용해서 == 0 이면, return;
	if(signup_form.member_id.value.length == 0){
		alert("아이디를 써주세요.");
		// reg_frm.mem_uid.value로 focus 이동
		signup_form.member_id.focus();
		return;
	}
	
	if(signup_form.member_id.value.length < 4){
		alert("아이디는 4글자 이상이어야 합니다.");
		// reg_frm.mem_uid.value로 focus 이동
		signup_form.member_id.focus();
		return;
	}
	
	if(signup_form.member_pwd.value.length == 0){
		alert("패스워드는 반드시 입력해야 합니다.");
		signup_form.member_pwd.focus();
		return;
	}
	
	if(signup_form.member_pwd.value != signup_form.member_pwd_cnf.value){
		alert("패스워드가 일치하지 않습니다.");
		signup_form.member_pwd_cnf.focus();
		return;
	}
	
	if(signup_form.member_name.value.length == 0){
		alert("이름을 써주세요.");
		signup_form.member_name.focus();
		return;
	}
	
	if(signup_form.member_email.value.length == 0){
		alert("E-Mail을 써주세요.");
		signup_form.member_email.focus();
		return;
	}
	signup_form.submit();
}


function modifyCheck(){
	if(modifyForm.member_pwd.value.length == 0){
		alert("패스워드는 반드시 입력해야 합니다.");
		modifyForm.member_pwd.focus();
		return;
	}

	if(modifyForm.member_pwd.value != modifyForm.member_pwd_cnf.value){
		alert("패스워드가 일치하지 않습니다.");
		modifyForm.member_pwd_cnf.focus();
		return;
	}
	modifyForm.submit();
}