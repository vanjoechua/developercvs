<!-- App Main Structure -->
<template>
		<div>
				<AppBar></AppBar>
				<Drawer></Drawer>
				<ViewContainer></ViewContainer>
		</div>
</template>

<script>
		import AppBar from "../components/developercvs/AppBar";
		import Drawer from "../components/developercvs/Drawer";
		import ViewContainer from "../components/developercvs/ViewContainer";
		export default {
				name: "Layout",
				components: {ViewContainer, Drawer, AppBar},
				data: () => ({
						expandOnHover: false,
				}),
		}
</script>

<style scoped>

</style>
