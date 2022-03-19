Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C78C4332F
	for <soc@archiver.kernel.org>; Sat, 19 Mar 2022 22:00:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4F843C340ED; Sat, 19 Mar 2022 22:00:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 28AD8C340F0;
	Sat, 19 Mar 2022 22:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647727211;
	bh=dvrX0pOLli2Nm5D3vpGDpiLuqQuh8mAMzTJprKcQYTk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=aIt8+dUF4wsT4kaTmCJdRBcGY4SgQ8nWfjpjgpB6+PYVRhhLuiBpNUx9s4xYRJstr
	 6HDzAH+yiyftZ1cvEBxtQ3MvM0swy/GAqHkhrIHElyVVoyUxbJ6DD39VdyunCD38LF
	 hHSDW5TwlTmmE+BnY4Cei/JSxiNljhc8zENqzHntW1risNB0L26rTZpV+nQwWCUnRQ
	 l4cIAm03R5LLyaXOyqGx9UgCIvcYRT2vAsZpJs5MI5Wsndv05anP8MoZjIp0uw8iJy
	 fJvNTLxHcoMmg1Kq0NE7Z6rJIRnAp4fQiNV9jrHbr3cwGT/dd8Ioa2StubZg3Zim+5
	 XBhrylqIMw9JA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0E9B4F03847;
	Sat, 19 Mar 2022 22:00:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/5] ARM: configs: fix multi_v5_defconfig
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164772721105.21632.1051197727366346613.git-patchwork-notify@kernel.org>
Date: Sat, 19 Mar 2022 22:00:11 +0000
References: <20220317183043.948432-1-andre.przywara@arm.com>
In-Reply-To: <20220317183043.948432-1-andre.przywara@arm.com>
To: Andre Przywara <andre.przywara@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 17 Mar 2022 18:30:38 +0000 you wrote:
> This series is a revamp of two patches contained in some Allwinner
> F1C100 DT update (patch 13 and 14 in [1]). Back then I was just syncing
> the result of "make savedefconfig" over to multi_v5_defconfig, but this
> revealed there were problems in the defconfig which warrant closer
> inspection.
> 
> This series fixes the multi_v5_defconfig in a way that "make
> savedefconfig" and multi_v5_defconfig come out identical, but also the
> options we mention in the defconfig are actually honoured. Currently
> some options are not enabled, because we lost dependencies over the past
> two years or so.
> 
> [...]

Here is the summary with links:
  - [1/5] ARM: configs: multi_v5_defconfig: remove deleted platforms
    https://git.kernel.org/soc/soc/c/30160c195596
  - [2/5] ARM: configs: multi_v5_defconfig: re-enable CONFIG_V4L_PLATFORM_DRIVERS
    https://git.kernel.org/soc/soc/c/f5eb04d7a0e4
  - [3/5] ARM: configs: multi_v5_defconfig: re-enable DRM_PANEL and FB_xxx
    https://git.kernel.org/soc/soc/c/9c44d0805f94
  - [4/5] ARM: configs: clean up multi_v5_defconfig
    https://git.kernel.org/soc/soc/c/4bcf5f95c7fd
  - [5/5] ARM: configs: multi_v5: Enable Allwinner F1C100
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


