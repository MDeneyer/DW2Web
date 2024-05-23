# Gebruik de alpine basis image
FROM alpine:latest

# Installeer nginx en maak de HTML-directory
RUN apk update && apk add --no-cache nginx && mkdir -p /var/www/localhost/htdocs

# Kopieer de HTML-bestanden naar de nginx directory
COPY html /var/www/localhost/htdocs

# Maak het buildtime.txt bestand en voeg de build tijd toe
RUN echo "Build time: $(date -u)" > /var/www/localhost/htdocs/buildtime.txt

# Expose port 80 (let op, we exposen 80 in de container)
EXPOSE 80

# Start nginx in de foreground
CMD ["nginx", "-g", "daemon off;"]
