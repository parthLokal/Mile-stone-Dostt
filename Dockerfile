FROM node:20-alpine

WORKDIR /app

COPY backend/package*.json ./
RUN npm install

COPY backend/ .

# Frontend static files — backend/src/index.js resolves FRONTEND_DIR as two
# levels up from backend/src (i.e. the repo root), and serves index.html from
# there. Copied to the container root to match that path.
COPY index.html /index.html
COPY app.js /app.js
COPY styles.css /styles.css
COPY assets/ /assets/

EXPOSE 3001

CMD ["node", "src/index.js"]
