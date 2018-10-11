  PWD=$(pwd)
  echo $PWD
  find . -name "_build"
  ls -al $PWD/_build

  cd $HOME
  pwd
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis"
  # Clone the repository in the folder buildApk

  git clone --quiet --branch=travis_test https://phl0:$GITHUB_API_KEY@github.com/phl0/documentation travis_test > /dev/null

  cd travis_test
  pwd
  cp -Rf $PWD/_build/* .

  git add -f .
  git remote add origin https://phl0:$GITHUB_API_KEY@github.com/phl0/documentation.git
  git add -f .
  git commit -m "Travis build $ TRAVIS_BUILD_NUMBER pushed [skip ci] "
  git push origin travis_test -fq> / dev / null
  echo -e "Done\n"
