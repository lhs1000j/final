// Example starter JavaScript for disabling form submissions if there are
// invalid fields
(() => {
    'use strict'

    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    const forms = document.querySelectorAll('.needs-validation')

    // Loop over them and prevent submission
    Array
        .from(forms)
        .forEach(form => {
            form.addEventListener('submit', event => {
                if (!form.checkValidity()) {
                    event.preventDefault()
                    event.stopPropagation()
                }

                form
                    .classList
                    .add('was-validated')
            }, false)
        })
})()


function checkId(){
    var id = $('#id').val(); //id값이 "id"인 입력란의 값을 저장
    $.ajax({
        url:'./idCheck', //Controller에서 요청 받을 주소
        type:'post', //POST 방식으로 전달
        data:{id:id},
        success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다
            if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디
                $('.id_ok').css("display","inline-block");
                $('.id_already').css("display", "none");
            } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
                $('.id_already').css("display","inline-block");
                $('.id_ok').css("display", "none");
                alert("아이디를 다시 입력해주세요");
                $('#id').val('');
            }
        },
        error:function(){
            alert("에러입니다");
        }
    });
};

function check_ok(){

    // 문서에서.form이름.id이름.value값이.=="" => 없으면 return
    // return 대신에 focus를 사용할 수 있다.
    // if(document.reg_frm.mem_uid.value == ""){
    // (document를 생략해도 됨).length를 사용해서 == 0 이면, return;
    if(reg_frm.mem_uid.value.length == 0){
        alert("아이디를 써주세요.");
        // reg_frm.mem_uid.value로 focus 이동
        reg_frm.mem_uid.focus();
        return;
    }

    if(reg_frm.mem_uid.value.length < 4){
        alert("아이디는 4글자 이상이어야 합니다.");
        // reg_frm.mem_uid.value로 focus 이동
        reg_frm.mem_uid.focus();
        return;
    }

    if(document.reg_frm.mem_pwd.value.length == 0){
        alert("패스워드는 반드시 입력해야 합니다.");
        reg_frm.mem_pwd.focus();
        return;
    }

    if(reg_frm.mem_pwd.value != reg_frm.pwd_check.value){
        alert("패스워드가 일치하지 않습니다.");
        reg_frm.pwd_check.focus();
        return;
    }

    if(reg_frm.mem_name.value.length == 0){
        alert("이름을 써주세요.");
        reg_frm.mem_name.focus();
        return;
    }

    if(reg_frm.mem_email.value.length == 0){
        alert("E-Mail을 써주세요.");
        reg_frm.mem_email.focus();
        return;
    }

    // 만약에 있다면
    // 문서.form.submit
    reg_frm.submit();
}