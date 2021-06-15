Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA0FFC49EA2
	for <soc@archiver.kernel.org>; Tue, 15 Jun 2021 16:00:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9C50E617ED; Tue, 15 Jun 2021 16:00:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 7F968616E9;
	Tue, 15 Jun 2021 16:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623772813;
	bh=9Gngd0r0vgTqdSYmaGrKaKTZraO12khpMqmlEwAiRNc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=e1OGlV31GU62dMwL3zy5Sw7FsVpqEbQtvo5dp7bpt1UraMa4hBa63mJz8c9NYqvjg
	 eZyZepkT66iAczQfB5hCDoiM+nTySE2MmRMdV5Gf3HJYtPIoJ/1P5XVSk0hPjWYuNC
	 9ave0SGG3wxiDkZy3psgpObRbVyDycaUss9vJo6n5Qz6mlLFbr2SY43CdOVH/aD3H7
	 nc0oY9EOmcfnMsA0/kh2imxV4Uwaax0Pl/bhmV3eaK7RsFEoh4b01dvEUpRWmkNfBE
	 6zrOQn0WujGKSda81K08vjPmQCDKjyIj061GsQjMaTo9UtLBls6z8B0DTGf8aoM3L/
	 0JP3+t+AAa/tw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 6FDF960953;
	Tue, 15 Jun 2021 16:00:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: Visconti: device tree changes for 5.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162377281345.17464.9020609330197751955.git-patchwork-notify@kernel.org>
Date: Tue, 15 Jun 2021 16:00:13 +0000
References: <20210614234654.2u3xetnn5rwhymwz@toshiba.co.jp>
In-Reply-To: <20210614234654.2u3xetnn5rwhymwz@toshiba.co.jp>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Tue, 15 Jun 2021 08:46:54 +0900 you wrote:
> Hi SoC team,
> 
> This request includes the PWM DT patch for the Visconti SoC.
> Please pull for v5.14 kernel cycle.
> 
> The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: Visconti: device tree changes for 5.14
    https://git.kernel.org/soc/soc/c/e6640fa697f3

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


