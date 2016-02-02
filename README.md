# docker-mapnik
Mapnik Docker image with Python bindings included

## Building

```bash
git clone https://github.com/mapnik/mapnik.git
cd mapnik
git checkout -b v.3.0.9 v3.0.9
git submodule update --init
cd ..
git clone https://github.com/mapnik/python-mapnik.git
docker build -t mapnik .
```
