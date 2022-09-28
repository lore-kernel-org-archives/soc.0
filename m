Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2656C6FA82
	for <soc@archiver.kernel.org>; Wed, 28 Sep 2022 21:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6D93CC43142; Wed, 28 Sep 2022 21:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 56DCBC43143;
	Wed, 28 Sep 2022 21:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664398829;
	bh=9Q+tDn3/dHClgSFICCz0rl2Tx2pus16skeWh9PTc/Ls=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=IVCSOH7trxR4/lMMY+Sgd/8RieFu0yLRnKGH/MwSW+RWEYm1mX4TZZMS24oZOZKIs
	 W+pBgBCuET/pzgSVHiR34iD4VSFrCCXk6WDmn+JukBoQNwCFF3/ChJuUtzDPcdOgJ6
	 Rf7ZMuoD96uuv1xPvqolIQSl+YjwcnUDDMpA/qYKoTlAnULaGd6SWD9eiMZaQQlQts
	 QzAM7Aj8Pvbo1tMhTVnWWCjq8/q2m/8zjjdJGj4WaY89euy/RpEY0zm93TltSqxqSR
	 Cnnit1gPf+Y6ozU7gPt4nsdL8qMynjwK6Nzs5v8VLlwf7b/fiLM9U9+ZIl2HKtQvhW
	 GlStFS6i5GVrw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3E494E4D022;
	Wed, 28 Sep 2022 21:00:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: aspeed: Kconfig: Fix indentation
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166439882925.18494.10347863055292197576.git-patchwork-notify@kernel.org>
Date: Wed, 28 Sep 2022 21:00:29 +0000
References: <20220928025926.2592030-1-joel@jms.id.au>
In-Reply-To: <20220928025926.2592030-1-joel@jms.id.au>
To: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 28 Sep 2022 12:29:26 +0930 you wrote:
> From: Juerg Haefliger <juerg.haefliger@canonical.com>
> 
> The convention for indentation seems to be a single tab. Help text is
> further indented by an additional two whitespaces. Fix the lines that
> violate these rules.
> 
> Signed-off-by: Juerg Haefliger <juergh@canonical.com>
> Acked-by: Andrew Jeffery <andrew@aj.id.au>
> Link: https://lore.kernel.org/r/20220523060532.7864-1-juergh@canonical.com
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> 
> [...]

Here is the summary with links:
  - ARM: aspeed: Kconfig: Fix indentation
    https://git.kernel.org/soc/soc/c/ef2fb84c130b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


