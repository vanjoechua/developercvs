<template>
	<div :style="'height: ' + tabHeight + 'px !important'">
		<v-container fluid>
			<v-row no-gutters>
				<v-col cols="12" class="d-flex flex-row justify-space-between align-center">
					<span class="text-h1 font-weight-light">My Skills</span>
					<v-btn
						fab
						@click="openSkillDialog(null)"
					><v-icon>fas fa-plus</v-icon>
					</v-btn>
				</v-col>
			</v-row>
			<v-row>
				<v-col cols="3" v-for="skill in allSkills" :key="skill.Skill.id">
					<v-card class="mx-auto d-flex flex-column justify-space-between" height="250">
						<v-card-title class="d-flex flex-column justify-center" style="height: 150px">
							<div class="text-center">
								<v-img :src="getSkillIcon(skill.Skill.technology)" max-width="100"></v-img>
							</div>
						</v-card-title>
						<v-card-text>
							<v-row>
								<v-col cols="12" class="d-flex flex-column">
									<span>Level: {{ skill.Skill.level }}/10</span>
									<span>Years of experience: {{ skill.Skill.yearsOfExperience }}</span>
								</v-col>
								<v-col cols="12">
									<v-btn icon small class="float-right"><v-icon small>fas fa-trash-alt</v-icon></v-btn>
									<v-btn icon small class="float-right" @click="openSkillDialog(skill)"><v-icon small>fas fa-edit</v-icon></v-btn>
								</v-col>
							</v-row>
						</v-card-text>
					</v-card>
				</v-col>
			</v-row>
		</v-container>
		<v-dialog
			persistent
			v-model="skillDialog"
			width="400"
			max-width="400"
		>
			<v-card rounded>
				<v-card-title class="default text-left font-weight-bold">{{ skillDialogTitle }}</v-card-title>
				<v-card-text>
					<v-row no-gutters class="d-flex flex-row align-center">
						<v-col cols="4">Technology:</v-col>
						<v-col cols="8">
							<v-select
								:items="technologies"
								clearable
								dense
								hide-details
								item-value="id"
								item-text="title"
								solo
								v-model="SkillToUpdate.technology"
							></v-select>
						</v-col>
					</v-row>
					<v-row no-gutters class="d-flex flex-row align-center pt-3">
						<v-col cols="4">Level:</v-col>
						<v-col cols="8">
							<v-select
								:items="levels"
								clearable
								dense
								hide-details
								item-value="id"
								item-text="title"
								solo
								v-model="SkillToUpdate.level"
							>
							</v-select>
						</v-col>
					</v-row>
					<v-row no-gutters class="d-flex flex-row align-center pt-3">
						<v-col cols="4">Years of Experience</v-col>
						<v-col cols="8">
							<v-text-field
								clearable
								dense
								hide-details
								solo
								v-model="SkillToUpdate.yearsOfExperience"
							></v-text-field>
						</v-col>
					</v-row>
				</v-card-text>
				<v-card-actions>
					<v-spacer></v-spacer>
					<v-btn
						@click="skillDialog = false"
						class="ml-3"
						color="default"
						small
					>Close
					</v-btn>
					<v-btn
						class="ml-3"
						color="info"
						small
						@click="addSkill"
					>Add
					</v-btn>
				</v-card-actions>
			</v-card>
		</v-dialog>
	</div>
</template>

<script>
	import {mapMultiRowFields, mapFields} from 'vuex-map-fields'
	export default {
		name: "Skills",
		data(){
			return {
				levels: [
					{id: 1, title: '1/10'},
					{id: 2, title: '2/10'},
					{id: 3, title: '3/10'},
					{id: 4, title: '4/10'},
					{id: 5, title: '5/10'},
					{id: 6, title: '6/10'},
					{id: 7, title: '7/10'},
					{id: 8, title: '8/10'},
					{id: 9, title: '9/10'},
					{id: 10, title: '10/10'},
				],
				skillDialog: false,
				skillDialogTitle: null,
				SkillToUpdate: {
					technology: null,
					level: null,
					yearsOfExperience: null,
				},
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
				tabHeight: window.innerHeight - (140),
			}
		},
		computed: {
			...mapMultiRowFields('cvs',{
				allSkills: 'allSkills'
			})
		},
		methods: {
			addSkill () {
				this.skillDialog = true
			},
			getSkillIcon(technology){
				return this.technologies.find((tech) => tech.id == technology).icon
			},
			openSkillDialog (skill) {
				this.skillDialog = true
				if(skill){
					this.skillDialogTitle = 'Update your Skill'
					this.SkillToUpdate.technology = skill.Skill.technology
					this.SkillToUpdate.level = skill.Skill.level
					this.SkillToUpdate.yearsOfExperience = skill.Skill.yearsOfExperience
				} else {
					this.skillDialogTitle = 'Add a new Skill'
					this.SkillToUpdate.technology = null
					this.SkillToUpdate.level = null
					this.SkillToUpdate.yearsOfExperience = null
				}
			},
			removeSkill(){

			},
			updateSkill(){

			}
		},
		created() {
		}
	}
</script>

<style scoped>

</style>
