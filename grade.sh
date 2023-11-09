set -e
CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

files=`find student-submission -name "*.java"`

for file in $files
do
    if [[ -f $file ]] && [[ $file == **/ListExamples.java* ]]
    then
        echo $file
        cp -r $file grading-area
        echo "files found"
    else
        echo "files not found"
    fi
done


rm -rf student-submission
cp -r ./TestListExamples.java grading-area
cp -r lib grading-area
cd grading-area

javac -cp ".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar" *.java
java -cp ".;lib/junit-4.13.2.jar;lib/hamcrest-core-1.3.jar" org.junit.runner.JUnitCore TestListExamples




# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests

