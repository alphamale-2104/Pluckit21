<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Pluckit Farm - Strawberry Varieties & Chat Support</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

<style>
body {
    background: #fdf6f8 url('https://images.unsplash.com/photo-1584270354949-df432a6e36b1?auto=format&fit=crop&w=1350&q=80') no-repeat center center fixed;
    background-size: cover;
    font-family: 'Poppins', sans-serif;
    margin: 0;
    padding: 0;
}

body::before {
    content: "";
    position: fixed;
    top: 0; left: 0;
    width: 100%; height: 100%;
    background-color: rgba(255,255,255,0.85);
    z-index: -1;
}

.header {
    text-align: center;
    padding: 25px;
    background: #ff4d79;
    color: white;
    font-size: 28px;
    font-weight: 600;
    border-bottom-left-radius: 20px;
    border-bottom-right-radius: 20px;
    letter-spacing: 1px;
    box-shadow: 0 5px 20px rgba(0,0,0,0.25);
}

.sub-text {
    text-align: center;
    font-size: 17px;
    margin: 15px 0 30px 0;
    color: #444;
}

/* CARD GRID */
.card-container {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 28px;
    max-width: 1400px;
    padding: 35px;
    margin: auto;
}

/* CARD STYLE */
.card {
    background: #ffffff;
    border-radius: 20px;
    padding: 30px 20px;
    text-align: center;
    transition: transform .2s ease-out, box-shadow .2s ease-out;
    box-shadow: 0px 6px 16px rgba(0,0,0,0.12);
    cursor: pointer;
}

.card img {
    width: 85px;
    height: 85px;
    object-fit: contain;
}

.card-title {
    font-size: 18px;
    font-weight: 600;
    margin-top: 15px;
    color: #004b5c;
}

.card-text {
    font-size: 14px;
    margin-top: 10px;
    color: #333;
}

.card.glow {
    box-shadow: 0px 0px 30px rgba(255,75,107,0.5);
}

/* ================= PREMIUM GLASS CHATBOT ================= */

df-messenger {
    --df-messenger-bot-message: #ff4d79;
    --df-messenger-user-message: #ffe6ec;
    --df-messenger-button-titlebar-color: rgba(255,77,121,0.9);
    --df-messenger-chat-background: rgba(255,255,255,0.2);
    --df-messenger-font-color: #ffffff;

    position: fixed;
    bottom: 25px;
    right: 25px;
    z-index: 999;
}

/* Circle PNG Cover */
df-messenger::part(chat-icon) {
    background-image: url("../images/chatlogo.png");
    background-size: cover;
    background-position: center;
    border-radius: 50%;
    width: 75px;
    height: 75px;
    transition: all 0.4s ease;
    animation: strawberryPulse 2.5s infinite;
}

df-messenger::part(chat-icon) img {
    display: none;
}

df-messenger::part(chat-icon):hover {
    transform: scale(1.2) rotate(10deg);
    box-shadow: 0 0 35px rgba(255,0,80,0.9);
}

/* Glass Chat Window */
df-messenger::part(chat-wrapper) {
    backdrop-filter: blur(18px);
    background: rgba(255,255,255,0.25);
    border-radius: 20px;
    box-shadow: 0 10px 40px rgba(0,0,0,0.3);
}

