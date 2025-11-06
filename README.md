1. **Clone / create project**

   * Create a folder `fastapi-react-app` and add files above.

2. **Backend — run locally (without Docker)**

   * Open `backend` folder in VS Code Terminal.
   * Create and activate a virtual environment:

     ```powershell
     python -m venv .venv
     .\.venv\Scripts\Activate.ps1  # (PowerShell)
     # or: .\.venv\Scripts\activate  # (cmd)
     ```
   * Install dependencies:

     ```powershell
     pip install -r requirements.txt
     ```
   * Copy `.env.sample` to `.env` if you want and edit.
   * Run the API:

     ```powershell
     uvicorn app.main:app --reload --host 127.0.0.1 --port 8000
     ```
   * Open `http://127.0.0.1:8000/docs` to view OpenAPI/Swagger UI.

3. **Frontend — run locally**

   * Open `frontend` folder in a new VS Code Terminal.
   * Install Node + npm (if not installed). Recommended Node 18+.
   * Run:

     ```powershell
     npm install
     npm run dev
     ```
   * Vite dev server will start on `http://localhost:5173`.

4. **CORS**

   * The backend includes CORS middleware allowing `http://localhost:5173`.
   * If you change the frontend port, update `main.py` CORS origins.

5. **Run with Docker Compose**

   * From project root:

     ```powershell
     docker compose up --build
     ```
   * Backend: `http://localhost:8000` (OpenAPI: `/docs`)
   * Frontend: `http://localhost:5173`

6. **Build for production (frontend)**

   * In `frontend` folder: `npm run build` creates `dist/`.
   * Serve `dist` from any static host or container.

7. **Notes & next steps (DevOps)**

   * The project is intentionally small and file-based (SQLite) so you can focus on tooling later.
   * Next, we can add Docker multi-stage builds, Kubernetes manifests, Terraform infra, CI/CD (GitHub Actions/GitLab CI), and monitoring (Prometheus/Grafana). Tell me which CI provider / cloud you prefer and I’ll add automation.
