<template>
		<v-footer
				id="dashboard-core-footer"
		>
				<v-container>
						<v-row
								align="center"
								no-gutters
						>
								<v-col
										cols="12"
										md="auto"
								>
								</v-col>
						</v-row>
				</v-container>
		</v-footer>
</template>

<script>
		export default {
				name: 'Footer',

				data: () => ({
						links: [
								{
										href: '#',
										text: 'Creative Tim',
								},
								{
										href: '#',
										text: 'About Us',
								},
								{
										href: '#',
										text: 'Blog',
								},
								{
										href: '#',
										text: 'Licenses',
								},
						],
				}),
		}
</script>

<style lang="sass">
		#dashboard-core-footer
				a
						font-size: .825rem
						font-weight: 500
						text-decoration: none
						text-transform: uppercase
</style>
