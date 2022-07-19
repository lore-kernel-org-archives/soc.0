Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D43C433EF
	for <soc@archiver.kernel.org>; Tue, 19 Jul 2022 14:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C16B7C341D7; Tue, 19 Jul 2022 14:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A655FC341D6;
	Tue, 19 Jul 2022 14:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658239815;
	bh=yBPCBv49O8F2DVDzWQEKVwJojO8YPN/WleI4CeS43K4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Qp32yvgYvYSMf3PAhi6ay28Duxq/SaKjURpk0hPJddKVEw2XYWdLlgeEoqj5TRxiO
	 rEqNeA1orHYRct6aRJR3iAAzJYi3cSmj0Xpl0yisI9Wm7D1hRTHFae+rwS3ZKDV9D2
	 noCwIicNEEtv5TJZmS/k98/W8/3ndoEKX/N4tI1LEDvSCp/zul/SaYqP94YAbEYgMV
	 Sw1LJb+7ar3rg4+EQSBiKqUvo/5VMaiTb8zf8Bd3m2RK6dJs7rkQTb7GNtxktml2+n
	 ewasqaDUofUKi6x/dE5kIX4li8iobAD+4nI7OpNXKbTtA4WrbeUsQR+ZvxrOv7lt9J
	 Uv6idXve9wF2A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8586EE451BB;
	Tue, 19 Jul 2022 14:10:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: mvebu: dt for v5.20 (#1)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165823981554.7750.9523282920095987674.git-patchwork-notify@kernel.org>
Date: Tue, 19 Jul 2022 14:10:15 +0000
References: <87lespqn28.fsf@BL-laptop>
In-Reply-To: <87lespqn28.fsf@BL-laptop>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 19 Jul 2022 14:55:27 +0200 you wrote:
> Hi,
> 
> Here is the first pull request for dt for mvebu for v5.20.
> 
> Sorry to be late, actually I've just realized this week we were already
> at -rc7.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: mvebu: dt for v5.20 (#1)
    https://git.kernel.org/soc/soc/c/7dbb1b0b467e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


