USERNAME="brighambandersen"
# GH_PAT is an env var (GitHub Personal Access Token)

echo "Enter name for new repository (hyphen-separated):"
read REPO_NAME

echo "Enter a repository description: "
read DESCRIPTION


echo "Making new directory..."
mkdir $REPO_NAME
cd $REPO_NAME

echo "Setting up GitHub repository..."

git init
echo "${REPO_NAME} - ${DESCRIPTION}" > README.MD
git add README.MD
git commit -m 'First commit using automated script'


curl -i -H "Authorization: token $GH_PAT" https://api.github.com/user/repos -d "{\"name\": \"${REPO_NAME}\", \"description\": \"${DESCRIPTION}\"}"
git branch -M main
git remote add origin https://github.com/${USERNAME}/${REPO_NAME}.git
git push -u origin main

echo "Done. Opening new repository in VS Code and on GitHub site..." 
code .
git open
