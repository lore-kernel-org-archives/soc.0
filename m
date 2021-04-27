Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28E4EC433ED
	for <soc@archiver.kernel.org>; Tue, 27 Apr 2021 21:22:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id CBE6B613F9; Tue, 27 Apr 2021 21:22:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id B316B613F3;
	Tue, 27 Apr 2021 21:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619558562;
	bh=9e6IiNdJciQCgObCvOGC9haRliCsXVQwVG5c5DUztGw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=DYYtM5pKfNDaxfCHEM11xLfWnTrU+c2A3a+f5hHcQK5sg45WtyfzAqKaU/KgOiWYa
	 bb8xgJ9szQCmCWqDAjKo9QUto5/VRhgvC/XbaQHXOLaMXRnc0jSg8oHF3lEy3IA/ve
	 43h/Zau7j7DxSI4vgQJ4HqtBO9utsvOCBXrkxBtfJAp5OxXGEVH8bYitrU/fq3i/JM
	 OF2yDc3HDSnbzBKmFhFD7KSS7GWVKcfy66g4Jo/8fDdX0Bc3cl/IrjyBxBQtbJ8b89
	 VC+3uo+9VfDDbyueyyfub94cMfxz/GDLCTXBk3jBEpQPM6DtX9uzEpzEuRg3qc4biF
	 Ohq65O4axiBmA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id AA57C60A24;
	Tue, 27 Apr 2021 21:22:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 0/6] ARM SoC branches for 5.13
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161955856269.21098.3431585367624887707.git-patchwork-notify@kernel.org>
Date: Tue, 27 Apr 2021 21:22:42 +0000
References: <CAK8P3a2RjRSjTcmwVf3VHy2CUB2HBj5AaJTx=1NSYuA_Qy4E-w@mail.gmail.com>
In-Reply-To: <CAK8P3a2RjRSjTcmwVf3VHy2CUB2HBj5AaJTx=1NSYuA_Qy4E-w@mail.gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (refs/heads/arm/fixes):

On Mon, 26 Apr 2021 17:52:39 +0200 you wrote:
> Here are six branches for the SoC tree for the 5.13 merge window.
> There are a couple
> of new SoCs this time, with the initial Apple M1 support being the
> most exciting one.
> The STM32H750 platform is also noteworthy because it's fairly
> unexpected to still
> see new MMU-less boards.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/6] ARM: SoC changes for v5.13
    https://git.kernel.org/soc/soc/c/01d713689441
  - [GIT,PULL,2/6] ARM: defconfigs for v5.13
    https://git.kernel.org/soc/soc/c/2b90506a8186
  - [GIT,PULL,3/6] ARM: SoC drivers for v5.13
    https://git.kernel.org/soc/soc/c/37f00ab4a003
  - [GIT,PULL,4/6] ARM: devicetree changes for 5.13
    https://git.kernel.org/soc/soc/c/f7857bf3745e
  - [GIT,PULL,5/6] ARM: platform support for Nuvoton WPCM450
    https://git.kernel.org/soc/soc/c/6b0fbc540c2f
  - [GIT,PULL,6/6,look,out,for,dependencies] ARM: platform support for Apple M1
    https://git.kernel.org/soc/soc/c/0c8555631820

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


