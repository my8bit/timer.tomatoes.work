DEPLOY_OUTPUT="$(node_modules/netlify-cli/bin/cli.js deploy -t $NETLIFY_TOKEN -d)"
echo DEPLOY_OUTPUT
URL=$(grep -iIohE 'https://[^[:space:]]+' <<< $DEPLOY_OUTPUT)
echo "Site is deployed: "
echo $URL
node node_modules/lighthouse-ci/runlighthouse.js --output="json" $URL
