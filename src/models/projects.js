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

export {getAllServiceProjects} 