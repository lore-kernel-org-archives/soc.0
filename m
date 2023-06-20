Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1793CC04E69
	for <soc@archiver.kernel.org>; Tue, 20 Jun 2023 21:21:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D97E7C4AF5C; Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C357FC433BC;
	Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687296112;
	bh=2DAKh1ktGZRJ0NtN04nBkKVCtP4sOoJrhgRBNSc7rQ4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=XjNRQBsfHUvpYXubvhdvSYu1UQpIGg1nT0vevtQsctk3Er3DczT/TE4HewESfLfIF
	 /4dRophcfdMNBMdpCgiRM1Cdi8Ip0EqZdjM2KNGOyGpYP1V3XTDc3tGrQ6E1fDRwge
	 KDyRgFHFD+zhG/ZZgtTSGy0d/StFA5NQFJFhltXIZ0+K2m31tD3zjlUiKfCksedeYS
	 EK+aO4jgQjvbTgxkzHP/HGcWPtUAweKwYYv3e9lR/csAjjAGK3MLZxQ/4ZFfyg3d+Z
	 ZOMBGZHVgSVI0luN4hDcmx0LLetTXxugOAUptv1kJPGlSZsLMXQZUjq5aTfg92EO1z
	 v/11+uFK1WZ2A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B2847C395C7;
	Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/6] soc/tegra: Changes for v6.5-rc1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168729611272.12258.13670900925044165927.git-patchwork-notify@kernel.org>
Date: Tue, 20 Jun 2023 21:21:52 +0000
References: <20230609193620.2275240-1-thierry.reding@gmail.com>
In-Reply-To: <20230609193620.2275240-1-thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  9 Jun 2023 21:36:15 +0200 you wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:
> 
>   Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/6] soc/tegra: Changes for v6.5-rc1
    (no matching commit)
  - [GIT,PULL,2/6] firmware: tegra: Changes for v6.5-rc1
    (no matching commit)
  - [GIT,PULL,3/6] dt-bindings: Changes for v6.5-rc1
    https://git.kernel.org/soc/soc/c/79e47607205a
  - [GIT,PULL,4/6] memory: tegra: Changes for v6.5-rc1
    (no matching commit)
  - [GIT,PULL,5/6] PCI: tegra: Changes for v6.5-rc1
    (no matching commit)
  - [GIT,PULL,6/6] arm64: tegra: Device tree changes for v6.5-rc1
    https://git.kernel.org/soc/soc/c/a9c7f8d0cfb7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


