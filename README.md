# 같이 타잉

호남 전용 택시 카풀 서비스

> 호남지역의 교통순환 불편 문제를 해결하기 위해 기획되었습니다. 호남지역에서만 사용이 가능하며 다양한 필터를 제공해 시민들의 교통 이용에 편의를 제공합니다.

## Table of Contents

- [Sections](#sections)
  - [Title](#title)
  - [Banner](#banner)
  - [Badges](#badges)
  - [Short Description](#short-description)
  - [Long Description](#long-description)
  - [Table of Contents](#table-of-contents-1)
  - [Security](#security)
  - [Background](#background)
  - [Install](#install)
  - [Usage](#usage)
  - [Extra Sections](#extra-sections)
  - [API](#api)
  - [Maintainers](#maintainers)
  - [Thanks](#thanks)
  - [Contributing](#contributing)
  - [License](#license)
- [Definitions](#definitions)

## Sections

### Title

**Requirements:**

- Title must match repository, folder and package manager names - or it may have another, relevant title with the repository, folder, and package manager title next to it in italics and in parentheses. For instance:

  ```markdown
  # Standard Readme Style _(standard-readme)_
  ```

  If any of the folder, repository, or package manager names do not match, there must be a note in the [Long Description](#long-description) explaining why.

**Suggestions:**

- Should be self-evident.

### Banner

**Status:** Optional.

**Requirements:**

- Must not have its own title.
- Must link to local image in current repository.
- Must appear directly after the title.

### Short Description

**Status:** Required.

**Requirements:**

- Must not have its own title.
- Must be less than 120 characters.
- Must not start with `> `
- Must be on its own line.
- Must match the description in the packager manager's `description` field.
- Must match GitHub's description (if on GitHub).

**Suggestions:**

- Use [gh-description](https://github.com/RichardLitt/gh-description) to set and get GitHub description.
- Use `npm show . description` to show the description from a local [npm](https://npmjs.com) package.

### Table of Contents

**Status:** Required; optional for READMEs shorter than 100 lines.

**Requirements:**

- Must link to all Markdown sections in the file.
- Must start with the next section; do not include the title or Table of Contents headings.
- Must be at least one-depth: must capture all `##` headings.

**Suggestions:**

- May capture third and fourth depth headings. If it is a long ToC, these are optional.

### Background

**Status:** Optional.

**Requirements:**

- Cover motivation.
- Cover abstract dependencies.
- Cover intellectual provenance: A `See Also` section is also fitting.

### Usage

**Status:** Required by default, optional for [documentation repositories](#definitions).

**Requirements:**

- Code block illustrating common usage.
- If CLI compatible, code block indicating common usage.
- If importable, code block indicating both import functionality and usage.

**Subsections:**

- `CLI`. Required if CLI functionality exists.

**Suggestions:**

- Cover basic choices that may affect usage: for instance, if JavaScript, cover promises/callbacks, ES6 here.
- If relevant, point to a runnable file for the usage code.

### API

**Status:** Optional.

**Requirements:**

- Describe exported functions and objects.

**Suggestions:**

- Describe signatures, return types, callbacks, and events.
- Cover types covered where not obvious.
- Describe caveats.
- If using an external API generator (like go-doc, js-doc, or so on), point to an external `API.md` file. This can be the only item in the section, if present.

### Thanks

**Status**: Optional.

**Requirements:**

- Must be called `Thanks`, `Credits` or `Acknowledgements`.

**Suggestions:**

- State anyone or anything that significantly helped with the development of your project.
- State public contact hyper-links if applicable.

### Contributing

**Status**: Required.

**Requirements:**

- State where users can ask questions.
- State whether PRs are accepted.
- List any requirements for contributing; for instance, having a sign-off on commits.

**Suggestions:**

- Link to a CONTRIBUTING file -- if there is one.
- Be as friendly as possible.
- Link to the GitHub issues.
- Link to a Code of Conduct. A CoC is often in the Contributing section or document, or set elsewhere for an entire organization, so it may not be necessary to include the entire file in each repository. However, it is highly recommended to always link to the code, wherever it lives.
- A subsection for listing contributors is also welcome here.

### License

**Status:** Required.

**Requirements:**

- State license full name or identifier, as listed on the [SPDX](https://spdx.org/licenses/) license list. For unlicensed repositories, add `UNLICENSED`. For more details, add `SEE LICENSE IN <filename>` and link to the license file. (These requirements were adapted from [npm](https://docs.npmjs.com/files/package.json#license)).
- State license owner.
- Must be last section.

**Suggestions:**

- Link to longer License file in local repository.
