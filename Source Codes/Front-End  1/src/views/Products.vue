<template>
  <div
    class="flex justify-center items-center bg-cover bg-center w-screen min-h-screen"
    style="background-image: url()"
  >
    <!-- block image to search and can edit , delete  -->
    <div
      class="h-screen md:w-4/6 bg-white bg-opacity-50 items-center md:mx-auto rounded-xl mt-16 lg:md-20"
    >
      <div class="mt-3 text-center">
        <!-- Search -->
        <div
          class="flex justify-center items-center text-center flex-col v-show="
        >
          <input
            v-model="inputSearch"
            placeholder="What are you finding?"
            class="p-2 bg-white w-full rounded border"
          />
          <!-- if notfound Show ... -->
          <p v-if="notFound" class="text-center text-xl mt-4">
            We can't find the Case
          </p>
        </div>
        <showcase 
        @edit-click="openEditModal" @send-data="editCase"></showcase>
      </div>
    </div>
  </div>

  <inputdata
    v-if="addClicked"
    @close="changeAddItemClicked"
    formLabel="Add New Case"
  ></inputdata>

  <inputdata
    v-if="editClicked"
    :product="editProducts"
    @close="changeEditItemClicked"
    formLabel="Edit Case"
  ></inputdata>
</template>

<script>
import showcase from "../components/ShowCase";
import inputdata from "../components/AddProduct";
export default {
  emits: ["close-add-modal"],
  props: ["addClicked",],
  components: {
    inputdata,
    showcase,
  },
 data() {
    return {
      addProd: false,
      showC:false,
      editClicked: false,
      inputSearch: "",
      notFound: false,
      editProducts: [],
      
    };
  },
  methods: {
    changeAddItemClicked(value) {
      this.$emit("close-add-modal", value);
    }, 
    changeEditItemClicked(value) {
      this.editClicked = !value;
    },
    changeNotFound(value) {
      this.notFound = value;
    },
    closeCase() {
      this.caseNow = false;
    },
    openEditModal(value){
        console.log("MK"+value)
        this.editClicked = value;
        console.log(value)
        
    },
    editCase(editingCase){
        this.editProducts=editingCase;        
    },
  }
};
</script>
