Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C353C636F9
	for <soc@archiver.kernel.org>; Mon, 21 Nov 2022 14:52:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 186EEC4314C; Mon, 21 Nov 2022 14:52:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 01F27C4314B;
	Mon, 21 Nov 2022 14:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669042344;
	bh=Kik7FKP8vns9yM5ZpdZfWq1YspKf8/13makQEMeCT2s=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ScEfFsOQY/Z6EvQsFzFzEIzsm5Y0c8p8ex5KRl7n7b7DjCcOZlqqkaaBCuC+cztep
	 cWMbRBafC40YRngnD05JqD2svyUueThdEfadbCGOpMfI1JNUIpXHYWKRRBiyB3cz3V
	 eF0/tCDWKbQHFv3Y09GwQPrMPx/u12EyyP6lzvI9f2ElqBUyv9AYk0TJGKY+2K06rq
	 uThgwC0FTNWiSud2wVvZtseL4d37GNDyK8Vye6/XliCldjnEhDttLStqrOgmVIxZjO
	 Pp3gMuiRQ4YRjWkqoCQWRuIygXzEFEpBqOFMQCjiR/zwH8U1eyj1+Z2Ljl6ENx8fJs
	 oi+OnOyDJHlRQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DFC29E270C7;
	Mon, 21 Nov 2022 14:52:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX fixes for 6.1, part 3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166904234391.4359.2579090098216835311.git-patchwork-notify@kernel.org>
Date: Mon, 21 Nov 2022 14:52:23 +0000
References: <20221119073812.GQ16229@T480>
In-Reply-To: <20221119073812.GQ16229@T480>
To: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 19 Nov 2022 15:38:13 +0800 you wrote:
> The following changes since commit 836fb30949d9edf91d7de696a884ceeae7e426d2:
> 
>   soc: imx8m: Enable OCOTP clock before reading the register (2022-11-14 15:52:53 +0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.1-3
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX fixes for 6.1, part 3
    https://git.kernel.org/soc/soc/c/cafd3d346acb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


