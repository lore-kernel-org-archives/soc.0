Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7137BC7EE2E
	for <soc@archiver.kernel.org>; Mon, 27 Feb 2023 13:50:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 37CB5C433A8; Mon, 27 Feb 2023 13:50:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2000DC433D2;
	Mon, 27 Feb 2023 13:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677505818;
	bh=O2tTndmujFJUokf1mPiUGZtVphBiM8Ml+iIo2miIxgY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Th3czmRKh/bgHHg87JZo+p6giSGGWt9EYCjZLLZVv7da4tSkAl9Rqvs+jVMxjQKLy
	 23FNOAIMUCCUHs1Fa7pND8p13LdVhcxdFgePsk+Tiq5FpPAIXfnIZjJs2xBqX3ctDk
	 QBp987bMy6CTfTepLDJSzySlQt7o6+9bgV6Gb3wx12h15QfbLvgYHqbJFIhfVlH5SC
	 qxEUX8K5Q4GjWrZuY5bEFGFaVj0pe5Y14r0C+/PYPLjMfTh4O5N5RYtv1ppdHafJPj
	 pCD2NczGp+YNAeEb+mZACunuSfdSo8g4NgMCs18EubIFsoSMtbG2o7ylk1I3ylJV1C
	 OAWSeDMW8/cJA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EF693E524D3;
	Mon, 27 Feb 2023 13:50:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: defconfig: Fix unintentional disablement of PCI on
 i.MX
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167750581797.1456.12307474479462615888.git-patchwork-notify@kernel.org>
Date: Mon, 27 Feb 2023 13:50:17 +0000
References: <20230220-imx-pci-defconfig-v1-1-2210cf08340e@kernel.org>
In-Reply-To: <20230220-imx-pci-defconfig-v1-1-2210cf08340e@kernel.org>
To: Mark Brown <broonie@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 20 Feb 2023 19:09:45 +0000 you wrote:
> A recent update to support PCI endpoint mode on i.MX platforms
> unintentionally disabled PCI host support for i.MX in defconfig.  The
> existing PCI_IMX6 was made a hidden option, selected by new options
> PCI_IMX6_HOST (for the existing support) and PCI_IMX6_EP (for the
> endpoint mode), but there has been no corresponding update to defconfig
> so the PCI_IMX6 ends up getting disabled.  Switch defconfig to
> PCI_IMX6_HOST to preserve the existing functionality.
> 
> [...]

Here is the summary with links:
  - arm64: defconfig: Fix unintentional disablement of PCI on i.MX
    https://git.kernel.org/soc/soc/c/0cd5780eb625

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


