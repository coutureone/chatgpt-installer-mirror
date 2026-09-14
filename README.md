# ChatGPT Installer Mirror

这是一个公开的个人镜像项目，用于把 **OpenAI 官方提供的 ChatGPT 安装包**复制到 GitHub Releases，方便下载。

本项目不修改安装包、不绕过登录或授权，也不是 OpenAI 官方项目。发布前必须确认相应安装包允许再分发；如果官方没有明确授权，请只使用脚本下载官方地址，不要上传二进制文件。

## 下载

请在 [Releases](../../releases) 中选择对应平台和架构。每个文件旁边的 `.sha256` 文件用于校验完整性：

```sh
shasum -a 256 -c ChatGPT-<version>-<platform>-<arch>.sha256
```

## 维护者发布流程

从官方页面下载原始安装包后，在本地执行：

```sh
./scripts/publish.sh "/path/to/official-installer" "1.0.0" "macos" "arm64"
```

脚本会计算 SHA-256 并创建 GitHub Release。它不会修改安装包。

也可以在 GitHub Actions 中手动运行 `Publish official installer`，提供官方直链、版本号、平台和架构。工作流只接受 HTTPS URL，并会把下载文件的 SHA-256 写入 Release。

## 来源

请以 OpenAI 官方下载页为准：<https://chatgpt.com/download/>。本仓库的 Release 说明必须包含实际使用的官方来源 URL 和下载日期。
