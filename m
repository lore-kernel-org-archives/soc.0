Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05230C433E0
	for <soc@archiver.kernel.org>; Fri,  8 Jan 2021 15:30:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B88ED2399C; Fri,  8 Jan 2021 15:30:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 9F375239A1;
	Fri,  8 Jan 2021 15:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610119808;
	bh=esOJxiomr3mDwAgkYG2eSG/n2VFYd8VS+XiU5v/oNKI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=dP3L32yrKLByQ1MUo630aPDcyzmyfLgdowSUl2udnjlDUoWOpve/X9tZOQbxyF10A
	 a5x9J2D4xwAUsqsOFUbzCdO6D3ag6lKqxAqmVOY9MaeXusdjwwYn9unXXX4DnPFeRc
	 Ou2adkgF2oU5ynn72+SVrbOrToewwT2Jn3g/qvRxRAyh2oZuuUMoZHGA+QXooptK1/
	 5ICU5CDAgNIxhX9naueJIug9iGv7xSXvCmWdngk+cm6KZxH4En8AkwE+Y1HrmUSYXA
	 vybFgHr5/9nhpOtQDPGuErpJa/lJaqGJG3K4JDTM+7ju2t2VQtXYgpdVUaB1HLkPOV
	 DMWY2F+/20bnw==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 8F070605AC;
	Fri,  8 Jan 2021 15:30:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: picoxcell: fix missing interrupt-parent properties
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161011980858.25062.9062141682289300661.git-patchwork-notify@kernel.org>
Date: Fri, 08 Jan 2021 15:30:08 +0000
References: <20201230152010.3914962-1-arnd@kernel.org>
In-Reply-To: <20201230152010.3914962-1-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (refs/heads/arm/fixes):

On Wed, 30 Dec 2020 16:20:05 +0100 you wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> dtc points out that the interrupts for some devices are not parsable:
> 
> picoxcell-pc3x2.dtsi:45.19-49.5: Warning (interrupts_property): /paxi/gem@30000: Missing interrupt-parent
> picoxcell-pc3x2.dtsi:51.21-55.5: Warning (interrupts_property): /paxi/dmac@40000: Missing interrupt-parent
> picoxcell-pc3x2.dtsi:57.21-61.5: Warning (interrupts_property): /paxi/dmac@50000: Missing interrupt-parent
> picoxcell-pc3x2.dtsi:233.21-237.5: Warning (interrupts_property): /rwid-axi/axi2pico@c0000000: Missing interrupt-parent
> 
> [...]

Here is the summary with links:
  - ARM: picoxcell: fix missing interrupt-parent properties
    https://git.kernel.org/soc/soc/c/bac717171971

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


