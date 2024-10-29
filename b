<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>アクションゲーム</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #e0f7fa;
        }
        canvas {
            background-color: #ffffff;
            border: 2px solid #000;
        }
    </style>
</head>
<body>
    <canvas id="gameCanvas" width="400" height="400"></canvas>
    <script>
        const canvas = document.getElementById("gameCanvas");
        const ctx = canvas.getContext("2d");

        let player = { x: 200, y: 200, size: 20, color: "blue" };
        let enemy = { x: Math.random() * 400, y: Math.random() * 400, size: 20, color: "red", speed: 1 };

        function drawPlayer() {
            ctx.fillStyle = player.color;
            ctx.fillRect(player.x, player.y, player.size, player.size);
        }

        function drawEnemy() {
            ctx.fillStyle = enemy.color;
            ctx.fillRect(enemy.x, enemy.y, enemy.size, enemy.size);
        }

        function moveEnemy() {
            if (enemy.x < player.x) enemy.x += enemy.speed;
            if (enemy.x > player.x) enemy.x -= enemy.speed;
            if (enemy.y < player.y) enemy.y += enemy.speed;
            if (enemy.y > player.y) enemy.y -= enemy.speed;
        }

        function checkCollision() {
            if (Math.abs(player.x - enemy.x) < player.size && Math.abs(player.y - enemy.y) < player.size) {
                alert("ゲームオーバー！");
                player.x = 200;
                player.y = 200;
                enemy.x = Math.random() * 400;
                enemy.y = Math.random() * 400;
            }
        }

        function update() {
            ctx.clearRect(0, 0, canvas.width, canvas.height);
            drawPlayer();
            drawEnemy();
            moveEnemy();
            checkCollision();
        }

        function movePlayer(event) {
            switch(event.key) {
                case "ArrowUp":
                    if (player.y > 0) player.y -= 5;
                    break;
                case "ArrowDown":
                    if (player.y < canvas.height - player.size) player.y += 5;
                    break;
                case "ArrowLeft":
                    if (player.x > 0) player.x -= 5;
                    break;
                case "ArrowRight":
                    if (player.x < canvas.width - player.size) player.x += 5;
                    break;
            }
        }

        document.addEventListener("keydown", movePlayer);
        setInterval(update, 30);
    </script>
</body>
</html>
