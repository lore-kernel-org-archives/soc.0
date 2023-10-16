Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F45C41513
	for <soc@archiver.kernel.org>; Mon, 16 Oct 2023 21:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3C86FC4167D; Mon, 16 Oct 2023 21:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 25B07C433BD;
	Mon, 16 Oct 2023 21:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697491918;
	bh=a1XjI5JZ+rUeHOesaxif0WbwHxWTSsT0cts6xeZ5svs=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=JbSj9YQyNaMOw7dMtDF/CvXWUrNTr1tdKAh1LXIAF+Z7Mlemy7+90U7+wajtHWh4w
	 eTyoH3OjPka2JRlA5tkrPPdw5P3sTgLLXhoJ2yC/Cec6HvOY6cqdkPRobATXeaCO+i
	 pZuzif/ii6diJArXI8r5WtejYpPXpemBIIgsZU8eeOE0B1AThjVyE16l3HrrQGWL+q
	 r4bQ6w+nl/3KsUOs24/DC3nntyGFSntHbBWdKnmwE9j7MzaKVpvOukPwp5EFjShX/x
	 pU/Xlg2DPWUjHf81+w8nFC1FH8IR4odFPrUdpf+PHUF1IvL/VvL3mHbMqUQDtvRDNH
	 xmJ8qM7pLAUFw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0F199C595C0;
	Mon, 16 Oct 2023 21:31:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 0/5] Renesas SoC updates for v6.7
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169749191805.22284.13269606310883390928.git-patchwork-notify@kernel.org>
Date: Mon, 16 Oct 2023 21:31:58 +0000
References: <cover.1695985418.git.geert+renesas@glider.be>
In-Reply-To: <cover.1695985418.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 29 Sep 2023 13:10:10 +0200 you wrote:
> Hi SoC folks,
> 
> This is my first pull request for the inclusion of Renesas SoC updates
> for v6.7.
> 
> It consists of 5 parts:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/5] Renesas ARM defconfig updates for v6.7
    (no matching commit)
  - [GIT,PULL,2/5] Renesas ARM SoC updates for v6.7
    (no matching commit)
  - [GIT,PULL,3/5] Renesas driver updates for v6.7
    https://git.kernel.org/soc/soc/c/8c15065cddb9
  - [GIT,PULL,4/5] Renesas DT binding updates for v6.7
    (no matching commit)
  - [GIT,PULL,5/5] Renesas DTS updates for v6.7
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


