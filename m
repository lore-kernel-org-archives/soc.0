Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C839C47073
	for <soc@archiver.kernel.org>; Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 55400C43142; Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3E79AC433B7;
	Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703180466;
	bh=hol4JhW3QuGsZr5e/1M1+CTfr7HXIu6escR0Q6Z3czg=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Hn+oSDvKkMkq1QlWRQrzdW0WimsuAyg33GQZLDGqMc/O0bU02RpkyfpGZ8NlQHIId
	 ITP1Vig5pSHuL8avDapf0MQlVhoPKFU1U2L7G0gBtt4Jz/7h2/vC/VcoAXl0QFsCfV
	 y8VOiWT4B4h8K3/rEU+A8ZjawFB6Rqa+Mc9bMFqioLt2rWO3EuvlwR3sLyWFzpK1Zu
	 lj9VH9iBZJ+t3Ftx2hdfHLHCgw8NufejAefyTLIGa2/ckWFgYJe/tqo9Y8GI+9oFXq
	 HXZe7/Gm4i6fGNaKXB6Emy2MKnTkKgv3VCNNzcj3/mjhjKg38zwAoYvF1YRxvnsYfm
	 dzFfmlENEF+Gw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 16F8CDD4EF2;
	Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts64 changes for 6.8 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170318046609.3302.8744772612363673117.git-patchwork-notify@kernel.org>
Date: Thu, 21 Dec 2023 17:41:06 +0000
References: <3535836.iIbC2pHGDl@phil>
In-Reply-To: <3535836.iIbC2pHGDl@phil>
To: =?utf-8?q?Heiko_St=C3=BCbner_=3Cheiko=40sntech=2Ede=3E?=@ci.codeaurora.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 12 Dec 2023 22:32:52 +0100 you wrote:
> Hi Arnd, Kevin, Olof,
> 
> please find below and in a subsequent pull-request
> Rockchip changes for for 6.8 .
> 
> 
> The change that might need the most explanation is probably around the
> aliases. In a recent discussion [0] the alias naming came up - with them
> aimed at matching labeling / documentation.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts64 changes for 6.8 #1
    https://git.kernel.org/soc/soc/c/16e6e974d17b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


