Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2E21C433B4
	for <soc@archiver.kernel.org>; Tue, 11 May 2021 08:09:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A3C3161448; Tue, 11 May 2021 08:09:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 8C4EB6144F;
	Tue, 11 May 2021 08:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1620720581;
	bh=Ye5Rk7im8ZJGIo6b8nUWMWKC0iC14TqX3W4jICm/fsY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=NCWLMBTC27ydWShhXOGL6rkDKOSRJnlAmnWLRtnziyuvMg8jPXM2zoLc8ggo4iuPO
	 /Pw5nm1A5aUqigCrfa2I8pzs5nh+zoK1f6vaRwbJx/F4MEzAMwDi7l13hKquoYnA4V
	 8eT2lb8OT3GN31y9LIhVytbPdMrf61wrn8fLygFPxrgM/AUQR/HfAxgJ9JTvKdIUY2
	 lmRZJpqmL4WLHXaiGPY1J2RnHMwWGLeOdSCHk4fal4q48uFbRdpCa/2gQjJBKwCYO5
	 RuKnSnrgDsTFBeKxHfc2HAyS3Ky+mDI3WXOCmk+Kl2xJ5LqxbbiHmRwNlEBsbWPz9f
	 VTkyCVLwdBg2A==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 7C86560A48;
	Tue, 11 May 2021 08:09:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] psci: Remove unneeded semicolon
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162072058150.29505.16319974257300147563.git-patchwork-notify@kernel.org>
Date: Tue, 11 May 2021 08:09:41 +0000
References: <1619659589-4775-1-git-send-email-yang.lee@linux.alibaba.com>
In-Reply-To: <1619659589-4775-1-git-send-email-yang.lee@linux.alibaba.com>
To: Yang Li <yang.lee@linux.alibaba.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (refs/heads/for-next):

On Thu, 29 Apr 2021 09:26:29 +0800 you wrote:
> Eliminate the following coccicheck warning:
> ./drivers/firmware/psci/psci.c:141:2-3: Unneeded semicolon
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> Acked-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> 
> [...]

Here is the summary with links:
  - [v2] psci: Remove unneeded semicolon
    https://git.kernel.org/soc/soc/c/9b924f4f0d8f

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


