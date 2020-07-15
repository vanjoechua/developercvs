<template>
	<div :style="'height: ' + tabHeight + 'px !important'">
		<v-container fluid>
			<v-row no-gutters>
				<v-col cols="12" class="d-flex flex-row justify-space-between align-center">
					<span class="text-h1 font-weight-light">My Projects</span>
					<v-btn
						fab
						@click="openProjectDialog(null)"
					><v-icon>fas fa-plus</v-icon>
					</v-btn>
				</v-col>
			</v-row>
			<v-row>
				<v-col cols="4" v-for="project in allProjects" :key="project.Project.id">
					<v-card class="mx-auto d-flex flex-column justify-space-between" height="375">
						<v-card-title class="d-flex flex-column justify-center">
							<span>{{ project.Project.title }}</span>
							<v-img :src="project.Project.icon" width="80"></v-img>
						</v-card-title>
						<v-card-text>
							<v-row no-gutters>
								<v-col cols="12" class="font-italic py-3 text-center">"{{ project.Project.description }}"</v-col>
								<v-col cols="12" class="text-center">{{ project.Project.position }}</v-col>
								<v-col cols="12" class="d-flex flex-column">
									<div>Type: <span class="font-weight-bold">{{ projectTypes.find((type) => type.id == project.Project.type).title }}</span></div>
									<div>Year started: <span class="font-weight-bold">{{ project.Project.yearStarted }}</span></div>
									<div>Year completed: <span class="font-weight-bold">{{ project.Project.yearCompleted ? project.Project.yearCompleted : 'N/A' }}</span></div>
									<div>Current status: <span class="font-weight-bold">{{ project.Project.ongoing ? 'On-going' : 'Completed' }}</span></div>
									<div>Repository: <a :href="project.Project.repository">Github</a></div>
									<div>Technologies used:</div>
									<div class="d-flex flex-row align-center justify-md-space-around">
										<span v-for="technology in project.Project.technologies" class="ml-5">
											<v-img :src="technologies.find(tech=>tech.id === technology).icon" width="40"></v-img>
										</span>
									</div>
								</v-col>
								<v-col cols="12">
									<v-btn icon small class="float-right"><v-icon small>fas fa-trash-alt</v-icon></v-btn>
									<v-btn icon small class="float-right" @click="openProjectDialog(project)"><v-icon small>fas fa-edit</v-icon></v-btn>
								</v-col>
							</v-row>
						</v-card-text>
					</v-card>
				</v-col>
			</v-row>
		</v-container>
		<v-dialog
			persistent
			v-model="projectDialog"
			width="500"
			max-width="500"
		>
			<v-card rounded>
				<v-card-title class="default text-left font-weight-bold">{{ projectDialogTitle }}</v-card-title>
				<v-card-text>
					<v-row no-gutters class="d-flex flex-row align-center">
						<v-col cols="4">Project title:</v-col>
						<v-col cols="8">
							<v-text-field
								clearable
								dense
								hide-details
								solo
								v-model="ProjectToUpdate.title"
							></v-text-field>
						</v-col>
					</v-row>
					<v-row no-gutters class="d-flex flex-row align-center pt-3">
						<v-col cols="4">Type:</v-col>
						<v-col cols="8">
							<v-select
								:items="projectTypes"
								clearable
								dense
								hide-details
								item-value="id"
								item-text="title"
								solo
								v-model="ProjectToUpdate.type"
							></v-select>
						</v-col>
					</v-row>
					<v-row no-gutters class="d-flex flex-row align-center pt-3">
						<v-col cols="4">Description:</v-col>
						<v-col cols="8">
							<v-textarea
								clearable
								dense
								height="70"
								hide-details
								solo
								v-model="ProjectToUpdate.description"
							></v-textarea>
						</v-col>
					</v-row>
					<v-row no-gutters class="d-flex flex-row align-center pt-3">
						<v-col cols="4">Year started:</v-col>
						<v-col cols="8">
							<v-text-field
								clearable
								dense
								hide-details
								solo
								v-model="ProjectToUpdate.yearStarted"
							></v-text-field>
						</v-col>
					</v-row>
					<v-row no-gutters class="d-flex flex-row align-center pt-3">
						<v-col cols="4">Year completed:</v-col>
						<v-col cols="8">
							<v-text-field
								dense
								hide-details
								solo
								v-model="ProjectToUpdate.yearCompleted"
							></v-text-field>
						</v-col>
					</v-row>
					<v-row no-gutters class="d-flex flex-row align-center pt-3">
						<v-col cols="4">Repository:</v-col>
						<v-col cols="8">
							<v-text-field
								dense
								hide-details
								solo
								v-model="ProjectToUpdate.repository"
							></v-text-field>
						</v-col>
					</v-row>
					<v-row no-gutters class="d-flex flex-row align-center pt-3">
						<v-col cols="4">Technologies used:</v-col>
						<v-col cols="8">
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
								v-model="ProjectToUpdate.technologies"
							></v-select>
						</v-col>
					</v-row>
					<v-row no-gutters class="d-flex flex-row align-center pt-3">
						<v-col cols="4">Ongoing?:</v-col>
						<v-col cols="8">
							<v-checkbox
								:true-value="true"
								class="mt-3"
								dense
								hide-details
								v-model="ProjectToUpdate.ongoing"
							></v-checkbox>
						</v-col>
					</v-row>
				</v-card-text>
				<v-card-actions>
					<v-spacer></v-spacer>
					<v-btn
						@click="projectDialog = false"
						class="ml-3"
						color="default"
						small
					>Close
					</v-btn>
					<v-btn
						class="ml-3"
						color="info"
						small
						@click="addProject"
					>Add
					</v-btn>
				</v-card-actions>
			</v-card>
		</v-dialog>
	</div>
