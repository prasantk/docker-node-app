FROM node:8

COPY index.js /app/index.js

EXPOSE 3000

CMD ["node", "/app/index.js"]