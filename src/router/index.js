import Vue from 'vue'
import Router from 'vue-router'
import Layout from "../container/DeveloperCvsLayout";

const Profile = () => import('../views/developercvs/Profile')
const Projects = () => import('../views/developercvs/Projects')
const Skills = () => import('../views/developercvs/Skills')
const Work = () => import('../views/developercvs/Work')

Vue.use(Router)

export default new Router({
		mode: 'history',
		routes: [
				{
						path: '/',
						component: Layout,
						redirect: '/profile',
						children: [
								{
										component: Profile,
										path: '/profile',
								},
								{
										component: Work,
										path: '/work',
								},
								{
										component: Projects,
										path: '/projects',
								},
								{
										component: Skills,
										path: '/skills',
								},
						],
				},
		],
})