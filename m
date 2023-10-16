Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39CDECDB483
	for <soc@archiver.kernel.org>; Mon, 16 Oct 2023 21:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 243BBC433BB; Mon, 16 Oct 2023 21:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0556BC43395;
	Mon, 16 Oct 2023 21:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697491918;
	bh=/N8L3eawi5DHZ8wquEOz44rDs9by6bF6G1f2oNZ5YVw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=BfYzXk+wgkYZHKZZOUqS+GYBtxZVt+Az1pHJgqpDLQ/nkHjq4417Jp40RB/uh0ujA
	 b6iu2Itkji/9UBIyx1QBMvfWNEb2sIzeKjDnrf+yH8eTzr6igryVC8QFkEmGC18pfY
	 OFuCb8kCb4XpUhPGRxp8HXAn8JKXjWHuZ4glDNZ6nhrvNeSQd056z1eZrLo81nQVNF
	 wYVVPyXf16lMp/XQ7vanrpurk21xqWglOI4jl9U3vI1ZHTi8h+2oA/5LnjkF16HdJm
	 Z/PB7d/ObDN/Alnk+ATOp24+8+/ONCtOmCLA3rcuIu3c43IoaKU5YBAj8AiT6o5QRk
	 kwkoyxcarXRNQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CB958C04E32;
	Mon, 16 Oct 2023 21:31:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] STM32 DT changes for v6.7 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169749191783.22284.2492259048090611323.git-patchwork-notify@kernel.org>
Date: Mon, 16 Oct 2023 21:31:57 +0000
References: <8a6b3ca9-f10d-825e-e371-8aeff3289a25@foss.st.com>
In-Reply-To: <8a6b3ca9-f10d-825e-e371-8aeff3289a25@foss.st.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 16 Oct 2023 11:18:53 +0200 you wrote:
> Hi ARM SoC maintainers,
> 
> Please consider this first round of STM32 DT for v6.7 cycle. New OCTAVO
> board has been added.
> 
> Thanks
> Alex
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] STM32 DT changes for v6.7 #1
    https://git.kernel.org/soc/soc/c/0e70ecbb2b65

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


