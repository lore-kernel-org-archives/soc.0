Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AEA1C77B70
	for <soc@archiver.kernel.org>; Tue,  4 Apr 2023 14:41:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2D5D3C43446; Tue,  4 Apr 2023 14:41:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1729AC433B0;
	Tue,  4 Apr 2023 14:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680619284;
	bh=/I7iei+twoa81SaBws579ns+XdfsAentSNNCny112jQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=nt+3qovlJXhkP/q5rOqMK12Fz5MZnoOA9n3FJ9T9g0Sz5/lQMxRDkc9lMub1W9l70
	 ZswNVut7hqQoERq7WWH5rUldpLd4vS0IFdom4+wfrD+syLmr+MduEmANqN/fh/3R2w
	 l7aWN/VX1p7O6uO8LeRAj0LQg5BTFf1+IqxE3s99KzcRMpbSY+2ipFJv1RZXdZ4t4n
	 1yCvT+K5jUefuCR+w9y+nJQFhkh8neaKDDSU8+Jof5naSpgpns/jT1aOGL+fuI8yZH
	 nEiLGMLNtQyCzHgEeJTiMsASIHLnfguIBQgPtzdROh6TorMY+WSNJuPzyoF4onUX/M
	 2EZyz6RjJPKgA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 04438E5EA85;
	Tue,  4 Apr 2023 14:41:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH RFC v2 0/4] ARM: oxnas support removal
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168061928401.17322.12333470528209884910.git-patchwork-notify@kernel.org>
Date: Tue, 04 Apr 2023 14:41:24 +0000
References: <20230331-topic-oxnas-upstream-remove-v2-0-e51078376f08@linaro.org>
In-Reply-To: <20230331-topic-oxnas-upstream-remove-v2-0-e51078376f08@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 03 Apr 2023 09:42:17 +0200 you wrote:
> With [1] removing MPCore SMP support, this makes the OX820 barely usable,
> associated with a clear lack of maintainance, development and migration to
> dt-schema it's clear that Linux support for OX810 and OX820 should be removed.
> 
> In addition, the OX810 hasn't been booted for years and isn't even present
> in an ARM config file.
> 
> [...]

Here is the summary with links:
  - [RFC,v2,1/4] ARM: dts: oxnas: remove obsolete device tree files
    https://git.kernel.org/soc/soc/c/a9414bef866c
  - [RFC,v2,2/4] ARM: oxnas: remove OXNAS support
    https://git.kernel.org/soc/soc/c/5ca2653011a4
  - [RFC,v2,3/4] ARM: configs: remove oxnas_v6_defconfig
    https://git.kernel.org/soc/soc/c/fc746270c2a5
  - [RFC,v2,4/4] dt-bindings: arm: oxnas: remove obsolete bindings
    https://git.kernel.org/soc/soc/c/03216cdbd7df

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


