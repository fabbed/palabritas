var I18n = I18n || {};
I18n.translations = {"en":{"date":{"formats":{"default":"%Y-%m-%d","short":"%b %d","long":"%B %d, %Y"},"day_names":["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"],"abbr_day_names":["Sun","Mon","Tue","Wed","Thu","Fri","Sat"],"month_names":[null,"January","February","March","April","May","June","July","August","September","October","November","December"],"abbr_month_names":[null,"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"],"order":["year","month","day"]},"time":{"formats":{"default":"%a, %d %b %Y %H:%M:%S %z","short":"%d %b %H:%M","long":"%B %d, %Y %H:%M"},"am":"am","pm":"pm"},"support":{"array":{"words_connector":", ","two_words_connector":" and ","last_word_connector":", and "}},"errors":{"format":"%{attribute} %{message}","messages":{"inclusion":"is not included in the list","exclusion":"is reserved","invalid":"is invalid","confirmation":"doesn't match confirmation","accepted":"must be accepted","empty":"can't be empty","blank":"can't be blank","too_long":"is too long (maximum is %{count} characters)","too_short":"is too short (minimum is %{count} characters)","wrong_length":"is the wrong length (should be %{count} characters)","not_a_number":"is not a number","not_an_integer":"must be an integer","greater_than":"must be greater than %{count}","greater_than_or_equal_to":"must be greater than or equal to %{count}","equal_to":"must be equal to %{count}","less_than":"must be less than %{count}","less_than_or_equal_to":"must be less than or equal to %{count}","odd":"must be odd","even":"must be even","not_found":"not found","already_confirmed":"was already confirmed","not_locked":"was not locked"},"dynamic_format":"%{message}","template":{"header":{"one":"1 error prohibited this %{model} from being saved","other":"%{count} errors prohibited this %{model} from being saved"},"body":"There were problems with the following fields:"}},"activerecord":{"errors":{"messages":{"taken":"has already been taken","record_invalid":"Validation failed: %{errors}"}}},"number":{"format":{"separator":".","delimiter":",","precision":3,"significant":false,"strip_insignificant_zeros":false},"currency":{"format":{"format":"%u%n","unit":"$","separator":".","delimiter":",","precision":2,"significant":false,"strip_insignificant_zeros":false}},"percentage":{"format":{"delimiter":""}},"precision":{"format":{"delimiter":""}},"human":{"format":{"delimiter":"","precision":3,"significant":true,"strip_insignificant_zeros":true},"storage_units":{"format":"%n %u","units":{"byte":{"one":"Byte","other":"Bytes"},"kb":"KB","mb":"MB","gb":"GB","tb":"TB"}},"decimal_units":{"format":"%n %u","units":{"unit":"","thousand":"Thousand","million":"Million","billion":"Billion","trillion":"Trillion","quadrillion":"Quadrillion"}}}},"datetime":{"distance_in_words":{"half_a_minute":"half a minute","less_than_x_seconds":{"one":"less than 1 second","other":"less than %{count} seconds"},"x_seconds":{"one":"1 second","other":"%{count} seconds"},"less_than_x_minutes":{"one":"less than a minute","other":"less than %{count} minutes"},"x_minutes":{"one":"1 minute","other":"%{count} minutes"},"about_x_hours":{"one":"about 1 hour","other":"about %{count} hours"},"x_days":{"one":"1 day","other":"%{count} days"},"about_x_months":{"one":"about 1 month","other":"about %{count} months"},"x_months":{"one":"1 month","other":"%{count} months"},"about_x_years":{"one":"about 1 year","other":"about %{count} years"},"over_x_years":{"one":"over 1 year","other":"over %{count} years"},"almost_x_years":{"one":"almost 1 year","other":"almost %{count} years"}},"prompts":{"year":"Year","month":"Month","day":"Day","hour":"Hour","minute":"Minute","second":"Seconds"}},"helpers":{"select":{"prompt":"Please select"},"submit":{"create":"Create %{model}","update":"Update %{model}","submit":"Save %{model}"}},"devise":{"failure":{"unauthenticated":"You need to sign in or sign up before continuing.","unconfirmed":"You have to confirm your account before continuing.","locked":"Your account is locked.","invalid":"Invalid email or password.","invalid_token":"Invalid authentication token.","timeout":"Your session expired, please sign in again to continue.","inactive":"Your account was not activated yet."},"sessions":{"signed_in":"Signed in successfully.","signed_out":"Signed out successfully."},"passwords":{"send_instructions":"You will receive an email with instructions about how to reset your password in a few minutes.","updated":"Your password was changed successfully. You are now signed in."},"confirmations":{"send_instructions":"You will receive an email with instructions about how to confirm your account in a few minutes.","confirmed":"Your account was successfully confirmed. You are now signed in."},"registrations":{"signed_up":"You have signed up successfully. If enabled, a confirmation was sent to your e-mail.","updated":"You updated your account successfully.","destroyed":"Bye! Your account was successfully cancelled. We hope to see you again soon."},"unlocks":{"send_instructions":"You will receive an email with instructions about how to unlock your account in a few minutes.","unlocked":"Your account was successfully unlocked. You are now signed in."},"mailer":{"confirmation_instructions":{"subject":"Confirmation instructions"},"reset_password_instructions":{"subject":"Reset password instructions"},"unlock_instructions":{"subject":"Unlock Instructions"}}},"hello":"Hello world"},"es":{"errors":{"messages":{"not_found":"not found","already_confirmed":"was already confirmed","not_locked":"was not locked"}},"devise":{"failure":{"unauthenticated":"You need to sign in or sign up before continuing.","unconfirmed":"You have to confirm your account before continuing.","locked":"Your account is locked.","invalid":"Este email con esa contrase\u00f1a no es valido","invalid_token":"Invalid authentication token.","timeout":"Your session expired, please sign in again to continue.","inactive":"Your account was not activated yet."},"sessions":{"signed_in":"Signed in successfully.","signed_out":"Signed out successfully."},"passwords":{"send_instructions":"You will receive an email with instructions about how to reset your password in a few minutes.","updated":"Your password was changed successfully. You are now signed in."},"confirmations":{"send_instructions":"You will receive an email with instructions about how to confirm your account in a few minutes.","confirmed":"Your account was successfully confirmed. You are now signed in."},"registrations":{"signed_up":"You have signed up successfully. If enabled, a confirmation was sent to your e-mail.","updated":"You updated your account successfully.","destroyed":"Bye! Your account was successfully cancelled. We hope to see you again soon.","new":{"nombre":"Escribe tu nombre","email":"Email","username":"Nombre de usuario","password":"Contrase\u00f1a","slogan_below_form":"Obt\u00e9n tu propio 5palabritas.com totalmente gratis! ","title":"S\u00f3lo 5 palabras acerca de ti.","subtitle":"5palabritas.com te regala una p\u00e1gina <br/> donde tus amigos pueden describirte en <br/> tan s\u00f3lo 5 palabras."}},"unlocks":{"send_instructions":"You will receive an email with instructions about how to unlock your account in a few minutes.","unlocked":"Your account was successfully unlocked. You are now signed in."},"mailer":{"confirmation_instructions":{"subject":"Confirmation instructions"},"reset_password_instructions":{"subject":"Reset password instructions"},"unlock_instructions":{"subject":"Unlock Instructions"}}},"activerecord":{"errors":{"words":{"blank":"Por favor pon por lo menos 3 palabras","too_short":"Una palabra debe tener por lo menos 3 letras","too_long":"Una palabra debe tener mas que 25 letras"},"models":{"user":{"attributes":{"display_name":{"blank":"Por favor pon un nombre","too_short":"El nombre debe tener 4 letras minimo","too_long":"El nombre no debe tener mas que 30 letras"},"email":{"invalid":"Este email no es valido","blank":"Por favor pon tu email","taken":"Este email ya esta tomada"},"password":{"blank":"Por favor elige una contrase\u00f1a","too_short":"La contrase\u00f1a debe tener 4 letras minimo","too_long":"La contrase\u00f1a no debe tener mas que 15 letras"},"username":{"too_short":"Tu nombre de usuario debe tener 4 letras minimo","too_long":"Tu nombre de usuario no debe tener mas que 20 letras","taken":"Este nombre de usuario ya esta tomado, elige otro","blank":"Tienes que especificar un nombre de usuario"}}}},"login":{"password":{"blank":"Por favor, pon tu contrase\u00f1a"}}}},"shared":{"header":{"hola_username":"Hola, %{link}","home":"in\u00edcio","answers":"tus respuestas","settings":"ajustes","close_session":"cerrar sessi\u00f3n","login":"entrar"}},"user":{"dashboard":{"share_link_call_to_action":"Comparte este enlace con tus amigos para que te respondan","your_answers":"Tus respuestas","share_in_facebook":"Compartir enlace en facebook"},"edit":{"choose_an_avatar":"Elige un foto para ti","choose_a_background":"Elige un foto para el trasfondo de tu p\u00e1gina publica"}},"please_choose_a_username":"Por favor, elige un nombre de usuario...","datetime":{"distance_in_words":{"half_a_minute":"medio minuto","less_than_x_seconds":{"one":"menos de 1 segundo","other":"menos de %{count} segundos"},"x_seconds":{"one":"1 segundo","other":"%{count} segundos"},"less_than_x_minutes":{"one":"menos de 1 minuto","other":"menos de %{count} minutos"},"x_minutes":{"one":"1 minuto","other":"%{count} minutos"},"about_x_hours":{"one":"cerca de 1 hora","other":"cerca de %{count} horas"},"x_days":{"one":"1 d\u00eda","other":"%{count} d\u00edas"},"about_x_months":{"one":"cerca de 1 mes","other":"cerca de %{count} meses"},"x_months":{"one":"1 mes","other":"%{count} meses"},"about_x_years":{"other":"cerca de %{count} a\u00f1os","one":"cerca de 1 a\u00f1o"},"over_x_years":{"one":"m\u00e1s de 1 a\u00f1o","other":"m\u00e1s de %{count} a\u00f1os"},"almost_x_years":{"one":"casi 1 a\u00f1o","other":"casi %{count} a\u00f1os"}}}}};