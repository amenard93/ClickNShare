<template>
        <div id="user-profile">
            <div id="profile-pic" v-if="item.imageUrl">
                <img  :src="item.imageUrl"/>
            </div>
            <div id="profile-pic"  v-else-if="user.profileImage">
                <img :src="user.profileImage"/>
            </div>
            <div id="profile-pic" v-else>
                <img src="../../public/default_profile_picture.jpeg"/>
            </div>
            <div id="upload">
                
                <input id="upload-dp" v-if="user.id===$store.state.user.id" ref="imagefile" type="file" accept="image/*" @change="preview"/>
                <label id="upload-label" v-if="user.id===$store.state.user.id"></label>
           </div>
            <div id="dp-buttons" v-if="item.imageUrl">
                <button id="postpicture" class="badge bg-info" v-on:click.prevent="postPicture">Post</button><!--to .prevent default function of click-->
                <button id="cancelpost" class="badge bg-secondary" v-on:click.prevent="reset">Cancel</button>
                <div>
                    <label class="progress-bar bg-info progress-bar-striped" style= "width:40%" v-if="!gotResponse && postRequestSent">Uploading... Please wait...</label>
                    <label style="color: blue; font-weight: bold" v-else-if="gotResponse">Picture uploaded!</label>
                </div> 
            </div>
            <div id="user-detail">
                
                <div>Username : {{user.username}}</div>
                <div>First Name : {{user.firstName}}</div>
                <div>Last Name : {{user.lastName}}</div>
                <div>email : {{user.email}}</div>
                <div id="post-section-header">{{user.firstName}} {{user.lastName}}'s Posts:</div>
            </div>
            <div id="remove-post" v-if="user.id===$store.state.user.id">
                <button id="remove-post-button" @click.prevent="deletePosts">Delete Selected Posts</button>
                <home id="posts" v-bind:userId_filter="userId"></home>
            </div>
            
        </div>
</template>

<script>
//import Header from "./Header.vue";
import photoService from "../services/PhotoService.js";
import Home from "./Home.vue";

export default {
    name: "userprofile",
    components: {
        Home   
    },
    data() {
        return {
            userId: null,
            user: {
                id: null,
                email: null,
                username: null,
                firstName: null,
                lastName: null,
                profileImage: null,
            },
            item:{
                //...
                image : null,
                imageUrl: null,
                caption: null
            },
            gotResponse: false,
            postRequestSent: false
        };
    },
    created() {
        this.userId = this.$route.params.userId;
        photoService.getUser(this.userId).then(response => {
            const data = response.data;
            this.user.id = data.id;
            this.user.email = data.email;
            this.user.username = data.username;
            this.user.firstName = data.firstName;
            this.user.lastName = data.lastName;
            this.user.profileImage = data.profileImage;
        });
    },
    methods: {
        preview(event) {
            const file = event.target.files[0]//to retrieve data from event
            this.item.image = file
            this.item.imageUrl = URL.createObjectURL(file)
        },
        postPicture() {
            this.postRequestSent = true;
            photoService.addDisplayPicture(this.item.image).then(response => {
                if(response.status === 200){
                    this.gotResponse = true;
                }
            }).catch(error => {
                alert(error.response.status);
                alert('Photo upload failed');
            });
        },
        deletePosts(){
            photoService.deletePosts(this.$store.state.postsToDelete).then(response => {
                if(response.status === 204){
                    this.$store.state.postsToDelete.forEach(post => {
                        this.$store.commit('REMOVE_POST_TO_DELETE', post);
                    });
                    this.$store.commit('RESET_POSTS_TO_DELETE');
                }
            });
        },
        reset(){
          this.item.image = null,
          this.item.imageUrl = null,
          this.item.caption = null,
          this.gotResponse = false,
          this.postRequestSent = false;
      }
    }
}
</script>

<style>
#user-profile{
    display: grid;
    grid-template-rows: fr 1fr 1fr 1fr 2fr;
    grid-template-areas: "profile-pic user-detail"
                         "upload-label upload-label"
                         "upload-dp upload-dp"
                         "dp-buttons dp-buttons"
                         "posts posts";
                         
}
#profile-pic {
    margin-top: 10%;
    margin-left: 15%;
    grid-area: profile-pic;
    align-self: center;
    
}
#user-detail {
    grid-area: user-detail;
    align-self: center;
    font-family:"Billabong";
    font-size: 50px;
    
}
#posts {
    grid-area: posts;
}
#upload-dp{
    grid-area: upload-label;
    margin-left: 25%;
    align-self: center;
}
#upload-label{
    grid-area: upload-label;
    margin-left: 30%;
    margin-bottom: 10px;
    align-self: center;
}

#dp-buttons{
    grid-area: posts;
    margin-left: 30%;
    margin-top: 10px;
    align-self: center;
}

#profile-pic > img {
    max-width: 500px;
    max-height: 500px;
    min-width: 400px;
    border-radius: 300px;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
    
}

#remove-post {
    grid-area:  posts;
    margin-top: 3%;

    /* display: flex;
    align-content: flex-start; */
}

#remove-post-button{
    margin-left: 80%;
}

#upload {
    grid-area: upload-label;
}

#posts {
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}
#post-section-header {
    
    align-self: flex-end;
}
#postpicture{
    margin-left: 12%;
}
#cancelpost{
    margin-left: 12%;
}

</style>
