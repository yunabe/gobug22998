pkgdir=$GOPATH/src/github.com/yunabe/gobug22998/pkg
rm -rf $pkgdir

echo '## Building libstd.so ##'
go install -buildmode=shared -pkgdir $pkgdir std
echo '## Building lib0.so ##'
go install -v -x -buildmode=shared -linkshared -pkgdir $pkgdir github.com/yunabe/gobug22998/lib0
echo '## Building lib1.so ##'
go install -v -x -buildmode=shared -linkshared -pkgdir $pkgdir github.com/yunabe/gobug22998/lib1
echo '## Building lib2.so ##'
go install -v -x -buildmode=shared -linkshared -pkgdir $pkgdir github.com/yunabe/gobug22998/lib2

if [ $? -eq 0 ]; then
    echo '## Show stats ##'
    ls -lah $pkgdir/*.so
    ldd $pkgdir/*.so
else
    echo FAIL
fi
rm -rf $pkgdir

