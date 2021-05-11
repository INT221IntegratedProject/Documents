<template>
  <div class="fixed z-10 inset-0 overflow-y-auto  ">
    <div class="flex items-end justify-center min-h-screen pt-4 px-4 pb-20 text-center sm:block sm:p-0">
      <div class="fixed inset-0 bg-gray-500 bg-opacity-75 transition-opacity"></div>
      <span class="hidden sm:inline-block sm:align-middle sm:h-screen">&#8203;</span>
      <div
        class="inline-block align-bottom bg-white rounded-lg text-left overflow-hidden shadow-xl transform transition-all sm:my-8 sm:align-middle sm:max-w-2xl sm:w-full">
        <form @submit.prevent="checkForm">
          <div class="bg-gray-200 px-4 pt-5 pb-4 ">
            <div class="mt-3 text-center md:mt-0 md:ml-4 ">
              <h3 class="text-2xl font-medium text-gray-900" id="modal-title">
                {{ formLabel }}
              </h3>
              <div class="mt-4 ">
                <div class="grid sm:grid-cols-3 gap-6">
                  <div class="flex flex-col justify-center ">
                    <img v-show="!enableHolder.holder" src="@/assets/placeholder.png" class="input-image-get  " />
                    <img v-show="enableHolder.holder" :src="CaseImage" class="input-image-get" />

                    <br />
                    <div class="relative overflow-hidden inline-block ">
                      <base-button buttonLabel="Upload Image" buttonColor="bg-black" textColor="text-white"
                        borderColor="border-black"></base-button>
                      <input id="file-input" type="file" @change="uploadPhoto"
                        class="absolute top-0 left-0 opacity-0 h-10" />
                    </div>
                    <i class="text-sm text-red-500" v-if="this.invalid.incaseimage"> Invalid validate Image! </i>
                  </div>
                  <div class="col-span-2">
                    <div>
                      <label for="CaseName" class="text-lg font-medium">Case Name</label>
                      <br />
                      <input type="text" id="CaseName" v-model="products.caseName" name="CaseName"
                        class="border w-11/12 mt-2 rounded h-10 text-md" />
                      <br />
                      <i class="text-sm text-red-500" v-if="this.invalid.incaseName"> Invalid validate name! </i>
                    </div>
                    <div class="mt-4 flex col">

                      <div class="ml-5">
                        <label for="CaseBrand" class="text-lg font-medium">Brand</label>
                        <br />
                        <div>
                          <select class="bg-gray-100 rounded py-2 mb-4 w-40" id="caseBrand" name="caseBrand"
                            v-model="products.brand">
                            <option disabled value="">Brands</option>
                            <option v-for="brand in ShowBrand" :key="brand" :value="brand" selected>
                              {{ brand.caseBrand }}
                            </option>
                          </select>
                          <br />
                          <i class="text-sm text-red-500" v-if="this.invalid.inbrand"> Invalid validate brand! </i>
                        </div>
                      </div>

                      <div class="mr-5 ml-10">
                        <p class="text-lg font-medium">Color</p>
                        <div class="grid grid-cols-4 -ml-3">
                          <div v-for="color in ShowColor" :key="color.codeColor" class="m-2">
                            <input type="checkbox" :id="color.caseColor" :value="color" class="hidden"
                              v-model="products.color" />
                            <label @click="color.checked = !color.checked" :for="color.caseColor"
                              class="flex rounded-full bg-black h-8 w-8 shadow-inner" :class="
                                color.caseColor ? 'bg-caseCol-' + color.caseColor.toLowerCase(): '' ">
                              <span v-show="color.checked"
                                class="flex mx-auto items-center material-icons text-white">done</span>
                            </label>
                          </div>
                        </div>
                        <div class="">
                          <i class="text-sm text-red-500" v-if="this.invalid.incaseColor"> Invalid validate color! </i>
                        </div>
                      </div>
                    </div>

                    <div class="mt-2">
                      <label for="CDescription" class="text-lg font-medium">Case description</label>
                      <br />
                      <textarea rows="5" cols="50" type="text" id="CDescription" v-model="products.caseDescription"
                        name="CaseDescription" class="border w-11/12 mt-2 h-12 rounded text-mg" />
                      <i class="text-sm text-red-500" v-if="this.invalid.incaseDes"> Invalid validate Description! </i>
                    </div>
                  
                    <div class="mt-4 flex col ml-5">
                      <div class="mt-2 flex flex-col ">
                        <label for="CaseDate" class="text-lg font-medium">Date</label>
                        <input type="date" id="CaseDate" class="w-6/8 mt-4 rounded h-10 text-md" name="CaseDate" v-model="products.caseDate"/>
                        <br/>
                        <div>
                          <i class="text-sm text-red-500" v-if="this.invalid.incaseDate"> Invalid validate Date! </i>
                        </div>
                      </div>
                      <div class="mt-2 ml-6 flex flex-col">
                        <label for="CasePrice" class="text-lg font-medium mr-10">Price</label>
                        <input type="number" id="CasePrice" step="0.01" v-model="products.casePrice" name="CasePrice" class="w-4/5 mt-4  rounded h-10 text-md"/>
                        <br />
                        <i class="text-sm text-red-500" v-if="this.invalid.incasePrice"> Invalid validate Price! </i>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div  class="bg-gray-200 px-4 py-3 sm:px-6 flex sm:flex-row-reverse justify-center">
            <base-button buttonLabel="Save" buttonColor="bg-pink-300" textColor="text-white" buttonType="submit"/>
          </div>
          
        </form>
        <div class="bg-gray-200 px-4 py-3 sm:px-6 flex sm:flex-row-reverse justify-center ">
          <base-button  buttonLabel="Cancel" buttonColor="bg-purple-300" textColor="text-black" borderColor="border-grey-400" @click="closeCurrentModal" />
        </div>
      </div>
    </div>
  </div>

