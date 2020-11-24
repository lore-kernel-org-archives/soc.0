Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA792C6379D
	for <soc@archiver.kernel.org>; Tue, 24 Nov 2020 11:10:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 804A72073C; Tue, 24 Nov 2020 11:10:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606216205;
	bh=rumkrmkYoWpqjCYfUzmUYh7j8/fPc2tYwROhvLgk4OA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=AjaseYw5yIG1XLPXscfgf9i33XdaQxt8CWXoRzoOEUd1uDOPTTzm2i/EbLNnw/ieG
	 Wey5+GC9rJ/YrrWki3aqiWCx8U7r7dvgTK+DvWuUadziJocPezrusBUyH37oGRzReX
	 DHRtGPv6bUFv2EAraGufBQNfVIdrqqzhvdbSOBZA=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] soc: sunxi: Fix compilation of sunxi_mbus
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <160621620536.6746.43689244441351642.git-patchwork-notify@kernel.org>
Date: Tue, 24 Nov 2020 11:10:05 +0000
References: <20201124103546.839711-1-maxime@cerno.tech>
In-Reply-To: <20201124103546.839711-1-maxime@cerno.tech>
To: Maxime Ripard <maxime@cerno.tech>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (refs/heads/for-next):

On Tue, 24 Nov 2020 11:35:46 +0100 you wrote:
> dma_direct_set_offset has been moved from dma-mapping.h to
> dma-map-ops.h, but our driver hasn't been updated resulting in a build
> breakage. Let's change the header to fix the build.
> 
> Fixes: 16fee29b0735 ("dma-mapping: remove the dma_direct_set_offset export")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 
> [...]

Here is the summary with links:
  - soc: sunxi: Fix compilation of sunxi_mbus
    https://git.kernel.org/soc/soc/c/cd817f001fb5

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


