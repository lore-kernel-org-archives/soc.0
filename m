Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4539EC3065B
	for <soc@archiver.kernel.org>; Thu, 27 Jun 2024 15:01:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1AEACC4AF10; Thu, 27 Jun 2024 15:01:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F39C3C32786;
	Thu, 27 Jun 2024 15:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719500464;
	bh=9dmf0j14sWmozRDpP444P4LjLjHHFDpEzDtuepKxcxE=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ehakCvuJfWb9mQHYhsdMysh9buECU3vDy6uYCpaG/MKCsqVOXf8iXNHC8uSBNK2Ce
	 nTQnvLYX83LZaQ9aR/KxwuIfkf9Te6oBMZXiri2g1gGvMfexzPUgYrULFW8l25W+dH
	 6j3olh4R31p79M9UUFjCUMB/QA5CmUck/jlGfHVVWWQuQvojrHQeEQG3LMq48d8k1R
	 M4A2NyQWVA+ztUevPY0uoClq8/JWs9Wg/fGe/eKu1zY8RNvwUdY9Z0ISVugF9te4Ns
	 XHMkwMeHepphr/V88stxFLnUnbjVFfGkxdCfGiu15Zz2CebBXWSMy3fEZxnaBOhGTu
	 YtxvE5HLwVm7g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DBEB6C4333E;
	Thu, 27 Jun 2024 15:01:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] soc: add missing MODULE_DESCRIPTION() macros
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171950046389.29698.10130796345532797027.git-patchwork-notify@kernel.org>
Date: Thu, 27 Jun 2024 15:01:03 +0000
References: <20240625-md-drivers-soc-v2-1-8bc7c03e3e69@quicinc.com>
In-Reply-To: <20240625-md-drivers-soc-v2-1-8bc7c03e3e69@quicinc.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 25 Jun 2024 10:04:15 -0700 you wrote:
> With ARCH=x86, make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/imx/soc-imx8m.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/ixp4xx/ixp4xx-qmgr.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/ixp4xx/ixp4xx-npe.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/mediatek/mtk-cmdq-helper.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/amlogic/meson-clk-measure.o
> 
> [...]

Here is the summary with links:
  - [v2] soc: add missing MODULE_DESCRIPTION() macros
    https://git.kernel.org/soc/soc/c/a862a3f7b1b7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


