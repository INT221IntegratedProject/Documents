<template>
    <div class="grid grid-cols-1 lg:grid-cols-2  mr-28 ml-24  p-1 mt-2 bg-white ">
        <div class="mb-2 flex justify-center items-center"><slot name = "image"></slot></div>
      
        
        <div class="text-left font-bold  flex justify-center items-center flex-col ">
        <h1 class="header text-2xl  lg:text-4xl "><slot name="memberName"></slot></h1>
        <h1 class=" text-sm lg:text-base  "><slot name="role" ></slot></h1>
        <h1 class="">ID <span class="text-xl">:</span> <slot name="studentId"></slot></h1>
    </div>
    </div>
 
</template>