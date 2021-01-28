Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EEBEC4332D
	for <soc@archiver.kernel.org>; Thu, 28 Jan 2021 14:40:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DC3B664DE3; Thu, 28 Jan 2021 14:40:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id C42C064DE0;
	Thu, 28 Jan 2021 14:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611844831;
	bh=qkhdda/OSy0XkqA9JdlxeaDKKnh2RWBFqxHTC5rFJMQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Tpm3Tjr++nwdNZwpVHN/RHkzMoWVEC1cV8s9QQdBoZIDXGF9mTcURkG6UmkdYjW9C
	 sKfmI3sRqK3RrP2NZiNpPBwc4/ABMeTEkTY0lfNAiujo/G0NRfjlG6c8xFWX0DTzqe
	 wErMhS8/rkKZAhkCJdJOHizP8yxA4qIH94+MQGwB1BXcHX4Tma1gDzM3psA72KB3vU
	 ik0x8PS1ivXpEYbf8Y+cnnOihM2ujP8pg2P3P2LkwR0GDS6GGZwPbntSeRGjavNc1e
	 Kz6LrXoWVpV5Hp6DSdcs/zJnsEMWDEMVUmd5X4YCo9iVxNdbVOcuS0gl2MuRyfZG78
	 JTW+8NHKTbzuA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id BFE3A6531F;
	Thu, 28 Jan 2021 14:40:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts fixes for 5.11
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161184483178.28855.8379667456804438318.git-patchwork-notify@kernel.org>
Date: Thu, 28 Jan 2021 14:40:31 +0000
References: <5429065.DvuYhMxLoT@phil>
In-Reply-To: <5429065.DvuYhMxLoT@phil>
To: Heiko Stuebner <heiko@sntech.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Thu, 28 Jan 2021 09:32:05 +0100 you wrote:
> Hi Arnd, Kevin, Olof,
> 
> please find below some Rockchip devicetree fixes for the 5.11 cycle.
> Please pull!
> 
> Thanks
> Heiko
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts fixes for 5.11
    https://git.kernel.org/soc/soc/c/f2d514b4f428

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


