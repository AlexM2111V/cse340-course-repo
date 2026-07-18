import db from './db.js'

const getAllServiceProjects = async() => {
    const query = `
        SELECT o.name AS organization_name, p.title, p.project_date  FROM service_project as p
        INNER JOIN organization as o
        ON p.organization_id = o.organization_id
    `;

    const result = await db.query(query);

    return result.rows;
}

const getProjectsByOrganizationId = async (organizationId) => {
    const query = `
        SELECT
            project_id,
            organization_id,
            title,
            description,
            location,
            project_date
        FROM service_project
        WHERE organization_id = $1
        ORDER BY project_date;
    `;

    const queryParams = [organizationId];

    const result = await db.query(query, queryParams);

    return result.rows;
}

export {getAllServiceProjects, getProjectsByOrganizationId}