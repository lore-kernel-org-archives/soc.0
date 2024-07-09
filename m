Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0389C3DA4A
	for <soc@archiver.kernel.org>; Tue,  9 Jul 2024 13:50:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A20A1C4AF11; Tue,  9 Jul 2024 13:50:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8C22CC4AF13;
	Tue,  9 Jul 2024 13:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720533033;
	bh=RMET1vJxsS6AHt2LWoH06RqhhybvE8B4ILLzcmki//A=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=SkqpG6zgZdhYmDcKltl8ZTRQ4HIRHdCzyvuzL+Lazw78z+NMKBvtt3/Nnjw50YGAv
	 t1Xog8emzIxyKHX0C8gXbts7KaBBH+fWJIyB9oZ2zFUIwhWpCmHbGY6kX3jn0iO8oc
	 XTZAh61aqFM475F3e3tEA5ucG4jX7c2EOgE0QOTsYJWVeOuhkT56UKG26mlVbWW3vB
	 EtotI1FXjbCbhm6GOhnXaVEPyOKJf3r/Zs4Egf1+VlMZK/Gm0md9O0krTpR8UDdkir
	 Xi5punV12AGkZ7rhKTciKlNsi7viFecHLfycj2oogOKxhjWTasIDRiBe1kjGabznkW
	 wYB8mugAvYCtQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 742F6C43601;
	Tue,  9 Jul 2024 13:50:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 1/2] =?utf-8?q?ti=3A_omap=3A_MAINTAINERS=3A_move_Beno?=
	=?utf-8?q?=C3=AEt_Cousson_to_CREDITS?=
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172053303347.5265.6567010371892412875.git-patchwork-notify@kernel.org>
Date: Tue, 09 Jul 2024 13:50:33 +0000
References: <20240612084038.18519-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240612084038.18519-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 12 Jun 2024 10:40:37 +0200 you wrote:
> Last email from Benoît Cousson was in 2014 [1], so remove him from
> maintainers of the TI OMAP platform.  Stale maintainer entries hide
> information whether subsystem needs help, has a bus-factor or is even
> orphaned.
> 
> Benoît Cousson, thank you for TI OMAP contributions and maintenance.
> 
> [...]

Here is the summary with links:
  - [v2,1/2] ti: omap: MAINTAINERS: move Benoît Cousson to CREDITS
    https://git.kernel.org/soc/soc/c/ed75ace54104
  - [v2,2/2] amazon: MAINTAINERS: change to odd fixes and Tsahee Zidenberg to CREDITS
    https://git.kernel.org/soc/soc/c/ff12af710b30

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