</template>

<script>
	import {mapMultiRowFields} from "vuex-map-fields";

	export default {
		name: "Projects",
		data(){
			return {
				projectTypes: [
					{id: 'ecom-website', title: 'E-commerce website'},
					{id: 'saas-app', title: 'SaaS Application'},
					{id: 'api', title: 'API'},
					{id: 'dashboard', title: 'Dashboard'},
					{id: 'mobile-game', title: 'Mobile Game'},
				],
				projectDialog: false,
				projectDialogTitle: null,
				ProjectToUpdate: {
					id: null,
					title: null,
					type: null,
					url: null,
					repository: null,
					description: null,
					yearStarted: null,
					yearCompleted: null,
					ongoing: false,
					position: null,
					icon: null,
					technologies: []
				},
				tabHeight: window.innerHeight - (140),
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
			}
		},
		computed: {
			...mapMultiRowFields('cvs',{
				allProjects: 'allProjects'
			})
		},
		methods: {
			addProject () {

			},
			openProjectDialog (project) {
				this.projectDialog = true
				if(project){
					this.projectDialogTitle = 'Update your Project'
					this.ProjectToUpdate.id = project.Project.id
					this.ProjectToUpdate.title = project.Project.title
					this.ProjectToUpdate.type = project.Project.type
					this.ProjectToUpdate.url = project.Project.url
					this.ProjectToUpdate.repository = project.Project.repository
					this.ProjectToUpdate.description = project.Project.description
					this.ProjectToUpdate.yearStarted = project.Project.yearStarted
					this.ProjectToUpdate.yearCompleted = project.Project.yearCompleted
					this.ProjectToUpdate.ongoing = project.Project.ongoing
					this.ProjectToUpdate.position = project.Project.position
					this.ProjectToUpdate.icon = project.Project.icon
					this.ProjectToUpdate.technologies = project.Project.technologies
				} else {
					this.projectDialogTitle = 'Add a new Project'
					this.ProjectToUpdate.id = null
					this.ProjectToUpdate.title = null
					this.ProjectToUpdate.type = null
					this.ProjectToUpdate.url = null
					this.ProjectToUpdate.repository = null
					this.ProjectToUpdate.description = null
					this.ProjectToUpdate.yearStarted = null
					this.ProjectToUpdate.yearCompleted = null
					this.ProjectToUpdate.ongoing = false
					this.ProjectToUpdate.position = null
					this.ProjectToUpdate.icon = null
					this.ProjectToUpdate.technologies = []
				}
			},
		},
		created(){}
	}
</script>

<style scoped>

</style>
