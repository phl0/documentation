  echo $TRAVIS_BUILD_DIR
  BUILDDIR=$(pwd)
  echo $PWD
  cd _build
  ls -al
  find . -name "_build"
  ls -al $PWD/_build

  cd $HOME
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis"
  # Clone the repository in the folder buildApk

  git clone --quiet --branch=travis_test https://phl0:$GITHUB_API_KEY@github.com/phl0/documentation travis_test > /dev/null

  cd travis_test
  pwd
  cp -Rf $TRAVIS_BUILD_DIR/_build/DAPNET\ 2.0\ Software\ internals.pdf .

  git remote add origin https://phl0:$GITHUB_API_KEY@github.com/phl0/documentation.git
  git commit -m "Travis build $TRAVIS_BUILD_NUMBER pushed [skip ci] "
  git push origin travis_test -fq> / dev / null
  echo -e "Done\n"
