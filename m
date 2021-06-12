Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55DF7C49EBB
	for <soc@archiver.kernel.org>; Sat, 12 Jun 2021 16:10:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B0EDE6138C; Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 90FF1613BF;
	Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623514216;
	bh=++hSc+W+YybCzw4JpuUNPsbz4oRVW0JR+40H90LM1Zw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=TcWSGIMOKmeqGq39QLlYoCGaxjwL4d+JusVQcYxaVyd61lxIx3p988F6BmBEeGyuV
	 or+idqfUIqMDI6gB2ZJ2XPKVXBAbT6rrS1PgplNRGaAYDSWyjjJVBYlvhnRsse1kQD
	 5IgjNJ6I8FfuAhaTSkVOnU6WHQE6WWYy62lrMBo+ZbyEU7TDVbIGmbry87OvWXCvm4
	 R3kpiDxle9Rycl7qlrLhVyMfOyo1thZMO6hY1d0ke5RQuepSlBilKgir9jPmhqELhZ
	 HFghXJjmvzJcjHhrW9/R4tgbbR0ZnwnCeXYoUmsDO7peWsjBmUSwEwiGN71EJKT/pE
	 0KEVeTvzQNlkA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 807D560A6C;
	Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 0/2] Renesas ARM SoC updates for v5.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162351421652.27448.9437344986993816799.git-patchwork-notify@kernel.org>
Date: Sat, 12 Jun 2021 16:10:16 +0000
References: <cover.1622188833.git.geert+renesas@glider.be>
In-Reply-To: <cover.1622188833.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (refs/heads/for-next):

On Fri, 28 May 2021 10:30:48 +0200 you wrote:
> Hi soc folks,
> 
> This is my first pull request for the inclusion of Renesas SoC updates
> for v5.14.
> 
> It consists of 2 parts:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] Renesas ARM defconfig updates for v5.14
    https://git.kernel.org/soc/soc/c/3f43257e3c06
  - [GIT,PULL,2/2] Renesas ARM DT updates for v5.14
    https://git.kernel.org/soc/soc/c/09159b8025e0

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


