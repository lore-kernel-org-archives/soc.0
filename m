Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62540C4708C
	for <soc@archiver.kernel.org>; Wed, 23 Nov 2022 12:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 58392C4314B; Wed, 23 Nov 2022 12:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 428A1C43152;
	Wed, 23 Nov 2022 12:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669204824;
	bh=KpeSCObOmLpxCbamWcNH+mFTflVJjt9to5e1HTZkxPM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=rLnyin/vfEpOfcIDPkE9GTQxZXHhIcA3aySWqAgHljW5JXa6d67xN9zNkPM/RAISP
	 6UrGAzU+8wXrgO9TEegzocuGlNNKNHM6GqCJANI+R97T7oX4thufLBYJavTmDPPbnV
	 X3yqq/UKoxyB0uW/gukiGE7TtXZaY4/pTeN5HWmXtmPL9HP3zGM3E8xlDuDwLZdwYj
	 T871U2PucPbkUbavNSNYau5VMRfhkYv5T5zq+prwLYRBWWbjgMLLfmZNJszww1Qq9e
	 Ia4BhD0VuEmtSVXNKWZuIgEI0jbkCdoVFvwBQLnHekKSx7Z58u2MFj5UC/DxDBJ8hL
	 HqMuX+TMFraKg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2C2EBC395ED;
	Wed, 23 Nov 2022 12:00:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: ixp4xx: Remove unused debug iomap
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166920482417.7332.7678858501857983180.git-patchwork-notify@kernel.org>
Date: Wed, 23 Nov 2022 12:00:24 +0000
References: <20221121221015.1454948-1-linus.walleij@linaro.org>
In-Reply-To: <20221121221015.1454948-1-linus.walleij@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 21 Nov 2022 23:10:15 +0100 you wrote:
> If we don't provide the .map_io() callback, the LL debug
> defines will kick in anyway, so delete the UART debug map
> as well.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ARM SoC folks: please apply this as a fixup on top
> of the pulled IXP4xx patches if it looks OK.
> 
> [...]

Here is the summary with links:
  - ARM: ixp4xx: Remove unused debug iomap
    https://git.kernel.org/soc/soc/c/c93d8b457461

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


