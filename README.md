# curriculum-databases-projects-template


## Getting Started

This repository includes files with plain SQL that can be used to recreate a database:

- Use [schema.sql](./schema.sql) to create all tables.
- Use [data.sql](./data.sql) to populate tables with sample data.
- Check [queries.sql](./queries.sql) for examples of queries that can be run on a newly created database. **Important note: this file might include queries that make changes in the database (e.g., remove records). Use them responsibly!**

<a name="readme-top"></a>

<!--
HOW TO USE:
This is an example of how you may give instructions on setting up your project locally.

Modify this file to match your project and remove sections that don't apply.

REQUIRED SECTIONS:
- Table of Contents
- About the Project
  - Built With
  - Live Demo
- Getting Started
- Authors
- Future Features
- Contributing
- Show your support
- Acknowledgements
- License

After you're finished please remove all the comments and instructions!
-->


<!-- TABLE OF CONTENTS -->

# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
- [💻 Getting Started](#getting-started)
  - [Setup](#setup)
  - [Prerequisites](#prerequisites)

 
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [📝 License](#license)

<!-- PROJECT DESCRIPTION -->

# 📖 [VET-CLINIC-DB] <a name="about-project"></a>


**[]** is a database  to create a data structure for a vet clinic. The database includes tables for animals, animal owners, clinic employees, and visits. These tables store comprehensive information about each aspect, such as animal details, owner information, employee data, and visit records. This database facilitates efficient management, organization, and analysis of information, enabling better care and service for animals and their owners.

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>
<details>
<summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>

<!-- Features -->

### Key Features <a name="key-features"></a>

- **[store comprehensive information about animals]**
- **[unique Autoincrementing id for each animal]**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

## Getting Started <a name="getting-started"></a>

### Prerequisites

1. To install PostgreSQL, follow these steps:

Determine the appropriate installation method for your operating system. PostgreSQL supports various platforms, including Linux, macOS, and Windows. Visit the PostgreSQL website to find the installation method specific to your OS.

1. For Linux:

```
sudo apt-get install postgresql
```

or

```
sudo yum install postgresql-server
```

or

```
sudo dnf install postgresql-server postgresql-contrib
```

Other distributions: Refer to the PostgreSQL documentation or consult your distribution's documentation for installation instructions.

2. For Windows:

PostgreSQL Installer for Windows: Download the PostgreSQL Installer for Windows from the official website and run the installer. Follow the prompts and choose the components you want to install.

3. For macOS

Homebrew: If you have Homebrew installed, use the following command:

```
brew install postgresql
```

PostgreSQL for macOS: Download the PostgreSQL package for macOS from the official website and follow the installation instructions.

During the installation process, you may be prompted to provide a password for the default PostgreSQL superuser (postgres). Choose a strong password and remember it for future use.
After the installation is complete, PostgreSQL should be up and running as a service on your system. You can start and stop the service using the provided tools or by using the system services manager.

Once PostgreSQL is installed, you can access it using the psql command-line tool or a graphical client.

### Setup

To get a local copy up and running, follow these steps.
Choose the directory on your local machine where you want to copy project. For example:

```
cd /home/user/name-of-your-directory
```

Clone the project using one of the options.

Using HTTPS:

```
git clone https://github.com/beteland123/vet-clinic.git
```

You can also create the new directory just adding the name of it in the end of command. For example:

```
git clone https://github.com/beteland123/vet-clinic.git vet-clinic
```

### Usage

To create the PostgreSQL database and view its contents, follow the steps below:

1. Ensure that PostgreSQL is installed on your system and the PostgreSQL server is running.

2. Open a terminal or command prompt.

3. Run the following command to create the database:

```
psql -U <username> -c "CREATE DATABASE <database_name>;"
```

Replace <username> with your PostgreSQL username and <database_name> with the desired name for your database.

4. To view the contents of the database, use the following command:

```
psql -U <username> -d <database_name> -c "SELECT * FROM <table_name>;"
```

Replace <username> with your PostgreSQL username, <database_name> with the name of your database, and <table_name> with the name of the table you want to view.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- AUTHORS -->

## 👥 Authors <a name="authors"></a>

> Mention all of the collaborators of this project.

### 👤 **Betel Andarge** 
 - GitHub: [@Betel](https://github.com/beteland123)

  - Twitter: [@Betel](https://twitter.com/BetelAndarge)

  - LinkedIn: [Betel](https://linkedin.com/in/betelandarge)

👤 **Micronaut JUAN DAVID DIAZ**

- GitHub: [@JuanDBta](https://github.com/JuanDBta)
- Twitter: [@simplebetsas](https://twitter.com/simplebetsas)
- LinkedIn: [LinkedIn](https://linkedin.com/in/simplebet/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>

> Describe 1 - 3 features you will add to the project.

- [ ] **Add new tables & create relations between**
- [ ] **Add schema diagram**


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>


Contributions are welcome! If you have any ideas, improvements, or bug fixes, please open an issue or submit a pull request. For major changes, please discuss them with the project maintainers first.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>

> Write a message to encourage readers to support your project

If you like this project, please give a ⭐️ (Thank you)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>

> Give credit to everyone who inspired your codebase.

- I would like to thank Microverse for this learning opportunity.

- [Microverse team](https://microverse.org/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](LICENSE) licensed.


<p align="right">(<a href="#readme-top">back to top</a>)</p>
