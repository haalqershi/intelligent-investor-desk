-- Create databases for each microservice
CREATE DATABASE user_db;
CREATE DATABASE portfolio_db;
CREATE DATABASE market_data_db;
CREATE DATABASE alert_db;
CREATE DATABASE notification_db;
CREATE DATABASE analytics_db;

-- Grant privileges
GRANT ALL PRIVILEGES ON DATABASE user_db TO investordesk;
GRANT ALL PRIVILEGES ON DATABASE portfolio_db TO investordesk;
GRANT ALL PRIVILEGES ON DATABASE market_data_db TO investordesk;
GRANT ALL PRIVILEGES ON DATABASE alert_db TO investordesk;
GRANT ALL PRIVILEGES ON DATABASE notification_db TO investordesk;
GRANT ALL PRIVILEGES ON DATABASE analytics_db TO investordesk;

-- Connect to each database and create extensions
\c user_db;
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

\c portfolio_db;
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

\c market_data_db;
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

\c alert_db;
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

\c notification_db;
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

\c analytics_db;
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";