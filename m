Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED31CC433E9
	for <soc@archiver.kernel.org>; Tue,  9 Feb 2021 16:41:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9007164EC9; Tue,  9 Feb 2021 16:41:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 7825964EC7;
	Tue,  9 Feb 2021 16:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612888861;
	bh=2i7R/OhE9+mYf4PHdEFMwV6dAJm0o2/Wo/nyQu+4RHc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=SeZmfHsxKptLky5qkxnsd6c4GiWgNggXpXJ/Mg8Jy4Ghg1urCsvbiUZ2xdiX2jJx0
	 iiiL7ut8g4998yqb/OdbXvpCo54xbO+nkPkMxikXI89yUWsCSuW8jn+6I7UouwMc6F
	 Oml/AlV4AMB89nLpxCIc2KyGv+GAN/9ha7GJrqszrqCV9AAdzR6j6YkFjJy+dIl1WR
	 rUfZ6hgsVlISNp/V2xzfazFyiHCDrGn8hfWQoNk9CVQUbqnVs5T5jTOCKWJWFCyz+2
	 5Hp2dFPqrIHR9TZHM8S1pmi9UDUyj2SODhjqPJxVOIpLv59WrAH8HplUXciJ5wi9JP
	 jTRiqYGILbn3g==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 6BF10609D6;
	Tue,  9 Feb 2021 16:41:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Defconfig changes for omaps for v5.12
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161288886143.29773.3384340001350363552.git-patchwork-notify@kernel.org>
Date: Tue, 09 Feb 2021 16:41:01 +0000
References: <pull-1612421637-483551@atomide.com>
In-Reply-To: <pull-1612421637-483551@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Thu,  4 Feb 2021 08:54:15 +0200 you wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Defconfig changes for omaps for v5.12
    https://git.kernel.org/soc/soc/c/c76fe896d6fd

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


