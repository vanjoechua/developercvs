import {getField, updateField} from "vuex-map-fields";

const getDefaultState = () => {
	return {
		Skill: {
			id: null,
			technology: null,
			level: 0,
			yearsOfExperience: 0
		},
		Project: {
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
			icon: '',
			technologies: []
		}
	}
}

const namespaced = {
	namespaced: true
}

const state = {
	allProjects: [
		{Project: {
				id: 0,
				title: 'Vertex PDF',
				type: 'saas-app',
				url: null,
				repository: 'https://github.com/vanjoechua/developercvs',
				description: 'Web-based PDF editor',
				yearStarted: 2018,
				yearCompleted: null,
				ongoing: true,
				position: 'Owner',
				icon: '/static/img/projects/vertex.png',
				technologies: ['php','nodejs','html','css']
			}
		},
		{Project: {
				id: 1,
				title: 'Cave API',
				type: 'api',
				url: null,
				repository: 'https://github.com/vanjoechua/developercvs',
				description: 'Worldwide Caves Location API',
				yearStarted: 2010,
				yearCompleted: 2012,
				ongoing: false,
				position: 'Owner',
				icon: '/static/img/projects/cave.png',
				technologies: ['php','laravel','mssql']
			}
		},
		{Project: {
				id: 2,
				title: 'RocketDog',
				type: 'mobile-game',
				url: null,
				repository: 'https://github.com/vanjoechua/developercvs',
				description: 'A mobile game featuring a rocketeer dog hero',
				yearStarted: 2017,
				yearCompleted: 2018,
				ongoing: false,
				position: 'Owner',
				icon: '/static/img/projects/rocketdog.png',
				technologies: ['js','nodejs','mongo']
			}
		}
	],
	allSkills: [
		{Skill: {id: 1, technology: 'php', level: 7, yearsOfExperience: 4}},
		{Skill: {id: 2, technology: 'mongo', level: 5, yearsOfExperience: 2}},
		{Skill: {id: 3, technology: 'nodejs', level: 6, yearsOfExperience: 2}},
		{Skill: {id: 4, technology: 'laravel', level: 9, yearsOfExperience: 5}},
	],
}
const getters = {
	getField
}
const actions = {
	addSkill ({commit},payload) {
		commit('setSkill',payload)
	},
	deleteSkill ({commit},index) {
		commit()
	}
}
const mutations = {
	setSkill (state,payload){
		let skill = getDefaultState().Skill
		skill.id = 1
		skill.technology = payload.technology
		skill.level = payload.level
		skill.yearsOfExperience = payload.years
		state.allSkills.push(skill)
	},
	updateField
}

export const cvs = {
	namespaced,
	state,
	getters,
	actions,
	mutations
}

