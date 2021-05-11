<template>
    <button class="ml-4 py-2 px-4 font-medium rounded-md transition ease-in duration-100  hover:bg-white hover:text-black hover:border hover:border-black" :class="[buttonColor, textColor, borderColor]" :type="buttonType"> {{ buttonLabel }}</button>
</template>
<script>
export default {
    props: ['buttonLabel','buttonColor','textColor','borderColor','buttonType'],
}
</script>