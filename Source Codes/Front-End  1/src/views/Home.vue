<template>
   <div class="  min-h-screen bg-cover bg-center bg-opacity-50 overflow-hidden"
    style="
      background-image: url(https://i.pinimg.com/originals/5c/a4/e5/5ca4e561cbf520655bd71351ea61ba98.gif);
    " >
  
    <!-- <video autoplay muted loop id="myVideo" class="fixed bg-cover min-w-screen min-h-screen -z-99">
      <source src="../assets/Apple_1.mp4" type="video/mp4" />
    </video> -->
    

    <div class="h-screen w-screen text-center flex justify-center items-center text-white">
      <div>
        <h1 class="text-5xl font-bold ">Welcome to the PICKA CASE</h1>
       
        <br />
        <router-link to="/products">
          <base-button
            buttonLabel="Case"
            buttonColor="bg-gray-800"
            textColor="text-white"
            borderColor="border-transparent"
            class="text-3xl "/>
  </router-link>
      </div>
    </div>
  </div>
</template>

<script>


export default {
  name: "Home",
  components: {},
};
</script>
