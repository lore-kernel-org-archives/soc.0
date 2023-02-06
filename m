Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E491C6379F
	for <soc@archiver.kernel.org>; Mon,  6 Feb 2023 11:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 288CFC433A4; Mon,  6 Feb 2023 11:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0E125C4339B;
	Mon,  6 Feb 2023 11:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675682418;
	bh=HOMCYSWlP9cCqEmbzpFlvjwYHSmm7ufkhoTpnmkiIMY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=surOgxhh3lGCa1Pu02d3q0VRFlNML5LR33O8fbeam9e+/1ncOKgQYzpXBKNFSbzvb
	 tASwimISdbnbcHpPrex1s/Rgf/dYlAn2ARSLO1od9IIObeLkkFCRaqItq/QFcJeNnq
	 6UA0cFqNnEo0HPyaXqkWBjX/+FDCcuN4crzJkaqeVou7OPu2EHixznJBhYqdAEUCGB
	 s+Xc5PxmApxWtSPSxrXHhZ9jbDyrQv48ocGXhQuLrQmh25E47rOYp2Fdlq6Pu0zb3g
	 f6oYyApE3fqHxknhzmTiOeyJJn2rSInc6dOWbM2Ax/AlsYDTVhNxclmWIY3c7M306N
	 1Urmy5oK7CT1w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DD124E49BBF;
	Mon,  6 Feb 2023 11:20:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] ARM: defconfig: Add IOSCHED_BFQ to the default configs
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167568241790.3898.6782749897913820727.git-patchwork-notify@kernel.org>
Date: Mon, 06 Feb 2023 11:20:17 +0000
References: <20230203140404.1125850-1-linus.walleij@linaro.org>
In-Reply-To: <20230203140404.1125850-1-linus.walleij@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  3 Feb 2023 15:04:04 +0100 you wrote:
> ARM systems are often memory constrained and more often than not
> use slow single-channel storage such as flash memory or MMC/SD-cards.
> For any interactive systems (such as mobile phones, tablets,
> chromebooks...) the BFQ I/O scheduler will be desireable.
> 
> Make sure the BFQ I/O scheduler is available on these systems.
> 
> [...]

Here is the summary with links:
  - [v2] ARM: defconfig: Add IOSCHED_BFQ to the default configs
    https://git.kernel.org/soc/soc/c/e52d5388bd6f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


