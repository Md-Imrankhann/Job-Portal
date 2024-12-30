<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

    <style>
    @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700;800&display=swap");
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body,
input {
  font-family: "Poppins", sans-serif;
}

.container {
  position: relative;
  width: 100%;
  background-color: #fff;
  min-height: 100vh;
  overflow: hidden;
}

     .navbar {
        width: 100%;
        padding: 10px 0;
        position: fixed;
        top: 0;
        z-index: 100;
        background-color: transparent;
        display: flex;
        justify-content: space-between;
        align-items: center;
      }

      .navbar .logo {
        font-size: 2rem;
        font-weight: bold;
        color: #46e0a2;
        text-transform: uppercase;
        margin-left: 20px;
        text-decoration: none;
      }

      .navbar .nav-buttons {
        display: flex;
        justify-content: flex-end;
        margin-right: 20px;
      }

      .navbar .nav-buttons a {
        font-size: 1rem;
        font-weight: bold;
        color: #46e0a2;
        text-transform: uppercase;
        margin-left: 20px;
        text-decoration: none;
      }

      .navbar .nav-buttons a:hover {
        background-color: #fff;
        color: #23c686; /* Change this to your desired hover color */
      }


.forms-container {
  position: absolute;
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
}

.signin-signup {
  position: absolute;
  top: 50%;
  transform: translate(-50%, -50%);
  left: 75%;
  width: 50%;
  transition: 1s 0.7s ease-in-out;
  display: grid;
  grid-template-columns: 1fr;
  z-index: 5;
}

form {
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  padding: 0rem 5rem;
  transition: all 0.2s 0.7s;
  overflow: hidden;
  grid-column: 1 / 2;
  grid-row: 1 / 2;
}

form.sign-up-form {
  opacity: 0;
  z-index: 1;
}

form.sign-in-form {
  z-index: 2;
}

.title {
  font-size: 2.2rem;
  color: #444;
  margin-bottom: 10px;
}

.input-field {
  max-width: 380px;
  width: 100%;
  background-color: #f0f0f0;
  margin: 10px 0;
  height: 55px;
  border-radius: 55px;
 
  grid-template-columns: 15% 85%;
  padding: 0 0.4rem;
  position: relative;
}

.input-field i {
  text-align: center;
  line-height: 55px;
  color: #acacac;
  transition: 0.5s;
  font-size: 1.1rem;
  padding-left: 20px;
}

.input-field input {
  background: none;
  outline: none;
  border: none;
  line-height: 1;
  font-weight: 600;
  font-size: 1.1rem;
  color: #333;
   padding-left:10px;
  

}

.input-field input::placeholder {
  color: #aaa;
  font-weight: 500;
 
  
}





.btn {
  width: 150px;
  background-color: #23c686;
  border: none;
  outline: none;
  height: 49px;
  border-radius: 49px;
  color: #000;
  text-transform: uppercase;
  font-weight: 600;
  margin: 10px 0;
  cursor: pointer;
  transition: all 0.3s;
    position: relative;
    overflow: hidden;
    z-index: 1;
}

.btn:hover {
  background-color: #099d02;
}

.btn::after{
    content: "";
    position: absolute;
    left: 0;
    top: 0;
    height: 100%;
    width: 100%;
    background-color: #fff;
    z-index: -1;
    border-radius: 10rem;
    transition: 0.3s ease all;
    transform: scale(0, 1);
    transform-origin: bottom left;
    transition: transform 500ms cubic-bezier(0.86, 0, 0.07, 1);
    transition-timing-function: cubic-bezier(0.86, 0, 0.07, 1);


}
.btn:hover::after{
    transform: scale(1, 1);
    transform-origin: top left;
}
.btn.transparent {
  margin: 0;
  background: none;
  border: 2px solid #fff;
  width: 130px;
  height: 41px;
  font-weight: 600;
  font-size: 0.8rem;
}

