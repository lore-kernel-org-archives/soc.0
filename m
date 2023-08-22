Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8A0BEE49AB
	for <soc@archiver.kernel.org>; Tue, 22 Aug 2023 02:31:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6A054C433B7; Tue, 22 Aug 2023 02:31:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 53B89C433BC;
	Tue, 22 Aug 2023 02:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692671476;
	bh=Xgx4t7yv/MMnl2hwDetdJxQEAwGWhne0CMLVOP+EuZk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=CAdYlt3W1TQiiuNkE0POJpn3UjU5pSgf8zrcTNY5GB+nlvQZsJo23irH83mH2Ok3v
	 iNyqGgZWvhdXUj4x+8uaqErxBEG3E2fcO5Yc52MOnLdmv14d9rWhATgwH3ELJ8DJYL
	 JVP4xNg60ymrxvaL9zPTqxXQiYBBOf6n4nnw5FhR9jMac8fI1LFuIChWcLGkBwd9cg
	 GGoYkEg8n0YHGR86RUGs8laxWizsnq9bEM9mtJvNhiUqcO1Y20JGEIu3BvKr8XDnmn
	 MH0xw3dmU2jkHgb0fQ7VfGQ6hx3xEjT9l9Y83VnB9SjbUiuVdbPw7TJaJTKUVEauwu
	 ois5VSXuRQSmA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 32984E330B0;
	Tue, 22 Aug 2023 02:31:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm ARM64 DeviceTree updates for v6.6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169267147620.32531.8201505227496341870.git-patchwork-notify@kernel.org>
Date: Tue, 22 Aug 2023 02:31:16 +0000
References: <20230819034551.2537866-1-andersson@kernel.org>
In-Reply-To: <20230819034551.2537866-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 18 Aug 2023 20:45:49 -0700 you wrote:
> The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:
> 
>   Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-6.6
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm ARM64 DeviceTree updates for v6.6
    https://git.kernel.org/soc/soc/c/6522fbd48aaf

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


