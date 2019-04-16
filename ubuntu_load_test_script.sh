#running application on local machine.
echo "\nRunning application on local machine...\n\nResult:"
prefix='/home/satya/Downloads/'
for file in /home/satya/Downloads/test_images/*
do
  result=${file#"$prefix"}
  echo "$result"
  sudo docker run -it --rm -v $(pwd):/data:ro openalpr -c eu $result
done
