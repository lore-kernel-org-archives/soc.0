Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63109C64E7A
	for <soc@archiver.kernel.org>; Fri, 27 Nov 2020 17:10:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3C068221FF; Fri, 27 Nov 2020 17:10:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606497028;
	bh=OxF/DD/6vkXX3pReMYCaFmQsyWU8n2aJ84WAUBRmJ3E=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Lq0JEIRZwYSjXXjLwhuco7OPgZyOFj8Mix3/DqhSw2SUzOZ7fDve5j3LtAG/bn653
	 K4E/tZqBfcgVhb4Et3TMN67fwF6mY+CIsVc9+nASVWe4JUBCYr6sHEDmiqYwThAPC/
	 Lg1gkRmpcGKer3x9VK1i0UUA1UF40ifY+vfhmhO8=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/6] dt-bindings: Changes for v5.11-rc1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <160649702812.7685.12441883154247541242.git-patchwork-notify@kernel.org>
Date: Fri, 27 Nov 2020 17:10:28 +0000
References: <20201127144329.124891-1-thierry.reding@gmail.com>
In-Reply-To: <20201127144329.124891-1-thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Fri, 27 Nov 2020 15:43:24 +0100 you wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/6] dt-bindings: Changes for v5.11-rc1
    https://git.kernel.org/soc/soc/c/3f02c6a8280b
  - [GIT,PULL,2/6] soc/tegra: Changes for v5.11-rc1
    https://git.kernel.org/soc/soc/c/3afd2823c119
  - [GIT,PULL,3/6] firmware: tegra: Changes for v5.11-rc1
    https://git.kernel.org/soc/soc/c/85ccf83e5c5b
  - [GIT,PULL,4/6] ARM: tegra: Device tree changes for v5.11-rc1
    https://git.kernel.org/soc/soc/c/9c49a39c8cd7
  - [GIT,PULL,5/6] arm64: tegra: Device tree changes for v5.11-rc1
    https://git.kernel.org/soc/soc/c/914b8de3dd9e
  - [GIT,PULL,6/6] arm64: tegra: Default configuration changes for v5.11-rc1
    https://git.kernel.org/soc/soc/c/aa26d828df8f

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


