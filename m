Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D9B2C43214
	for <soc@archiver.kernel.org>; Fri, 27 Aug 2021 22:10:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E9F0461002; Fri, 27 Aug 2021 22:10:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id D24E560ED5;
	Fri, 27 Aug 2021 22:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1630102208;
	bh=Q8vPm1INtrC7kmCz7X40ryR+8LsqMrcAAl7UDd+L9fU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=obXz916V+DBRrsrgd2g3fgNNpiIN6yw8EjNf1aVjBYIW0IMWtpAHpL9IohfQc16Hn
	 tMysbmnk3M/XQKfNcpsMT+vAEO1FGyuNipD5M3o2V22OQ+PDXnbP70sME4tOTFdTfY
	 78RvZOlPxkvELpJwZDj/gKiR4x56V0A8005gBgG5XluSymWED152BSsHqRAG71PrdP
	 yYQTGrZpuHI0Y/Yvjui8C//B6sAuchu/fEklvWCxYZ8c7LFeiICwxAaDbc4fjpmaMk
	 RF1RO2Nrp3Mu+9KGFE502jqO+ePvlpeaYycRD9LRkkabi1OAhJiz+/Yg0UnGuW2EC8
	 MtuEcxaNaQyHw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id BE70160A3C;
	Fri, 27 Aug 2021 22:10:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts64 changes for 5.15
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163010220877.19400.12761271667916033194.git-patchwork-notify@kernel.org>
Date: Fri, 27 Aug 2021 22:10:08 +0000
References: <4327460.usQuhbGJ8B@phil>
In-Reply-To: <4327460.usQuhbGJ8B@phil>
To: Heiko Stuebner <heiko@sntech.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Sun, 22 Aug 2021 12:18:06 +0200 you wrote:
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.15-rockchip-dts64-1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts64 changes for 5.15
    https://git.kernel.org/soc/soc/c/894c2e3620f6

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


