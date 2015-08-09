all:
	g++ -c -fPIC MS3DFile.cpp -o ms3dfile.o -lGL -lGLU -lglut -ljpeg -lpng
	g++ -c -fPIC Textures.cpp -o textures.o -lGL -lGLU -lglut -ljpeg -lpng
	gcc -shared -Wl,-soname,libms3d.so.1 -o libms3d.so.1.0.1 ms3dfile.o textures.o

install:
	cp libms3d.so.1.0.1 /usr/lib
	ln -s /usr/lib/libms3d.so.1.0.1 /usr/lib/libms3d.so
	ln -s /usr/lib/libms3d.so.1.0.1 /usr/lib/libms3d.so.1

clean:
	rm textures.o
	rm ms3dfile.o
	rm libms3d.so.1.0.1