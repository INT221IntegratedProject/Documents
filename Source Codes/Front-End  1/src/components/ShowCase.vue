<template>
    <div  class="flex flex-wrap justify-center m-4 space-x-2 gap-1" >
        <div  v-for="proCase in ShowCase" :key="proCase.caseId" :value="proCase" class=" w-48 h-full md:m-2 bg-white rounded-md border-2 hover:bg-gray-300  border-gray-300 mt-4 hover:border-gray-600   "  >
            <div class="flex justify-center items-center">
                <img :src="'http://52.139.201.170:8086/api/products/image/'+proCase.caseImage" class="object-cover w-40 h-64 m-2 " />
            </div>
        <div class="col-span-2 ">
            <h4 class="font-bold  ">{{ proCase.caseName }}</h4>
            <div class="flex flex-row justify-center space-x-0.5 mx-5 my-2">
             <label  v-for=" (c,index) in proCase.color" :key="index" class=" rounded-full bg-black h-8 w-8 shadow-inner" 
                    :class="c.caseColor ? 'bg-caseCol-' + c.caseColor.toLowerCase(): '' "></label>
            </div>
            <p class="text-bold ">{{ proCase.brand.caseBrand  }} </p>
            <p >{{ proCase.casePrice + ".-" }}</p>
        </div>
        <div class="ml-auto my-2">
            <button class="bg-pink-300 py-2 px-3"  @click="editClick(proCase)">
                <i class="fas fa-pen"></i>
            </button>
            <button class="bg-purple-300 py-2 px-3 mx-2" @click="deleteCase(proCase.caseId)">
                <i class="fas fa-trash"></i>
            </button>
        </div>
      </div> 
      
  </div>
  <!-- </div> -->

</template>
<script>
import axios from 'axios'

export default {
 emits: ['edit-click','send-data'],
 
  components: {
    
  },
  data() {
    return {
      offset: 0,
      limit: 8,
      ShowCase:[],
      click: true,
    };
  },
  methods:{
    showProduct() {
        axios.get(`${process.env.VUE_APP_ROOT_API}api/products/`).then((response) => {
          this.ShowCase = response.data;
          console.log("xx : "+this.ShowCase)
        }).then(function(){
            console.log('SUCCESS products')
          })
          .catch(function(){
            console.log('FAILURE  products')
          });               
    },
    async deleteCase(id){
      await axios.delete(`${process.env.VUE_APP_ROOT_API}api/products/${id}`)
      for(let i = 0; i< this.ShowCase.length;i++ ){
        if(this.ShowCase[i].caseId == id){
          this.ShowCase.splice(i,1)
        }
      }
    },
    editClick(proCase) {
      
      this.$emit("edit-click", true);
      this.$emit("send-data", proCase);

    }
 
  },
  async created() {
    await this.showProduct();
  }
}
</script>
