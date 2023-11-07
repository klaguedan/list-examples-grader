CPATH='.;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'


# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests

if [[ -f student-submission/ListExamples.java ]]
then
    # Move everything into grading-area/
    studentcode="student-submission/listExamples.java"
    test="grading-area/TestListExamples.java"
    echo $?

    cp -r $studentcode TestListExamples.java grading-area/
    ls grading-area/

    # Start Testing
    javac -cp $CPATH grading-area/*.java
    java -cp $CPATH org.junit.runner.JUnitCore $test 

    ls grading-area/
else
    echo "Error! Correct file not recieved!"
fi