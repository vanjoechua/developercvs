<template>
		<v-content>
				<router-view></router-view>
				<Footer></Footer>
		</v-content>
</template>

<script>
		export default {
				name: 'ViewContainer',
				components: {
						Footer: () => import('./Footer'),
				},
		}
</script>
