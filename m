Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC98CC6379F
	for <soc@archiver.kernel.org>; Mon, 30 Jan 2023 22:31:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B9EF5C433AE; Mon, 30 Jan 2023 22:31:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A4680C433A4;
	Mon, 30 Jan 2023 22:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675117860;
	bh=h/QnozNPIGdWYuUQcysNOQ0uFTHLyKl0NMfG4nLFNec=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=WNxmxL+LcE7i+amOV13/k+SwdxeofRiXbr37Pikc63uQwxR1EAKcRXHTZKmttKoHn
	 n+Nlw+QEHL7rmYNFUyLCFSS0n+5JjM8JC7ig/cho+yCAmK+rOMTRKB0GHAHERElCe8
	 N6Op64rboEL606lQ8Hg9TGHbhJmzOKNoDzg7juqloT70zvVxZFcbOOCU9iaRohnTjR
	 fQbZhgPQ2hReP0Yoi62f16lG19ejgInfnkwo5sB/YZM17YYxFHQwRVwpGsJc1/hv5R
	 e5tOZ/4rl9qkLp1VcCnZDsHpf+9KZeX1+Lxjfq8xocbg4tI9u3onfEM4DStmv19AEq
	 2VSPXRH/wyMqA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7F8EDE52559;
	Mon, 30 Jan 2023 22:31:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/6] i.MX drivers change for 6.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167511786051.29049.18027434116259352420.git-patchwork-notify@kernel.org>
Date: Mon, 30 Jan 2023 22:31:00 +0000
References: <20230130023947.11780-1-shawnguo@kernel.org>
In-Reply-To: <20230130023947.11780-1-shawnguo@kernel.org>
To: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 30 Jan 2023 10:39:42 +0800 you wrote:
> The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:
> 
>   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-drivers-6.3
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/6] i.MX drivers change for 6.3
    https://git.kernel.org/soc/soc/c/e0530b9ea708
  - [GIT,PULL,2/6] i.MX SoC update for 6.3
    (no matching commit)
  - [GIT,PULL,3/6] i.MX DT bindings update for 6.3
    https://git.kernel.org/soc/soc/c/ae3ddc207639
  - [GIT,PULL,4/6] i.MX arm device tree change for 6.3
    https://git.kernel.org/soc/soc/c/739a7c29a704
  - [GIT,PULL,5/6] i.MX arm64 device tree change for 6.3
    https://git.kernel.org/soc/soc/c/4503fc6ea333
  - [GIT,PULL,6/6] i.MX defconfig change for 6.3
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


