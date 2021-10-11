Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33772C433EF
	for <soc@archiver.kernel.org>; Mon, 11 Oct 2021 21:50:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0851560F5B; Mon, 11 Oct 2021 21:50:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id E3C7C60EB4;
	Mon, 11 Oct 2021 21:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633989009;
	bh=D6Ybh2uE1DOMatR0tOufx0kIAui3XSoYfJ1BoGCF5MQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Pb4gQDhh9CLHPUNXbi/BOJfy/tVJGwH3DbluDtV0i0g87iIkV4mbFl5w83wTELpR9
	 jEVolgODoWSrG0vBvveM1NmY72okLx1Cdr9LRzcr8RJ7yIxwVYpTrL6GhPnho+Jq2m
	 6UWZ6uJiapQZCY7lH2JiE0KGizJEpzbjZIMtsuQZ9tjOc5j1jXFN31NGL8H0O8t7q+
	 mnNHuWSgxF1okPTnktiLDHn6s9UnqMY74T1kaxnBAPb/9kcl4Ho+SxKhRK3R6jbBhS
	 UK79vMP/zjR6RcjXVSFhLXsG3cYTVNyPpvXtJ24VxF1K6cCJxrrwgTKauy3/fGszyN
	 UvpBLo8xP38lg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id D2A8260989;
	Mon, 11 Oct 2021 21:50:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/2] Add Unisoc's UMS512 support
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163398900985.3472.13555193043757302800.git-patchwork-notify@kernel.org>
Date: Mon, 11 Oct 2021 21:50:09 +0000
References: <20211008034533.343167-1-zhang.lyra@gmail.com>
In-Reply-To: <20211008034533.343167-1-zhang.lyra@gmail.com>
To: Chunyan Zhang <zhang.lyra@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  8 Oct 2021 11:45:31 +0800 you wrote:
> From: Chunyan Zhang <chunyan.zhang@unisoc.com>
> 
> Unisoc's UMS512 has Octa-core ARM Cortex A55 application processor.
> 
> Changes since v1:
> * Renamed regulator node name and add required 'reg' property for it;
> * Removed sprd-uart.yaml which got merged already;
> * Added Rob's Acked-by for bindings changes.
> 
> [...]

Here is the summary with links:
  - [v2,1/2] dt-bindings: arm: Add bindings for Unisoc's UMS512
    https://git.kernel.org/soc/soc/c/77d7e51ebee9
  - [v2,2/2] arm64: dts: Add support for Unisoc's UMS512
    https://git.kernel.org/soc/soc/c/23410de5796c

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


