Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BB93C433E9
	for <soc@archiver.kernel.org>; Sat, 30 Jan 2021 00:00:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8741864E0A; Sat, 30 Jan 2021 00:00:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 66B3164E02;
	Sat, 30 Jan 2021 00:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611964809;
	bh=x5NPn5IcWXZzh1gDD755GLQ4Sx0vHdTvC6AtlXBsHZg=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=tumkySdnForsS0EQGuj1de1r1rjfL7fzK45PDhdEk/xolCcAqiPszvkIU23BqvJsH
	 or+pRgXIU2NWhWJQy44zB5niQ1rUbWCPvMjxgZgXC4riJ6kqqet+3UYh2l01QcS5jh
	 3DGuZqiA4Ljjsfc1A99jiO6Y27qRUEOP3fnH9hQ2t2JFlU8Kv5UhL+8CVdkZAfpsjS
	 IJEzOexmReVY7ai4pXn0BptWO3w09ehHB/KnrcHXcKAP0HYPSvS4SRMn+MyrxM/h9I
	 B8DDQTB6gMpu/Q3pgUIG2TaV1l4FDYaaE0G0nDlgNeyYcHw6GtYlmiJro3LmMpDCgd
	 03VKV8D7TJUkQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 631BF6095D;
	Sat, 30 Jan 2021 00:00:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: multi_v7_defconfig: add STM32 CEC support
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161196480940.10199.3110091203534513856.git-patchwork-notify@kernel.org>
Date: Sat, 30 Jan 2021 00:00:09 +0000
References: <20210129084842.29123-1-alexandre.torgue@foss.st.com>
In-Reply-To: <20210129084842.29123-1-alexandre.torgue@foss.st.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (refs/heads/for-next):

On Fri, 29 Jan 2021 09:48:42 +0100 you wrote:
> From: Yannick Fertre <yannick.fertre@foss.st.com>
> 
> Enable CEC support for STMicroelectronics as loadable module.
> 
> Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> 
> [...]

Here is the summary with links:
  - ARM: multi_v7_defconfig: add STM32 CEC support
    https://git.kernel.org/soc/soc/c/7ec5ed4a13b4

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


