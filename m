Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F50DC49EA6
	for <soc@archiver.kernel.org>; Sat, 12 Jun 2021 16:10:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A3821613F1; Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 7D384613DE;
	Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623514216;
	bh=BnSS9V+Xil8hspH8fr5C/peqGFS/P3ireIMMti+BSDc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=QMBeRthRyCK+JzBTNHJX36Yusb3blVzhbDO83/LuVL2Fyb95VWHhjff1w89q8ADjm
	 jtUiB40oDSz+YtaaFIJveijf0wcTl5c9V5cZnqHsfTtdyoMXkZHz7usgVCjuLt6ExA
	 M3Z8G5q7tsqcA9RUI30yVE/Q6DrFtLj3WmNUMVzJwmXW0Og9sWAlbd2wG96jSNuSWf
	 2i2brPh0HGDAJFFmnAl02qcmEJXaiO1vPdE58nYUNS+Gg0ETJZFrjtNrUuAYBy6+r/
	 s03Zh3VNTg0DyleZtwLGlA2HpgtIoi3iupAFS5exUtXz+qMDmCEj+ZU7U5Snq7aB3Y
	 vVxfhvyGAEzUw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 76F9060CE0;
	Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: defconfig: mediatek updates for v5.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162351421648.27448.2807286611855451610.git-patchwork-notify@kernel.org>
Date: Sat, 12 Jun 2021 16:10:16 +0000
References: <ad6f7f4e-7e4d-08b9-8781-71bd78444929@gmail.com>
In-Reply-To: <ad6f7f4e-7e4d-08b9-8781-71bd78444929@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Fri, 11 Jun 2021 13:03:52 +0200 you wrote:
> Hi Arnd and Olof,
> 
> Please have a look at the defconfig patches for v5.14
> 
> Regards,
> Matthias
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: defconfig: mediatek updates for v5.14
    https://git.kernel.org/soc/soc/c/65a40301234e

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


