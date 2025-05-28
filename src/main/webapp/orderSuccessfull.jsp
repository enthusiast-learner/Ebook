<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Thank You for Your Order!</title>

    <!-- Bootstrap CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body, html {
            height: 100%;
            background: #f8f9fa;
        }
        .thank-you-container {
            height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            padding: 20px;
        }
        .thank-you-icon {
            font-size: 5rem;
            color: #198754; /* Bootstrap's success green */
            margin-bottom: 20px;
        }
        .btn-home {
            margin-top: 30px;
        }
    </style>
</head>
<body>

    <div class="thank-you-container">
        <div class="thank-you-icon">
            <!-- Using Bootstrap icons CDN -->
            <svg xmlns="http://www.w3.org/2000/svg" width="72" height="72" fill="currentColor" class="bi bi-check-circle-fill" viewBox="0 0 16 16">
                <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM6.97 11.03a.75.75 0 0 0 1.08 0L11.477 7.6a.75.75 0 1 0-1.06-1.06L7.5 9.94 6.573 9.013a.75.75 0 0 0-1.06 1.06l1.457 1.457z"/>
            </svg>
        </div>

        <h1 class="display-4 text-success">Thank You!</h1>
        <p class="lead">Your order has been placed successfully.</p>
        <p>We appreciate your trust in us. You will receive a confirmation email shortly.</p>

        <a href="index.jsp" class="btn btn-success btn-lg btn-home">Continue Shopping</a>
    </div>

    <!-- Optional Bootstrap JS CDN for components -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>