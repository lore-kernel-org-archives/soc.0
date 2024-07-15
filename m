Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D90F0C3DA59
	for <soc@archiver.kernel.org>; Mon, 15 Jul 2024 11:50:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AEB72C4AF0B; Mon, 15 Jul 2024 11:50:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 96D96C4AF0E;
	Mon, 15 Jul 2024 11:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721044230;
	bh=df68f73UajWhUHpXFUbxOg25Id1OkoTmUgDF4iR2i0w=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=IUxhyFtzc1joimCY5zJPDkVUAXGTpSZSZshvwpw/lAtcm5D4Ro0/ZLov8j/8AFq32
	 zEDJRY/TxTE4v6Eb+I0b00ubQg5862BdLpMRsPeSzoBQrILgKfnSfYr5nqZ4S6MhqV
	 hooh3UVA1Jcggk+4wejw36y1Xp3RzQC6rMGJZo5WoUSOeTFcA+fbW9eII6P0QRfyWT
	 FsTSCoRfm4y41M0UhLUIm0Ml5+GKfviy5ECL9B602pGPzNIsxU9lm133NqlRg1a3OW
	 CUIy1t1Cv3U34tbDSq1PhSioPkrnQnrrjQpOohaFwzTRlX2dytvR6q72To892yezma
	 vYlll6JeLHc+Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 85F49C43445;
	Mon, 15 Jul 2024 11:50:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: pxa: fix build breakage on PXA3xx
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172104423054.10224.15558442776745375438.git-patchwork-notify@kernel.org>
Date: Mon, 15 Jul 2024 11:50:30 +0000
References: <ZpH12w9vyZZDdzDb@google.com>
In-Reply-To: <ZpH12w9vyZZDdzDb@google.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 12 Jul 2024 20:34:51 -0700 you wrote:
> Commit 917195d6f829 ("ARM: pxa: consolidate GPIO chip platform data")
> tried to reuse the same instance of platform data for PXA25x and PXA27x
> GPIO controllers by moving it into arch/arm/mach-pxa/devices.c
> Unfortunately this file is built for other PXA variants which resulted
> in the following error:
> 
> >> arm-linux-gnueabi-ld: arch/arm/mach-pxa/devices.o:(.data+0x167c): undefined reference to `gpio_set_wake'
> 
> [...]

Here is the summary with links:
  - ARM: pxa: fix build breakage on PXA3xx
    https://git.kernel.org/soc/soc/c/dead06c5e110

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


