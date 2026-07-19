// Import any needed model functions
import { getUpcomingProjects, getProjectDetails } from '../models/projects.js';


const NUMBER_OF_UPCOMING_PROJECTS = 5; // Define the number of upcoming projects to retrieve

// Define any controller functions
const showProjectsPage = async (req, res) => {
    const projects = await getUpcomingProjects(NUMBER_OF_UPCOMING_PROJECTS);
    console.log(projects);

    const title = 'Upcoming Service Projects';
    res.render('projects', { title, projects: projects });
};

const showProjectDetailsPage = async (req, res) => {
    const projectId = req.params.id;
    const projectDetails = await getProjectDetails(projectId);

    const title = 'Project Details';
    res.render('project', { title, projectDetails });
}

// Export any controller functions
export { showProjectsPage, showProjectDetailsPage };
