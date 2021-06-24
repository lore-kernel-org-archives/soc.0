Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27077C49EA7
	for <soc@archiver.kernel.org>; Thu, 24 Jun 2021 02:40:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E355E613C5; Thu, 24 Jun 2021 02:40:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id CD611613C0;
	Thu, 24 Jun 2021 02:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1624502410;
	bh=00+3y8Wl8rNf8kAAfjbhYt1RrO+r/sLYYdX3VVinJ5Q=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=OL637EId1NEJU5D3yzIBN9/x/tGq5Gvusdpbde6k/8P1vpNPkSiKeMNHW+y0zuVmu
	 pYepV+eOw35jWRuGqAcnSjgdXWV0njp6WlZZwDacQBxdQNCoYl0Gy9gY0p90stQOhw
	 +Ki7EbFylluOU7I96vvk+qHrLrgXmc+YRqSDFuKpEuVwcKh7fWXCHE6Rd/1Z4AeLmp
	 8oLBL9r9syRwyNuir3sDkOMyuEzb0eWg6Z1EqzP4S2HUhF69EXYU9SDfrVIWR2JGoK
	 nt/EvkLi//yeI9gjtPlwusZaX/GKVTO6CTS98gS4ZhcBXS690VSDy29gOIH7RLmwan
	 4FdqJG/Es01Ag==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id C803C60A4D;
	Thu, 24 Jun 2021 02:40:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts32 changes for 5.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162450241081.24025.9781745180899117669.git-patchwork-notify@kernel.org>
Date: Thu, 24 Jun 2021 02:40:10 +0000
References: <2084346.irdbgypaU6@phil>
In-Reply-To: <2084346.irdbgypaU6@phil>
To: =?utf-8?q?Heiko_St=C3=BCbner_=3Cheiko=40sntech=2Ede=3E?=@ci.codeaurora.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Mon, 21 Jun 2021 00:33:18 +0200 you wrote:
> The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:
> 
>   Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.14-rockchip-dts32-1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts32 changes for 5.14
    https://git.kernel.org/soc/soc/c/f82c6e6dd149

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


