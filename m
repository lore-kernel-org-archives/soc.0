Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 281D7C04FE0
	for <soc@archiver.kernel.org>; Tue, 20 Jun 2023 21:21:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 06D30C433CD; Tue, 20 Jun 2023 21:21:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E40DFC433CB;
	Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687296112;
	bh=t0qgKSu7N/aiwxkaAK97nsKUdilTaXsUizyFGln4Ank=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=KeJ63vJnT1Z/oueNF2u1WAWRZLuDq2silmULgIKlSODnXlzXofQUeBZ4J8errLWJf
	 U9GHI8DSFoyGKuJ4EQNYfhEpErpqsNwCU+HWwE5TBOC6Rr8wpPj+p3H4uJFCqYK3Zx
	 RBfopxpWru52bL9Ogf0nuAOVqx7RhDQLcBtDGKBsC+RXXJVtV3Ttc8228Q6bq7kwgR
	 zF9hNsrxUnKxqZzx2D+FM5xWN5+TjDcJe3/BZoAAO9QnLLHB+IozXQTIVXXzae7gRt
	 MeRakHY3Bfs5FUNGGkTlRt319mo0irnlu/Xxs3ovlzgHQobGI8JjgWZch9bEAoaD9q
	 3ctW4pOovq5YA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CFA30E301FA;
	Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: mediatek: Updates for v6.5
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168729611284.12258.11499557066780298440.git-patchwork-notify@kernel.org>
Date: Tue, 20 Jun 2023 21:21:52 +0000
References: <27843c96-142e-930e-33b2-b634182e7cfa@gmail.com>
In-Reply-To: <27843c96-142e-930e-33b2-b634182e7cfa@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 15 Jun 2023 18:49:52 +0200 you wrote:
> Hi Olof and Arnd,
> 
> here come the upadtes for the 64 bit DTs. I'm happy to see that a lot is going
> on touching all device types. On the network processor side we have some news on
> the BPI-R3 where we enable the thermal driver and the PWM for the SoC fan
> cooling. BPI-R64 got interrupt support for the switch chip.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: mediatek: Updates for v6.5
    https://git.kernel.org/soc/soc/c/5bfea833dd8f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


