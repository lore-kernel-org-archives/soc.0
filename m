Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E5C7C6FA90
	for <soc@archiver.kernel.org>; Wed, 28 Sep 2022 21:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 55820C43141; Wed, 28 Sep 2022 21:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 40540C43470;
	Wed, 28 Sep 2022 21:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664398829;
	bh=OpIBLgq6394TN7ZQ+KnBRedMH3e4XWwWPPcShwf89Lg=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=HyxMvk8OdYu+mv8A6wynyW2t5Rh6uiR7u1bseiLDK1og4xDkZFnRzyGN871AOxELQ
	 Bjw8/+dsIznP80CpG4S8oDjB2qXfSdMM56QKc1YkDdNxNiiUJfp+xPGp/b5ZCJcRaI
	 Tk440UJEksTvktzhOa4jSMyl4e1rmfGMqYvEQncb24qhOdBetr11kHgMY+QrQ064oJ
	 vGUb/Zshjf8ySLWpESAdtpIgC+qjrL1COon/asH6+Ub/mHZO2dpGtkzq/MMxFKXo9T
	 6jGVhMlQMdo80rxHkcXKhMpCa1vaVmcja6ijKcl9bADetSpXCUto66NlWdnJoa8lws
	 pEI1si/Z79TjA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1E3CFE4D021;
	Wed, 28 Sep 2022 21:00:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 0/9] Update UniPhier armv7 devicetree
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166439882911.18494.18323946843768414129.git-patchwork-notify@kernel.org>
Date: Wed, 28 Sep 2022 21:00:29 +0000
References: <20220913042249.4708-1-hayashi.kunihiko@socionext.com>
In-Reply-To: <20220913042249.4708-1-hayashi.kunihiko@socionext.com>
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 13 Sep 2022 13:22:40 +0900 you wrote:
> Update devicetree sources for UniPhier armv7 SoCs to remove dtschema
> warnings, add support existing features that haven't yet been
> described, and replace constants with macros.
> 
> Changes since v2:
> - Rename the nodes for usb external controller to "usb-controller"
> - Fix the node names for sata
> 
> [...]

Here is the summary with links:
  - [v3,1/9] ARM: dts: uniphier: Rename pvtctl node to thermal-sensor
    https://git.kernel.org/soc/soc/c/2681eed29b9e
  - [v3,2/9] ARM: dts: uniphier: Rename usb-phy node for USB2 to usb-controller
    https://git.kernel.org/soc/soc/c/242c78ff62ff
  - [v3,3/9] ARM: dts: uniphier: Rename usb-glue node for USB3 to usb-controller
    https://git.kernel.org/soc/soc/c/7e115bdd4f64
  - [v3,4/9] ARM: dts: uniphier: Rename gpio-hog node
    https://git.kernel.org/soc/soc/c/888c701754a8
  - [v3,5/9] ARM: dts: uniphier: Use GIC interrupt definitions
    https://git.kernel.org/soc/soc/c/c9c50dfdf6e4
  - [v3,6/9] ARM: dts: uniphier: Add ahci controller nodes for Pro4
    https://git.kernel.org/soc/soc/c/d5566de59bdd
  - [v3,7/9] ARM: dts: uniphier: Add ahci controller nodes for PXs2
    https://git.kernel.org/soc/soc/c/97837505f067
  - [v3,8/9] ARM: dts: uniphier: Move interrupt-parent property to each child node in uniphier-support-card
    https://git.kernel.org/soc/soc/c/0aca3912ce31
  - [v3,9/9] ARM: dts: uniphier: Remove compatible "snps,dw-pcie-ep" from pcie-ep node
    https://git.kernel.org/soc/soc/c/86b20827bece

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


