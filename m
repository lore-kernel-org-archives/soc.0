Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 203FDCDB482
	for <soc@archiver.kernel.org>; Mon, 16 Oct 2023 21:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 07378C43397; Mon, 16 Oct 2023 21:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E48B8C433CA;
	Mon, 16 Oct 2023 21:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697491917;
	bh=t9BCjPMiBIRKFi20ggcIzThCnEokAT7GKnpXXf+pTYo=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=DUjrJXQ5mGNHLWpp4QiZNni2cYrPPngDAMiMDwSvL7lnFer7Mtzh6UMwWUNfmdSGn
	 aHsvW01LkmiG2cBaayZ7afzaX3gR9c2tqHdAELlNyj2soLtkqcnskb15KvmvZEjXom
	 IoYdPvd7IPuTiiCii0jjziag8PcRmT0oMtCkLIkWkhg+71dqxj/4z1GMFe+VvthjjN
	 hmIdKnbMyf4mKuxheD+kxbFag25y6v+DtAticA3fR9Ess2cSe1mjduebBYdpVRoGsm
	 jP890D5Wf2xiKT1yg24kIsFuQlBAmjq5QTMTHGd8MqhL77xE3kxldrjpV8/3OX8BNm
	 in5azMt1P772Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C55C8C595C0;
	Mon, 16 Oct 2023 21:31:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Convert drivers/soc to struct
 platform_driver::remove_new()
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169749191780.22284.1947222775393778648.git-patchwork-notify@kernel.org>
Date: Mon, 16 Oct 2023 21:31:57 +0000
References: <20231014215918.prqhkk7kp2vobe3a@pengutronix.de>
In-Reply-To: <20231014215918.prqhkk7kp2vobe3a@pengutronix.de>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=3Cu=2Ekleine-koenig=40pengutronix=2Ede=3E?=@ci.codeaurora.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 14 Oct 2023 23:59:18 +0200 you wrote:
> Hello Arnd,
> 
> the following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:
> 
>   Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Convert drivers/soc to struct platform_driver::remove_new()
    https://git.kernel.org/soc/soc/c/4d8220323f60

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


