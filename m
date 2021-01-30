Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C9C9C433E9
	for <soc@archiver.kernel.org>; Sat, 30 Jan 2021 11:30:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5A82A64E0C; Sat, 30 Jan 2021 11:30:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 43E9C64E0A;
	Sat, 30 Jan 2021 11:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612006208;
	bh=25I2IDvYWT5pOm4J4p0lFFE5UKgRxXFVyP7zXD+uk2k=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=H5OP6wC3iPNaNdZd3MkgEP8HWTw5JV38fKM5JT+yoywr/1mrPZ/V/Mg7YN+Amg/SQ
	 HRi44aOYmqYIcEMCUWCo+2Uh8z+OFm7o+Xz5UyD+hFWgAtg5FhEaeyKMhfyte2ei0y
	 NKVTB0AwDV4LvzMjuXbdoTFjasVNtG3bEAojMx3/fUnmHKsnYi9/ty/0fEU13ApVsl
	 aBkDBTBosLsi8kuMdBMRkeZIMjStrFDb5q61J55qF0yMF9HH6iNQ4NJJOul33vOiIL
	 5B6Z/g86ZkFNrSxQYe69l1lZ1jpbeZjImyyq8ZG4RfzpXYFY4plrhYGJlLwXyFJM/M
	 ZKJeeXaQ9ov4Q==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 33D7E6095D;
	Sat, 30 Jan 2021 11:30:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: at91: soc for 5.12 #2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161200620820.5475.16001685043337515339.git-patchwork-notify@kernel.org>
Date: Sat, 30 Jan 2021 11:30:08 +0000
References: <20210129090030.26976-1-nicolas.ferre@microchip.com>
In-Reply-To: <20210129090030.26976-1-nicolas.ferre@microchip.com>
To: Nicolas Ferre <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Fri, 29 Jan 2021 10:00:30 +0100 you wrote:
> From: Nicolas Ferre <nicolas.ferre@microchip.com>
> 
> Arnd, Olof,
> 
> Here is the second batch of soc changes for 5.12. Actually first batch was
> consumed as "fixes" following our discussion here:
> https://lore.kernel.org/linux-arm-kernel/CAK8P3a1v=_4E40cZjZ-ff7vs84XE9XaxwdoGW7Rf+LYiA+TCTw@mail.gmail.com/
> Note that v5.11-rc1 is the root of this Pull-Request so the 2 first patches are
> the ones already taken as fixes.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: at91: soc for 5.12 #2
    https://git.kernel.org/soc/soc/c/4940b9919119

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


