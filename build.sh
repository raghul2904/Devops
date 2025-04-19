#!bin/bash
 
 echo “Current Branch: $BRANCH_NAME”
  
  if [ “$BRANCH_NAME” == “dev” ]; then
     docker build -t sureshv1994/dev-react-image .
     echo “Suresh@1994” | docker login -u “sureshv1994” --password-stdin
     docker push sureshv1994/dev-react-image:latest

  elif [“$BRANCH_NAME” == “main” ]; then
     docker build -t sureshv1994/prod-react-image .
     echo “Suresh@1994” | docker login -u “sureshv1994” --password-stdin
     docker push sureshv1994/prod-react-image:latest
fi

