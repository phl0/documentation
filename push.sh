  cd $HOME
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis"

  git clone --quiet --branch=travis_test https://phl0:$GH_TOKEN@github.com/phl0/documentation travis_test

  cd travis_test
  cp -Rf $TRAVIS_BUILD_DIR/_build/DAPNET\ 2.0\ Software\ internals.pdf .

  #git remote add origin https://phl0:$GH_TOKEN@github.com/phl0/documentation.git
  git commit -m "Travis build $TRAVIS_BUILD_NUMBER pushed [skip ci]" DAPNET\ 2.0\ Software\ internals.pdf
  git push origin travis_test -fq > /dev/null
  echo -e "Done\n"
