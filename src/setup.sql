CREATE TABLE organization (
    organization_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    contact_email VARCHAR(255) NOT NULL,
    logo_filename VARCHAR(255) NOT NULL
);

INSERT INTO organization (name, description, contact_email, logo_filename)
VALUES
('BrightFuture Builders', 'A nonprofit focused on improving community infrastructure through sustainable construction projects.', 'info@brightfuturebuilders.org', 'brightfuture-logo.png'),
('GreenHarvest Growers', 'An urban farming collective promoting food sustainability and education in local neighborhoods.', 'contact@greenharvest.org', 'greenharvest-logo.png'),
('UnityServe Volunteers', 'A volunteer coordination group supporting local charities and service initiatives.', 'hello@unityserve.org', 'unityserve-logo.png');

CREATE TABLE service_project (
    project_id SERIAL PRIMARY KEY,
    organization_id INTEGER NOT NULL REFERENCES organization(organization_id),
    title VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(100) NOT NULL,
    project_date DATE NOT NULL
);

INSERT INTO service_project (
    organization_id,
    title,
    description,
    location,
    project_date
)
VALUES
-- ==========================================
-- BrightFuture Builders (organization_id = 1)
-- ==========================================
(1, 'Community Playground Renovation',
'Renovate an aging neighborhood playground by repairing equipment, repainting structures, and improving accessibility.',
'Boise, ID', '2026-08-15'),

(1, 'Senior Home Accessibility Project',
'Install wheelchair ramps, handrails, and other accessibility improvements for senior residents.',
'Meridian, ID', '2026-09-12'),

(1, 'Community Center Painting Day',
'Volunteers will repaint the local community center and perform minor maintenance to improve the facility.',
'Nampa, ID', '2026-10-03'),

(1, 'Neighborhood Shelter Repairs',
'Repair fences, replace damaged flooring, and complete general maintenance at a local emergency shelter.',
'Caldwell, ID', '2026-10-24'),

(1, 'Veterans Housing Improvement',
'Help improve temporary housing for veterans by completing light construction and landscaping projects.',
'Boise, ID', '2026-11-14'),

-- ==========================================
-- GreenHarvest Growers (organization_id = 2)
-- ==========================================
(2, 'Neighborhood Community Garden',
'Build raised garden beds and plant seasonal vegetables for families in the community.',
'Boise, ID', '2026-08-22'),

(2, 'Tree Planting Initiative',
'Plant native trees in public parks to promote environmental sustainability and expand green spaces.',
'Eagle, ID', '2026-09-19'),

(2, 'School Garden Workshop',
'Assist students in creating and maintaining an educational vegetable garden.',
'Caldwell, ID', '2026-10-10'),

(2, 'Community Compost Program',
'Set up compost collection stations and educate residents on composting practices.',
'Meridian, ID', '2026-10-31'),

(2, 'River Cleanup Day',
'Remove trash and invasive plants along the river while educating volunteers about local ecosystems.',
'Boise, ID', '2026-11-21'),

-- ==========================================
-- UnityServe Volunteers (organization_id = 3)
-- ==========================================
(3, 'Food Bank Volunteer Day',
'Sort, package, and distribute donated food for local families in need.',
'Boise, ID', '2026-08-08'),

(3, 'Community Park Cleanup',
'Remove litter, clean walking paths, and beautify public park areas with volunteers.',
'Meridian, ID', '2026-09-05'),

(3, 'Winter Clothing Drive',
'Collect, organize, and distribute winter clothing and blankets to individuals experiencing homelessness.',
'Boise, ID', '2026-11-14'),

(3, 'Back-to-School Supply Drive',
'Assemble backpacks with school supplies and distribute them to students from low-income families.',
'Nampa, ID', '2026-08-29'),

(3, 'Holiday Meal Distribution',
'Prepare and deliver holiday meal packages to families and seniors throughout the community.',
'Caldwell, ID', '2026-12-12');

CREATE TABLE category (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

INSERT INTO category (name)
VALUES
('Environmental'),
('Educational'),
('Community Service'),
('Health and Wellness');

CREATE TABLE service_project_category (
    project_id INTEGER NOT NULL REFERENCES service_project(project_id) ON DELETE CASCADE,
    category_id INTEGER NOT NULL REFERENCES category(category_id) ON DELETE CASCADE,
    PRIMARY KEY (project_id, category_id)
);

-- ==========================================
-- category_id reference: 1 = Environmental, 2 = Educational,
-- 3 = Community Service, 4 = Health and Wellness
-- ==========================================
INSERT INTO service_project_category (project_id, category_id)
VALUES
(1, 3),   -- Community Playground Renovation -> Community Service
(2, 3),   -- Senior Home Accessibility Project -> Community Service
(2, 4),   -- Senior Home Accessibility Project -> Health and Wellness
(3, 3),   -- Community Center Painting Day -> Community Service
(4, 3),   -- Neighborhood Shelter Repairs -> Community Service
(5, 3),   -- Veterans Housing Improvement -> Community Service
(5, 4),   -- Veterans Housing Improvement -> Health and Wellness
(6, 1),   -- Neighborhood Community Garden -> Environmental
(6, 2),   -- Neighborhood Community Garden -> Educational
(7, 1),   -- Tree Planting Initiative -> Environmental
(8, 1),   -- School Garden Workshop -> Environmental
(8, 2),   -- School Garden Workshop -> Educational
(9, 1),   -- Community Compost Program -> Environmental
(9, 2),   -- Community Compost Program -> Educational
(10, 1),  -- River Cleanup Day -> Environmental
(11, 3),  -- Food Bank Volunteer Day -> Community Service
(11, 4),  -- Food Bank Volunteer Day -> Health and Wellness
(12, 1),  -- Community Park Cleanup -> Environmental
(12, 3),  -- Community Park Cleanup -> Community Service
(13, 3),  -- Winter Clothing Drive -> Community Service
(13, 4),  -- Winter Clothing Drive -> Health and Wellness
(14, 2),  -- Back-to-School Supply Drive -> Educational
(14, 3),  -- Back-to-School Supply Drive -> Community Service
(15, 3),  -- Holiday Meal Distribution -> Community Service
(15, 4);  -- Holiday Meal Distribution -> Health and Wellness
