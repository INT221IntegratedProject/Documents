<template>
  <div class="w-screen" :class="[fixedNav, bgColor]">
    <div
      class="hidden container mx-auto md:flex items-center py-2 md:justify-between md:relative"
    >
      <h1 class="text-2xl text-white font-medium pl-44">
        <router-link to="/">PICKA</router-link>
      </h1>
      <div class="pr-44 md:block">
        <base-button
          buttonLabel="+ New Case"
          textColor="text-white"
          borderColor="border-transparent"
          v-if="$route.path === '/products'"
          @click="changeAddItemClicked"
        />
        <router-link to="/products" v-else>
          <base-button
            buttonLabel="Case"
            textColor="text-white"
            borderColor="border-transparent"
          />
        </router-link>
        <router-link to="/about">
          <base-button
            buttonLabel="Member"
            textColor="text-white"
            borderColor="border-transparent"
          />
        </router-link>
      </div>
    </div>

    <div class="flex items-center pl-3 w-screen  h-14 bg-black md:hidden">
      <h1 class="block px-4 py-2 text-md capitalize text-white font-medium">
        <router-link to="/">PICKA</router-link>
      </h1>
      <div class="flex flex-grow justify-end pr-5">
        <button
          @click="dropdownOpen = !dropdownOpen"
          class="rounded-md focus:outline-none"
        >
          <span class="material-icons font-medium text-white mr-5">menu</span>
        </button>
      </div>

      <div
        v-show="dropdownOpen"
        class="absolute right-0  mt-32  py-1 w-full bg-black shadow-md"
      >
        <div class="flex justify-center">
          <base-button
            buttonLabel="+ New Case"
            textColor="text-white"
            borderColor="border-transparent"
            v-if="$route.path === '/products'"
            @click="changeAddItemClicked"
          />
          <router-link to="/products" v-else>
            <base-button
              buttonLabel="Case"
              textColor="text-white"
              borderColor="border-transparent"
            />
          </router-link>
        </div>
        <div class="flex justify-center">
          <router-link to="/about">
            <base-button
              buttonLabel="Member"
              textColor="text-white "
              borderColor="border-transparent"
            />
          </router-link>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  props: ["fixedNav", "bgColor"],
  emits: ["add-clicked"],
  data() {
    return {
      addItemClicked: false,
      dropdownOpen: false,
    };
  },
  methods: {
    changeAddItemClicked() {
      this.addItemClicked = true;
      this.$emit("add-clicked", this.addItemClicked);
      this.addItemClicked = false;
    },
  },
};
</script>