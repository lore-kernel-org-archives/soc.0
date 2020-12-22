Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3D8CC433E9
	for <soc@archiver.kernel.org>; Tue, 22 Dec 2020 17:00:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5663D2313C; Tue, 22 Dec 2020 17:00:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 3C06123133;
	Tue, 22 Dec 2020 17:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1608656407;
	bh=iUrayDq4NsfYu3v6xnIvArT4rLpG1bwJlOj6UPMBTDo=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=cnKSPbxEGPx/0O/tApB//nu2RjTD+Ifjlm2mpcpBPY0ksv7P4/51T5OTNgtVt0Da4
	 ijtUpmcSXlWveWY/9jP4qKAXD0eEgMUUTq/FZ6CkLgpsbCLsaC7AHYEbG/PxDGaOmr
	 fhsXczrTAUn7ugXuAVcyzjHKSwqV6j13m5FjMnFHSI/f3X65nAuSdkxgjr+tizJ7rf
	 2S4+m3DBqQOiIDTze0Nx8PT0eHEsUduitCw7gAu5u+3Ady7Hs4yzPW3QZleLznV64B
	 abx8s4jppAN+Qn1gsHQGxCO2Y1va5gHZVGQn82adA8+sk3b1a7XhAi3OiPZVrNn7F0
	 iCkWIp7bt8QBA==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 30AEF60113;
	Tue, 22 Dec 2020 17:00:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] soc: mediatek: mmsys: Specify HAS_IOMEM dependency for
 MTK_MMSYS
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <160865640719.31426.15111675208317881506.git-patchwork-notify@kernel.org>
Date: Tue, 22 Dec 2020 17:00:07 +0000
References: <20201210115124.1285-1-matthias.bgg@kernel.org>
In-Reply-To: <20201210115124.1285-1-matthias.bgg@kernel.org>
To: Matthias Brugger <matthias.bgg@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (refs/heads/for-next):

On Thu, 10 Dec 2020 12:51:24 +0100 you wrote:
> From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> 
> Because mtk-mmsys uses the 'devm_platform_ioremap_resource' function, it
> should depend on HAS_IOMEM.
> 
> Fixes: cc6576029aed ("soc: mediatek: mmsys: Use devm_platform_ioremap_resource()")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Link: https://lore.kernel.org/r/20201203121447.3366406-1-enric.balletbo@collabora.com
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> 
> [...]

Here is the summary with links:
  - soc: mediatek: mmsys: Specify HAS_IOMEM dependency for MTK_MMSYS
    https://git.kernel.org/soc/soc/c/ae66f0987b98

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


