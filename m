Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BDCEC43461
	for <soc@archiver.kernel.org>; Tue, 27 Apr 2021 21:22:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D85DD613F3; Tue, 27 Apr 2021 21:22:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id BF467613F5;
	Tue, 27 Apr 2021 21:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619558562;
	bh=uZzEVVakcCXQCWRsMwT+kuH5rFlVuqxXu7+NSF70Y6s=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=N/4CpF6eW7/DAjaVltfp7UkbfBYkom4gK0GGXRTRerloFFFKu+D8myB79aXeGkQUA
	 WMNGp/W0cF0SVTv2/wSR2WJY154+Ft0Ho7M5ZLoz9g/t+Os6RS0YlYYdWeZNlGkfRr
	 3nq8C8MCWt5D+0+Zn418Q9qg/9js3ELiZt1VHGzHfdW7M7hw4p0ugcNBGmfl8gbuoS
	 1pHTFSIGhyNj8ez2R3ClhCUb35jTlcQ0TGhYBWXMKzbvWAbPljn2kv5jcEjKBc8qbU
	 vfignOr/ABp1CATwdZsqEoBpiKDehmOkpu8tzhCMsmOXpL1+G7APymEa8zLQ3ZKf0t
	 nns6JToQRmveQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id B3D4060A23;
	Tue, 27 Apr 2021 21:22:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] dt-bindings: nvmem: mediatek: remove duplicate mt8192 line
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161955856273.21098.14760495259968162398.git-patchwork-notify@kernel.org>
Date: Tue, 27 Apr 2021 21:22:42 +0000
References: <20210427210121.1080364-1-arnd@kernel.org>
In-Reply-To: <20210427210121.1080364-1-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (refs/heads/arm/fixes):

On Tue, 27 Apr 2021 23:01:08 +0200 you wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The same patch was accidentally merged twice, resulting in a
> duplicate line for the mt8192 SoC.
> 
> Fixes: f2674c0c7488 ("dt-bindings: nvmem: mediatek: add support for MediaTek mt8192 SoC")
> Fixes: 2a1405a14c3a ("dt-bindings: nvmem: mediatek: add support for MediaTek mt8192 SoC")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
> [...]

Here is the summary with links:
  - dt-bindings: nvmem: mediatek: remove duplicate mt8192 line
    https://git.kernel.org/soc/soc/c/b5144a2bf401

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


