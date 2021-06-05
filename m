Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6097C48BD1
	for <soc@archiver.kernel.org>; Sat,  5 Jun 2021 22:58:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 55E996142A; Sat,  5 Jun 2021 22:58:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 3E3076136D;
	Sat,  5 Jun 2021 22:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1622933885;
	bh=1Qm7yECAH0R15FpYZqoGjyYygwuUCfRHRDxSp0fxtSM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Zadb9AJbFCUNVc2ytW/sPfw6voGDq0uu2fGFk9qJ1hzavefpLtvxdk3GE7Cb7t4BF
	 VntSoVR+8VqGBoBgpn+zguFXTAPu0R+rhPxZqttc2jbPGDpO6zruZkQhoF+3BYpRCx
	 RzYMrHyj6qFZMGVKQF3kz3AL5mEMGSVCPKgIriMGiR+tnVP73A2iBvsZE5Y/cVkiuK
	 MXQjCtuySB5mNzIXfrYH3otQXq9+vMkZ2tIlJ66c+yljobOzw4295/kU+myyYoWS8c
	 CU9kIIRYN+DKAukcPnRhaYHVoM+1pBKqXy2GrTRzGtbqyDk3pA0MB3wJIuYyKdx+eT
	 5AXbkTYOXDIYw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 341F1609B8;
	Sat,  5 Jun 2021 22:58:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: TI K3 fixups for v5.13 rc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162293388520.32315.16791944798585701170.git-patchwork-notify@kernel.org>
Date: Sat, 05 Jun 2021 22:58:05 +0000
References: <20210518115634.467vgpbzplal5kou@obituary>
In-Reply-To: <20210518115634.467vgpbzplal5kou@obituary>
To: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/arm/fixes):

On Tue, 18 May 2021 06:56:34 -0500 you wrote:
> Hi,
> 
> These are minor fixups for the 5.13-rc towards making the yaml
> conversion of various txt files in 5.14-rc1.
> 
> The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: TI K3 fixups for v5.13 rc
    https://git.kernel.org/soc/soc/c/b9c112f2c223

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


