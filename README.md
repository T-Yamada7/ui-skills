# ui-skills — 検証済みUIデザインシステム・スキル集

**Verified, ready-to-use design-system knowledge for AI coding agents.**
Plain-markdown skills any agent can read — Claude Code, Cursor, Codex, or a system prompt.

AIにUIを作らせると「どこかで見た画面」になる。原因は装飾ではなく、
**判断基準を渡していない**こと。このリポジトリは、実在するデザインシステムの
判断基準を「AIがそのまま従える形」で貯めるためのもの。

## 何が入っているか

| スキル | 中身 |
|---|---|
| [`dads`](skills/dads/SKILL.md) | デジタル庁デザインシステム。npm実測の全トークン＋**検証済みチャート4色**（公式には存在しない） |
| [`extract-ui-system`](skills/extract-ui-system/SKILL.md) | 新しいシステムを自分で抽出してスキル化する手順（メタスキル） |

## 既存の抽出ツールと何が違うか

SkillUI などの自動抽出ツールは「何でも・速く」。ここは「少数を・検証して」。

- **実測値のみ** — 目視で推測したHEXは書かない。出所（npmパッケージ名・版・取得日）と確度を明記
- **チャート配色は検証済み** — 色覚多様性（CVD ΔE）とコントラストをバリデータに通した値だけを載せる。
  例: DADSのプリミティブから素朴に選ぶと緑×黄土が色覚特性で区別不能（ΔE 6.6）になる。
  ここの4色は ΔE 19.5 まで検証して選定済み
- **「体系に無いもの」も書く** — DADSにフォントウェイト500は無い。使ったら準拠ではない、と明記
- **ライセンスゲート** — 再配布可（MIT等）のものだけが `skills/` に入る。
  ライセンス不明・ブランド系は `local/`（gitignore済み）に置く運用

## 使い方

### Claude Code（プラグインとして）

```
/plugin marketplace add T-Yamada7/ui-skills
/plugin install ui-skills@ui-skills
```

### Claude Code（シンボリックリンク）

```bash
git clone https://github.com/T-Yamada7/ui-skills.git
cd ui-skills && ./install.sh   # ~/.claude/skills にリンク。全プロジェクトで有効
```

### その他のAIエージェント

スキルは素のMarkdownなので、そのまま渡せば機能する:

- **Cursor** — `skills/dads/SKILL.md` の内容を `.cursor/rules/` にコピー
- **その他** — AGENTS.md から参照するか、プロンプトに貼る

### 頼み方の例

```
dadsスキルに従って設定画面を作って
このサイト https://example.com のUIを extract-ui-system の手順でスキル化して
```

## 新しいシステムを追加する

AIエージェントに「〜のUIを切り出してスキルにして」と頼むと、
`extract-ui-system` が手順（トークン源の特定 → 実測 → チャート色の検証 → ライセンス判定）を持っている。
再配布可なら `skills/` に、不可なら `local/` に生成される。PRも歓迎。

## 免責

- 各スキルは取得日時点のスナップショット。上流の更新への追従は保証しない（取得日を必ず見ること）
- `dads` の値は MIT の [@digital-go-jp/design-tokens](https://github.com/digital-go-jp/design-tokens) 由来。
  チャート4色はこのリポジトリ独自の検証済み拡張であり、デジタル庁の公式見解ではない

## License

MIT
