Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C17F3C47DAF
	for <soc@archiver.kernel.org>; Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B6F33C4AF6B; Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9526EC4AF5D;
	Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703180466;
	bh=mYFOKV+RNjcGSUaf3IdKcAQc/gIipI1VGgKfeVU06VI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=rYV/y6DAasv27SugOVStZ+v2On66KmVjhtoV4QLBM7Wpfeg/p9ySyaITdx4gab5S1
	 AFRNixyWIlTnYzBXE8fQcXjd+p1srNtv/6LyrU8ReGeNtCn7elc95wUpJqwfxG7nMc
	 lACnm37IHvTpocfJ9E1ivgga2aLFz905QXYudwj9XesukRvCJqKn0ZszzDH/ykY27e
	 9JnVm2Ebl7PkDb1ATJSMb86gl/LX33L5pR+BsOlHmrLnpbvQTS5CAciHvqvyi0wkKP
	 DnMPv+7Oh5qT7jqZRBvZtEaHpf5/qffL5YDoS4PLEJGQ4MhmQ9Zk+mCqTaky/SaiPj
	 BUaBgs88hxSJw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 817A3DD4EF3;
	Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: mvebu: dt64 for v6.8 (#1)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170318046652.3302.1463567696681098539.git-patchwork-notify@kernel.org>
Date: Thu, 21 Dec 2023 17:41:06 +0000
References: <87le9obypx.fsf@BL-laptop>
In-Reply-To: <87le9obypx.fsf@BL-laptop>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 20 Dec 2023 17:55:22 +0100 you wrote:
> Hi,
> 
> Here is the first pull request for dt64 for mvebu for v6.8.
> 
> Gregory
> 
> The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: mvebu: dt64 for v6.8 (#1)
    https://git.kernel.org/soc/soc/c/46a51dba9f31

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


