const fs = require("fs");
const axios = require("axios");

const owner = process.env.GITHUB_REPOSITORY.split("/")[0];
const repo = process.env.GITHUB_REPOSITORY.split("/")[1];
const token = process.env.GITHUB_TOKEN;

async function getContributors() {
  const res = await axios.get(`https://api.github.com/repos/${owner}/${repo}/stats/contributors`, {
    headers: { Authorization: `token ${token}` }
  });
  return res.data.map(user => ({
    login: user.author.login,
    avatar: user.author.avatar_url,
    totalChanges: user.weeks.reduce((sum, w) => sum + w.a + w.d, 0)
  }));
}

function updateReadme(contributors) {
  contributors.sort((a, b) => b.totalChanges - a.totalChanges);

  const table = [
    "| Rank | Developer | Total Changes |",
    "|------|-----------|--------------:|",
    ...contributors.map((c, i) => {
      const medal = i === 0 ? "🥇" : i === 1 ? "🥈" : i === 2 ? "🥉" : i + 1;
      return `| ${medal} | [@${c.login}](https://github.com/${c.login}) | ${c.totalChanges.toLocaleString()} |`;
    })
  ].join("\n");

  let readme = fs.readFileSync("README.md", "utf8");
  readme = readme.replace(
    /(<!-- CONTRIBUTORS_START -->)([\s\S]*?)(<!-- CONTRIBUTORS_END -->)/,
    `<!-- CONTRIBUTORS_START -->\n${table}\n<!-- CONTRIBUTORS_END -->`
  );
  fs.writeFileSync("README.md", readme);
}

(async () => {
  console.log(`Fetching contributors for ${owner}/${repo}...`);
  const contributors = await getContributors();
  updateReadme(contributors);
})();
