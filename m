Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D982AC001E0
	for <soc@archiver.kernel.org>; Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CEDE6C43142; Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B9D8AC433BB;
	Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687296112;
	bh=3NAa0+CQaTBxEWCit3+23kTvL9GUgTrvXDqGMFlIl9o=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=YjKpOUO8PMsGuoLE+MS2Ha0qV+h/rP/I6JWR7SzL1/CfBzmEnb+0qzyBdKw7prTjW
	 UNSFJs6Y694Lu/WwNLD2somfHHqzz19aiPnbg02YU6CG8Nybwuj0h4Rkc44YDqzh2m
	 jwv5tZrA5ziQbjLI2Iglxss3wQO5Ey8nfsj25WQeF9oKPH5G6dFk9RecL6p6GYxMuU
	 Yw9PMjOPR6Qjqhs3wXfmdCqY6JzOsIbmGajYVxXLDGXMoSC+N2dOLpCQ0wJFbSN628
	 kz1ht0j7I7BZkut0cr19evcu310nVfL7H4Fe1EtOV5fFVWBq6ocaix7PvHblSzHUwI
	 svUmQUr+4bkHg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A94C1C395D9;
	Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm: dts: Enable device-tree overlay support for AT91 boards
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168729611269.12258.12218763788178197448.git-patchwork-notify@kernel.org>
Date: Tue, 20 Jun 2023 21:21:52 +0000
References: <20230616152932.1484154-1-cristian.birsan@microchip.com>
In-Reply-To: <20230616152932.1484154-1-cristian.birsan@microchip.com>
To: Cristian Birsan <cristian.birsan@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 16 Jun 2023 18:29:32 +0300 you wrote:
> From: Cristian Birsan <cristian.birsan@microchip.com>
> 
> Add the '-@' DTC option for AT91 boards that have device-tree overlays.
> This option populates the '__symbols__' node that contains all the
> necessary symbols for supporting device-tree overlays (from bootloader)
> on these devices.
> 
> [...]

Here is the summary with links:
  - arm: dts: Enable device-tree overlay support for AT91 boards
    https://git.kernel.org/soc/soc/c/11d5441cde74

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


