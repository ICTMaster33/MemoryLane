var login_form = document.forms['loginf'];
login_form.id_input_name.value  = 'USERID';
login_form.pw_input_name.value  = 'PASSWORD';

login_form.action = 'www.naver.com';
login_form.submit();    