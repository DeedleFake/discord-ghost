module.exports = {
  branch: "release",
  plugins: [
    "@semantic-release/commit-analyzer",
    "@semantic-release/release-notes-generator",
    "@semantic-release/npm",
    [
      "@semantic-release/github",
      {
        assets: ["bin/**/*"]
      }
    ]
  ]
};
