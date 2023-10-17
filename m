Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C0A3CDB474
	for <soc@archiver.kernel.org>; Tue, 17 Oct 2023 22:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D9AD9C433CD; Tue, 17 Oct 2023 22:00:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B77E7C433CA;
	Tue, 17 Oct 2023 22:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697580027;
	bh=SGuOTy9rkp3dpJFj/2s5FtS1Ne6okevhkuSMDAfViJo=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=MU3/HBv2WZhXb4G+sECrXkhn9GqUo8mUgsS3VwAWeHq5w77Hm+iPvjGAntwT/pZYr
	 kqohepsvnoN37sfGWVSfiLjhcwGH3NiXW98zoLIz+XiT6ipWqjXFHfwUyH1HrLr77m
	 X/4b4JmfgvY1e79MSUwDXEzNEWQ5V2uOwBmrEKfG2IY5dtvyiJ8vvHWN8vmDtHldOo
	 MQV6313GAvGkSjD/RjeeIWlAGjIH1c3REC/4i+2H3oTuS1T4TXaphOn5lgDgf7q7PJ
	 u49b6Rb4ejK6ZZNvZNHKckZQeKK5yRxF2nmKJY91/DEczAFpZKrjCPDdE7DKvUr6CR
	 aNL5pQdwq0n7A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A8D95C04E24;
	Tue, 17 Oct 2023 22:00:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 0/3] Renesas SoC updates for v6.7 (take two)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169758002768.24805.7364731057578687732.git-patchwork-notify@kernel.org>
Date: Tue, 17 Oct 2023 22:00:27 +0000
References: <cover.1697200117.git.geert+renesas@glider.be>
In-Reply-To: <cover.1697200117.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 13 Oct 2023 14:39:12 +0200 you wrote:
> Hi SoC folks,
> 
> This is my second pull request for the inclusion of Renesas SoC updates
> for v6.7.
> 
> It consists of 3 parts:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] Renesas ARM defconfig updates for v6.7 (take two)
    https://git.kernel.org/soc/soc/c/ec91108949dc
  - [GIT,PULL,2/3] Renesas DT binding updates for v6.7 (take two)
    (no matching commit)
  - [GIT,PULL,3/3] Renesas DTS updates for v6.7 (take two)
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


