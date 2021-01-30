Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79C22C433DB
	for <soc@archiver.kernel.org>; Sat, 30 Jan 2021 11:30:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 55CEB64E0B; Sat, 30 Jan 2021 11:30:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 3FBE564DDB;
	Sat, 30 Jan 2021 11:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612006208;
	bh=0MqVHds6hq2lvgMshgtnujcvCkX9P4E7IDm8ZLUBNvQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=OOlo/8qNOmC4Q8q+Hqi7IyLG4SbxxrZSJMdX9sjAEA8ekaBQxyOMxRasBi77ZBjuy
	 3ot5IkJooppn+g8BXhmCzoqV4/tMndqfTaIU5t4E1h+/qGIVLsUumsGQ/MDse7kvXk
	 wsMYxYxO+8Hp6P2AHLVhu/4QuysqKYw8RFwrIXFasZ2xXMHLk9GG65B/TZHeKYlPLE
	 scRmc1Hvai3EaX+V90kDXOv3y64vv0rPSF3+9CJ0Blwmr+Rv0OuZbdOzhSpeXpUrDW
	 Z/2TKPXXnGA0y42pu3LV5gUwXrkZVgelbBT2Babhf5oawwfAVFcMYRO+r85fjBYX4y
	 g/TLNul6ImtEg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 2B74660984;
	Sat, 30 Jan 2021 11:30:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Reset controller updates for v5.12
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161200620817.5475.10123709477563845874.git-patchwork-notify@kernel.org>
Date: Sat, 30 Jan 2021 11:30:08 +0000
References: <20210129153108.GA26994@pengutronix.de>
In-Reply-To: <20210129153108.GA26994@pengutronix.de>
To: Philipp Zabel <pza@pengutronix.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Fri, 29 Jan 2021 16:31:08 +0100 you wrote:
> Dear arm-soc maintainers,
> 
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Reset controller updates for v5.12
    https://git.kernel.org/soc/soc/c/7cc623b85aef

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


