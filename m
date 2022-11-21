Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8FC9C4321E
	for <soc@archiver.kernel.org>; Mon, 21 Nov 2022 14:52:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A204BC43144; Mon, 21 Nov 2022 14:52:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8C43BC433D6;
	Mon, 21 Nov 2022 14:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669042343;
	bh=SVUEMBWLWADkOC6qjqlRj2olU6yLsXo4LmsvBq+aXms=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=D/rMYpsatvGRT3ua15HlzIOuhSFu8p5qczH2zK4yioFQG+X0cXSD+fOfRn+1ggr0T
	 5COROb0pQTtu4kbzglioMbNIiR+jXyxmC+din8E7lsNmBhQkMqTpT5dUftTCOWrjUE
	 XSxsnlABu571bBAJNtmyPW6m5G4/AfPhWIjwQDjbWlWvx0dceFmqP8d+rcZSRsDobT
	 3q9/gomOZB3BBKWlRnhM19M7n6s4XKZDKP3vQc6um8Qc203SQUCO4OvaZyGLe/HM+b
	 o4rSHj+kiS8SuNa5QyBbbWpvAcMRb4QR2x+hfdLwYFkcNnMVUW9/v4nBj1R68se1rC
	 buIhmyrxHZgTw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 79A8FE270C9;
	Mon, 21 Nov 2022 14:52:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Add __init/__exit annotations OP-TEE driver for v6.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166904234349.4359.10261515037438738135.git-patchwork-notify@kernel.org>
Date: Mon, 21 Nov 2022 14:52:23 +0000
References: <Y3d4CHWl3Ofx5OrX@jade>
In-Reply-To: <Y3d4CHWl3Ofx5OrX@jade>
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 18 Nov 2022 13:18:16 +0100 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull this small patch which adds __init/__exit annotations to the
> OP-TEE driver module.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Add __init/__exit annotations OP-TEE driver for v6.2
    https://git.kernel.org/soc/soc/c/f5014dcd931f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


