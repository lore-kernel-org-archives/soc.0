Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BDEDC61DA3
	for <soc@archiver.kernel.org>; Wed, 25 Jan 2023 16:20:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F2A33C433EF; Wed, 25 Jan 2023 16:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DC1A4C433D2;
	Wed, 25 Jan 2023 16:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674663618;
	bh=0yEAhg32TQcuuSbQ7VYvEYUhRLfX9O40JTod5vAsDSA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=AGkAlmS2/MhQHLepTLmfxGcAvarvMnbp/N1TEXsR7zMBYAz9S+Om24EgXWde7Rp4V
	 e3cqAEAQjrmpTgworT3aXXHTXY0hXq9nFq836VNZi+VXBFt+xuHyapsuDykvzHbaUZ
	 jEQ2dz+NhoRwQzl/DpG/CSEYRt4RIp3ywhrJALvbTMUrGWZLEYtL6dNdzew/XEnIYV
	 OC04z1ucQcPagDsncn0CanZstOY01oKW2gp8f+BUjWL1AETh80uUgXim+soQSVdnAy
	 t026Q+Z0tkval59kQYKe950Z2X9M8pFALy9BLVNqRGQ2rfwf088NYL7H3XX+fzPW8m
	 2ii2nToCGW85g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BDC36F83ED0;
	Wed, 25 Jan 2023 16:20:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: dts: intel-ixp42x-welltech-epbx100: add ethernet node
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167466361877.4524.8516616602377999939.git-patchwork-notify@kernel.org>
Date: Wed, 25 Jan 2023 16:20:18 +0000
References: <20230125075838.2801020-1-linus.walleij@linaro.org>
In-Reply-To: <20230125075838.2801020-1-linus.walleij@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 25 Jan 2023 08:58:38 +0100 you wrote:
> From: Corentin Labbe <clabbe@baylibre.com>
> 
> Add ethernet node for the first port of intel-ixp42x-welltech-epbx100.
> 
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> Link: https://lore.kernel.org/r/20221005105510.3512132-1-clabbe@baylibre.com
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> 
> [...]

Here is the summary with links:
  - ARM: dts: intel-ixp42x-welltech-epbx100: add ethernet node
    https://git.kernel.org/soc/soc/c/6042a5880aaf

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