.panels-container {
  position: absolute;
  height: 100%;
  width: 100%;
  top: 0;
  left: 0;
  display: grid;
  grid-template-columns: repeat(2, 1fr);
}
.container:before {
  content: "";
  position: absolute;
  height: 2000px;
  width: 2000px;
  top: -10%;
  right: 48%;
  transform: translateY(-50%);
  background-image: linear-gradient(-45deg, #23c686 0%, #46e0a2 100%);
  transition: 1.8s ease-in-out;
  border-radius: 50%;
  z-index: 6;
}

.image {
  width: 100%;
  transition: transform 1.1s ease-in-out;
  transition-delay: 0.4s;
}

.panel {
  display: flex;
  flex-direction: column;
  align-items: flex-end;
  justify-content: space-around;
  text-align: center;
  z-index: 6;
}

.left-panel {
  pointer-events: all;
  padding: 3rem 17% 2rem 12%;
}

.right-panel {
  pointer-events: none;
  padding: 3rem 12% 2rem 17%;
}

.panel .content {
  color: #000;
  transition: transform 0.9s ease-in-out;
  transition-delay: 0.6s;
}

.panel h3 {
  font-weight: 600;
  line-height: 1;
  font-size: 1.5rem;
}

.panel p {
  font-size: 0.95rem;
  padding: 0.7rem 0;
}


.right-panel .image,
.right-panel .content {
  transform: translateX(800px);
}

/* ANIMATION */

.container.sign-up-mode:before {
  transform: translate(100%, -50%);
  right: 52%;
}

.container.sign-up-mode .left-panel .image,
.container.sign-up-mode .left-panel .content {
  transform: translateX(-800px);
}

.container.sign-up-mode .signin-signup {
  left: 25%;
}

.container.sign-up-mode form.sign-up-form {
  opacity: 1;
  z-index: 2;
}

.container.sign-up-mode form.sign-in-form {
  opacity: 0;
  z-index: 1;
}

.container.sign-up-mode .right-panel .image,
.container.sign-up-mode .right-panel .content {
  transform: translateX(0%);
}

.container.sign-up-mode .left-panel {
  pointer-events: none;
}

.container.sign-up-mode .right-panel {
  pointer-events: all;
}

@media (max-width: 870px) {
  .container {
    min-height: 800px;
    height: 100vh;
  }
  .signin-signup {
    width: 100%;
    top: 95%;
    transform: translate(-50%, -100%);
    transition: 1s 0.8s ease-in-out;
  }

  .signin-signup,
  .container.sign-up-mode .signin-signup {
    left: 50%;
  }

  .panels-container {
    grid-template-columns: 1fr;
    grid-template-rows: 1fr 2fr 1fr;
  }

  .panel {
    flex-direction: row;
    justify-content: space-around;
    align-items: center;
    padding: 2.5rem 8%;
    grid-column: 1 / 2;
  }

  .right-panel {
    grid-row: 3 / 4;
  }

  .left-panel {
    grid-row: 1 / 2;
  }

  .image {
    width: 200px;
    transition: transform 0.9s ease-in-out;
    transition-delay: 0.6s;
  }

  .panel .content {
    padding-right: 15%;
    transition: transform 0.9s ease-in-out;
    transition-delay: 0.8s;
  }

  .panel h3 {
    font-size: 1.2rem;
  }

  .panel p {
    font-size: 0.7rem;
    padding: 0.5rem 0;
  }

  .btn.transparent {
    width: 110px;
    height: 35px;
    font-size: 0.7rem;
  }

  .container:before {
    width: 1500px;
    height: 1500px;
    transform: translateX(-50%);
    left: 30%;
    bottom: 68%;
    right: initial;
    top: initial;
    transition: 2s ease-in-out;
  }

  .container.sign-up-mode:before {
    transform: translate(-50%, 100%);
    bottom: 32%;
    right: initial;
  }

  .container.sign-up-mode .left-panel .image,
  .container.sign-up-mode .left-panel .content {
    transform: translateY(-300px);
  }

  .container.sign-up-mode .right-panel .image,
  .container.sign-up-mode .right-panel .content {
    transform: translateY(0px);
  }

  .right-panel .image,
  .right-panel .content {
    transform: translateY(300px);
  }

  .container.sign-up-mode .signin-signup {
    top: 5%;
    transform: translate(-50%, 0);
  }
}

@media (max-width: 570px) {
  form {
    padding: 0 1.5rem;
  }

  .image {
    display: none;
  }
  .panel .content {
    padding: 0.5rem 1rem;
  }
  .container {
    padding: 1.5rem;
  }

  .container:before {
    bottom: 72%;
    left: 50%;
  }

  .container.sign-up-mode:before {
    bottom: 28%;
    left: 50%;
  }
}
.radio-group {
  display: flex;
  justify-content: space-around;
  width: 100%;
  margin-bottom: 15px;
}

.radio-group label {
  font-size: 14px;
  display: flex;
  align-items: center;
  cursor: pointer;
}

.radio-group input[type="radio"] {
  margin-right: 8px;
  accent-color: #23c686;
}
.forgot {
  text-decoration: none;
  font-size: 0.9rem; /* Adjust font size */
  margin-top: 10px; /* Add space from the input fields */
  color: #C75B7A; /* Customize to match your theme */
  display: block;
}
/* Email container to position the button inside the input */
.email-container {
    position: relative;
    width: 100%;
    max-width: 400px;
    margin: 5px auto;
}

/* Input styling */


/* Button styling */
.email-container button {
    position: absolute;
    right: 0px;
    top: 40%;
    transform: translateY(-50%);
    padding: 20px 20px;
    background-color: #23c686;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    margin-right: -6px;
    border-top-right-radius:55px; 
    border-bottom-right-radius:55px; 
}

/* Change border color when the email is not verified */
.email-container input.invalid {
    border-color: red;
}

/* Button hover effect */



    </style>
    <title>Sign in & Sign up Form</title>
  </head>
  <body>
  
    <!-- Nav Bar -->
    <nav class="navbar">
      <div class="nav-buttons"><a href="home.jsp">Home</a></div>
      <div class="nav-buttons">
        <a href="home.jsp">Home</a>
        
      </div>
    </nav>

    <div class="container">
      <!-- Your existing form and content structure goes here -->
      <div class="forms-container">
        <div class="signin-signup">
        <%if("f".equals(request.getParameter("verify"))) {%>
          <form action="EmailOtp" method="get" class="sign-in-form">
            <h2 class="title">Login</h2>
            <div class="input-field" style="border:1px solid red; border-color: red;">
              
              <div class="email-container">
              			<i class="fas fa-user" style="margin-top: 0px;"></i>
    					<input type="email" id="email" placeholder="Email" name="email" style="margin-top: 0px;"  required/>
    					<button type="submit" style="background-color: red;" ><b>Verify</b></button>
				</div>
             	<div class="error" style="color:red;"></div>
            </div>
            <div class="input-field">
              <i class="fas fa-lock"></i>
              <input type="password" placeholder="Password" name="" />
              <div class="error" style="color:red;"></div>
            </div>
            <div class="d-flex justify-content-start">
    			<a href="forgot.jsp" class="forgot">Forgot password?</a>
  			</div>
           <a href="login.jsp?verify=f"> <input type="" value="Login" class="btn" name="" style="padding-left: 55px;  font-weight: bold;"/></a>

          </form>
		<%}else{ %>
			 <form action="register" method="post" class="sign-in-form">
            <h2 class="title">Login</h2>
            <div class="input-field" style="border:1px solid green; ">
              
              <div class="email-container" style="padding-top: 0px;">
              			<i class="fas fa-user"></i>
    					<input type="email" id="email" placeholder="Email" name="email"value="<%=request.getParameter("email") %>"  readonly  />
    					<b><i class="fas fa-check" style="padding: 0px; font-size: 30px; height: 2px; color: green; margin-left: 30px;"></i></b>
				</div>
             	<div class="error" style="color:red;"></div>
            </div>
            <div class="input-field">
              <i class="fas fa-lock"></i>
              <input type="password" placeholder="Password" name="pw" required/>
              <div class="error" style="color:red;"></div>
            </div>
            <div class="d-flex justify-content-start">
    			<a href="forgot.jsp" class="forgot">Forgot password?</a>
  			</div>
            <input type="submit" value="Login" class="btn" name="login" />

          </form>
		<%} %>
		
		
		
		
		
		
		<%if("f".equals(request.getParameter("verify"))) {%>
        
          <form action="EmailOtp" method="get" class="sign-up-form">
            <h2 class="title">Sign up</h2>
            <div class="input-field">
              <i class="fas fa-user"></i>
              <input type="text" placeholder="Username" name="" id="name" />
              <div class="error" style="color:red; width: 100px; height: 100%;"></div>
            </div>
            <div class="input-field" style="border:1px solid red; border-color: red;">
              
              <div class="email-container">
              			<i class="fas fa-user" style="margin-top: 0px;"></i>
    					<input type="email" id="email" placeholder="Email" name="email" style="margin-top: 0px;"  required/>
    					<button type="submit" style="background-color: red;" ><b>Verify</b></button>
				</div>
             	<div class="error" style="color:red;"></div>
            </div>
            <div class="input-field">
              <i class="fas fa-envelope"></i>
              <input type="text" placeholder="Phone number" name="" id="phone" />
              <div class="error" style="color:red;"></div>
            </div>
            <div class="input-field">
              <i class="fas fa-lock"></i>
              <input type="password" placeholder="Password" name="" id="pw" />
              <div class="error" style="color:red;"></div>
            </div>
            <div class="input-field">
              <i class="fas fa-lock"></i>
              <input type="password" placeholder="Confirm Password" name="" id="cp" />
              <div class="error" style="color:red;"></div>
            </div>

            <div class="input-field radio-group">
              <label>
                <input type="radio" value="job-seeker" name=""  />
                <span>Job Seeker</span>
              </label>
              <label>
                <input type="radio" value="recruiter" name=""  />
                <span>Recruiter</span>
              </label>
            </div>
           <a href="login.jsp?verify=f"> <input type="" value="Sign Up" class="btn" name="" style="padding-left: 55px;  font-weight: bold;"/></a>
            
          </form>
          <%}else{ %>
           <form action="register" method="post" class="sign-up-form">
            <h2 class="title">Sign up</h2>
            <div class="input-field">
              <i class="fas fa-user"></i>
              <input type="text" placeholder="Username" name="name" id="name" required/>
              <div class="error" style="color:red; width: 100px; height: 100%;"></div>
            </div>
            
             <div class="input-field" style="border:1px solid green; ">
              
              <div class="email-container" style="padding-top: 0px;">
              			<i class="fas fa-user"></i>
    					<input type="email" id="email" placeholder="Email" name="email" value="<%=request.getParameter("email") %> " readonly/>
    					<b><i class="fas fa-check" style="padding: 0px; font-size: 30px; height: 2px; color: green; margin-left: 30px;"></i></b>
				</div>
             	<div class="error" style="color:red;"></div>
            </div>
            
            <div class="input-field">
              <i class="fas fa-envelope"></i>
              <input type="text" placeholder="Phone number" name="phone" id="phone" required/>
              <div class="error" style="color:red;"></div>
            </div>
            <div class="input-field">
              <i class="fas fa-lock"></i>
              <input type="password" placeholder="Password" name="pw" id="pw" required/>
              <div class="error" style="color:red;"></div>
            </div>
            <div class="input-field">
              <i class="fas fa-lock"></i>
              <input type="password" placeholder="Confirm Password" name="cp" id="cp" required/>
              <div class="error" style="color:red;"></div>
            </div>

            <div class="input-field radio-group">
              <label>
                <input type="radio" value="job-seeker" name="category" required />
                <span>Job Seeker</span>
              </label>
              <label>
                <input type="radio" value="recruiter" name="category" required />
                <span>Recruiter</span>
              </label>
            </div>
            <input type="submit" class="btn" name="signup" value="Sign up" />
            
          </form>
          <%} %>
        </div>
      </div>

      <div class="panels-container">
        <div class="panel left-panel">
          <div class="content">
            <h3>New here?</h3>
            <p>Join us and start your journey today</p>
            <button class="btn transparent" id="sign-up-btn">Sign up</button>
          </div>
          <img src="img/log.svg" class="image" alt="" />
        </div>
        <div class="panel right-panel">
          <div class="content">
            <h3>One of us?</h3>
            <p>Let's get you back on board!</p>
            <button class="btn transparent" id="sign-in-btn">Sign in</button>
          </div>
          <img src="img/register.svg" class="image" alt="" />
        </div>
      </div>
    </div>
<script src="validation.js"></script>
<script>
  
    // Check if the 'status' attribute is present
    window.onload = function() {
        var status = '<%= request.getAttribute("status") %>';
        if (status !== 'null' && status !== '') {
            // Show an alert with the status message
            alert(status);
        }
    };


      const sign_in_btn = document.querySelector("#sign-in-btn");
      const sign_up_btn = document.querySelector("#sign-up-btn");
      const container = document.querySelector(".container");

      sign_up_btn.addEventListener("click", () => {
        container.classList.add("sign-up-mode");
      });

      sign_in_btn.addEventListener("click", () => {
        container.classList.remove("sign-up-mode");
      });
    </script>
  </body>
</html>