</template>

<script>
import CaseImage from "../assets/placeholder.png";
import axios from "axios";

export default {
   emits: ["close"],
   props: [ "product" ],
  data() {
    return {
      products: {
        caseName: "",
        caseDescription: "",
        caseDate: "",
        casePrice: "",
        brand: {
                codeBrand: 0,
                caseBrand: ""
       },
        color: [],
      },
      ShowBrand: [],
      ShowColor: [],
      enableHolder:{
        holder: false
      },
      caseImage:  CaseImage,
      invalid: {
        incaseName: false,
        incaseDes: false,
        incaseDate: false,
        incasePrice: false,
        incaseimage: false,
        inbrand: false,
        incaseColor: false
      },
      enterEditMode:false,
      
      
    };
  },
  methods: {
    SentData(id){
      if(this.enterEditMode==false){
                let formData = new FormData()
                let caseJson = JSON.stringify(this.products);
                //change prodJson to Blob
                const caseBlob = new Blob([caseJson],{
                    type: 'application/json'
                })
                const imageBlob = new Blob([this.caseImage],{
                    type: 'application/json'
                })
                //add image to formdata            
                formData.append("imageFile",imageBlob)
                formData.append('body',caseBlob)
                console.log(formData.getAll("newProduct"))
                //post to backend by multipart
                axios.post(`${process.env.VUE_APP_ROOT_API}api/products/`, formData,
                {
                    headers: {
                        'Content-Type': 'multipart/form-data',                   
                    }
                }).then(function(){
                    console.log('SUCCESS')
                })
                .catch(function(){
                    console.log('FAILURE')
                })
                console.log(caseJson) 
                }else{
                  let formData = new FormData()
                let caseJson = JSON.stringify(this.products);
                //change prodJson to Blob
                const caseBlob = new Blob([caseJson],{
                    type: 'application/json'
                })
                const imageBlob = new Blob([this.caseImage],{
                    type: 'application/json'
                })
                //add image to formdata            
                formData.append("imageFile",imageBlob)
                formData.append('body',caseBlob)
                console.log(formData.getAll("newProduct"))
                //post to backend by multipart
                axios.put(`${process.env.VUE_APP_ROOT_API}api/products/${id}`, formData,
                {
                    headers: {
                        'Content-Type': 'multipart/form-data',                   
                    }
                }).then(function(){
                    console.log('SUCCESS')
                })
                .catch(function(){
                    console.log('FAILURE')
                })
                console.log(caseJson) 
    }          
                
     },checkForm() {
        this.invalid.incaseName = this.products.caseName === "" || this.products.caseName.length > 20 ? true : false;
        this.invalid.incaseDes = this.products.caseDescription === "" ? true : false;
        this.invalid.incasePrice = this.products.casePrice === "" ? true : false;
        this.invalid.incaseDate = this.products.caseDate === "" ? true : false;
        this.invalid.incaseColor = this.products.color.length === 0  ? true : false;
        this.invalid.inbrand = this.products.brand.caseBrand === "" ? true : false;

      if(
        this.invalid.incaseName ||
        this.invalid.incaseDes ||
        this.invalid.incasePrice ||
        this.invalid.incaseDate ||
        this.invalid.incaseColor ||
        this.invalid.inbrand === true
        ){console.log("false")
      }
      else {
        this.SentData();
        this.closeCurrentModal();
      }
     },
    
    closeCurrentModal() {
     this.$emit("close", true);
    },
    uploadPhoto(e) {
      this.enableHolder.holder = false;
      const file = e.target.files[0];
      const reader = new FileReader();
      reader.onload = (e) => {
        this.CaseImage = e.target.result;
        this.enableHolder.holder = true;
      };
      reader.readAsDataURL(file);
    },
    ChooseBrand() {
      axios.get(`${process.env.VUE_APP_ROOT_API}api/brands`).then((response) => {
        this.ShowBrand = response.data;
      }).then(function(){
      console.log('SUCCESS Brands')
      })
      .catch(function(){
      console.log('FAILURE Brands')
      });
    },
    ChooseColor() {
      return axios.get(`${process.env.VUE_APP_ROOT_API}api/colors`).then((response) => {
        this.ShowColor = response.data;
      }).then(function(){
      console.log('SUCCESS COLORS')
      }).catch(function(){
      console.log('FAILURE COLORS')
      });
    },
  },
 
  async created() {
    await this.ChooseBrand();
    await  this.ChooseColor();
    if(this.product!=undefined){
    this.enterEditMode==true;
    this.products = this.product;
    this.products.color = this.products.color.map(c=>c={codeColor: c.codeColor,
        caseColor: c.caseColor,checked:true})
    console.log(this.ShowColor)
    for(let i=0;i<this.ShowColor.length;i++){
      if(this.products.color.map(c=>c.codeColor).includes(this.ShowColor[i].codeColor) ){
        this.ShowColor[i]=this.products.color.filter(c=>c.codeColor==this.ShowColor[i].codeColor)[0]  
      }
    }
    console.log(this.ShowColor)
    console.log(this.products.color)
    }
    await console.log("Brands : ", this.ShowBrand);
    await console.log("Colors : ", this.ShowColor);
  },
};
</script>