Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6249DC38142
	for <soc@archiver.kernel.org>; Wed,  1 Feb 2023 16:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 349E7C433A1; Wed,  1 Feb 2023 16:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1A7BCC4339C;
	Wed,  1 Feb 2023 16:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675269020;
	bh=miAgWoj6Res8M1Vix1uqmB4pp/SiSRXUnGnHZ0LoHbk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=vFbCYg6WeFWXsxqxTQL8sDtOBDczyeTaOIhblvzcZkpPOsLkrpYlQfh95GPihxWhG
	 JNU6IQ+q4HFSOqDBcaDLsRmETOWpfPpdEAzsjf3ysudVzN5Yx3wshFWpCNYr5v8wei
	 OgGhgjKASDzNUKBRy/c7Zr+Rk1X6DHYt/wgUO55xMFcStEGtXJtaNwgVl44BmpR02M
	 efQR8TRrWquXn4xZhz5ne14KSGM9hKH+Kv61aHsjdTKXKgFKfxahvnBe7gNrQQDTna
	 gzrFZA3xuke09CAY1+b/pBpy/qhFaDICy/631ClmsDf6EMTJJ4iKm7lvfFwawf8umK
	 3NJ8WgNgGcRHw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E8F0CE501F1;
	Wed,  1 Feb 2023 16:30:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] MAINTAINERS: Update entry for MediaTek SoC support
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167526901995.23236.3207394228812042511.git-patchwork-notify@kernel.org>
Date: Wed, 01 Feb 2023 16:30:19 +0000
References: <20230201152256.19514-1-matthias.bgg@kernel.org>
In-Reply-To: <20230201152256.19514-1-matthias.bgg@kernel.org>
To: Matthias Brugger <matthias.bgg@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed,  1 Feb 2023 16:22:56 +0100 you wrote:
> From: Matthias Brugger <matthias.bgg@gmail.com>
> 
> The linux-mediatek IRC channel has moved to liber.chat for quite some
> time. Apart from that, not all patches are also send to LKML, so add
> this ML explicitly.
> 
> And last but not least:
> Angelo does a wunderfull job in reviewing patches for all kind of
> devices from MediaTek.
> 
> [...]

Here is the summary with links:
  - MAINTAINERS: Update entry for MediaTek SoC support
    https://git.kernel.org/soc/soc/c/b459861783a9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


