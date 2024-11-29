<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Biz Haqimizda</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
            color: #333;
            margin: 0;
            padding: 0;
        }
        .container {
            text-align: center;
            padding: 50px 20px;
            max-width: 800px;
            margin: 0 auto;
            background-color: #ffffff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }
        h1 {
            color: #007bff;
            font-size: 36px;
            margin-bottom: 20px;
        }
        p {
            font-size: 18px;
            line-height: 1.6;
            margin-bottom: 20px;
        }
        .team {
            margin-top: 30px;
        }
        .team h2 {
            font-size: 24px;
            color: #333;
            margin-bottom: 10px;
        }
        .team ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }
        .team ul li {
            font-size: 16px;
            margin: 5px 0;
        }
        .back-button {
            margin-top: 30px;
        }
        .back-button button {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }
        .back-button button:hover {
            background-color: #0056b3;
        }
        footer {
            margin-top: 30px;
            font-size: 14px;
            color: #666;
        }
        .error-message {
            margin-top: 20px;
            font-size: 16px;
            color: #e74c3c;
            font-weight: bold;
        }
        .feedback-container {
            margin-top: 30px;
            text-align: left;
        }
        .feedback-container textarea {
            width: 100%;
            height: 150px;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
            resize: vertical;
        }
        .feedback-container button {
            background-color: #28a745;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 10px;
        }
        .feedback-container button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>About Us</h1>
    <p>
        Bizning ilovamizga xush kelibsiz! Biz sizning ehtiyojlaringizga mos innovatsion va foydalanuvchilar uchun qulay yechimlar yaratishga intilamiz.
        Bizning maqsadimiz yuqori sifatli xizmatlar taqdim etish va tajribangizni silliq qilishdir.
    </p>
    <p>
        Ilovamiz g'amxo'rlik va ehtiros bilan, o'z ishiga bag'ishlangan mutaxassislar jamoasi tomonidan yaratilgan.
        Biz sizning fikr-mulohazalaringiz asosida xizmatlarimizni doimiy ravishda yaxshilab, ajoyib qiymat taqdim etishga intilamiz.
    </p>

    <div class="team">
        <h2>Bizning Jamoamiz</h2>
        <ul>
            <li>Muhammadyusuf - Project Manager</li>
            <li>Muhammadyusuf - Lead Developer</li>
            <li>ChatGPt - UI/UX Designer</li>
            <li>Muhammadyusuf - Backend Developer</li>
            <li>Muhammadyusuf - Quality Assurance</li>
        </ul>
    </div>


    <div class="error-message">
        Agar siz xatolarga duch kelsangiz yoki muammolarni sezsangiz, iltimos bizga xabar bering, shunda biz xatoni to'g'rilashga harakat qilamiz.
    </div>


    <div class="feedback-container">
        <h3>Fikr-mulohazangizni Bering</h3>
        <p>Bizning xizmatlarimizni yaxshilashda sizning takliflaringiz yoki muammolaringiz biz uchun juda muhimdir.</p>

        <textarea placeholder="Fikr-mulohazangizni shu yerda yozing..." name="feedback"></textarea>
        <br>
        <button type="submit">Fikr-mulohaza yuborish</button>

    </div>


    <div class="back-button">
        <button onclick="history.back()">Back</button>
    </div>

    <footer>
        2024 Bu dastur pdp o'quvchilar tomonidan ishlab chiqilgan.Barcha huquqlar himoyalangan.
    </footer>
</div>
</body>
</html>
