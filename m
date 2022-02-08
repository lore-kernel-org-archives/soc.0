Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06ECEC4332F
	for <soc@archiver.kernel.org>; Tue,  8 Feb 2022 09:12:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D8D9CC36AE3; Tue,  8 Feb 2022 09:12:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B9471C340EF;
	Tue,  8 Feb 2022 09:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644311578;
	bh=Q9+rlMAgoHUphtdamZmGyNEzvpz8B1b1eEzALOQET+E=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=mQb0wSJ+xt+4s/j5Vd3tob2VmR7T8ZuEDvwnWC0o+TXv4CA/YzltagzhYHdwPfWUm
	 TxXbMXsR5ecSIPRh+/MOMMdDoiYZv5QCfaIqXtCP9HMbJrLxm2Ocb4QfvIYW/MrG3c
	 wxVIqd30Oo4hkl1bbsX0q2CoKWL5AKaL8rPxHxgriazTD5fWozTrOwo9ubSpU+GVI+
	 KvM5rKK2Cm6Ia8cJHezJtOU7QqKEPyOqaOoqrrNBvNDkKcxS+95hOWT3T4bxx7OVpA
	 YGxyF8qt3TGeB9+EkaE4qrDfc1Xmdu0dg6Itz/uN9DzCRTAUDYVBaG9QaJJk7VurUv
	 jzL0wlh/XdUGQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 978F7E5CF96;
	Tue,  8 Feb 2022 09:12:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] docs/ABI: testing: aspeed-uart-routing: Escape asterisk
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164431157861.18327.16522531611014591703.git-patchwork-notify@kernel.org>
Date: Tue, 08 Feb 2022 09:12:58 +0000
References: <20220201070027.196314-1-joel@jms.id.au>
In-Reply-To: <20220201070027.196314-1-joel@jms.id.au>
To: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue,  1 Feb 2022 17:30:27 +1030 you wrote:
> From: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> 
> Escape asterisk symbols to fix the following warning:
> 
> "WARNING: Inline emphasis start-string without end-string"
> 
> Fixes: c6807970c3bc ("soc: aspeed: Add UART routing support")
> Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Link: https://lore.kernel.org/r/20220124014351.9121-1-chiawei_wang@aspeedtech.com
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> 
> [...]

Here is the summary with links:
  - docs/ABI: testing: aspeed-uart-routing: Escape asterisk
    https://git.kernel.org/soc/soc/c/088400521e42

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


