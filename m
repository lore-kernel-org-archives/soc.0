Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B325C4332B
	for <soc@archiver.kernel.org>; Fri, 22 Jan 2021 23:00:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 209E723B1C; Fri, 22 Jan 2021 23:00:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 0A4CB23B17;
	Fri, 22 Jan 2021 23:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611356413;
	bh=Q8dBl/69WLW4tDWvYYyNXLtdv3QcWp0V3svNJHSd7zE=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=PuA4WAXunNaaylkXoDJ3XI/StffMyHG/GKTwlfgjkQJLop96VZ04M4Rg6AjoHTfQz
	 6UdEbPM3w/qi3EVMeZneIycNjuLAFnOQGnqxLv+4fjBcMHH72TZv8UHm/tX8VzHTaX
	 gNGiGzYYNFlDmEjcIjOQ0QwvHjW+9h6HOug75Bl8GTvhyaArOE89cdESX62HlEyp8V
	 tMAiDCXFn2vy5EB6Ry5UYxoRFRQrgDWpaPqQf5rsHx2Cnm+PWSUblo6kmLmtR6g/y5
	 OTtqy1utGTo/akGGNWkCmOmWxQXKEtPWHwGU6ZoS6kOW6G7q82Kj01GLx/PjrkCwQZ
	 An7XqF56uSb0g==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 06A77652D1;
	Fri, 22 Jan 2021 23:00:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: at91: dt for 5.12
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161135641302.29035.6298110587540497556.git-patchwork-notify@kernel.org>
Date: Fri, 22 Jan 2021 23:00:13 +0000
References: <20210122145056.171283-1-nicolas.ferre@microchip.com>
In-Reply-To: <20210122145056.171283-1-nicolas.ferre@microchip.com>
To: Nicolas Ferre <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Fri, 22 Jan 2021 15:50:56 +0100 you wrote:
> From: Nicolas Ferre <nicolas.ferre@microchip.com>
> 
> Arnd, Olof,
> 
> Here is the first batch of dt changes for 5.12. As for the SoC PR, I plan to do
> another one by mid-next-week. Tell me if it's fine with you.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: at91: dt for 5.12
    https://git.kernel.org/soc/soc/c/8a4e89a16aa4

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


