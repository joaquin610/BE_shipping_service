COLLECTION="postman-collection.json"
ENVIRONMENT="postman-environment.json"


newman run postman-collection.json -e postman-environment.json -r cli,html --reporter-html-export newman-report.html