df-messenger::part(titlebar) {
    backdrop-filter: blur(15px);
    background: linear-gradient(45deg,#ff4d79,#ff8fa3);
    border-top-left-radius: 20px;
    border-top-right-radius: 20px;
}

df-messenger::part(message) {
    border-radius: 18px;
}

df-messenger::part(chip) {
    background: linear-gradient(45deg,#ff4d79,#ff8fa3);
    color: white;
    border-radius: 25px;
}

@keyframes strawberryPulse {
    0% { box-shadow: 0 0 0 0 rgba(255,0,80,0.7); }
    70% { box-shadow: 0 0 0 25px rgba(255,0,80,0); }
    100% { box-shadow: 0 0 0 0 rgba(255,0,80,0); }
}
</style>
</head>

<body>

<div class="header">🍓 Explore Strawberry Varieties & Ask Any Queries to Pluckit Chatbot</div>
<p class="sub-text">Move your cursor over any strawberry card to learn more & chat with Pluckit Assistant anytime!</p>

<div class="card-container">

<div class="card">
<img src="../images/festival.png" alt="Festival Strawberry">
<div class="card-title">Festival Strawberry</div>
<div class="card-text">Bright red, sweet and juicy. Best for fresh eating and toppings.</div>
</div>

<div class="card">
<img src="../images/Camarosa_strawberry.jpg" alt="Camarosa Strawberry">
<div class="card-title">Camarosa Strawberry</div>
<div class="card-text">Large berries used for jam & desserts with strong aroma.</div>
</div>

<div class="card">
    
<img src="../images/sweeeet.jpg" alt="Sweet Sensation"/>
<div class="card-title">Sweet Sensation</div>
<div class="card-text">Soft texture, high sugar level — great for chocolate dips.</div>
</div>

<div class="card">
<img src="../images/organic.png" alt="Organic Baby Berry">
<div class="card-title">Organic Baby Berry</div>
<div class="card-text">Small-sized sweet berries grown with zero chemicals.</div>
</div>

<div class="card">
<img src="../images/desert22.png" alt="Dessert Elite Berry">
<div class="card-title">Dessert Elite Berry</div>
<div class="card-text">Perfect for ice creams, milkshakes & bakery items.</div>
</div>

<div class="card">
<img src="https://img.icons8.com/color/96/strawberry.png" alt="Export Grade Berry">
<div class="card-title">Export Grade Berry</div>
<div class="card-text">Firm texture suitable for long-distance shipping.</div>
</div>

<div class="card">
<img src="../images/ruby_heart.jpg" alt="Ruby Heart">
<div class="card-title">Ruby Heart</div>
<div class="card-text">Deep red flesh & sweet balanced flavor.</div>
</div>

<div class="card">
<img src="../images/mountain.png" alt="Mountain Berry">
<div class="card-title">Mountain Berry</div>
<div class="card-text">Grown at high altitudes with natural sweetness.</div>
</div>

<div class="card">
<img src="../images/winter.png" alt="Winter Special">
<div class="card-title">Winter Special</div>
<div class="card-text">Seasonal fresh berries from November to March.</div>
</div>

<div class="card">
<img src="../images/chocolate.png" alt="Chocolate Berry">
<div class="card-title">Chocolate Berry</div>
<div class="card-text">Pairs perfectly with chocolate fondue and waffles.</div>
</div>

<div class="card">
<img src="../images/garden.png" alt="Garden Sweet">
<div class="card-title">Garden Sweet</div>
<div class="card-text">Home-grown mild tart berry perfect for salad & drinks.</div>
</div>

<div class="card">
<img src="../images/royal.png" alt="Royal Berry">
<div class="card-title">Royal Berry</div>
<div class="card-text">Premium soft berry for luxury desserts & gifting.</div>
</div>

</div>

<script src="https://www.gstatic.com/dialogflow-console/fast/messenger/bootstrap.js?v=1"></script>

<df-messenger
intent="WELCOME"
chat-title="🍓 PluckitBot"
agent-id="e0f1dc1a-b86a-4502-a6cd-ef0576685212"
language-code="en">
</df-messenger>

<script>
document.addEventListener("DOMContentLoaded", function() {
   const cards = document.querySelectorAll(".card");

   cards.forEach(card => {
       card.addEventListener("mousemove", e => {
           const rect = card.getBoundingClientRect();
           const x = (e.clientX - rect.left - rect.width/2)/10;
           const y = (e.clientY - rect.top - rect.height/2)/10;
           card.style.transform = `scale(1.12) rotateX(${y}deg) rotateY(${x}deg)`;
           card.classList.add("glow");
       });

       card.addEventListener("mouseleave", () => {
           card.style.transform = "scale(1)";
           card.classList.remove("glow");
       });
   });
});
</script>

</body>
</html>