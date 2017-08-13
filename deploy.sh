# GH_USER: Username for the user
# GH_TOKEN: Token or pass for the user
# GH_REF: github.com/<user-name>/<repo-name>.git
rm -rf dist/
npm run build
cd dist/
git init .
git config --local user.name "CodingBlocks gnoida Deploy Bot"
git config --local user.email "deploy-bot@codingblocks.com"
now=$(date)
echo "Deployed on $now" >> "Deployed_$now".txt
echo "gnoida.codingblocks.com" >> CNAME
git add -A
git commit -m "Deploy to GitHub Pages"
git push --force --quiet "https://${GH_USER}:${GH_TOKEN}@${GH_REF}" master
