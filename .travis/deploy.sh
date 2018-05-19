npm run build --prod
echo "paulshibanov.com" > dist/CNAME
npx angular-cli-ghpages --repo=https://GH_TOKEN@github.com/paulshibanov/com.git
