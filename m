Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 840C8C43381
	for <soc@archiver.kernel.org>; Tue,  2 Feb 2021 17:20:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0665964F8A; Tue,  2 Feb 2021 17:20:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id E021164F8D;
	Tue,  2 Feb 2021 17:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612286411;
	bh=UWwy4yKRB9fxc0R9lX5bwkDizeo+4XXpM9AeN8o8u7g=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=QI1CGtaZqxo/YNCe74DOKk20PPTslMvKBn7ZA/cnBhWNN/ILq4Dizo0HSjbOE9CM0
	 9oAQtlaeKXiv9wgl/r4BivzGq/vS5WHIxDEm3wmuluwQfVGkLmrZDELnkH/1iqm+Pg
	 JaUULPH6WWpVqb4razgi1XSktWlD7NH9P9/YDKTL4uKVpm+o6FhbMEJ0xzvWCnY79R
	 LXjI77kDo53wkC5zMRQKvX6fjN/94iDI3wkf9GJK+nUexDGw95KY7A82DAQFuDSEkW
	 ENkhD5ZVOdFl4pulC7Z1O9CFnOA3ooim/hN3JmtcEnrSU/5x+5zONLbJSFKUllnQRH
	 NryHKvNpd1MIw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id D31AD609E5;
	Tue,  2 Feb 2021 17:20:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: mvebu: dt for v5.12 (#1)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161228641186.5662.16660381014093628040.git-patchwork-notify@kernel.org>
Date: Tue, 02 Feb 2021 17:20:11 +0000
References: <87sg6fn49o.fsf@BL-laptop>
In-Reply-To: <87sg6fn49o.fsf@BL-laptop>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Mon, 01 Feb 2021 17:26:11 +0100 you wrote:
> Hi,
> 
> Here is the first pull request for dt for mvebu for v5.12.
> 
> Gregory
> 
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: mvebu: dt for v5.12 (#1)
    https://git.kernel.org/soc/soc/c/7e500c897ddf

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


