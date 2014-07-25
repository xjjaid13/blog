<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<style>
	
@import "//fonts.googleapis.com/css?family=Roboto:200,400,500,600";
html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, font, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td {
    border: 0 none;
    font-family: inherit;
    font-size: 100%;
    font-style: inherit;
    font-weight: inherit;
    margin: 0;
    outline: 0 none;
    padding: 0;
    vertical-align: baseline;
}
:focus {
    outline: 0 none;
}
ol, ul {
    list-style: none outside none;
}
table {
    border-collapse: separate;
    border-spacing: 0;
}
caption, th, td {
    font-weight: normal;
    text-align: left;
}
blockquote:before, blockquote:after, q:before, q:after {
    content: "";
}
a img {
    border: 0 none;
}
article, aside, details, figcaption, figure, footer, header, hgroup, menu, nav, section {
    display: block;
}
html, body {
    height: 100%;
    width: 100%;
}
body {
    background: none repeat scroll 0 0 #FFFFFF;
    color: #777777;
    font: 12px/21px "Helvetica Neue",Helvetica,Arial,sans-serif;
}
h1, h2, h3, h4, h5, h6 {
    color: #3F3F3F;
    font-weight: normal;
}
a {
    color: #258ED2;
    text-decoration: none;
    transition: color 0.1s linear 0s;
}
a:hover {
    color: #B50D53;
    text-decoration: underline;
}
strong {
    color: #3F3F3F;
    font-weight: bold;
}
input, .login input[type="password"], textarea {
    background: none repeat scroll 0 0 #FFFFFF;
    border: 1px solid #DDDDDD;
    border-radius: 2px;
    box-shadow: none;
    color: #AEAEAE;
    display: block;
    font: 300 12px/21px "Helvetica Neue",Helvetica,Arial,sans-serif;
    margin: 0;
    padding: 8px;
}
input:focus, .login input[type="password"]:focus, textarea:focus {
    border-color: #C5C5C5;
    color: #5C5C5C !important;
}
button {
    font: 300 12px/12px "Helvetica Neue",Helvetica,Arial,sans-serif;
}
.hide, .hide-if-no-js {
    display: none;
}
.clearfix:after {
    clear: both;
}
.clearfix:before, .clearfix:after {
    content: "";
    display: table;
}
.clearfix:after {
    clear: both;
    content: ".";
    display: block;
    font-size: 0;
    height: 0;
    visibility: hidden;
}
.clearfix:before, .clearfix:after {
    content: "";
    display: table;
}
.btn {
    border-radius: 5px;
    color: #3F3F3F;
    display: block;
    font-size: 13px;
    line-height: 13px;
    padding: 10px 22px 12px;
    text-align: center;
}
.btn_gray, #header ul.menu li.current-menu-item a, body.jigoshop-shop #header ul.menu li.pricing_btn a, div#feedback input.wpcf7-submit, div#feedback div.form_sent a {
    -moz-border-bottom-colors: none;
    -moz-border-left-colors: none;
    -moz-border-right-colors: none;
    -moz-border-top-colors: none;
    background: -moz-linear-gradient(center top , #FFFFFF, #F3F3F3) repeat scroll 0 0 rgba(0, 0, 0, 0);
    border-color: #CCCCCC #CCCCCC #ACACAC;
    border-image: none;
    border-style: solid;
    border-width: 1px;
    box-shadow: 0 0 4px rgba(0, 0, 0, 0.03);
    color: #3F3F3F;
    text-shadow: none;
}
.btn_gray:hover, div#feedback input.wpcf7-submit:hover, div#feedback div.form_sent a:hover, .login input.submit:hover, div#support_form ul.form li input.wpcf7-submit:hover {
    background: -moz-linear-gradient(center top , #FFFFFF, #F9F9F9) repeat scroll 0 0 rgba(0, 0, 0, 0);
    border-color: #BBBBBB #BBBBBB #999999;
    box-shadow: 0 0 4px rgba(0, 0, 0, 0.13);
    color: #333333;
    text-decoration: none;
}
.btn_blue {
    -moz-border-bottom-colors: none;
    -moz-border-left-colors: none;
    -moz-border-right-colors: none;
    -moz-border-top-colors: none;
    background: -moz-linear-gradient(center top , #2A9AE2, #258ED2) repeat scroll 0 0 rgba(0, 0, 0, 0);
    border-color: #2383BF #2383BF #333333;
    border-image: none;
    border-style: solid;
    border-width: 1px;
    box-shadow: 0 1px 0 rgba(255, 255, 255, 0.4), 0 1px 0 rgba(255, 255, 255, 0.4) inset;
    color: #FFFFFF;
    text-shadow: 0 1px 1px #333333;
}
.btn_blue:hover {
    background: none repeat scroll 0 0 #2A9AE2;
    box-shadow: 0 0 4px rgba(0, 0, 0, 0.2), 0 1px 0 rgba(255, 255, 255, 0.4) inset;
    color: #FFFFFF;
    text-decoration: none;
}
.btn_green, #header ul.menu li.pricing_btn a, #payment .button-alt, div.checkout_pay .button-alt {
    -moz-border-bottom-colors: none;
    -moz-border-left-colors: none;
    -moz-border-right-colors: none;
    -moz-border-top-colors: none;
    background: -moz-linear-gradient(center top , #91D484, #7BB86E) repeat scroll 0 0 rgba(0, 0, 0, 0);
    border-color: #6F9D66 #6F9D66 #587752;
    border-image: none;
    border-style: solid;
    border-width: 1px;
    box-shadow: 0 1px 0 rgba(255, 255, 255, 0.4), 0 1px 0 rgba(255, 255, 255, 0.4) inset;
    color: #FFFFFF;
    font-weight: 200;
    text-shadow: 1px 1px 0 #555555;
}
.btn_green:hover, #header ul.menu li.pricing_btn a:hover, #payment .button-alt:hover, div.checkout_pay .button-alt:hover {
    background: -moz-linear-gradient(center top , #91D484, #7BB86E) repeat scroll 0 0 rgba(0, 0, 0, 0);
    box-shadow: 0 0 4px rgba(0, 0, 0, 0.2), 0 1px 0 rgba(255, 255, 255, 0.4) inset;
    color: #FFFFFF;
    text-decoration: none;
}
#wrapper {
    background: url("/slidetabs/wp-content/themes/slidetabs/images/pattern.gif") repeat scroll 0 0 rgba(0, 0, 0, 0);
    overflow: hidden;
}
#wrapper_inner {
    background: url("/slidetabs/wp-content/themes/slidetabs/images/top_gradient.png") repeat-x scroll 0 0 rgba(0, 0, 0, 0);
    overflow: hidden;
}
.page-template-template-support-php #wrapper_inner, .page-template-template-docs-php #wrapper_inner, .jigoshop #wrapper_inner, .page-id-14 #wrapper_inner {
    background-position: 0 58px;
}
.jigoshop-shop #wrapper_inner {
    background-position: 0 0;
}
.header {
    background: linear-gradient(#4E4E4E, #313131) repeat scroll 0 0 rgba(0, 0, 0, 0);
    box-shadow: 0 0 2px rgba(0, 0, 0, 0.8);
}
div#top_bar div.top_bar_inner, .header_center, #header, #page, #footer div.center {
    margin: 0 auto;
    width: 880px;
}
#page {
    position: relative;
}
#content {
}
.page_heading, .entry-header {
    text-align: center;
    width: 100%;
}
.page_heading h1, .entry-header h1 {
    font: 200 24px/36px Roboto,Georgia,"Times New Roman",Times,serif;
    letter-spacing: -1px;
    padding: 0 30px;
}
div#top_bar {
    background: linear-gradient(#4E4E4E, #313131) repeat scroll 0 0 rgba(0, 0, 0, 0);
    box-shadow: 0 0 2px rgba(0, 0, 0, 0.8);
    color: #AAAAAA;
    font-size: 12px;
    height: 29px;
    left: 0;
    overflow: hidden;
    padding-top: 8px;
    position: fixed;
    top: 0;
    width: 100%;
    z-index: 100000;
}
div#top_bar div.top_bar_inner {
    margin: 0 auto;
    position: relative;
}
div#top_bar p {
    display: block;
    float: left;
}
div#top_bar a {
    color: #EEEEEE;
    text-decoration: none;
}
div#top_bar a:hover {
    color: #FFFFFF;
}
ul#social_media {
    float: left;
}
ul#social_media li {
    float: left;
    margin-right: 12px;
}
div.tweet {
    display: inline-block;
    height: 20px;
}
div.tweet a.tw_btn {
    -moz-user-select: none;
    cursor: pointer;
    display: block;
    float: left;
    font-weight: bold;
    position: relative;
    text-indent: 23px;
}
div.tweet a.tw_btn span.label, ul.top_bar_nav li a.feedback {
    background: url("/slidetabs/wp-content/themes/slidetabs/images/sprite.png") no-repeat scroll 0 0 rgba(0, 0, 0, 0);
}
div.tweet a.tw_btn span.label {
    background-position: 0 -491px;
    display: block;
}
div.tweet_count {
    cursor: default;
    display: none;
    float: left;
    margin-left: 4px;
    position: relative;
}
div.tweet_count a.count {
    display: block;
}
ul.top_bar_nav {
    float: right;
}
ul.top_bar_nav li {
    float: left;
}
ul.top_bar_nav li.first {
    border-right: 1px solid #777777;
    margin-right: 9px;
    padding-right: 9px;
}
ul.top_bar_nav li a {
    font-weight: bold;
}
ul.top_bar_nav li a.feedback {
    background-position: 67px -108px;
    padding-right: 11px;
}
ul.top_bar_nav li a.feedback.active {
    color: #B50D53;
}
div#feedback {
    -moz-border-bottom-colors: none;
    -moz-border-left-colors: none;
    -moz-border-right-colors: none;
    -moz-border-top-colors: none;
    background: none repeat scroll 0 0 #FFFFFF;
    border-color: #CCCCCC #CCCCCC #AAAAAA;
    border-image: none;
    border-radius: 5px;
    border-style: solid;
    border-width: 1px;
    box-shadow: 0 0 4px rgba(0, 0, 0, 0.12);
    color: #777777;
    display: none;
    padding: 11px 13px 13px;
    position: fixed;
    right: 185px;
    top: 38px;
    width: 203px;
    z-index: 1000000;
}
div#feedback a {
    color: #258ED2;
}
div#feedback a:hover {
    color: #B50D53;
}
div#feedback div.arrow_border, div#feedback div.arrow {
    left: 105px;
    position: absolute;
}
div#feedback div.arrow_border {
    -moz-border-bottom-colors: none;
    -moz-border-left-colors: none;
    -moz-border-right-colors: none;
    -moz-border-top-colors: none;
    border-color: rgba(0, 0, 0, 0) rgba(0, 0, 0, 0) #CCCCCC;
    border-image: none;
    border-style: outset outset solid;
    border-width: 9px;
    height: 0;
    top: -18px;
    width: 0;
}
div#feedback div.arrow {
    -moz-border-bottom-colors: none;
    -moz-border-left-colors: none;
    -moz-border-right-colors: none;
    -moz-border-top-colors: none;
    border-color: rgba(0, 0, 0, 0) rgba(0, 0, 0, 0) #FFFFFF;
    border-image: none;
    border-style: outset outset solid;
    border-width: 9px;
    height: 0;
    top: -16px;
    width: 0;
}
div#feedback input, div#feedback textarea {
    border-radius: 3px;
    color: #5C5C5C;
    margin-top: 12px;
    padding: 5px;
    resize: vertical;
    width: 188px;
}
#feedback input.default {
    color: #999999;
}
div#feedback input.wpcf7-submit, div#feedback div.form_sent a {
    border-radius: 5px;
    box-shadow: 0 2px 0 rgba(0, 0, 0, 0.03);
    cursor: pointer;
    font-weight: bold;
    padding: 6px 0;
    width: 200px;
}
div#feedback img.ajax-loader {
    display: none;
}
div#feedback div#support_form_overlay {
    background: url("/slidetabs/wp-content/themes/slidetabs/images/spinner.gif") no-repeat scroll center center #FFFFFF;
    border-radius: 5px;
    height: 100%;
    left: 0;
    position: absolute;
    top: 0;
    width: 100%;
    z-index: 1000;
}
div#feedback div.form_sent {
    text-align: center;
}
div#feedback div.form_sent h1 {
    font-size: 14px;
    font-weight: bold;
    line-height: 14px;
    margin: 5px 0 4px;
    padding-bottom: 3px;
}
div#feedback div.form_sent p {
    float: none;
}
div#feedback div.form_sent a {
    display: inline-block;
    margin-bottom: 5px;
    margin-top: 9px;
    padding: 3px 12px;
    width: auto;
}
div#feedback div.wpcf7-validation-errors, div#feedback div.wpcf7-mail-sent-ng {
    color: #D1156A;
    display: inline-block !important;
    padding-top: 10px;
}
div#feedback div.wpcf7-validation-errors a, div#feedback div.wpcf7-mail-sent-ng a {
    text-decoration: underline;
}
#header {
    box-shadow: none;
}
#header .header_center {
    padding: 97px 0 26px;
    position: relative;
    width: 100%;
}
#logo {
    float: left;
}
#logo h1 a {
    background: url("/slidetabs/wp-content/themes/slidetabs/images/sprite_type.png") no-repeat scroll 0 0 rgba(0, 0, 0, 0);
    display: block;
    height: 30px;
    text-indent: -99999px;
    width: 139px;
}
#logo h1 a:active {
    position: relative;
    top: 1px;
}
#logo h2 {
    display: none;
}
#header ul.menu {
    float: right;
}
#header ul.menu li {
    float: left;
    margin-left: 6px;
}
#header ul.menu li.menu-item-home {
    margin-left: 0;
}
#header ul.menu li a {
    border: 1px solid rgba(0, 0, 0, 0);
    border-radius: 5px;
    color: #3F3F3F;
    display: block;
    font-size: 14px;
    line-height: 29px;
    padding: 0 18px 2px;
}
body.jigoshop-shop #header ul.menu li a, #header ul.menu li a:hover {
    color: #939393;
    text-decoration: none;
}
#header ul.menu li.current-menu-item a {
    box-shadow: none !important;
}
#header ul.menu li.current-menu-item a:hover {
    color: #3F3F3F;
}
#header ul.menu li#menu-item-27 a strong {
    color: inherit;
}
ul.menu_dropdown {
    display: none;
    width: 100%;
}
ul.menu_dropdown .btn {
    cursor: pointer;
    padding: 9px 0 11px;
}
ul.menu_dropdown li {
    float: left;
    width: 20%;
}
ul.menu_dropdown li.btn_gray {
    border-bottom-right-radius: 0;
    border-top-right-radius: 0;
    font-weight: bold;
    margin-right: -3px;
    position: relative;
    text-align: left;
    text-indent: 13px;
    width: 80%;
    z-index: 90;
}
ul.menu_dropdown li.btn_gray i {
    background: url("/slidetabs/wp-content/themes/slidetabs/images/home/dropdown_icon.gif") no-repeat scroll 0 0 rgba(0, 0, 0, 0);
    height: 15px;
    position: absolute;
    right: 12px;
    top: 9px;
    width: 19px;
}
ul.menu_dropdown li a.btn_green {
    border-bottom-left-radius: 0;
    border-top-left-radius: 0;
    position: relative;
    z-index: 100;
}
#header #dropdown_menu {
    display: none;
}
#header #dropdown_menu ul {
    -moz-border-bottom-colors: none;
    -moz-border-left-colors: none;
    -moz-border-right-colors: none;
    -moz-border-top-colors: none;
    border-bottom-left-radius: 5px;
    border-bottom-right-radius: 5px;
    border-color: #CCCCCC #CCCCCC #AAAAAA;
    border-image: none;
    border-style: solid;
    border-width: 1px;
    float: none;
    left: 0;
    padding-top: 10px;
    position: absolute;
    top: 181px;
    width: 297px;
    z-index: 50;
}
#header #dropdown_menu ul li {
    float: none;
    margin-left: 0;
}
#header #dropdown_menu ul li.menu-item-home {
    margin-left: 0;
}
#header #dropdown_menu ul li.menu-item-25 {
    display: none;
}
#header #dropdown_menu ul li a, #header #dropdown_menu ul li.current-menu-item a, #header #dropdown_menu ul li#menu-item-27 a {
    -moz-border-bottom-colors: none;
    -moz-border-left-colors: none;
    -moz-border-right-colors: none;
    -moz-border-top-colors: none;
    background: none repeat scroll 0 0 #FAFAFA;
    border-color: -moz-use-text-color -moz-use-text-color #E9E9E9;
    border-image: none;
    border-radius: 0;
    border-style: none none solid;
    border-width: 0 0 1px;
    color: #3F3F3F;
    display: block;
    font-size: 13px;
    line-height: 29px;
    padding: 6px 0;
    text-indent: 15px;
    text-shadow: none;
}
#header #dropdown_menu ul li.current-menu-item a, #header #dropdown_menu ul li a:hover, #header #dropdown_menu ul li#menu-item-27 a:hover {
    background: none repeat scroll 0 0 #FFFFFF;
    box-shadow: none;
    color: #3F3F3F;
    text-decoration: none;
}
#header #dropdown_menu ul li.current-menu-item a, #header #dropdown_menu ul li.current-menu-item a:hover {
    box-shadow: none;
    color: #939393;
}
#header #dropdown_menu ul li.menu-item-27 a {
    border-bottom: 0 none;
    border-bottom-left-radius: 5px;
    border-bottom-right-radius: 5px;
    box-shadow: none;
    margin-top: 0;
}
#header #dropdown_menu ul li.menu-item-27 a strong {
    color: inherit;
}
span.hw_text {
    display: block;
    position: absolute;
    text-indent: -999em;
}
#docs_header {
    height: 59px;
}
#docs_header h1 {
    background: url("/slidetabs/wp-content/themes/slidetabs/images/sprite_type.png") no-repeat scroll 0 -59px rgba(0, 0, 0, 0);
    display: block;
    float: left;
    height: 24px;
    margin-top: 16px;
    text-indent: -99999px;
    width: 160px;
}
#docs_header ul {
    float: right;
    margin-top: 15px;
}
#docs_header ul li {
    float: left;
}
#docs_header ul li a {
    color: #CCCCCC;
    display: block;
    line-height: 20px;
    margin-left: 15px;
    margin-top: 5px;
}
#docs_header ul li a.support_link {
    background: -moz-linear-gradient(center top , #FFFFFF, #E5E5E5) repeat scroll 0 0 rgba(0, 0, 0, 0);
    border-radius: 20px;
    color: #333333;
    display: inline-block;
    line-height: 12px;
    margin-top: 0;
    padding: 7px 14px 8px 28px;
    position: relative;
}
#docs_header ul li a.support_link:hover {
    background: none repeat scroll 0 0 #F7F7F7;
    color: #333333;
}
#docs_header ul li a.support_link span {
    background: url("/slidetabs/wp-content/themes/slidetabs/images/sprite.png") no-repeat scroll 0 -95px rgba(0, 0, 0, 0);
    display: block;
    height: 12px;
    left: 11px;
    position: absolute;
    top: 8px;
    width: 11px;
}
#docs_header ul li a:hover {
    color: #FFFFFF;
    text-decoration: none;
}
#account_header {
    height: 59px;
}
#account_header h1 {
    background: url("/slidetabs/wp-content/themes/slidetabs/images/sprite_type.png") no-repeat scroll 0 -84px rgba(0, 0, 0, 0);
    display: block;
    float: left;
    height: 24px;
    margin-top: 16px;
    text-indent: -99999px;
    width: 183px;
}
#account_header p {
    float: right;
    margin-top: 18px;
}
#account_header a {
    color: #CCCCCC;
}
#account_header a:hover {
    color: #FFFFFF;
}
div#terms {
    color: #555555;
    font-size: 13px;
    margin: 40px 0 50px;
}
div#terms h1 {
    font-size: 24px;
    font-weight: bold;
    line-height: 26px;
    margin-bottom: 15px;
}
div#terms h2 {
    font-size: 18px;
    font-weight: bold;
    line-height: 18px;
    margin: 35px 0 15px;
}
div#terms p, div#terms ul {
    margin-bottom: 13px;
}
div#terms ul {
    list-style: disc outside none;
    margin-left: 15px;
}
.message, .error, div.jigoshop_error, div.jigoshop_message {
    border: 1px solid;
    border-radius: 5px;
    box-shadow: 0 0 3px rgba(0, 0, 0, 0.05);
    margin-top: 30px;
    padding: 10px 14px;
}
.message, .error, div#change_password_form .jigoshop_error {
    margin-bottom: 20px;
}
.message {
    background-color: #FFFBCC;
    border-color: #E6DB55;
    color: #555555;
}
.error, div.jigoshop_error {
    background: url("/slidetabs/wp-content/themes/slidetabs/images/sprite.png") no-repeat scroll 14px -239px #FBE3E4;
    border-color: #FA9698;
    color: #111111;
    padding: 10px 14px 10px 35px;
}
.error a, div.jigoshop_error a {
    display: none;
}
div#requirements_overlay, div#requirements_modal {
    display: none;
    position: absolute;
}
div#requirements_overlay {
    background-color: #000000;
    cursor: pointer;
    height: 100%;
    left: 0;
    opacity: 0.5;
    top: 0;
    width: 100%;
    z-index: 10000;
}
div#requirements_modal {
    background: none repeat scroll 0 0 #FFFFFF;
    border-radius: 7px;
    box-shadow: 0 0 19px rgba(0, 0, 0, 0.4);
    height: 146px;
    left: 50%;
    margin-left: -166px;
    margin-top: -72px;
    padding: 25px;
    top: 50%;
    width: 332px;
    z-index: 11000;
}
a#requirements_close {
    background: url("/slidetabs/wp-content/themes/slidetabs/images/sprite.png") no-repeat scroll 2px -768px rgba(0, 0, 0, 0);
    cursor: pointer;
    height: 37px;
    position: absolute;
    right: -15px;
    top: -14px;
    width: 34px;
    z-index: 1103;
}
a#requirements_close:hover {
    text-decoration: none;
}
div#requirements_modal h3 {
    font-size: 15px;
    font-weight: bold;
    line-height: 15px;
    margin-bottom: 17px;
}
div#requirements_modal p {
    margin-bottom: 15px;
}
#footer {
    background: none repeat scroll 0 0 #FEFEFE;
    border-top: 1px solid #E3E3E3;
    clear: both;
    color: #999999;
    font-size: 12px;
    overflow: hidden;
    text-align: center;
}
.footer_minimal {
    text-align: left !important;
}
#footer div.center {
    margin: 0 auto;
    overflow: hidden;
    padding: 40px 0 30px;
    position: relative;
}
#footer ul li {
    float: left;
}
#footer h1.logo {
    color: #999999;
    font-size: 15px;
    line-height: 15px;
}
.footer_minimal h1.logo {
    position: absolute;
    right: 0;
    top: 30px;
}
#footer h1.logo a {
    background: url("/slidetabs/wp-content/themes/slidetabs/images/sprite_type.png") no-repeat scroll 0 -33px rgba(0, 0, 0, 0);
    display: inline-block;
    height: 24px;
    text-indent: -99999px;
    transition: opacity 0.2s ease 0s;
    width: 109px;
}
#footer h1.logo a:active {
    position: relative;
    top: 1px;
}
.footer_minimal h1.logo a:active {
    top: 0 !important;
}
#footer h1.logo a:hover {
    opacity: 0.8;
}
.footer_minimal h1.logo a:hover {
    opacity: 1 !important;
}
#footer h1.logo span {
    bottom: -8px;
    font-weight: normal;
    left: 5px;
    line-height: 16px;
    position: relative;
}
#footer p.footer_nav {
    margin: 23px 0 17px;
}
#footer p.footer_nav a {
    border-right: 1px solid #CCCCCC;
    color: #777777;
    font-weight: bold;
    line-height: 1;
    margin-right: 10px;
    padding-right: 10px;
}
#footer p.footer_nav a.last {
    border-right: 0 none;
    margin-right: 0;
    padding-right: 0;
}
#footer p.footer_nav a:hover {
    color: #000000;
    text-decoration: none;
}
#footer ul.social_media_footer {
    margin: 0 auto 17px;
    width: 268px;
}
#footer ul.social_media_footer li {
    margin-right: 15px;
}
#footer ul.social_media_footer li a {
    background-color: rgba(0, 0, 0, 0);
    background-image: url("/slidetabs/wp-content/themes/slidetabs/images/sprite.png");
    background-repeat: no-repeat;
    color: #258ED2;
    display: inline-block;
    height: 25px;
    line-height: 25px;
    padding-left: 31px;
}
#footer ul.social_media_footer li a.tweet {
    background-position: 0 -512px;
}
#footer ul.social_media_footer li a.tweet:hover {
    background-position: 0 -540px;
}
#footer ul.social_media_footer li a.pinterest {
    background-position: 0 -568px;
}
#footer ul.social_media_footer li a.pinterest:hover {
    background-position: 0 -595px;
}
p.copyright {
    display: inline-block;
    margin-bottom: 5px;
}
p.copyright a {
    color: #999999;
    display: inline-block;
    line-height: 12px;
}
p.copyright a:hover {
    text-decoration: underline;
}
p.copyright a.divider {
    border-right: 1px solid #CCCCCC;
    margin-right: 7px;
    padding-right: 7px;
}
@media screen and (max-width: 940px) {
.header_center, #header, #page, div#top_bar div.top_bar_inner, #footer div.center {
    width: 715px;
}
#header ul.menu li#menu-item-25 {
    display: none;
}
.footer_minimal h1.logo {
    margin-bottom: 15px;
    position: static;
}
.footer_minimal div.center {
    padding: 30px 0 !important;
}
}
@media screen and (max-width: 760px) {
.header_center, #header, #page, div#top_bar div.top_bar_inner, #footer div.center {
    width: 420px;
}
ul.top_bar_nav li span, div.tweet_count a.count {
    display: none;
}
.page_heading h1, .entry-header h1 {
    font: 200 22px/30px Roboto,Georgia,"Times New Roman",Times,serif;
}
#header .header_center {
    padding: 97px 0 28px;
}
#logo {
    float: none !important;
}
#logo h1 a {
    margin: 0 auto 30px;
}
#header ul.menu {
    float: none !important;
    margin: 0 auto;
    width: 561px;
}
#header ul.menu li {
    margin-left: 6px;
}
#header ul.menu li a {
    border: 1px solid #F3F3F3;
}
#header #dropdown_menu {
    display: none;
}
#header #dropdown_menu.show {
    display: none;
}
.footer_minimal {
    text-align: center !important;
}
#footer p.footer_nav a.full_only {
    display: none;
}
}
@media screen and (max-width: 480px) {
.header_center, #header, #page, div#top_bar div.top_bar_inner, #footer div.center {
    width: 300px;
}
#menu-slidetabs-main-menu {
    display: none;
}
#header #dropdown_btn {
    display: inline-block;
}
#header #dropdown_menu.show {
    display: block;
}
#footer p.footer_nav a.home {
    display: none;
}
}
div.selector, div.selector span, div.checker span, div.radio span, div.uploader, div.uploader span.action, div.button, div.button span {
    background-image: url("/slidetabs/wp-content/themes/slidetabs/js/uniform/images/sprite.png");
    background-repeat: no-repeat;
}
.selector, .radio, .checker, .uploader, .button, .selector *, .radio *, .checker *, .uploader *, .button * {
    margin: 0;
    padding: 0;
}
input.text, input.email, input.password, textarea.uniform {
    background: url("/slidetabs/wp-content/themes/slidetabs/js/uniform/images/bg-input.png") repeat-x scroll 0 0 rgba(0, 0, 0, 0);
    border-color: #AAAAAA #CCCCCC #CCCCCC #AAAAAA;
    border-radius: 3px;
    border-style: solid;
    border-width: 1px;
    color: #777777;
    font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
    font-size: 12px;
    font-weight: normal;
    outline: 0 none;
    padding: 3px;
}
input.text:focus, input.email:focus, input.password:focus, textarea.uniform:focus {
    background: url("/slidetabs/wp-content/themes/slidetabs/js/uniform/images/bg-input-focus.png") repeat-x scroll 0 0 rgba(0, 0, 0, 0);
    border-color: #999999;
    box-shadow: 0 0 4px rgba(0, 0, 0, 0.3);
}
div.selector {
    background-position: -483px -130px;
    height: 26px;
    line-height: 26px;
}
div.selector span {
    background-position: right 0;
    height: 26px;
    line-height: 26px;
}
div.selector select {
    left: 0;
    top: 0;
}
div.selector:active, div.selector.active {
    background-position: -483px -156px;
}
div.selector:active span, div.selector.active span {
    background-position: right -26px;
}
div.selector.focus, div.selector.hover, div.selector:hover {
    background-position: -483px -182px;
}
div.selector.focus span, div.selector.hover span, div.selector:hover span {
    background-position: right -52px;
}
div.selector.focus:active, div.selector.focus.active, div.selector:hover:active, div.selector.active:hover {
    background-position: -483px -208px;
}
div.selector.focus:active span, div.selector:hover:active span, div.selector.active:hover span, div.selector.focus.active span {
    background-position: right -78px;
}
div.selector.disabled {
    background-position: -483px -234px;
}
div.selector.disabled span {
    background-position: right -104px;
}
div.checker {
    height: 18px;
    width: 18px;
}
div.checker input {
    height: 18px;
    width: 18px;
}
div.checker span {
    background-position: 0 -260px;
    height: 18px;
    width: 18px;
}
div.checker:active span, div.checker.active span {
    background-position: -19px -260px;
}
div.checker.focus span, div.checker:hover span {
    background-position: -38px -260px;
}
div.checker.focus:active span, div.checker:active:hover span, div.checker.active:hover span, div.checker.focus.active span {
    background-position: -57px -260px;
}
div.checker span.checked {
    background-position: -76px -260px;
}
div.checker:active span.checked, div.checker.active span.checked {
    background-position: -95px -260px;
}
div.checker.focus span.checked, div.checker:hover span.checked {
    background-position: -114px -260px;
}
div.checker.focus:active span.checked, div.checker:hover:active span.checked, div.checker.active:hover span.checked, div.checker.active.focus span.checked {
    background-position: -133px -260px;
}
div.checker.disabled span, div.checker.disabled:active span, div.checker.disabled.active span {
    background-position: -152px -260px;
}
div.checker.disabled span.checked, div.checker.disabled:active span.checked, div.checker.disabled.active span.checked {
    background-position: -171px -260px;
}
div.radio {
    height: 18px;
    width: 18px;
}
div.radio input {
    height: 18px;
    width: 18px;
}
div.radio span {
    background-position: 0 -279px;
    height: 18px;
    width: 18px;
}
div.radio:active span, div.radio.active span {
    background-position: -18px -279px;
}
div.radio.focus span, div.radio:hover span {
    background-position: -36px -279px;
}
div.radio.focus:active span, div.radio:active:hover span, div.radio.active:hover span, div.radio.active.focus span {
    background-position: -54px -279px;
}
div.radio span.checked {
    background-position: -72px -279px;
}
div.radio:active span.checked, div.radio.active span.checked {
    background-position: -90px -279px;
}
div.radio.focus span.checked, div.radio:hover span.checked {
    background-position: -108px -279px;
}
div.radio.focus:active span.checked, div.radio:hover:active span.checked, div.radio.focus.active span.checked, div.radio.active:hover span.checked {
    background-position: -126px -279px;
}
div.radio.disabled span, div.radio.disabled:active span, div.radio.disabled.active span {
    background-position: -144px -279px;
}
div.radio.disabled span.checked, div.radio.disabled:active span.checked, div.radio.disabled.active span.checked {
    background-position: -162px -279px;
}
div.uploader {
    background-position: 0 -297px;
    height: 28px;
}
div.uploader span.action {
    background-position: right -409px;
    height: 24px;
    line-height: 24px;
}
div.uploader span.filename {
    height: 24px;
    line-height: 24px;
    margin: 2px 0 2px 2px;
}
div.uploader.focus, div.uploader.hover, div.uploader:hover {
    background-position: 0 -353px;
}
div.uploader.focus span.action, div.uploader.hover span.action, div.uploader:hover span.action {
    background-position: right -437px;
}
div.uploader.active span.action, div.uploader:active span.action {
    background-position: right -465px;
}
div.uploader.focus.active span.action, div.uploader.active:focus span.action, div.uploader.focus:active span.action, div.uploader:focus:active span.action {
    background-position: right -493px;
}
div.uploader.disabled {
    background-position: 0 -325px;
}
div.uploader.disabled span.action {
    background-position: right -381px;
}
div.button {
    background-position: 0 -523px;
}
div.button span {
    background-position: right -643px;
}
div.button.focus, div.button:focus, div.button:hover, div.button.hover {
    background-position: 0 -553px;
}
div.button.focus span, div.button:focus span, div.button:hover span, div.button.hover span {
    background-position: right -673px;
}
div.button.active, div.button:active {
    background-position: 0 -583px;
}
div.button.active span, div.button:active span {
    background-position: right -703px;
    color: #555555;
}
div.button.disabled, div.button:disabled {
    background-position: 0 -613px;
}
div.button.disabled span, div.button:disabled span {
    background-position: right -733px;
    color: #BBBBBB;
    cursor: default;
}
div.button {
    height: 30px;
}
div.button span {
    font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
    font-size: 12px;
    font-weight: bold;
    height: 22px;
    letter-spacing: 1px;
    margin-left: 13px;
    padding-left: 2px;
    padding-right: 15px;
    padding-top: 8px;
    text-transform: uppercase;
}
div.selector {
    font-size: 12px;
    width: 190px;
}
div.selector select {
    border: 1px solid #FFFFFF;
    font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
    font-size: 12px;
    min-width: 190px;
}
div.selector span {
    cursor: pointer;
    padding: 0 25px 0 2px;
}
div.selector span {
    color: #666666;
    text-shadow: 0 1px 0 #FFFFFF;
    width: 158px;
}
div.selector.disabled span {
    color: #BBBBBB;
}
div.checker {
}
div.radio {
    margin-right: 3px;
}
div.uploader {
    cursor: pointer;
    width: 190px;
}
div.uploader span.action {
    background-color: #FFFFFF;
    font-size: 11px;
    font-weight: bold;
    text-align: center;
    text-shadow: 0 1px 0 #FFFFFF;
    width: 85px;
}
div.uploader span.filename {
    border-right: 1px solid #BBBBBB;
    color: #777777;
    font-size: 11px;
    width: 82px;
}
div.uploader input {
    width: 190px;
}
div.uploader.disabled span.action {
    color: #AAAAAA;
}
div.uploader.disabled span.filename {
    border-color: #DDDDDD;
    color: #AAAAAA;
}
.selector, .checker, .button, .radio, .uploader {
    display: inline-block;
    vertical-align: middle;
}
.selector select:focus, .radio input:focus, .checker input:focus, .uploader input:focus {
    outline: 0 none;
}
div.button a, div.button button, div.button input {
    position: absolute;
}
div.button {
    cursor: pointer;
    position: relative;
}
div.button span {
    display: inline-block;
    line-height: 1;
    text-align: center;
}
div.selector {
    overflow: hidden;
    padding-left: 10px;
    position: relative;
}
div.selector span {
    display: block;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}
