Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF6CC3DA58
	for <soc@archiver.kernel.org>; Mon,  8 Jul 2024 15:11:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 27783C4AF53; Mon,  8 Jul 2024 15:11:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 118E0C4AF4D;
	Mon,  8 Jul 2024 15:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720451508;
	bh=5NKk6f9fkPysktlv3T9jC2+31bUaQ/OzN3vuJZAIOBU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=GSajkKwyNn/mojyBkt6+OYDqWMbmnKk1sck3rgWLtM1frB5/DFOG+Ph38qL76qzaw
	 9ZDY8/7mnkGKJQqs/O0x7wuXIadYw7rpxD/6hg3xJd24pRGYNcthODgSKaV/8HUXSu
	 Jcf5uuJGBbIVC3IPFRZ/5WzQmtNYrd6WoGmiqlsTmWApoyFMOVpnmfOdy+9gfZecCK
	 vxklBzxW1P+gn66wzmfpVuJE53SzcH/GccpY9yCLG/+8a02iuhihhlYx1c8/ayE3gC
	 53ktRceHVBbR+jp9jpQ/mtIPEkXARmJHzsyxXHzZ/BHo81ykGcJe4dvKwm/zm1EJCS
	 981rnJLNWATRA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 053A5DF370E;
	Mon,  8 Jul 2024 15:11:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] MAINTAINERS: ARM: axm: add Krzysztof Kozlowski as maintainer
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172045150801.17395.10148547634550694847.git-patchwork-notify@kernel.org>
Date: Mon, 08 Jul 2024 15:11:48 +0000
References: <20240613134910.7862-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240613134910.7862-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>:

On Thu, 13 Jun 2024 15:49:10 +0200 you wrote:
> There is no maintainers entry for the ARM LSI AXM SoC, thus patches end
> up nowhere.  Add such entry, because even if platform is orphaned and on
> its way out of the kernel, it is nice to take patches if someone sends
> something.
> 
> I do not plan to actively support/maintain AXM but I can take odd fixes
> now and then.
> 
> [...]

Here is the summary with links:
  - MAINTAINERS: ARM: axm: add Krzysztof Kozlowski as maintainer
    https://git.kernel.org/soc/soc/c/296c0bb50e31

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


