Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90E0BC49EA2
	for <soc@archiver.kernel.org>; Thu, 17 Jun 2021 01:50:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 262EF613D5; Thu, 17 Jun 2021 01:50:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 0EAF8613DE;
	Thu, 17 Jun 2021 01:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623894605;
	bh=wTk2x5j9f+09WS6ktH2+P+bhovETIhHzF1dFO+g1HM8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=mKB2Uty8xUmwGPSMB8l5KnyI/OlDJuH2t//M2C6SmqFIsQx1DZJSKjOaUdzUAFU1m
	 gvI/h3cxKAZMyRsnxdQngbSve/0Lh4AiH8rjuJFifgby7i1KYU+XcDHGdUBdGOdjnY
	 mBfs58t7s2gEeDR8Ar5iJeS6xyrujQ4IqGxqpohwQLZ6SYZk6PytVnBAlwr9XhSAtG
	 iem4Agv2AenwQyIDAUn5qoYWZigFY0eIy0vifpCt75jXihk46pmv1OdTyor+iry4Cd
	 nxZ6gUvWGO6drkQwwfhPwqhZJqMqFaoNi2kXES+Ls1W+TljVI86fpR0Onl6oNj9J61
	 bnMQRTwx4n+ow==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 00C5560CD7;
	Thu, 17 Jun 2021 01:50:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm: dts: amlogic updates for v5.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162389460499.26973.2335308281546800517.git-patchwork-notify@kernel.org>
Date: Thu, 17 Jun 2021 01:50:04 +0000
References: <2f19a5a1-3ed9-dd11-02f1-7d535cb1c25c@baylibre.com>
In-Reply-To: <2f19a5a1-3ed9-dd11-02f1-7d535cb1c25c@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Wed, 16 Jun 2021 08:26:40 +0200 you wrote:
> Hi,
> 
> Here's a single ARM DT changes for v5.14 to add UART FIFO size like the ARM64 SoCs support.
> 
> Neil
> 
> The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm: dts: amlogic updates for v5.14
    https://git.kernel.org/soc/soc/c/9be389934dc5

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


