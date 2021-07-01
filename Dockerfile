# run the hugo command in the root directory to create the /public dir.
# Publish the public dir.
FROM klakegg/hugo:0.76.3-ext-alpine-onbuild AS hugo

FROM nginx
COPY --from=hugo /target /usr/share/nginx/html
