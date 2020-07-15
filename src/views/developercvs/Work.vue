<template>
	<div :style="'height: ' + tabHeight + 'px !important'">
		<v-container fluid>
			<v-row no-gutters>
				<v-col cols="12" class="d-flex flex-row justify-space-between align-center">
					<span class="text-h2 font-weight-light">My Work Experience</span>
					<v-btn
						fab
						small
						@click="openExperienceDialog(null)"
					><v-icon>fas fa-plus</v-icon>
					</v-btn>
				</v-col>
			</v-row>
			<div :style="'height: ' + (tabHeight - 20) + 'px !important; overflow-y: auto'">
				<v-row no-gutters>
					<v-col cols="12" v-for="work in allWork" :key="work.Work.id">
						<v-card class="mx-auto d-flex flex-column justify-space-between mt-3">
							<v-card-title>
								<span>{{ workRoles.find(role => role.id == work.Work.jobRole).title }}</span>
								<span class="ml-2">{{ '@ ' + workLocations.find(location => location.id == work.Work.workLocation).title }}</span>
								<v-spacer></v-spacer>
								<span>{{ work.Work.yearStarted.toString() + (work.Work.yearLeft ? ' - ' + work.Work.yearLeft.toString() : ' - current')}}</span>
							</v-card-title>
							<v-card-text>
								<v-row no-gutters class="pt-3">
									<v-col cols="2">Responsibilities:</v-col>
									<v-col cols="10"><span v-html=" nl2br(work.Work.responsibilities)"></span></v-col>
								</v-row>
								<v-row no-gutters class="pt-3">
									<v-col cols="2">Accomplishments:</v-col>
									<v-col cols="10"><span v-html=" nl2br(work.Work.accomplishments)"></span></v-col>
								</v-row>
								<v-row no-gutters class="align-center pt-3">
									<v-col cols="2" lg="2" md="2">Technologies used:</v-col>
									<v-col cols="10" lg="10" md="10" class="d-flex flex-row">
										<span v-for="technology in work.Work.technologies" class="ml-5">
											<v-img :src="technologies.find(tech=>tech.id === technology).icon" width="40"></v-img>
										</span>
									</v-col>
								</v-row>
								<v-row no-gutters>
									<v-col cols="12">
										<v-btn icon small class="float-right"><v-icon small>fas fa-trash-alt</v-icon></v-btn>
										<v-btn icon small class="float-right" @click="openExperienceDialog(work)"><v-icon small>fas fa-edit</v-icon></v-btn>
									</v-col>
								</v-row>
							</v-card-text>
						</v-card>
					</v-col>
				</v-row>
			</div>
		</v-container>
		<v-dialog
			persistent
			v-model="workDialog"
			width="700"
			max-width="700"
		>
			<v-card rounded>
				<v-card-title class="default text-left font-weight-bold">{{ workDialogTitle }}</v-card-title>
				<v-card-text>
					<v-row no-gutters class="d-flex flex-row align-center pt-3">
						<v-col cols="3">Company:</v-col>
						<v-col cols="9">
							<v-select
								:items="workLocations"
								clearable
								dense
								hide-details
								item-value="id"
								item-text="title"
								solo
								v-model="WorkToUpdate.workLocation"
							></v-select>
						</v-col>
					</v-row>
					<v-row no-gutters class="d-flex flex-row align-center pt-3">
						<v-col cols="3">Role:</v-col>
						<v-col cols="9">
							<v-select
								:items="workRoles"
								clearable
								dense
								hide-details
								item-value="id"
								item-text="title"
								solo
								v-model="WorkToUpdate.jobRole"
							></v-select>
						</v-col>
					</v-row>
					<v-row no-gutters class="d-flex flex-row align-center pt-3">
						<v-col cols="3">Year employed:</v-col>
						<v-col cols="9">
							<v-text-field
								clearable
								dense
								hide-details
								solo
								v-model="WorkToUpdate.yearStarted"
							></v-text-field>
						</v-col>
					</v-row>
					<v-row no-gutters class="d-flex flex-row align-center pt-3">
						<v-col cols="3">Year left:</v-col>
						<v-col cols="9">
							<v-text-field
								dense
								hide-details
								solo
								v-model="WorkToUpdate.yearLeft"
							></v-text-field>
						</v-col>
					</v-row>
					<v-row no-gutters class="d-flex flex-row align-center pt-3">
						<v-col cols="3">Responsibilities:</v-col>
						<v-col cols="9">
							<v-textarea
								clearable
								dense
								hide-details
								solo
								v-model="WorkToUpdate.responsibilities"
							></v-textarea>
						</v-col>
					</v-row>
					<v-row no-gutters class="d-flex flex-row align-center pt-3">
						<v-col cols="3">Accomplishments:</v-col>
						<v-col cols="9">
							<v-textarea
								clearable
								dense
								hide-details
								solo
								v-model="WorkToUpdate.accomplishments"
							></v-textarea>
						</v-col>
					</v-row>
					<v-row no-gutters class="d-flex flex-row align-center pt-3">
						<v-col cols="3">Technologies used:</v-col>
						<v-col cols="9">
							<v-select
								:items="technologies"
								chips
								clearable
								dense
								hide-details
								item-value="id"
								item-text="title"
								multiple
								solo
								v-model="WorkToUpdate.technologies"
							></v-select>
						</v-col>
					</v-row>
				</v-card-text>
				<v-card-actions>
					<v-spacer></v-spacer>
					<v-btn
						@click="workDialog = false"
						class="ml-3"
						color="default"
						small
					>Close
					</v-btn>
					<v-btn
						class="ml-3"
						color="info"
						small
						@click="addWork"
					>Save
					</v-btn>
				</v-card-actions>
			</v-card>
		</v-dialog>
	</div>
