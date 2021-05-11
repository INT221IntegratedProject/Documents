<template >
  <div class="mx-auto  max-w-6xl ">
    <div class=" flex justify-center item-center ">
    <h1 class=" mt-24 mb-10 text-5xl font-bold text-black ">
      Team Member
    </h1>
  </div>

      <div class="w-full p-3 transform transition duration-500 hover:scale-110">
        <Card-Member  v-for="member in members" :key="member.name"
          class="bg-white rounded-lg shadow-lg overflow-hidden flex-1 flex flex-col hover:bg-black hover:text-white "
        >
        <template v-slot:image >
          <img class="w-44 h-44  mt-2 mx-auto rounded-full" :src="require(`../assets/${member.image}`)"></template>

            <template v-slot:studentId >{{ member.studentId }}</template>
            
              <template v-slot:memberName >{{ member.name }}</template>
              
              
               <template v-slot:role>{{ member.role }}</template>
            
        </Card-Member>
      </div>

   </div>
  

</template>
<script>
    import CardMember from '../components/CardMember.vue';
export default {
components: {
    CardMember
},  
data() {
    return {
        
        members: [
        {
            image: "1.png",
            name : "Thanaphat Dararat",
            role : "Back-End Devops Database",
            studentId : "62130500032",
        },
        {
            image: "36833.jpg",
            name : "Paweena Thongyan",
            role : "FrontEnd Devops Network",
            studentId : "62130500053",
        }, 
        {
            image: "2.jpg",
            name : "Anuttree Tipmom",
            role : "FrontEnd Devops Database ",
            studentId : "62130500101",
        }
        ]
    }
},
}
</script>


