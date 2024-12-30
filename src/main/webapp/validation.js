
  // Check if the 'status' attribute is present
  
function checkEmail(value) {
    const emailPattern = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return emailPattern.test(value);
}

function checkPhone(value) {
    const phonePattern = /^[0-9]+$/; // Accept only numbers
    return phonePattern.test(value);
}

document.addEventListener("DOMContentLoaded", function() {
    const loginForm = document.querySelector(".sign-in-form");
    const signupForm = document.querySelector(".sign-up-form");

    function clearErrors(form) {
        const errorMessages = form.querySelectorAll(".error");
        errorMessages.forEach(msg => msg.textContent = "");
    }

    function showError(input, message) {
        const errorMessage = input.nextElementSibling;
        if (errorMessage && errorMessage.classList.contains("error")) {
            errorMessage.textContent = message;
        }
    }

    loginForm.addEventListener("submit", function(event) {
        clearErrors(loginForm);
        const emailInput = loginForm.querySelector("input[name='email']");
        const passwordInput = loginForm.querySelector("input[name='pw']");
        let valid = true;

        // Validate only email for login
        if (!checkEmail(emailInput.value)) {
            showError(emailInput, "Please enter a valid email.");
            valid = false;
        }

        if (passwordInput.value.length < 6) {
            showError(passwordInput, "Password must be at least 6 characters long.");
            valid = false;
        }

        if (!valid) {
            event.preventDefault();
        }
    });

    signupForm.addEventListener("submit", function(event) {
        clearErrors(signupForm);
        const usernameInput = signupForm.querySelector("input[name='name']");
        const emailInput = signupForm.querySelector("input[name='email']");
        const phoneInput = signupForm.querySelector("input[name='phone']");
        const passwordInput = signupForm.querySelector("input[name='pw']");
        const confirmPasswordInput = signupForm.querySelector("input[name='cp']");
        let valid = true;

        // Validate username for signup
        if (!usernameInput.value) {
            showError(usernameInput, "Please enter your username.");
            valid = false;
        }

        // Validate email for signup
        if (!checkEmail(emailInput.value)) {
            showError(emailInput, "Please enter a valid email.");
            valid = false;
        }

        // Validate phone for signup
        if (!checkPhone(phoneInput.value) || phoneInput.value.length == 10) {
            showError(phoneInput, "Phone number must be 10 digits and contain only numbers.");
            valid = false;
        }

        if (passwordInput.value.length < 6) {
            showError(passwordInput, "Password must be at least 6 characters long.");
            valid = false;
        }

        if (passwordInput.value !== confirmPasswordInput.value) {
            showError(confirmPasswordInput, "Passwords do not match.");
            valid = false;
        }

        if (!valid) {
            event.preventDefault();
        }
    });
});
