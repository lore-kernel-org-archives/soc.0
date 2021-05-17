Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D5C6C433B4
	for <soc@archiver.kernel.org>; Mon, 17 May 2021 20:20:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D4AE061354; Mon, 17 May 2021 20:20:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id BCEA160FEB;
	Mon, 17 May 2021 20:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1621282809;
	bh=0Amb4vKY3oTlPamdg6S1wZGqJ2ccnvYpsGMoNJxbv64=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=TAGUgRthSMwR+zAkDf9fym6Q2uooFa46L7GraeKf4bjyvO7O5gKDydyqueTerdynQ
	 SEiAvl91T+TKKd33qCykcfReUFaGnj5Ric8XI8/dQD0XnpGWQD4zOUSRO67rAOrjve
	 yettztkaA+oxrC0VFKuGb7jJoEn1q3vXcEmZ5qnuPMch9HhzkiBlsK/i9I2/MOHVRY
	 9drzhUI/LfFsTfm8mkSSk4oCMP0B3XKvbeiSEg+mN43gdJwO67qERU+gpEc1R3cxqg
	 RfO/FgQE3SKBZbZovRcfa2crM7u9KUxPT6BKPv+oq1X9sl+/sGbSD8uU5F614MrM5+
	 F0KXb7Cz0G/jA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id B11B460972;
	Mon, 17 May 2021 20:20:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] MAINTAINERS: ARM/Amlogic SoCs: add Neil as primary maintainer
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162128280972.19328.14012577360413699130.git-patchwork-notify@kernel.org>
Date: Mon, 17 May 2021 20:20:09 +0000
References: <20210511190054.26300-1-khilman@baylibre.com>
In-Reply-To: <20210511190054.26300-1-khilman@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (refs/heads/arm/fixes):

On Tue, 11 May 2021 12:00:54 -0700 you wrote:
> Add Neil as primary maintainer for the Amlogic family of Arm SoCs.  I
> will now act as co-maintainer.
> 
> Neil is already doing lots of the reviewing, testing and behind the
> scenes support for users of the upstream kernel on these SoCs, so this
> is just to formalize the current state of affairs.
> 
> [...]

Here is the summary with links:
  - MAINTAINERS: ARM/Amlogic SoCs: add Neil as primary maintainer
    https://git.kernel.org/soc/soc/c/b433d090ac63

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


