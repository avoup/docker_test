FROM node:16-alpine as builder
# as <some name> tag a phase
WORKDIR '/app'
COPY package.json .
RUN npm i
COPY . .
RUN npm run build

FROM nginx
# end of phase 'builder' (FROM keyword)
COPY --from=builder /app/build /usr/share/nginx/html
## copy staff from builder phase -from-phase -from-dir -to-dir
