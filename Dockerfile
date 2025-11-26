# Menggunakan Nginx versi Alpine yang ringan
FROM nginx:alpine

# Hapus config default Nginx
RUN rm /etc/nginx/conf.d/default.conf

# Salin konfigurasi khusus Unity (file nginx.conf di bawah)
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Salin seluruh file game (index.html, Build/, TemplateData/) ke folder Nginx
COPY . /usr/share/nginx/html

# Pastikan permission benar
RUN chmod -R 755 /usr/share/nginx/html

# Expose port 80
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
