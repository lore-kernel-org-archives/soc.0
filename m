Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CB1FC4743E
	for <soc@archiver.kernel.org>; Sat,  5 Jun 2021 22:58:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2D0BD6141E; Sat,  5 Jun 2021 22:58:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 144386140F;
	Sat,  5 Jun 2021 22:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1622933885;
	bh=4iVuNPD8Jj7H0n9uYY90fiRgNrbHtchyF+ORlVzdNKA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=cZUvFPCEnJVMBBd4WuPX3lSe60KRE0LTc7B69JBItKLsiTYRp1JrnVasFFnURchOJ
	 7YzNBeepbOtZFDdARYdfU9hO4i2PV+ApDavt3x+V+bG0dnP+NjuU+/+EFFa5ItBJGb
	 YQ5hYnpTsqqppYpSC8f+g8PC2EvzlBWRtDwyKu+nGt1W+QrJiKfbGOMI3qS4Xirhqk
	 Kn0kCUzKrXHxVmjDAZS/RP2W3AD5VjcDOTiEGURwEPk5BumtI4YPi4NPC9DmU/cRXr
	 w40EKR1vG4S7ZJkSRfuJ8uu1D/GlYdGvS+C1HKUHok2EoWiEAJpGnkfICxjQxfzRZf
	 wrTyKVDQ9V3qA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 084FB609F7;
	Sat,  5 Jun 2021 22:58:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: SoC fixes for 5.13
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162293388502.32315.5527516660061229798.git-patchwork-notify@kernel.org>
Date: Sat, 05 Jun 2021 22:58:05 +0000
References: <CAK8P3a0QqwkGDabWzD+oDp7jsfkuLEaFxmCaHBuu_HVd4TxLXg@mail.gmail.com>
In-Reply-To: <CAK8P3a0QqwkGDabWzD+oDp7jsfkuLEaFxmCaHBuu_HVd4TxLXg@mail.gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/arm/fixes):

On Thu, 20 May 2021 23:04:12 +0200 you wrote:
> The following changes since commit 0c855563182001c829065faa17f8e29e9ceffe13:
> 
>   Merge tag 'arm-apple-m1-5.13' of
> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc (2021-04-26
> 12:30:36 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: SoC fixes for 5.13
    https://git.kernel.org/soc/soc/c/ba816d3c265c

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


