Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F944C49EAF
	for <soc@archiver.kernel.org>; Sat, 12 Jun 2021 16:10:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9DEA6613F0; Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 7B6A3613DB;
	Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623514216;
	bh=Ck5ohpbhCsj0IibxX5HNMloGSu0jgkKCzs2vT0wGhW8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=PjhI6Z6QhvxwB2EytO1Z+nAfvnpxffak9eyIl1Pl+XucJ70zDYlRkHn3BTlIh6Xxx
	 i6AFeJTVxgD++4dneC3jJZwUrPeqgv43krXam75wfnykhlg+9MPKXU7BFS6Xo6UKyv
	 936msN8YwZubuW7pZL2Cq8ndY7XOA+tBGW2IQUQDHS6Aa99I+ZvNz7rsq3EYGan7Ty
	 z0EEXZdi/S3EK3LOhLLLI50nrUOn1FcSYvWKdUJUJ8KmdfBgKCC6bbRMUtkToUqzZ1
	 sxPL09aSiLMTzeEDVCc0RNS66dXQtwhH9TSC5TA3TOR/gf14i0r6GMZr1ujMXMOPS5
	 NGSR/WXeDoD0w==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 6DF4E60972;
	Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: config: aspeed: Add DEBUG_FS and EXT4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162351421644.27448.8902321378387860815.git-patchwork-notify@kernel.org>
Date: Sat, 12 Jun 2021 16:10:16 +0000
References: <20210610045338.99847-1-joel@jms.id.au>
In-Reply-To: <20210610045338.99847-1-joel@jms.id.au>
To: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (refs/heads/for-next):

On Thu, 10 Jun 2021 14:23:38 +0930 you wrote:
> DEBUG_FS was lost way back in v5.5, and EXT4 is used by ast2600 systems
> that have MMC.
> 
> Fixes: 0e4a459f56c3 ("tracing: Remove unnecessary DEBUG_FS dependency")
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> Link: https://lore.kernel.org/r/20210603040906.125109-1-joel@jms.id.au
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> 
> [...]

Here is the summary with links:
  - ARM: config: aspeed: Add DEBUG_FS and EXT4
    https://git.kernel.org/soc/soc/c/c5f05415b9d9

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


