Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 734A9C433F5
	for <soc@archiver.kernel.org>; Tue, 14 Dec 2021 21:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 536F0C34608; Tue, 14 Dec 2021 21:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3D134C34604;
	Tue, 14 Dec 2021 21:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639518011;
	bh=glRQjVIDiVUj5f4DvInwBKGUmD3H1ZXEUerO+UkqA94=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=knTXPrlOZzrzA2u+LsCTuNAawzKan018ZYge9w/hKW5l1Ec/7CqDJKiChD9dBpPkO
	 y+pRtxmEdmyltnyyeuPthZoeoJ7S/1YcPLyBP2vsul7HneFTCg4ibT2fgeluPcZFLt
	 3KpsW1R10jJoxPoL+scLYBKXdztBQO155ZpYnm24lKUzlgkkG6B2Ub2FW/fZ79yuqw
	 imXh1ljIBUDcDmAG4rS21OIu6H4rbPdhT+xq9qsQM0cynyyyLpkd7W2ofAP5knbVJ1
	 7aSTpuUVeTG4FzUsM95qW7SyJs73RnntxkPpC8MUx90inrq/vKnVK0rkzHfveN0mRx
	 4ZhYTJ69yx14A==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 1E51B609BA;
	Tue, 14 Dec 2021 21:40:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Apple SoC PMGR driver for 5.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163951801111.19193.17757590112597415303.git-patchwork-notify@kernel.org>
Date: Tue, 14 Dec 2021 21:40:11 +0000
References: <049f4de9-51be-7be4-1f9a-a59756af88d7@marcan.st>
In-Reply-To: <049f4de9-51be-7be4-1f9a-a59756af88d7@marcan.st>
To: Hector Martin <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 7 Dec 2021 15:08:04 +0900 you wrote:
> Hi SoC folks,
> 
> Please merge the new PMGR driver for 5.17.
> 
> This should not have any hard deps with the previous pulls. The
> MAINTAINERS change already rode along the DT pull, for simplicity.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Apple SoC PMGR driver for 5.17
    https://git.kernel.org/soc/soc/c/5b532920d74e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


