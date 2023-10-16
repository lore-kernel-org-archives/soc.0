Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E4F7C46CA1
	for <soc@archiver.kernel.org>; Mon, 16 Oct 2023 15:21:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E98A0C433D9; Mon, 16 Oct 2023 15:21:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D284EC433CC;
	Mon, 16 Oct 2023 15:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697469685;
	bh=n7CrDvOXD/J13Ijm0h/5bW//8qjvpJBeUj9oXtvAURc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=uiJtzp2URBUEPDCbnfhf+/aFqnDqft5frL2ytGnWFUPWIcTxaTkUwyLfUrb1adZZs
	 DttZEHZjBdqAEYtxzjFC/ZsFu1H8ZKG98Y2Fp4d38+Yq01v7+e2EujPAJwZ6jjJlIM
	 bgwz84LRAYmRnnH+6F1MN3RdQGwp3lqKgIzh0mY5ZbH2m+wcGfrZYNlFWsr9mUn7rS
	 uA6SUGi5gKaY6IumO5XPpn3szKf6buaEbXcplS9Fme/LtXlr37vYU1kPecZ7jfyZuT
	 WRtkcCxccOHXnyW5r54ym+DPCvL99jLdKAWK2U/X0c8/8NKO4OUM5tfWt756amatSn
	 D644+DU++S4+w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B6603E4E9BC;
	Mon, 16 Oct 2023 15:21:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] MAINTAINERS: Fix Florian Fainelli's email address
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169746968574.27582.4494366895805531889.git-patchwork-notify@kernel.org>
Date: Mon, 16 Oct 2023 15:21:25 +0000
References: <20230928070652.2290946-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230928070652.2290946-1-u.kleine-koenig@pengutronix.de>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=3Cu=2Ekleine-koenig=40pengutronix=2Ede=3E?=@ci.codeaurora.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 28 Sep 2023 09:06:52 +0200 you wrote:
> Commit 31345a0f5901 ("MAINTAINERS: Replace my email address") added 13
> instances of ...@broadcom.com and one of only ...@broadcom. I didn't
> double check if Broadcom really owns that TLD, but git send-email
> doesn't accept it, so add ".com" to that one bogous(?) instance.
> 
> Fixes: 31345a0f5901 ("MAINTAINERS: Replace my email address")
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> [...]

Here is the summary with links:
  - MAINTAINERS: Fix Florian Fainelli's email address
    https://git.kernel.org/soc/soc/c/b0b88a585c27

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


