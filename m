Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B772C48BE8
	for <soc@archiver.kernel.org>; Tue, 15 Jun 2021 16:00:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5709961628; Tue, 15 Jun 2021 16:00:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 4095961490;
	Tue, 15 Jun 2021 16:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623772813;
	bh=PH+D76x2SJKDfUv9gJ1T4z+UGa6lkMvJZHwT2nvkkWI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=KhWG7Ki/Zyx7zemUbFFA+p/ytBhVWyl7bTTLAQDJ+YUZU1pzUkyZInMQEJw4yApIr
	 +5R3fgz20zFGHjnkhzDCp57MX2D1Q/pAElI9CXQyTWaOdool6IvcIFWovFahKMB6+v
	 h26q2wVcjlc+9wVCEnxEAylYCZ4OPLTBniSe5Y8GusyQeglxJXDbAex+ZctkHihxbE
	 kRVXurJjYHebHS872k4SaltSbRsOK20aDk6dFaAs4aniohEJEuh3kouyk1Fx1l2uAf
	 /ESwwLGkM1ToknXJsmsQ4Nk2DTzzx239LwPrPLbGUJHYXjb3UD0zJzlZHtj/Jxk048
	 /v7qCodvNpbfg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 3B75060953;
	Tue, 15 Jun 2021 16:00:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/6] dt-bindings: Changes for v5.14-rc1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162377281323.17464.10510938285704487671.git-patchwork-notify@kernel.org>
Date: Tue, 15 Jun 2021 16:00:13 +0000
References: <20210611164437.3568059-1-thierry.reding@gmail.com>
In-Reply-To: <20210611164437.3568059-1-thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Fri, 11 Jun 2021 18:44:32 +0200 you wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:
> 
>   Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/6] dt-bindings: Changes for v5.14-rc1
    https://git.kernel.org/soc/soc/c/479011d4f22a
  - [GIT,PULL,2/6] soc/tegra: Changes for v5.14-rc1
    https://git.kernel.org/soc/soc/c/777cf27fb226
  - [GIT,PULL,3/6] firmware: tegra: Changes for v5.14-rc1
    https://git.kernel.org/soc/soc/c/5dad6db1c45c
  - [GIT,PULL,4/6] ARM: tegra: Device tree changes for v5.14-rc1
    https://git.kernel.org/soc/soc/c/8fb202c77fc6
  - [GIT,PULL,5/6] ARM: tegra: Default configuration changes for v5.14-rc1
    https://git.kernel.org/soc/soc/c/020b31abb7ad
  - [GIT,PULL,6/6] arm64: tegra: Device tree changes for v5.14-rc1
    https://git.kernel.org/soc/soc/c/d7fe0d42b5f9

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


