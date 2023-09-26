Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C46FE7F130
	for <soc@archiver.kernel.org>; Tue, 26 Sep 2023 21:21:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 39E99C116A4; Tue, 26 Sep 2023 21:21:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 22A7BC4167D;
	Tue, 26 Sep 2023 21:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695763280;
	bh=AMYDQo4gFnC4huX4QtOi7YuECGpADdopRKrlQMlRG+E=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ZIlA7AIn2BOQJej72aeLUtohe9nBHQmjFu3WGjJhSszP+byans89T1zjDDul0bZdH
	 ZOJMeAU7eYmotX930Xx05o8iSspq7i/K5IVy7B/FxvpaGbyfwnllK4uN+kqe2PI1Et
	 4AwgN2Y84TKKiYThtgv8hV1/VMKg9F0B6iTIM6QVso8+pb+C753kEWOorrFl1qoLmU
	 qX5WauEb7nJKGdzHrHFeTdQb+VKy1FlXc6V2YfsCu6R22Qa1r7cyHADZRB6dQbr6u0
	 UF1WfF9rmCLUdmD0aT5QFoppZgQv6719Grrfnq38+5OImKBPA5TE6Vr2/2LDdrTETn
	 NXraEDFCsyTFQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 00EEEC64459;
	Tue, 26 Sep 2023 21:21:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: SoC/genpd driver updates for v6.6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169576328000.24546.6968948012147835571.git-patchwork-notify@kernel.org>
Date: Tue, 26 Sep 2023 21:21:20 +0000
References: <20230829213441.310655-1-ulf.hansson@linaro.org>
In-Reply-To: <20230829213441.310655-1-ulf.hansson@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Linus Torvalds <torvalds@linux-foundation.org>:

On Tue, 29 Aug 2023 23:34:41 +0200 you wrote:
> Hi Linus,
> 
> Here's a pull-request that introduces the genpd provider subsystem.
> 
> Most of the changes have been shared via an immutable branch/tag, which has
> been pulled in by Arnd Bergmann into the soc tree. However, as I have also
> queued up a couple of additional changes on top, I am sending this pull request
> for you.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: SoC/genpd driver updates for v6.6
    https://git.kernel.org/soc/soc/c/c66403f62717

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


