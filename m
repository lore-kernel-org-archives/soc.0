Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA3CC4707C
	for <soc@archiver.kernel.org>; Tue,  2 Jan 2024 10:11:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E04BFC433D9; Tue,  2 Jan 2024 10:11:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CB1F9C433CB;
	Tue,  2 Jan 2024 10:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704190300;
	bh=5cnx/bC99GwroppEyJWkZHTSmPsCrLe7sSubfIGfkyA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=n/7ybiowCK5dBQAYO1o/hX5wy0AUq0mtVTtM2LZ51Al2GLi3dKdvXpq8C8EPswkIZ
	 wsn2uKLn9YYmfLCmD7ylHnyOzP3z3B73N3lPtRfSmNCdZ+uEyj5YLn6/kRV26w7pXQ
	 G/2ZCpd5humtmqsYwyY/KxTQ/mNiNPmMxpmhkevYaOOpE8YjhfczgkcnN461IzZksM
	 rP1CnpoFSyr4suofjmKe1C1DY9YLHxBr89HKS/0gjEx1qu4NKibMif0WLOEvc4hkDD
	 onY3EecAWJEZnfaMD0RktQqZ9kWjgl5CQ48One2Ln7BCxAHwKKckUlgHR5jdbJVped
	 B43imKQBnfunQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B2A20C395F8;
	Tue,  2 Jan 2024 10:11:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts64 changes for 6.8 #2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170419030071.6407.17997943262003820375.git-patchwork-notify@kernel.org>
Date: Tue, 02 Jan 2024 10:11:40 +0000
References: <3711719.VqM8IeB0Os@diego>
In-Reply-To: <3711719.VqM8IeB0Os@diego>
To: Heiko Stuebner <heiko@sntech.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 01 Jan 2024 23:54:40 +0100 you wrote:
> Hi Arnd, Kevin, Olof,
> 
> please find below and in a subsequent pull-request
> some more Rockchip changes for for 6.8 .
> 
> Just some stuff that came in since #1 .
> If it's too late for this stuff for 6.8, I'll respin this for
> 6.9, so no worries :-)
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts64 changes for 6.8 #2
    https://git.kernel.org/soc/soc/c/228307ad3f9e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