div.selector select {
    background: none repeat scroll 0 0 rgba(0, 0, 0, 0);
    border: medium none;
    height: 25px;
    opacity: 0;
    position: absolute;
}
div.checker {
    position: relative;
}
div.checker span {
    display: inline-block;
    text-align: center;
}
div.checker input {
    background: none repeat scroll 0 0 rgba(0, 0, 0, 0);
    display: inline-block;
    opacity: 0;
}
div.radio {
    position: relative;
}
div.radio span {
    display: inline-block;
    text-align: center;
}
div.radio input {
    background: none repeat scroll 0 0 rgba(0, 0, 0, 0);
    display: inline-block;
    opacity: 0;
    text-align: center;
}
div.uploader {
    cursor: default;
    overflow: hidden;
    position: relative;
}
div.uploader span.action {
    cursor: pointer;
    display: inline;
    float: left;
    overflow: hidden;
    padding: 2px 0;
}
div.uploader span.filename {
    cursor: default;
    display: block;
    float: left;
    overflow: hidden;
    padding: 0 10px;
    text-overflow: ellipsis;
    white-space: nowrap;
}
div.uploader input {
    border: medium none;
    bottom: 0;
    cursor: default;
    float: right;
    height: 25px;
    opacity: 0;
    position: absolute;
    right: 0;
    top: 0;
}
#fancybox-loading {
    background: url("/slidetabs/wp-content/themes/slidetabs/images/spinner.gif") no-repeat scroll 50% 50% #FFFFFF;
    border: 1px solid #E9E9E9;
    border-radius: 7px;
    cursor: pointer;
    display: none;
    height: 116px;
    left: 50%;
    margin-left: -58px;
    margin-top: -58px;
    position: fixed;
    top: 50%;
    width: 116px;
    z-index: 1104;
}
#fancybox-overlay {
    display: none;
    left: 0;
    position: absolute;
    top: 0;
    width: 100%;
    z-index: 1100;
}
#fancybox-tmp {
    border: 0 none;
    display: none;
    margin: 0;
    overflow: auto;
    padding: 0;
}
#fancybox-wrap {
    display: none;
    left: 0;
    outline: medium none;
    padding: 20px;
    position: absolute;
    top: 0;
    z-index: 1101;
}
#fancybox-outer {
    background: none repeat scroll 0 0 #FFFFFF;
    border-radius: 7px;
    box-shadow: 0 0 19px rgba(0, 0, 0, 0.4);
    height: 100%;
    position: relative;
    width: 100%;
}
#fancybox-content {
    background: none repeat scroll 0 0 #FFFFFF;
    border: 0 solid #FFFFFF;
    border-radius: 5px;
    height: 0;
    outline: medium none;
    overflow: hidden;
    padding: 0;
    position: relative;
    width: 0;
    z-index: 1102;
}
#fancybox-hide-sel-frame {
    background: none repeat scroll 0 0 rgba(0, 0, 0, 0);
    height: 100%;
    left: 0;
    position: absolute;
    top: 0;
    width: 100%;
    z-index: 1101;
}
#fancybox-close {
    background: url("/slidetabs/wp-content/themes/slidetabs/js/fancybox/images/fancy_close.png") repeat scroll 0 0 rgba(0, 0, 0, 0);
    cursor: pointer;
    display: none;
    height: 37px;
    position: absolute;
    right: -15px;
    top: -14px;
    width: 34px;
    z-index: 1103;
}
#fancybox-error {
    color: #444444;
    font: 12px/20px Arial;
    margin: 0;
    padding: 14px;
}
#fancybox-img {
    border: medium none;
    height: 100%;
    line-height: 0;
    margin: 0;
    outline: medium none;
    padding: 0;
    vertical-align: top;
    width: 100%;
}
#fancybox-frame {
    border: medium none;
    display: block;
    height: 100%;
    width: 100%;
}
#fancybox-left, #fancybox-right {
    background: none repeat scroll 0 0 rgba(0, 0, 0, 0);
    bottom: 0;
    cursor: pointer;
    display: none;
    height: 100%;
    outline: medium none;
    position: absolute;
    width: 35%;
    z-index: 1102;
}
#fancybox-left {
    left: 0;
}
#fancybox-right {
    right: 0;
}
#fancybox-left-ico, #fancybox-right-ico {
    background-image: url("/slidetabs/wp-content/themes/slidetabs/js/fancybox/images/fancybox_arrow_btns.png");
    cursor: pointer;
    display: block;
    height: 38px;
    left: -9999px;
    margin-top: -15px;
    position: absolute;
    top: 50%;
    width: 34px;
    z-index: 1102;
}
#fancybox-left-ico {
    background-position: 0 0;
}
#fancybox-right-ico {
    background-position: -35px 0;
}
#fancybox-left:hover, #fancybox-right:hover {
    visibility: visible;
}
#fancybox-left:hover span {
    left: 20px;
}
#fancybox-right:hover span {
    left: auto;
    right: 20px;
}
.fancybox-bg {
    border: 0 none;
    height: 20px;
    margin: 0;
    padding: 0;
    position: absolute;
    width: 20px;
    z-index: 1001;
}
#fancybox-bg-n {
    background-image: url("/slidetabs/wp-content/themes/slidetabs/js/fancybox/images/fancybox-x.png");
    left: 0;
    top: -20px;
    width: 100%;
}
#fancybox-bg-ne {
    background-image: url("/slidetabs/wp-content/themes/slidetabs/js/fancybox/images/fancybox.png");
    background-position: -40px -162px;
    right: -20px;
    top: -20px;
}
#fancybox-bg-e {
    background-image: url("/slidetabs/wp-content/themes/slidetabs/js/fancybox/images/fancybox-y.png");
    background-position: -20px 0;
    height: 100%;
    right: -20px;
    top: 0;
}
#fancybox-bg-se {
    background-image: url("/slidetabs/wp-content/themes/slidetabs/js/fancybox/images/fancybox.png");
    background-position: -40px -182px;
    bottom: -20px;
    right: -20px;
}
#fancybox-bg-s {
    background-image: url("/slidetabs/wp-content/themes/slidetabs/js/fancybox/images/fancybox-x.png");
    background-position: 0 -20px;
    bottom: -20px;
    left: 0;
    width: 100%;
}
#fancybox-bg-sw {
    background-image: url("/slidetabs/wp-content/themes/slidetabs/js/fancybox/images/fancybox.png");
    background-position: -40px -142px;
    bottom: -20px;
    left: -20px;
}
#fancybox-bg-w {
    background-image: url("/slidetabs/wp-content/themes/slidetabs/js/fancybox/images/fancybox-y.png");
    height: 100%;
    left: -20px;
    top: 0;
}
#fancybox-bg-nw {
    background-image: url("/slidetabs/wp-content/themes/slidetabs/js/fancybox/images/fancybox.png");
    background-position: -40px -122px;
    left: -20px;
    top: -20px;
}
#fancybox-title {
    font-family: Helvetica;
    font-size: 12px;
    z-index: 1102;
}
.fancybox-title-inside {
    background: none repeat scroll 0 0 #FFFFFF;
    color: #333333;
    padding-bottom: 10px;
    position: relative;
    text-align: center;
}
.fancybox-title-outside {
    color: #FFFFFF;
    padding-top: 10px;
}
.fancybox-title-over {
    bottom: 0;
    color: #FFFFFF;
    left: 0;
    position: absolute;
    text-align: left;
}
#fancybox-title-over {
    display: block;
    padding: 10px;
}
.fancybox-title-float {
    bottom: -20px;
    height: 32px;
    left: 0;
    position: absolute;
}
#fancybox-title-float-wrap {
    border: medium none;
    border-collapse: collapse;
    width: auto;
}
#fancybox-title-float-wrap td {
    border: medium none;
    white-space: nowrap;
}
#fancybox-title-float-left {
    padding: 0 0 0 15px;
}
#fancybox-title-float-main {
    color: #FFFFFF;
    font-weight: bold;
    line-height: 29px;
    padding: 0 0 3px;
}
#fancybox-title-float-right {
    padding: 0 0 0 15px;
}
div#demo div.clean_rounded.st_webkit > div.st_tabs a.st_prev, div#demo div.clean_rounded.st_webkit > div.st_tabs a.st_next, div#demo div.st_webkit #st_spinner {
}
div#demo div.st_webkit div.st_tabs_wrap, div#demo div.st_webkit div.st_view {
}
div#demo div.contrast-vertical.align_left.st_webkit > div.st_tabs {
    margin-right: -2px !important;
}
div#demo div.contrast-vertical.align_right.st_webkit > div.st_tabs {
    background: url("/slidetabs/wp-content/themes/slidetabs/images/webkit_border_left.png") repeat-y scroll 0 0 #FAFAFA !important;
    margin-left: -2px !important;
}
div#external_linking {
    width: 100%;
}
div#external_links {
    height: 65px;
    padding-top: 5px;
    width: 100%;
}
div#external_links p {
    display: inline-block;
}
div#external_links p.right {
    float: right;
}
div#external_links p span.alt {
    display: none;
}
div#external_links a, div#demo div.separated_3 > div.st_views div.st_view a.st_ext {
    border-radius: 3px;
    display: inline-block;
    line-height: 12px;
    margin-left: 7px;
    padding: 8px 10px;
}
div#demo div.separated_3-horizontal > div.st_tabs ul li a {
    padding-left: 34px;
    padding-right: 34px;
}
div#intro_text {
    padding: 23px 0 25px;
    position: relative;
    text-align: center;
    width: 100%;
}
div#intro_text h1 {
    display: block;
    font: 27px/28px Roboto,Georgia,"Times New Roman",Times,serif;
    letter-spacing: -1px;
}
div#intro_text h2 {
    color: #6F6F6F;
    font-size: 17px;
    margin-top: 10px;
}
div#intro_text h1 span, div#intro_text h2 span {
    color: #434343;
}
div#intro_text h1 em {
    font-style: normal;
}
div#examples {
    margin-top: 31px;
    position: relative;
}
div#examples div.spinner {
    background: url("/slidetabs/wp-content/themes/slidetabs/images/spinner.gif") no-repeat scroll 50% 50% #FFFFFF;
    border: 1px solid #D9D9D9;
    border-radius: 7px;
    display: none;
    height: 66px;
    left: 50%;
    margin: -59px 0 0 -59px;
    padding: 25px;
    position: absolute;
    top: 50%;
    width: 66px;
}
span#st_spinner {
    background: url("/slidetabs/wp-content/themes/slidetabs/images/spinner.gif") no-repeat scroll 50% 50% #FFFFFF;
    border: 1px solid #E3E3E3;
    border-radius: 7px;
    height: 66px;
    left: 50%;
    margin: -38px 0 0 -59px;
    padding: 25px;
    position: absolute;
    text-indent: -999em;
    top: 50%;
    width: 66px;
    z-index: 1000;
}
div#demo_controls {
    height: 65px;
    position: relative;
    width: 100%;
    z-index: 1000;
}
div#demo_controls h2 {
    display: block;
}
div#demo_controls h2#examples_btn {
    cursor: pointer;
}
div#demo_controls h2 a {
    color: #3F3F3F;
    display: block;
    float: left;
    font-size: 19px;
    padding-top: 8px;
}
div#demo_controls h2 a:hover {
    color: #939393;
    text-decoration: none;
}
div#demo_controls h2 span {
    background: url("/slidetabs/wp-content/themes/slidetabs/images/sprite.png") no-repeat scroll 14px -118px rgba(0, 0, 0, 0);
    border-left: 1px dotted #BCBCBC;
    display: block;
    float: left;
    height: 37px;
    margin-left: 13px;
    width: 50px;
}
div#demo_controls ul.demo_btns {
    border-bottom-left-radius: 3px;
    border-bottom-right-radius: 3px;
    float: right;
    position: relative;
}
div#demo_controls ul.demo_btns li {
    float: left;
}
div#demo_controls ul.demo_btns li a {
    -moz-border-bottom-colors: none;
    -moz-border-left-colors: none;
    -moz-border-right-colors: none;
    -moz-border-top-colors: none;
    background-color: #FFFFFF;
    background-image: url("/slidetabs/wp-content/themes/slidetabs/images/sprite.png");
    background-repeat: no-repeat;
    border-color: #CCCCCC #C3C3C3 #ACACAC #CCCCCC;
    border-image: none;
    border-left: 1px solid #CCCCCC;
    border-style: solid none solid solid;
    border-width: 1px 0 1px 1px;
    display: block;
    height: 34px;
    text-indent: -999em;
    width: 34px;
}
div#demo_controls ul.demo_btns li a#add_tab_btn {
    background-position: 0 -657px;
    border-bottom-left-radius: 3px;
    border-top-left-radius: 3px;
}
div#demo_controls ul.demo_btns li a#remove_tab_btn {
    background-position: 0 -694px;
}
div#demo_controls ul.demo_btns li a#settings_btn {
    background-position: 0 -731px;
    border-bottom-right-radius: 3px;
    border-right: 1px solid #C3C3C3;
    border-top-right-radius: 3px;
}
div#demo_controls ul.demo_btns li a.btn_disabled {
    cursor: default;
    opacity: 0.5;
}
div#demo_btns_overlay {
    background: none repeat scroll 0 0 #F7F7F7;
    display: none;
    height: 38px;
    left: -1px;
    opacity: 0.4;
    position: absolute;
    top: 0;
    width: 71px;
}
div#btn_tooltip {
    color: #FFFFFF;
    display: none;
    font-size: 11px;
    line-height: normal;
    max-width: 100px;
    opacity: 0.85;
    position: absolute;
    text-align: center;
    z-index: 10000;
}
div#btn_tooltip p {
    background-color: #000000;
    border-radius: 2px;
    padding: 8px;
}
div#btn_tooltip div.tt_arrow {
    border-left: 5px solid rgba(0, 0, 0, 0);
    border-right: 5px solid rgba(0, 0, 0, 0);
    border-top: 5px solid #000000;
    height: 0;
    margin: 0 auto;
    width: 0;
}
div#demo_controls div.arrow_border, div#demo_controls div.arrow {
    height: 0;
    position: absolute;
    width: 0;
}
div#demo_controls ul#demo_dropdown div.arrow_border, div#demo_controls ul#demo_dropdown div.arrow {
    left: 10px;
}
div#demo_controls div.arrow_border {
    -moz-border-bottom-colors: none;
    -moz-border-left-colors: none;
    -moz-border-right-colors: none;
    -moz-border-top-colors: none;
    border-color: rgba(0, 0, 0, 0) rgba(0, 0, 0, 0) #999999;
    border-image: none;
    border-style: outset outset solid;
    border-width: 8px;
    right: 10px;
    top: -15px;
}
div#demo_controls div.arrow {
    -moz-border-bottom-colors: none;
    -moz-border-left-colors: none;
    -moz-border-right-colors: none;
    -moz-border-top-colors: none;
    border-color: rgba(0, 0, 0, 0) rgba(0, 0, 0, 0) #FAFAFA;
    border-image: none;
    border-style: outset outset solid;
    border-width: 8px;
    right: 10px;
    top: -14px;
}
ul#demo_dropdown, ul#demo_settings {
    border-radius: 3px;
    box-shadow: 0 0 4px rgba(0, 0, 0, 0.11);
    display: none;
    position: absolute;
    z-index: 1011;
}
ul#demo_dropdown {
    left: 0;
    top: 41px;
    width: 230px;
}
ul#demo_dropdown li a {
    -moz-border-bottom-colors: none;
    -moz-border-left-colors: none;
    -moz-border-right-colors: none;
    -moz-border-top-colors: none;
    background: none repeat scroll 0 0 #FFFFFF;
    border-color: #E1E1E1 #D2D2D2 -moz-use-text-color;
    border-image: none;
    border-style: solid solid none;
    border-width: 1px 1px 0;
    color: #707070;
    display: block;
    padding: 11px 0 11px 16px;
}
ul#demo_dropdown li a:hover, ul#demo_dropdown li a.selected {
    background: none repeat scroll 0 0 #FAFAFA;
    color: #333333;
    text-decoration: none;
}
ul#demo_dropdown li a.selected {
    font-weight: bold;
}
ul#demo_dropdown li a.disabled, ul#demo_dropdown li a.disabled em {
    color: #AAAAAA;
    cursor: text;
}
ul#demo_dropdown li a.disabled:hover {
    background: none repeat scroll 0 0 #FFFFFF;
}
ul#demo_dropdown li a.disabled em {
    font-style: italic;
}
ul#demo_dropdown li a.first, ul#demo_settings li.first {
    border-top-color: #D2D2D2;
    border-top-left-radius: 3px;
    border-top-right-radius: 3px;
}
ul#demo_dropdown li a.selected {
    background: url("/slidetabs/wp-content/themes/slidetabs/images/sprite.png") no-repeat scroll 198px -142px #FAFAFA;
}
ul#demo_dropdown li a.last, ul#demo_settings li.last {
    border-bottom: 1px solid #313131;
    border-bottom-left-radius: 3px;
    border-bottom-right-radius: 3px;
}
ul#demo_settings {
    right: 0;
    top: 39px;
    width: 233px;
}
ul#demo_settings li {
    -moz-border-bottom-colors: none;
    -moz-border-left-colors: none;
    -moz-border-right-colors: none;
    -moz-border-top-colors: none;
    background: none repeat scroll 0 0 #FFFFFF;
    border-color: #E3E3E3 #D2D2D2 -moz-use-text-color;
    border-image: none;
    border-left: 1px solid #D2D2D2;
    border-right: 1px solid #D2D2D2;
    border-style: solid solid none;
    border-width: 1px 1px 0;
    float: left;
    padding: 9px 16px 7px;
    width: 199px;
}
ul#demo_settings li.first, ul#demo_settings li.header, ul#demo_settings li.last {
    padding: 11px 16px 10px;
}
ul#demo_settings li.header {
    background: none repeat scroll 0 0 #FAFAFA;
    box-shadow: none;
    padding: 13px 16px 12px;
}
ul#demo_settings li.header span {
    color: #828282;
    display: inline-block;
    font-family: Georgia,"Times New Roman",Times,serif;
    font-style: italic;
    padding-left: 5px;
    padding-top: 1px;
}
ul#demo_settings li.header span a {
    text-decoration: underline;
}
ul#demo_settings li ul {
    float: left;
    padding-bottom: 3px;
}
ul#demo_settings li ul li {
    border: 0 none;
    float: left;
    margin-right: 12px;
    padding: 0;
    width: auto;
}
ul#demo_settings label {
    cursor: pointer;
    display: block;
    float: left;
    line-height: 14px;
}
ul#demo_settings label em {
    font-style: normal;
    padding-left: 2px;
}
ul#demo_settings input {
    cursor: pointer;
    float: left;
    margin: 0;
    padding: 0;
}
ul#demo_settings select {
    border: 1px solid #CCCCCC;
    border-radius: 3px;
    margin-bottom: 4px;
    padding: 2px;
    width: 198px;
}
ul#demo_settings div.selector {
    margin-bottom: 6px;
}
ul#demo_settings h2 {
    float: left;
    font-size: 13px;
    font-weight: bold;
}
ul#demo_settings h3 {
    clear: both;
    color: #585858;
    font-size: 12px;
    font-weight: normal;
    padding-bottom: 5px;
}
ul#demo_settings a#settings_save_btn {
    border-radius: 5px;
    display: block;
    font-weight: bold;
    margin: 4px 0 5px;
    padding: 6px 0;
    text-align: center;
    width: 197px;
}
body.is_touch #demo_dropdown, body.is_touch #demo_settings {
}
div#demo {
    height: 469px;
    width: 100%;
}
div#demo.hide {
    visibility: hidden;
}
div.separated_2-horizontal a.st_prev, div.separated_2-horizontal a.st_next {
    display: none !important;
}
div.separated_2-horizontal.st_sliding_active div.st_tabs_wrap {
    margin: 0 !important;
}
div#slidetabs_262 > div.st_tabs ul li a {
    background: -moz-linear-gradient(center top , #FFFFFF, #FCFCFC) repeat scroll 0 0 rgba(0, 0, 0, 0);
    color: #676767;
    padding: 0 30px;
}
div#slidetabs_262 > div.st_tabs ul li a.st_tab_active {
    background: none repeat scroll 0 0 #F3F3F3;
    color: #000000;
    padding-bottom: 2px;
}
div#slidetabs_262 > div.st_views {
    height: auto;
}
div#slidetabs_262 > div.st_views div.st_view_inner {
    padding: 0;
}
div#slidetabs_262 div.separated_2-horizontal div.st_tabs {
    background: -moz-linear-gradient(center top , #F3F3F3, #F1F1F1) repeat scroll 0 0 rgba(0, 0, 0, 0);
    border-radius: 0;
    height: 38px;
    margin-bottom: 0;
    padding: 14px 14px 13px;
    width: auto !important;
}
div#slidetabs_262 div.separated_2-horizontal ul.st_tabs_ul li a {
    border-radius: 4px;
    font: bold 12px/36px Arial,Helvetica,sans-serif;
    height: 36px;
    margin: 0 3px 0 0;
    padding: 0 15px !important;
}
div#slidetabs_262 div.separated_2-horizontal div.st_views {
    border-bottom: 0 none;
    border-left: 0 none;
    border-radius: 0;
    border-right: 0 none;
    height: 340px;
}
div#slidetabs_262 div.separated_2-horizontal div.st_view_inner {
    padding: 27px !important;
}
div#demo div.st_view {
    color: #888888;
    font-size: 12px;
    line-height: 22px;
}
div#demo div.align_left div.st_view, div#demo div.align_right div.st_view {
    line-height: 21px;
}
div#demo div.st_view_inner {
    padding: 33px 35px 35px;
}
div#demo h3 {
    color: #999999;
    font-size: 18px;
    font-weight: bold;
    margin-bottom: 18px;
}
div#demo div.align_left h3, div#demo div.align_right h3 {
    margin-bottom: 18px;
}
div#demo div.st_view p {
    margin-bottom: 20px;
}
div#demo div.clean_rounded-horizontal div.st_view p, div#demo div.spaced-horizontal div.st_view p {
    margin-bottom: 18px;
}
div#demo div.st_view p.last {
    margin-bottom: 0 !important;
}
div#demo div.st_view blockquote {
    background: url("/slidetabs/wp-content/themes/slidetabs/images/home/quotes.gif") no-repeat scroll 0 4px rgba(0, 0, 0, 0);
    color: #AAAAAA;
    float: left;
    font: 16px/24px Helvetica,Arial,sans-serif;
    margin: 9px 10px 0 0;
    padding-left: 40px;
    width: 43%;
}
div#slidetabs_539 div.st_view div.st_view_inner {
    padding: 50px 40px !important;
}
div.contrast-vertical ul.st_tabs_ul li a {
    text-indent: 52px !important;
}
div.contrast-vertical a.st_tab span.st_icon {
    background: url("/slidetabs/wp-content/themes/slidetabs/images/sprite.png") no-repeat scroll 0 0 rgba(0, 0, 0, 0);
    display: block;
    height: 50px;
    left: 0;
    opacity: 0.5;
    position: absolute;
    top: 0;
    width: 50px;
}
div.contrast-vertical a.st_tab:hover span.st_icon, div.contrast-vertical a.st_tab_active span.st_icon {
    opacity: 1;
}
div.contrast-vertical a.st_tab_1 span.st_icon {
    background-position: 16px -301px;
}
div.contrast-vertical a.st_tab_2 span.st_icon {
    background-position: 16px -335px;
}
div.contrast-vertical a.st_tab_3 span.st_icon {
    background-position: 16px -373px;
}
div.contrast-vertical a.st_tab_4 span.st_icon {
    background-position: 16px -408px;
}
div.contrast-vertical a.st_tab_5 span.st_icon {
    background-position: 16px -443px;
}
div#demo div.st_tabs, div#demo div.st_views {
}
div.compact_demo-vertical div.dyn_image {
    height: 100%;
    position: relative;
    width: 100%;
}
div.compact_demo div.dyn_image img {
    float: none !important;
    left: 50%;
    margin: 0 0 0 -438px !important;
    position: absolute;
    top: 0;
}
ul#features_text {
    background: url("/slidetabs/wp-content/themes/slidetabs/images/border_deep.gif") repeat-x scroll 0 bottom rgba(0, 0, 0, 0);
    padding: 3px 0 39px;
    text-align: center;
}
ul#features_text li {
    float: left;
    width: 30%;
}
ul#features_text li.center {
    margin: 0 5%;
}
ul#features_text h2 {
    color: #258ED2;
    font-size: 17px;
    margin-bottom: 10px;
}
div#logo_divider {
    background: url("/slidetabs/wp-content/themes/slidetabs/images/border_deep.gif") repeat-x scroll 0 bottom rgba(0, 0, 0, 0);
    max-width: 100%;
    padding: 23px 0 25px;
}
div#logo_divider img {
    display: block;
}
div#logo_divider ul.logos {
    float: left;
}
div#logo_divider ul.logos li {
    float: left;
    margin-right: 40px;
}
div#logo_divider ul.logos li.last {
    margin-right: 0;
}
div#logo_divider ul.buttons {
    float: right;
    padding-top: 8px;
}
div#logo_divider ul.buttons li {
    float: left;
    margin-right: 0;
    width: 160px;
}
div#logo_divider ul.buttons li.center {
    padding-top: 8px;
    text-align: center;
    width: 32px;
}
div#logo_divider ul.buttons li em {
    display: block;
    font: italic 15px Georgia,"Times New Roman",Times,serif;
}
ul#features_home {
}
ul#features_home li {
    background: url("/slidetabs/wp-content/themes/slidetabs/images/border_deep.gif") repeat-x scroll 0 bottom rgba(0, 0, 0, 0);
    float: left;
    margin: 43px 0 0;
    padding-bottom: 45px;
    width: 100%;
}
ul#features_home li img {
    max-width: 100%;
}
ul#features_home li.right img, ul#features_home li.left div {
    float: left;
}
ul#features_home li.left img, ul#features_home li.right div {
    float: right;
}
ul#features_home li h2 {
    font-size: 18px;
    font-weight: bold;
    margin: 11px 0 8px;
}
ul#features_home li p {
    line-height: 23px;
}
#super_customizable div {
    padding-top: 35px;
    width: 40%;
}
#super_customizable span {
    background: url("/slidetabs/wp-content/themes/slidetabs/images/home/highlight.png") no-repeat scroll 0 0 rgba(0, 0, 0, 0);
    display: block;
    height: 47px;
    position: absolute;
    right: -50px;
    top: 85px;
    width: 144px;
    z-index: 100;
}
#wordpress_integration div {
    padding-top: 13px;
    width: 40%;
}
#seo_friendly div {
    padding-top: 50px;
    width: 45%;
}
#cross_browser_and_device div {
    padding-top: 46px;
    width: 47%;
}
#help_and_support div {
    padding-top: 35px;
    width: 41%;
}
div#features_divider {
    clear: both;
    padding: 48px 0 56px;
    text-align: center;
}
div#features_divider p {
    color: #3F3F3F;
    display: inline-block;
    font: 200 20px Roboto,Georgia,"Times New Roman",Times,serif;
    padding-top: 12px;
    position: relative;
    top: 4px;
}
div#features_divider a {
    display: inline-block !important;
    margin-left: 20px;
}
ul#screens {
    background: url("/slidetabs/wp-content/themes/slidetabs/images/border.gif") repeat-x scroll 0 bottom rgba(0, 0, 0, 0);
    margin-bottom: 40px;
    padding: 15px 0 38px;
}
ul#screens li {
    float: left;
    margin-right: 4.5%;
    position: relative;
    text-align: center;
    width: 21.6%;
}
ul#screens li.last {
    margin-right: 0;
}
ul#screens li a {
    background: none repeat scroll 0 0 #FFFFFF;
    border: 1px solid #D5D5D5;
    border-radius: 5px;
    display: block;
    max-height: 163px;
    overflow: hidden;
}
ul#screens li a img {
    display: block;
    max-width: 100%;
}
ul#screens li a span.screens_icon {
    background: url("/slidetabs/wp-content/themes/slidetabs/images/sprite.png") no-repeat scroll 0 -621px rgba(0, 0, 0, 0);
    display: block;
    height: 35px;
    position: absolute;
    right: 9px;
    text-indent: -99999px;
    top: 123px;
    width: 32px;
}
ul#screens li h2 {
    font-weight: bold;
    margin-bottom: 5px;
    margin-top: 15px;
}
ul#screens li p {
    color: #888888;
}
span.hw_ajax, span.hw_select, span.hw_customize {
    background-color: rgba(0, 0, 0, 0);
    background-image: url("/slidetabs/wp-content/themes/slidetabs/images/sprite_type.png");
    background-repeat: no-repeat;
}
span.hw_ajax {
    background-position: 0 -178px;
    height: 22px;
    right: 101px;
    top: 103px;
    width: 191px;
}
span.hw_select {
    background-position: 0 -135px;
    height: 19px;
    left: -175px;
    top: 166px;
    width: 159px;
}
span.hw_customize {
    background-position: 0 -155px;
    height: 22px;
    right: -213px;
    top: 137px;
    width: 198px;
}
@media screen and (max-width: 940px) {
div#intro_text h1 {
    font-size: 25px;
}
div#intro_text span.hw_ajax {
    display: none;
}
div#intro_text h2 {
    font-size: 16px;
}
div#external_links p.right span {
    display: none;
}
div#demo div.align_left div.st_view, div#demo div.align_right div.st_view {
    line-height: 22px;
}
div#demo div.st_view h3 {
    margin-bottom: 20px;
}
div#demo div.st_view span.hide_1, div#demo div.st_view p.second {
    display: none;
}
div#demo div.clean_rounded-horizontal div.st_view p.second, div#demo div.spaced-horizontal div.st_view p.second {
    display: block;
}
div#demo div.st_view blockquote {
    float: none;
    margin: 0 auto;
    width: 83%;
}
div#logo_divider {
    padding: 20px 10px 31px;
}
div#logo_divider ul.logos li.wordpress {
    margin-right: 0;
}
div#logo_divider ul.logos li.html5, div#logo_divider ul.logos li.css3 {
    display: none;
}
ul#features_home li div {
    padding-top: 16px;
}
#super_customizable img {
    width: 56%;
}
#super_customizable span {
    top: 63px;
}
#wordpress_integration img {
    width: 54%;
}
#wordpress_integration div {
    width: 41%;
}
#seo_friendly img {
    width: 51%;
}
#cross_browser_and_device img {
    width: 47%;
}
#help_and_support img {
    width: 54%;
}
ul#screens li a span.screens_icon {
    top: 93px;
}
}
@media screen and (max-width: 760px) {
ul.top_bar_nav li.first {
    display: none;
}
div#intro_text {
    padding: 10px 0;
}
div#intro_text h1 {
    font-size: 23px;
}
div#intro_text h2 {
    display: none;
}
span.hw_text {
    display: none;
}
div#external_links p span {
    display: none;
}
div#external_links a.first {
    margin-left: 0;
}
div#demo div.st_view .hide_2 {
    display: none;
}
div#demo div.clean_rounded-horizontal div.st_view p.second, div#demo div.spaced-horizontal div.st_view p.second {
    display: none;
}
div#demo div.st_view {
    line-height: 20px !important;
}
div#demo div.st_view_inner {
    padding: 30px;
}
div#demo div.st_view h3 {
    margin-bottom: 16px;
}
div#demo div.clean_rounded-horizontal div.st_view h3, div#demo div.spaced-horizontal div.st_view h3 {
    margin-bottom: 18px;
}
div#demo div.st_view p {
    margin-bottom: 15px;
}
div.contrast-vertical a.st_prev, div.contrast-vertical a.st_next {
    width: 50px !important;
}
div.contrast-vertical div.st_tabs {
    width: 51px !important;
}
div.contrast-vertical ul.st_tabs_ul li a {
    text-indent: -1000em !important;
    width: 50px !important;
}
div.contrast-vertical.align_right a.st_prev, div.contrast-vertical.align_right a.st_next {
    margin-left: -1px !important;
}
div#slidetabs_45 > div.st_tabs ul li a {
    padding-left: 21px !important;
    padding-right: 21px !important;
}
div.clean_rounded-vertical a.st_prev, div.clean_rounded-vertical a.st_next {
    border-left: 0 none !important;
    width: 50px !important;
}
div.clean_rounded-vertical a.st_prev {
    border-right: 1px solid #CCCCCC !important;
    margin-left: 0 !important;
}
div.clean_rounded-vertical div.st_tabs {
    height: 353px !important;
    width: 52px !important;
}
div.clean_rounded-vertical.st_sliding_active div.st_tabs {
    width: 51px !important;
}
div.clean_rounded-vertical ul.st_tabs_ul li a {
    background: url("/slidetabs/wp-content/themes/slidetabs/images/home/tab_dots.gif") no-repeat scroll center 18px #F8F8F8 !important;
    padding: 0 !important;
    text-indent: -1000em !important;
    width: 50px !important;
}
div.clean_rounded-vertical ul.st_tabs_ul a:hover {
    background-color: #FBFBFB !important;
}
div.clean_rounded-vertical ul.st_tabs_ul a.st_tab_active {
    background: url("/slidetabs/wp-content/themes/slidetabs/images/home/tab_dots.gif") no-repeat scroll center -64px #FFFFFF !important;
    padding-right: 1px !important;
}
div.clean_rounded-vertical.align_right ul.st_tabs_ul a.st_tab_active {
    padding-right: 0 !important;
}
div.clean_rounded-vertical div.st_views {
    height: 352px !important;
}
div.clean_rounded-vertical.align_right a.st_next {
    border-top-right-radius: 0 !important;
}
div.clean_rounded-vertical.align_right a.st_prev, div.clean_rounded-vertical.align_right a.st_next {
    border-left: 1px solid #CCCCCC !important;
}
div#logo_divider ul.logos {
    display: none;
}
div#logo_divider ul.buttons {
    float: none;
    margin: 0 auto;
    width: 353px;
}
div#logo_divider ul.buttons li a {
    padding: 13px 22px 15px;
}
div#logo_divider ul.buttons li em {
    margin-top: 2px;
}
ul#features_text {
    padding: 3px 0 7px;
}
ul#features_text li {
    float: none;
    font-size: 14px;
    margin-bottom: 30px !important;
    width: 100%;
}
ul#features_text li.center {
    margin: 0;
}
ul#features_text li strong {
    font-weight: normal;
}
ul#features_home li img {
    display: block;
    float: none !important;
    margin: 0 auto;
    max-width: 100%;
    width: auto;
}
ul#features_home li div {
    width: 100%;
}
#super_customizable span {
    top: 66px;
}
div#features_divider {
    padding: 39px 0 45px;
}
div#features_divider p {
    display: none;
}
div#features_divider a {
    display: inline-block !important;
    font-size: 14px;
    margin-left: 0;
    padding: 12px 28px 14px;
}
ul#screens {
    padding: 8px 0 33px;
}
ul#screens li a {
    position: relative;
}
ul#screens li a span.screens_icon {
    left: 50%;
    margin: -12px 0 0 -12px;
    top: 50%;
}
ul#screens li p {
    display: none;
}
}
@media screen and (max-width: 480px) {
ul.top_bar_nav li.last {
    display: none;
}
div#intro_text {
    padding: 0;
}
div#intro_text h1 {
    font-size: 20px;
    line-height: 28px;
}
div#demo_controls h2 a {
    font-size: 18px;
}
div#external_links a {
    margin-left: 8px;
}
div#external_links p.right {
    display: none;
}
div#demo div.separated_3-horizontal > div.st_tabs ul li a {
    padding-left: 22px;
    padding-right: 22px;
}
div#demo div.st_view p.second, div#demo div.clean_rounded-horizontal div.st_view p.second, div#demo div.spaced-horizontal div.st_view p.second {
    display: inline;
}
div#demo div.st_view .hide_3, div#demo div.st_view p.last {
    display: none;
}
div#demo div.st_view blockquote {
    margin: 0;
    width: 79%;
}
div#slidetabs_45 > div.st_tabs ul li a {
    padding-left: 14px !important;
    padding-right: 14px !important;
}
div.spaced-horizontal ul.st_tabs_ul li a {
    padding-left: 17px !important;
    padding-right: 17px !important;
}
div#logo_divider {
    padding: 20px 0 31px;
}
div#logo_divider ul.buttons {
    width: auto;
}
div#logo_divider ul.buttons li {
    width: 133px;
}
div#logo_divider ul.buttons li a {
    padding: 10px 0 12px;
}
div#logo_divider ul.buttons li a span {
    display: none;
}
div#logo_divider ul.buttons li em {
    margin-top: 0;
}
#super_customizable span {
    display: none;
}
ul#screens li a span.screens_icon {
    margin: -15px 0 0 -15px;
}
}
div.clean_rounded-horizontal {
    clear: both;
    position: relative;
    width: 100%;
}
div.clean_rounded-horizontal > div.st_tabs a.st_prev, div.clean_rounded-horizontal > div.st_tabs a.st_next {
    background: url("/slidetabs/wp-content/plugins/slidetabs/templates/clean_rounded/images/arrows_h.gif") no-repeat scroll 0 0 #FFFFFF;
    border: 1px solid #CCCCCC;
    display: none;
    height: 43px;
    outline: medium none;
    position: absolute;
    text-indent: -999em;
    top: 0;
    width: 43px;
    z-index: 110;
}
div.clean_rounded-horizontal > div.st_tabs a.st_prev {
    background-position: center 15px;
    border-top-left-radius: 5px;
    left: 0;
}
div.clean_rounded-horizontal > div.st_tabs a.st_prev:hover {
    background-color: #F8F8F8;
    background-position: center -45px;
}
div.clean_rounded-horizontal > div.st_tabs a.st_next {
    background-position: center -15px;
    border-top-right-radius: 5px;
    right: 0;
}
div.clean_rounded-horizontal > div.st_tabs a.st_next:hover {
    background-color: #F8F8F8;
    background-position: center -75px;
}
div.clean_rounded-horizontal > div.st_tabs a.st_prev.st_btn_disabled, div.clean_rounded-horizontal > div.st_tabs a.st_next.st_btn_disabled {
    background-color: #F8F8F8;
    cursor: default;
}
div.clean_rounded-horizontal > div.st_tabs a.st_prev.st_btn_disabled {
    background-position: center -105px;
}
div.clean_rounded-horizontal > div.st_tabs a.st_next.st_btn_disabled {
    background-position: center -135px;
}
div.clean_rounded-horizontal > div.st_tabs {
    height: 45px;
    margin-bottom: -1px;
    overflow: hidden;
    position: relative;
    width: 100% !important;
    z-index: 100;
}
div.clean_rounded-horizontal.st_sliding_active > div.st_tabs {
    border-top-left-radius: 5px;
    border-top-right-radius: 5px;
    overflow: visible;
}
div.clean_rounded-horizontal > div.st_tabs div.st_tabs_wrap {
    position: relative !important;
    width: 100%;
}
div.clean_rounded-horizontal.st_sliding_active > div.st_tabs div.st_tabs_wrap {
    margin: 0 44px;
    width: auto !important;
}
div.clean_rounded-horizontal > div.st_tabs ul {
    list-style: none outside none;
    margin: 0;
    padding: 0;
    width: 10000px;
}
div.clean_rounded-horizontal > div.st_tabs ul li {
    display: block;
    float: left;
    margin: 0;
}
div.clean_rounded-horizontal > div.st_tabs ul li a {
    background: -moz-linear-gradient(center top , #FBFBFB, #F8F8F8) repeat scroll 0 0 rgba(0, 0, 0, 0);
    border-right: 1px solid #CCCCCC;
    border-top: 1px solid #CCCCCC;
    border-bottom : 1px solid #CCCCCC;
    color: #6A6A6A;
    display: block;
    font: bold 12px/43px Arial,Helvetica,sans-serif;
    height: 43px;
    margin: 0;
    outline: medium none;
    padding: 0 28px;
    text-decoration: none;
}
div.clean_rounded-horizontal > div.st_tabs ul li a:hover {
    background: none repeat scroll 0 0 #FBFBFB;
    color: #333333;
}
div.clean_rounded-horizontal > div.st_tabs ul li a.st_tab_first {
    border-left: 1px solid #CCCCCC;
    border-top-left-radius: 5px;
}
div.clean_rounded-horizontal.st_sliding_active > div.st_tabs ul li a.st_tab_first {
    border-left: 0 none;
    border-top-left-radius: 0;
}
div.clean_rounded-horizontal > div.st_tabs ul li a.st_tab_last {
    border-top-right-radius: 5px;
}
div.clean_rounded-horizontal.st_sliding_active > div.st_tabs ul li a.st_tab_last {
    border-right: 0 none;
    border-top-right-radius: 0;
}
div.clean_rounded-horizontal > div.st_tabs ul li a.st_tab_active {
    background: none repeat scroll 0 0 #FFFFFF;
    color: #1CA5EC;
    padding-bottom: 2px;
}
div.clean_rounded-horizontal > div.st_views {
    background-color: #FFFFFF;
    border: 1px solid #CCCCCC;
    border-bottom-left-radius: 5px;
    border-bottom-right-radius: 5px;
    border-top-right-radius: 5px;
    height: 390px;
    line-height: 19px;
    overflow: hidden;
    padding: 0 !important;
    position: relative;
}
div.clean_rounded-horizontal.st_sliding_active > div.st_views {
    border-top-right-radius: 0;
}
div.clean_rounded-horizontal > div.st_views div.st_view {
    -moz-box-sizing: border-box;
    background-color: rgba(0, 0, 0, 0) !important;
    background-image: none;
    background-position: center center !important;
    background-repeat: no-repeat !important;
    height: 100%;
    overflow: hidden;
    width: 100%;
    z-index: 5;
}
div.clean_rounded-horizontal > div.st_views div.st_view_inner {
    padding: 30px;
}
div.clean_rounded-horizontal > div.st_views div.st_view_first {
    display: block;
}
div.clean_rounded-horizontal.align_bottom {
    margin-bottom: 44px;
}
div.clean_rounded-horizontal.align_bottom > div.st_tabs a.st_prev {
    border-bottom-left-radius: 5px;
}
div.clean_rounded-horizontal.align_bottom > div.st_tabs a.st_next {
    border-bottom-right-radius: 5px;
}
div.clean_rounded-horizontal.align_bottom > div.st_tabs a.st_prev, div.clean_rounded-horizontal.align_bottom > div.st_tabs a.st_next, div.clean_rounded-horizontal.align_bottom.st_sliding_active > div.st_tabs, div.clean_rounded-horizontal.align_bottom > div.st_tabs div.st_views {
    border-top-left-radius: 0;
    border-top-right-radius: 0;
}
div.clean_rounded-horizontal.align_bottom > div.st_tabs a.st_prev {
    border-bottom-left-radius: 5px;
}
div.clean_rounded-horizontal.align_bottom > div.st_tabs {
    bottom: -44px;
    left: 0;
    margin-bottom: 0;
    position: absolute;
}
div.clean_rounded-horizontal.align_bottom.st_sliding_active > div.st_tabs {
    border-bottom-left-radius: 5px;
    border-bottom-right-radius: 5px;
    border-top: 0 none;
}
div.clean_rounded-horizontal.align_bottom > div.st_tabs ul li a {
    border-bottom: 1px solid #CCCCCC;
}
div.clean_rounded-horizontal.align_bottom > div.st_tabs ul li a.st_tab_first {
    border-bottom-left-radius: 5px;
    border-top-left-radius: 0;
}
div.clean_rounded-horizontal.align_bottom.st_sliding_active > div.st_tabs ul li a.st_tab_first {
    border-bottom-left-radius: 0;
}
div.clean_rounded-horizontal.align_bottom > div.st_tabs ul li a.st_tab_active {
    border-top-color: #FFFFFF;
    padding-bottom: 0;
}
div.clean_rounded-horizontal.align_bottom > div.st_tabs ul li a.st_tab_last {
    border-bottom-right-radius: 5px;
    border-top-right-radius: 0;
}
div.clean_rounded-horizontal.align_bottom.st_sliding_active > div.st_tabs ul li a.st_tab_last {
    border-bottom-right-radius: 0;
}
div.clean_rounded-horizontal.align_bottom > div.st_views {
    border-bottom-left-radius: 0;
    border-top-left-radius: 5px;
    border-top-right-radius: 5px;
}
div.clean_rounded-horizontal.align_bottom.st_sliding_active > div.st_views {
    border-bottom-right-radius: 0;
}
div.clean_rounded-vertical {
    clear: both;
    position: relative;
    width: 100%;
}
div.clean_rounded-vertical > div.st_tabs a.st_prev, div.clean_rounded-vertical > div.st_tabs a.st_next {
    -moz-border-bottom-colors: none;
    -moz-border-left-colors: none;
    -moz-border-right-colors: none;
    -moz-border-top-colors: none;
    background: url("/slidetabs/wp-content/plugins/slidetabs/templates/clean_rounded/images/arrows_v.gif") no-repeat scroll 0 0 #FFFFFF;
    border-color: -moz-use-text-color #CCCCCC #CCCCCC;
    border-image: none;
    border-right: 1px solid #CCCCCC;
    border-style: none solid solid;
    border-width: 0 1px 1px;
    display: none;
    float: left;
    height: 32px;
    outline: medium none;
    position: relative;
    text-indent: -999em;
    width: 95px;
    z-index: 100;
}
div.clean_rounded-vertical > div.st_tabs a.st_prev {
    background-position: center 12px;
    border-right: 0 none;
    border-top-left-radius: 5px;
    margin-left: -1px;
}
div.clean_rounded-vertical > div.st_tabs a.st_prev:hover {
    background-color: #F5F5F5;
    background-position: center -52px;
}
div.clean_rounded-vertical > div.st_tabs a.st_next {
    background-position: center -20px;
}
div.clean_rounded-vertical > div.st_tabs a.st_next:hover {
    background-color: #F5F5F5;
    background-position: center -84px;
}
div.clean_rounded-vertical > div.st_tabs a.st_prev.st_btn_disabled, div.clean_rounded-vertical > div.st_tabs a.st_next.st_btn_disabled {
    background-color: #F7F7F7;
    cursor: default;
}
div.clean_rounded-vertical > div.st_tabs a.st_prev.st_btn_disabled {
    background-position: center -116px;
}
div.clean_rounded-vertical > div.st_tabs a.st_next.st_btn_disabled {
    background-position: center -148px;
}
div.clean_rounded-vertical > div.st_tabs {
    border-bottom-left-radius: 5px;
    border-top: 1px solid #CCCCCC;
    border-top-left-radius: 5px;
    float: left;
    height: 378px;
    margin-right: -1px;
    overflow: hidden;
    position: relative;
    width: 193px;
    z-index: 100;
}
div.clean_rounded-vertical.st_sliding_active > div.st_tabs {
    border-left: 1px solid #CCCCCC;
    width: 192px;
}
div.clean_rounded-vertical > div.st_tabs div.st_tabs_wrap {
    clear: both;
    float: left;
    position: relative !important;
}
div.clean_rounded-vertical.st_sliding_active > div.st_tabs div.st_tabs_wrap {
    margin-left: -1px;
}
div.clean_rounded-vertical > div.st_tabs ul {
    float: left;
    list-style: none outside none;
    margin: 0;
    padding: 0;
}
div.clean_rounded-vertical > div.st_tabs ul li {
    clear: both;
    float: left;
    margin: 0;
    position: relative;
}
div.clean_rounded-vertical > div.st_tabs ul li a {
    background-color: #F8F8F8;
    background-image: -moz-linear-gradient(center top , #F9F9F9, #F4F4F4);
    border-bottom: 1px solid #CCCCCC;
    border-left: 1px solid #CCCCCC;
    border-right: 1px solid #CCCCCC;
    color: #5C5C5C;
    display: block;
    font: bold 12px/18px Arial,Helvetica,sans-serif;
    height: 40px;
    margin: 0;
    outline: medium none;
    padding: 14px 0 14px 20px;
    text-decoration: none;
    width: 171px;
}
div.clean_rounded-vertical > div.st_tabs ul li a:hover {
    background: none repeat scroll 0 0 #FBFBFB;
    color: #333333;
}
div.clean_rounded-vertical > div.st_tabs ul li a.st_tab_first {
    border-top-left-radius: 5px;
}
div.clean_rounded-vertical.st_sliding_active > div.st_tabs ul li a.st_tab_first {
    border-top-left-radius: 0;
}
div.clean_rounded-vertical > div.st_tabs ul li a.st_tab_last {
    border-bottom-left-radius: 5px;
}
div.clean_rounded-vertical > div.st_tabs ul li a.st_tab_active {
    background: none repeat scroll 0 0 #FFFFFF;
    color: #1CA5EC;
    padding-right: 2px;
    position: relative;
    z-index: 10;
}
div.clean_rounded-vertical > div.st_tabs ul li a span {
    clear: both;
    color: #838383;
    display: block;
    font-size: 11px;
    font-weight: normal;
    padding-top: 3px;
}
div.clean_rounded-vertical > div.st_views {
    background-color: #FFFFFF;
    border: 1px solid #CCCCCC;
    border-bottom-left-radius: 5px;
    border-bottom-right-radius: 5px;
    border-top-right-radius: 5px;
    height: 377px;
    line-height: 18px;
    overflow: hidden;
    position: relative;
    z-index: 5;
}
div.clean_rounded-vertical.st_sliding_active > div.st_views {
    border-bottom-left-radius: 0;
}
div.clean_rounded-vertical > div.st_views div.st_view {
    background-color: rgba(0, 0, 0, 0) !important;
    background-image: none;
    background-position: center center !important;
    background-repeat: no-repeat !important;
    height: 100%;
    overflow: hidden;
    width: 100%;
}
div.clean_rounded-vertical > div.st_views div.st_view_inner {
    overflow: hidden !important;
    padding: 30px;
}
div.clean_rounded-vertical > div.st_views div.st_view_first {
    display: block;
}
div.clean_rounded-vertical.align_right > div.st_tabs a.st_prev {
    border-top-left-radius: 0;
    margin-left: 0;
}
div.clean_rounded-vertical.align_right > div.st_tabs a.st_next {
    border-top-right-radius: 5px;
    margin-right: -1px;
}
div.clean_rounded-vertical.align_right > div.st_tabs {
    border-radius: 0 5px 5px 0;
    float: right;
    margin-left: -1px;
    margin-right: 0;
}
div.clean_rounded-vertical.align_right.st_sliding_active > div.st_tabs {
    border-left: 0 none;
    border-right: 1px solid #CCCCCC;
}
div.clean_rounded-vertical.align_right.st_sliding_active > div.st_tabs div.st_tabs_wrap {
    margin-left: 0;
}
div.clean_rounded-vertical.align_right > div.st_tabs ul li a {
    border-right: 1px solid #CCCCCC;
}
div.clean_rounded-vertical.align_right > div.st_tabs ul li a.st_tab_first {
    border-top-left-radius: 0;
    border-top-right-radius: 5px;
}
div.clean_rounded-vertical.align_right.st_sliding_active > div.st_tabs ul li a.st_tab_first {
    border-top-right-radius: 0;
}
div.clean_rounded-vertical.align_right > div.st_tabs ul li a.st_tab_last {
    border-bottom-left-radius: 0;
    border-bottom-right-radius: 5px;
}
div.clean_rounded-vertical.align_right > div.st_tabs ul li a.st_tab_active {
    border-left-color: #FFFFFF;
    padding-right: 0;
}
div.clean_rounded-vertical.align_right > div.st_views {
    border-bottom-left-radius: 5px;
    border-top-left-radius: 5px;
    border-top-right-radius: 0;
}
div.clean_rounded-vertical.align_right.st_sliding_active > div.st_views {
    border-bottom-right-radius: 0;
}
div.separated_2-horizontal {
    clear: both;
    position: relative;
    width: 100%;
}
div.separated_2-horizontal > div.st_tabs a.st_prev, div.separated_2-horizontal > div.st_tabs a.st_next {
    background: url("/slidetabs/wp-content/plugins/slidetabs/templates/separated_2/images/arrows_h.gif") no-repeat scroll 0 0 #FFFFFF;
    border: 1px solid #CCCCCC;
    border-radius: 5px;
    display: none;
    height: 41px;
    outline: medium none;
    position: absolute;
    text-indent: -999em;
    top: 0;
    width: 43px;
    z-index: 110;
}
div.separated_2-horizontal > div.st_tabs a.st_prev {
    background-position: center 14px;
    left: 0;
}
div.separated_2-horizontal > div.st_tabs a.st_prev:hover {
    background-color: #F8F8F8;
    background-position: center -46px;
}
div.separated_2-horizontal > div.st_tabs a.st_next {
    background-position: center -16px;
    right: 0;
}
div.separated_2-horizontal > div.st_tabs a.st_next:hover {
    background-color: #F8F8F8;
    background-position: center -76px;
}
div.separated_2-horizontal > div.st_tabs a.st_prev.st_btn_disabled, div.separated_2-horizontal > div.st_tabs a.st_next.st_btn_disabled {
    background-color: #F8F8F8;
    cursor: default;
}
div.separated_2-horizontal > div.st_tabs a.st_prev.st_btn_disabled {
    background-position: center -106px;
}
div.separated_2-horizontal > div.st_tabs a.st_next.st_btn_disabled {
    background-position: center -136px;
}
div.separated_2-horizontal > div.st_tabs {
    border-radius: 5px;
    height: 43px;
    margin-bottom: 5px;
    overflow: hidden;
    position: relative;
    width: 100% !important;
    z-index: 100;
}
div.separated_2-horizontal.st_sliding_active > div.st_tabs {
}
div.separated_2-horizontal > div.st_tabs div.st_tabs_wrap {
    position: relative !important;
    width: 100%;
}
div.separated_2-horizontal.st_sliding_active > div.st_tabs div.st_tabs_wrap {
    margin: 0 50px;
    width: auto !important;
}
div.separated_2-horizontal > div.st_tabs ul {
    list-style: none outside none;
    margin: 0;
    padding: 0;
    width: 10000px;
}
div.separated_2-horizontal > div.st_tabs ul li {
    display: block;
    float: left;
    margin: 0;
}
div.separated_2-horizontal > div.st_tabs ul li a {
    background: -moz-linear-gradient(center top , #FBFBFB, #F8F8F8) repeat scroll 0 0 rgba(0, 0, 0, 0);
    border: 1px solid #CCCCCC;
    border-radius: 5px;
    color: #6A6A6A;
    display: block;
    font: bold 12px/41px Arial,Helvetica,sans-serif;
    height: 41px;
    margin: 0 5px 0 0;
    outline: medium none;
    padding: 0 30px;
    text-decoration: none;
}
div.separated_2-horizontal > div.st_tabs ul li a:hover {
    background: none repeat scroll 0 0 #FBFBFB;
    color: #333333;
}
div.separated_2-horizontal > div.st_tabs ul li a.st_tab_first {
    border-left: 1px solid #CCCCCC;
}
div.separated_2-horizontal > div.st_tabs ul li a.st_tab_last {
    margin-right: 0;
}
div.separated_2-horizontal > div.st_tabs ul li a.st_tab_active {
    background: none repeat scroll 0 0 #FFFFFF;
    color: #1CA5EC;
}
div.separated_2-horizontal > div.st_views {
    background-color: #FFFFFF;
    border: 1px solid #CCCCCC;
    border-radius: 5px;
    height: 395px;
    line-height: 19px;
    overflow: hidden;
    padding: 0 !important;
    position: relative;
    z-index: 5;
}
div.separated_2-horizontal > div.st_views div.st_view {
    -moz-box-sizing: border-box;
    background-color: rgba(0, 0, 0, 0) !important;
    background-image: none;
    background-position: 0 0 !important;
    background-repeat: no-repeat !important;
    height: 100%;
    overflow: hidden;
    width: 100%;
}
div.separated_2-horizontal > div.st_views div.st_view_inner {
    padding: 30px;
}
div.separated_2-horizontal > div.st_views div.st_view_first {
    display: block;
}
div.separated_2-horizontal.align_bottom {
    margin-bottom: 49px;
}
div.separated_2-horizontal.align_bottom > div.st_tabs {
    bottom: -48px;
    left: 0;
    margin-bottom: 0;
    position: absolute;
}
div.separated_2-vertical {
    clear: both;
    position: relative;
    width: 100%;
}
div.separated_2-vertical > div.st_tabs a.st_prev, div.separated_2-vertical > div.st_tabs a.st_next {
    background: url("/slidetabs/wp-content/plugins/slidetabs/templates/separated_2/images/arrows_v.gif") no-repeat scroll 0 0 #FFFFFF;
    border: 1px solid #CCCCCC;
    display: none;
    float: left;
    height: 34px;
    margin-bottom: 5px;
    outline: medium none;
    position: relative;
    text-indent: -999em;
    width: 93px;
    z-index: 100;
}
div.separated_2-vertical > div.st_tabs a.st_prev {
    background-position: center 13px;
    border-bottom-left-radius: 5px;
    border-right: 0 none;
    border-top-left-radius: 5px;
}
div.separated_2-vertical > div.st_tabs a.st_prev:hover {
    background-color: #F5F5F5;
    background-position: center -51px;
}
div.separated_2-vertical > div.st_tabs a.st_next {
    background-position: center -19px;
    border-bottom-right-radius: 5px;
    border-top-right-radius: 5px;
}
div.separated_2-vertical > div.st_tabs a.st_next:hover {
    background-color: #F5F5F5;
    background-position: center -83px;
}
div.separated_2-vertical > div.st_tabs a.st_prev.st_btn_disabled, div.separated_2-vertical > div.st_tabs a.st_next.st_btn_disabled {
    background-color: #F7F7F7;
    cursor: default;
}
div.separated_2-vertical > div.st_tabs a.st_prev.st_btn_disabled {
    background-position: center -115px;
}
div.separated_2-vertical > div.st_tabs a.st_next.st_btn_disabled {
    background-position: center -147px;
}
div.separated_2-vertical > div.st_tabs {
    border-top-left-radius: 5px;
    border-top-right-radius: 5px;
    float: left;
    height: 407px;
    margin-right: 5px;
    overflow: hidden;
    position: relative;
    width: 189px;
    z-index: 100;
}
div.separated_2-vertical.st_sliding_active > div.st_tabs {
}
div.separated_2-vertical > div.st_tabs div.st_tabs_wrap {
    clear: both;
    float: left;
    position: relative !important;
}
div.separated_2-vertical > div.st_tabs ul {
    float: left;
    list-style: none outside none;
    margin: 0;
    padding: 0;
}
div.separated_2-vertical > div.st_tabs ul li {
    clear: both;
    float: left;
    margin: 0;
    position: relative;
}
div.separated_2-vertical > div.st_tabs ul li a {
    background-color: #F8F8F8;
    background-image: -moz-linear-gradient(center top , #F9F9F9, #F4F4F4);
    border: 1px solid #CCCCCC;
    border-radius: 5px;
    color: #5C5C5C;
    display: block;
    font: bold 12px/18px Arial,Helvetica,sans-serif;
    margin: 0 0 5px;
    outline: medium none;
    padding: 14px 0 14px 20px;
    text-decoration: none;
    width: 167px;
}
div.separated_2-vertical > div.st_tabs ul li a:hover {
    background: none repeat scroll 0 0 #FBFBFB;
    color: #333333;
}
div.separated_2-vertical > div.st_tabs ul li a.st_tab_first {
}
div.separated_2-vertical > div.st_tabs ul li a.st_tab_last {
    margin-bottom: 0;
}
div.separated_2-vertical > div.st_tabs ul li a.st_tab_active {
    background: none repeat scroll 0 0 #FFFFFF;
    color: #1CA5EC;
}
div.separated_2-vertical > div.st_tabs ul li a span {
    clear: both;
    color: #838383;
    display: block;
    font: italic 11px/11px Georgia,"Times New Roman",Times,serif;
    padding-top: 3px;
}
div.separated_2-vertical > div.st_views {
    background-color: #FFFFFF;
    border: 1px solid #CCCCCC;
    border-radius: 5px;
    height: 406px;
    line-height: 18px;
    overflow: hidden;
    position: relative;
    z-index: 5;
}
div.separated_2-vertical > div.st_views div.st_view {
    background-color: rgba(0, 0, 0, 0) !important;
    background-image: none;
    background-position: 0 0 !important;
    background-repeat: no-repeat !important;
    height: 100%;
    overflow: hidden;
    width: 100%;
}
div.separated_2-vertical > div.st_views div.st_view_inner {
    overflow: hidden !important;
    padding: 30px;
}
div.separated_2-vertical > div.st_views div.st_view_first {
    display: block;
}
div.separated_2-vertical.align_right > div.st_tabs {
    float: right;
    margin-left: 5px;
    margin-right: 0;
}
.st_tabs_ul>li>a>font{
	margin-left : 20px;
}
</style>
<script>
	$(function(){
		$("#addItem").click(function(){
			$(".st_tab_active").removeClass("st_tab_active");
			$(".st_tabs_ul").append('<li class=""><a class="st_tab st_tab_4 st_tab_active">Eiusmod Proident<font>x</font></a></li>');
		});
		$(".st_tabs_ul>li>a>font").click(function(){
			$(this).closest("li").remove();
		});
	});
</script>
</head>
<body>
	<a id="addItem">click</a>
	<div id="demo" style="margin-top:50px;">
		<div class="slidetabs clean_rounded clean_rounded-horizontal align_top st_sliding_active">
			<div class="st_tabs">
				<a class="st_prev" href="#" style="display: hide;">prev</a>
				<a class="st_next st_btn_disabled" href="#" style="display: hide;">next</a>
				<div class="st_tabs_wrap" style="overflow: hidden;">
					<ul class="st_tabs_ul" >
						<li><a class="st_tab st_tab_2" rel="beneficium" href="#beneficium">Beneficium<font>x</font></a></li>
						<li class="st_li_active"><a class="st_tab st_tab_3 st_tab_active" rel="elementum" href="#elementum">Elementum<font>x</font></a></li>
						<li class=""><a class="st_tab st_tab_4" rel="tab-4" href="#tab-4">Eiusmod Proident<font>x</font></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>