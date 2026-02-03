<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Send Message</title>

<style>
#msgPopup{
    position:fixed;
    right:20px;
    bottom:20px;
    width:320px;
    background:white;
    border-radius:8px;
    box-shadow:0 0 15px rgba(0,0,0,0.3);
    padding:15px;
    display:none;
    z-index:999;
}

#msgPopup h3{
    margin:0;
    color:#003366;
}

#msgPopup input, #msgPopup textarea{
    width:100%;
    margin-top:8px;
    padding:8px;
}

#msgPopup button{
    margin-top:10px;
    width:100%;
    padding:8px;
    background:#0077cc;
    color:white;
    border:none;
    border-radius:4px;
}

.closeBtn{
    float:right;
    cursor:pointer;
    color:red;
}
</style>
</head>

<body>

<div id="msgPopup">
    <span class="closeBtn" onclick="closePopup()">✖</span>
    <h3>📩 Contact Admin</h3>

    <form action="sendMessage" method="post">
        <input type="text" name="name" placeholder="Your Name" required>
        <input type="email" name="email" placeholder="Your Email" required>
        <textarea name="message" rows="4"
                  placeholder="Type your message..." required></textarea>
        <button type="submit">Send Message</button>
    </form>
</div>

<script>
function openMessagePopup(){
    document.getElementById("msgPopup").style.display="block";
}
function closePopup(){
    document.getElementById("msgPopup").style.display="none";
}
</script>

</body>
</html>
