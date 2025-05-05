

# 💼 Virtual Job Portal

The **Virtual Job Portal** is a full-stack Java web application that bridges the gap between job seekers and job givers (admins). It allows admins to post and manage job listings, and job seekers to apply for them by uploading resumes and personal details — providing a real-world simulation of modern job platforms like LinkedIn or Naukri.

---

## 👤 User Roles & Features

### 🔹 Job Seeker
- 🔐 Secure login  
- 👀 View all posted jobs  
- 📄 Apply to jobs with resume and personal details  
- 📊 View application status  

### 🔹 Job Giver (Admin)
- 🔐 Admin login  
- 📢 Post new jobs  
- 🛠 Edit/delete existing jobs  
- 📥 View applications  
- ✅ Accept or ❌ Reject job seekers  

---

## 🧰 Tech Stack

- **Frontend:** JSP, HTML, CSS, JavaScript  
- **Backend:** Java, Spring MVC, Servlets, JDBC  
- **Database:** MySQL  
- **Build Tool:** Maven  
- **IDE:** Eclipse

---

## 📁 Project Structure


├── .classpath               # Eclipse classpath config

├── .project                 # Eclipse project config

├── .settings/               # Eclipse settings

├── pom.xml                  # Maven build configuration

├── src/                     # Java source files (controllers, models)

├── target/                  # Compiled classes

---

## 🗃️ Database Setup

1. Create a MySQL database named `job_portal_db`  
2. Run the SQL script from your `database/` folder (if available), or manually create tables for:
   - Users (Job Seekers & Admins)
   - Jobs
   - Applications

3. Configure DB credentials in your DAO or `application.properties` (if using Spring config).



## 🚀 How to Run

1. **Clone the repository**
```bash
git clone https://github.com/your-username/virtual-job-portal.git
cd virtual-job-portal



Open in Eclipse

Import as Existing Maven Project
Setup Apache Tomcat

Build the project

mvn clean install

Deploy on Tomcat

Run the project on a configured Tomcat server

Access in browser

http://localhost:8080/virtual-job-portal/


🔑 Sample Login Details
Admin:
  username: admin
  password: admin123




