<template>
	<div :style="'height: ' + tabHeight + 'px !important'">
		<v-container fluid>
			<v-row no-gutters>
				<v-col cols="12" class="d-flex flex-row justify-space-between align-center">
					<span class="text-h2 font-weight-light">My Personal Information</span>
				</v-col>
			</v-row>
			<v-row no-gutters>
				<v-col cols="12">
					<v-card class="mx-auto d-flex flex-column justify-space-between mt-3">
						<v-card-text>
							<v-row no-gutters class="align-center">
								<v-col cols="2">First Name:</v-col>
								<v-col cols="4">
									<v-text-field
										autocomplete="new-password"
										clearable
										dense
										hide-details
										solo
										v-model="Profile__firstName"
									></v-text-field>
								</v-col>
							</v-row>
							<v-row no-gutters class="pt-3 align-center">
								<v-col cols="2">Last Name:</v-col>
								<v-col cols="4">
									<v-text-field
										autocomplete="new-password"
										clearable
										dense
										hide-details
										solo
										v-model="Profile__lastName"
									></v-text-field>
								</v-col>
							</v-row>
							<v-row no-gutters class="pt-3 align-center">
								<v-col cols="2">Short Description of Myself:</v-col>
								<v-col cols="4">
									<v-text-field
										autocomplete="new-password"
										clearable
										dense
										hide-details
										solo
										v-model="Profile__headline"
									></v-text-field>
								</v-col>
							</v-row>
							<v-row no-gutters class="pt-3 align-center">
								<v-col cols="2">Address:</v-col>
								<v-col cols="4">
									<v-textarea
										autocomplete="new-password"
										clearable
										dense
										hide-details
										solo
										v-model="Profile__address"
									></v-textarea>
								</v-col>
							</v-row>
							<v-row no-gutters class="pt-3 align-center">
								<v-col cols="2">Country:</v-col>
								<v-col cols="4">
									<v-select
										:items="countries"
										clearable
										dense
										hide-details
										item-value="id"
										item-text="title"
										solo
										v-model="Profile__country"
									>
									</v-select>
								</v-col>
							</v-row>
							<v-row no-gutters class="pt-3 align-center">
								<v-col cols="2">Email:</v-col>
								<v-col cols="4">
									<v-text-field
										autocomplete="new-password"
										clearable
										dense
										hide-details
										solo
										v-model="Profile__email"
									></v-text-field>
								</v-col>
							</v-row>
							<v-row no-gutters class="pt-3 align-center">
								<v-col cols="2">Website:</v-col>
								<v-col cols="4">
									<v-text-field
										autocomplete="new-password"
										clearable
										dense
										hide-details
										solo
										v-model="Profile__website"
									></v-text-field>
								</v-col>
							</v-row>
							<v-row no-gutters class="pt-3 align-center">
								<v-col cols="2">WhatsApp ID:</v-col>
								<v-col cols="4">
									<v-text-field
										autocomplete="new-password"
										clearable
										dense
										hide-details
										solo
										v-model="Profile__whatsapp"
									></v-text-field>
								</v-col>
							</v-row>
							<v-row no-gutters class="pt-3 align-center">
								<v-col cols="2">Skype ID:</v-col>
								<v-col cols="4">
									<v-text-field
										autocomplete="new-password"
										clearable
										dense
										hide-details
										solo
										v-model="Profile__skype"
									></v-text-field>
								</v-col>
							</v-row>
						</v-card-text>
						<v-card-actions>
							<v-spacer></v-spacer>
							<v-btn
								class="ml-3"
								color="info"
								small
								@click="saveProfile"
							>Save Profile
							</v-btn>
						</v-card-actions>
					</v-card>
				</v-col>
			</v-row>
		</v-container>
	</div>
</template>

<script>
	import {mapFields} from 'vuex-map-fields'
	export default {
		name: "Profile",
		data(){
			return {
				countries: [
					{id: 'ca', title: 'Canada'},
					{id: 'mx', title: 'Mexico'},
					{id: 'es', title: 'Spain'},
					{id: 'ph', title: 'Philippines'},
					{id: 'us', title: 'USA'}
				],
				tabHeight: window.innerHeight - (145),
			}
		},
		computed: {
			...mapFields('cvs',{
				Profile__firstName: 'Profile.firstName',
				Profile__lastName: 'Profile.lastName',
				Profile__headline: 'Profile.headline',
				Profile__country: 'Profile.country',
				Profile__address: 'Profile.address',
				Profile__whatsapp: 'Profile.whatsapp',
				Profile__skype: 'Profile.skype',
				Profile__email: 'Profile.email',
				Profile__website: 'Profile.website',
			}),
		},
		methods: {
			saveProfile(){

			}
		}
	}
</script>

<style scoped>

</style>