</template>

<script>
	import {mapMultiRowFields} from "vuex-map-fields";
	export default {
		name: "Work",
		data(){
			return {
				tabHeight: window.innerHeight - (145),
				technologies: [
					{id: 'php', title: 'PHP', icon: '/static/img/technologies/php.png'},
					{id: 'js', title: 'JavaScript', icon: '/static/img/technologies/js.png'},
					{id: 'python', title: 'Python', icon: '/static/img/technologies/python.png'},
					{id: 'csharp', title: 'C#', icon: '/static/img/technologies/csharp.png'},
					{id: 'java', title: 'Java', icon: '/static/img/technologies/java.png'},
					{id: 'mysql', title: 'MySQL', icon: '/static/img/technologies/mysql.png'},
					{id: 'mssql', title: 'MSSQL', icon: '/static/img/technologies/mssql.png'},
					{id: 'mongo', title: 'MongoDB', icon: '/static/img/technologies/mongo.png'},
					{id: 'html', title: 'HTML', icon: '/static/img/technologies/html.png'},
					{id: 'css', title: 'CSS', icon: '/static/img/technologies/css.png'},
					{id: 'scss', title: 'SCSS', icon: '/static/img/technologies/scss.png'},
					{id: 'wp', title: 'Wordpress', icon: '/static/img/technologies/wp.png'},
					{id: 'drupal', title: 'Drupal', icon: '/static/img/technologies/drupal.png'},
					{id: 'laravel', title: 'Laravel', icon: '/static/img/technologies/laravel.png'},
					{id: 'nodejs', title: 'NodeJS', icon: '/static/img/technologies/nodejs.png'},
				],
				workDialog: false,
				workDialogTitle: null,
				workLocations: [
					{id: 'widgets', title: 'Widgets Inc.', icon: ''},
					{id: 'ibm', title: 'IBM', icon: ''},
					{id: 'google', title: 'Google', icon: ''},
					{id: 'yahoo', title: 'Yahoo', icon: ''},
					{id: 'amazon', title: 'Amazon', icon: ''}
				],
				workRoles: [
					{id: 'pm', title: 'Project Manager'},
					{id: 'frontdev', title: 'Frontend Developer'},
					{id: 'backdev', title: 'Backend Developer'},
					{id: 'fullstackdev', title: 'Full Stack Developer'},
					{id: 'mobiledev', title: 'Mobile Developer'},
					{id: 'devops', title: 'DevOps'},
					{id: 'datasci', title: 'Data Scientist'},
				],
				WorkToUpdate: {
					id: null,
					accomplishments: null,
					workLocation: null,
					jobRole: null,
					yearStarted: null,
					yearLeft: null,
					responsibilities: null,
					technologies: []
				}
			}
		},
		computed: {
			...mapMultiRowFields('cvs',{
				allWork: 'allWork'
			})
		},
		methods: {
			addWork(){

			},
			openExperienceDialog (work) {
				this.workDialog = true
				if(work){
					this.workDialogTitle = 'Update your Work Experience'
					this.WorkToUpdate.id = work.Work.id
					this.WorkToUpdate.accomplishments = work.Work.accomplishments
					this.WorkToUpdate.workLocation = work.Work.workLocation
					this.WorkToUpdate.jobRole = work.Work.jobRole
					this.WorkToUpdate.yearStarted = work.Work.yearStarted
					this.WorkToUpdate.yearLeft = work.Work.yearLeft
					this.WorkToUpdate.responsibilities = work.Work.responsibilities
					this.WorkToUpdate.technologies = work.Work.technologies
				} else {
					this.workDialogTitle = 'Add a new Work Experience'
					this.WorkToUpdate.id = null
					this.WorkToUpdate.accomplishments = null
					this.WorkToUpdate.workLocation = null
					this.WorkToUpdate.jobRole = null
					this.WorkToUpdate.yearStarted = null
					this.WorkToUpdate.yearLeft = null
					this.WorkToUpdate.responsibilities = null
					this.WorkToUpdate.technologies = []
				}
			},
			nl2br (str, is_xhtml) {
				if (typeof str === 'undefined' || str === null) {
					return '';
				}
				var breakTag = (is_xhtml || typeof is_xhtml === 'undefined') ? '<br />' : '<br>';
				return (str + '').replace(/([^>\r\n]?)(\r\n|\n\r|\r|\n)/g, '$1' + breakTag + '$2');
			}
		},
		created(){}
	}
</script>

<style scoped>

</style>