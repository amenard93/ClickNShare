<template>
  <div id="register" class="text-center">
    <icon-image id="image"/>
    <form class="form-register" @submit.prevent="register">
      <h1 id="register-banner" >ClicknShare</h1>
      <h2 id="register-text" class="h3 mb-3 font-weight-normal">Create an Account</h2>
      <div class="alert alert-danger" role="alert" v-if="registrationErrors">
        {{ registrationErrorMsg }}
      </div>
      <div>
        <!--<label for="name" class="sr-only">Name</label> -->
        <input
          type="text"
          id="firstName"
          class="form-control"
          placeholder="First Name"
          v-model="user.firstName"
          required
          />
      </div>  

      <div>
        <!--<label for="name" class="sr-only">Name</label> -->
        <input
          type="text"
          id="lastName"
          class="form-control"
          placeholder="Last Name"
          v-model="user.lastName"
          required
          />
      </div>  
      
      <div>
        <!-- <label for="emailid" class="sr-only">Email Id</label> -->
        <input
          type="text"
          id="emailid"
          class="form-control"
          placeholder="email@example.com"
          v-model="user.email"
          required
        />
      </div>

      <div class="register-input">
        <!-- <label for="username" class="sr-only">Username</label> -->
      <input
        type="text"
        id="username"
        class="form-control"
        placeholder="Username"
        v-model="user.username"
        required
        autofocus
      />
      </div>
      
      <div class="register-input">
         <!--<label for="password" class="sr-only">Password</label> -->
        <input
          type="password"
          id="password"
          class="form-control"
          placeholder="password"
          v-model="user.password"
          required
          v-on:change="checkPassword"
        />
      </div>
      <div class="alert alert-danger" role="alert" v-if="!validPassword">Password length must be at least 8. It must contain 1 uppercase letter, 1 number and 1 special character @$%!</div>

      <div>
        <input
          type="password"
          id="confirmPassword"
          class="form-control"
          placeholder="Confirm Password"
          v-model="user.confirmPassword"
          required
        />
      </div>
      
      <!--<button class="btn btn-lg btn-primary btn-block" type="submit">-->
        <button class="badge rounded-pill bg-info" type="submit" id="submitButton">
        Create Account
      </button>
    </form>

    <div class="back-to-login">
      <!--<router-link :to="{ name: 'login' }">Already have an account?</router-link>-->
      <label>Already have an account? <router-link :to="{ name: 'login' }">Log in</router-link></label>
    </div>
  </div>
</template>

<script>
import authService from '../services/AuthService';
import IconImage from "../components/IconImage.vue"

export default {
  name: 'register',
  components: {
    IconImage
  },
  data() {
    return {
      user: {
        firstName: '',
        lastName: '',
        email: '',
        username: '',
        password: '',
        confirmPassword: '',
        role: 'user',
      },
      registrationErrors: false,
      registrationErrorMsg: 'There were problems registering this user.',
      validPassword : true,
    };
  },
  methods: {
    backToLogin(){
      this.$router.push({name: 'login'});
    },

    checkPassword(){
      const pwd = this.user.password;
      const upperLettersRule = /[A-Z]/;
      const numbersRule = /[0-9]/;
      const splCharRule = /[@$%!]/;
      if(pwd.length < 8  || !upperLettersRule.test(pwd) 
      || !numbersRule.test(pwd) || !splCharRule.test(pwd)){
        this.validPassword = false;
      } else{
        this.validPassword = true;
      }
    },
    
    register() {
      if (this.user.password != this.user.confirmPassword) {
        this.registrationErrors = true;
        this.registrationErrorMsg = 'Password & Confirm Password do not match.';
      } else {
        authService
          .register(this.user)
          .then((response) => {
            if (response.status == 201) {
              this.$router.push({
                path: '/login',
                query: { registration: 'success' },
              });
            }
          })
          .catch((error) => {
            const response = error.response;
            this.registrationErrors = true;
            if (response.status === 400) {
              this.registrationErrorMsg = 'Bad Request: Validation Errors';
            }
          });
      }
    },
    clearErrors() {
      this.registrationErrors = false;
      this.registrationErrorMsg = 'There were problems registering this user.';
    },
  },
};
</script>

<style>

#register {
  display: grid;
  justify-items: center;
  grid-template-columns: 1fr 1fr;
  grid-template-areas: "image form-register"
                       "image back-to-login";   
                                                        
}

.form-register {
  
  display: grid;
  grid-area: form-register;
  border: 1px solid black;
  border-radius: 5px;
  width: 40%;
  margin: 5px;
  margin-top: 105px;
  margin-left: -10%;
  row-gap: 10px;
  column-gap: 30px;
  padding-bottom: 20px;
  background-color:aliceblue;
  justify-items: center;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}

.back-to-login {
  display: grid;
  font-family:"Billabong";
  font-size: 180%;
  grid-area: back-to-login;
  border: 1px solid black;
  border-radius: 5px;
  width: 40%;
  margin: 5px;
  margin-left: -10%;
  padding-bottom: 10px;
  padding-top: 10px;
  row-gap: 10px;
  background-color:aliceblue;
  justify-items: center;
}

#register-banner {
  font-family:"Billabong";
  color: cadetblue;
  font-weight: 1000;
  font-style: italic;
  margin-bottom: 0%; 
  margin-top: 5%;
}

#image {
  grid-area: image;
  margin-right: -20%;
  margin-top: 75px;
}

#register-text {
  font-family: "Billabong";
  font-style: italic;
  margin: 0%;
  color:black;
}

.form-control {
  width: 200px;
  height: 30px;
  
}

.alert {
  align-self: center;
}

.invalidPwd {
  margin-left: 20px;
}

#firstName {
  
  width: 85%;
  height: 90%;
  font-size: 15pt;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
  margin-bottom: 2%;
  margin-left: 10%;
  
}

#lastName {
  width: 85%;
  height: 90%;
  font-size: 15pt;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
  margin-bottom: 2%;
  margin-left: 10%;
}

#emailid {
  width: 85%;
  height: 90%;
  font-size: 15pt;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
  margin-bottom: 2%;
  margin-left: 10%;
}

.register-input #username {
  width: 85%;
  height: 90%;
  font-size: 15pt;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
  margin-bottom: 2%;
  margin-left: 10%;
}

.register-input #password {
  width: 85%;
  height: 90%;
  font-size: 15pt;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
  margin-bottom: 2%;
  margin-left: 10%;
}

#confirmPassword {
  width: 85%;
  height: 90%;
  font-size: 15pt;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
  margin-bottom: 2%;
  margin-left: 10%;
}

#submitButton {
  font-size: 20px;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}

#submitButton:active {
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}

</style>
