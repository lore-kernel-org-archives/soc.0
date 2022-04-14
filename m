Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77EA1C43219
	for <soc@archiver.kernel.org>; Thu, 14 Apr 2022 21:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 435B4C385A1; Thu, 14 Apr 2022 21:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2C4B7C385AE;
	Thu, 14 Apr 2022 21:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649970615;
	bh=WuPL6piRvgHHHrqj1vtpG824Di6PN6Jp6wRSkqq6HMY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=JVSWSDyrIwVLvtiKAkGyyDaHzic5fi82+OqCgnvd9iXXZgZRIaD9yUriVaiTShHHR
	 ODw50ASaQCLUFsP0V6qqL84QoazuV+16+TB7HsABwIAD+DOQG6tv8mydG/UHBN30BI
	 XN7kwW9UsLKQ9uD/NzcJpqvtY8tSTEyrhnWz01MeMDPVCKczZgE7gjObg29tK+kuwc
	 IG2QmsVWo+zIpnwYeBMQ6DpYoFyWol0tNDCGcz6xLbaQGwrvPudTjJX4x5nizpSomv
	 Evdr0MMHgBadgnWA9VWx3/BIAYoYfkeFzTUkEEiv1CsDFCL6y/9FI0iI3HojCMhyWo
	 k+pyDBwXFzd4w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1C7C0EAC09B;
	Thu, 14 Apr 2022 21:10:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: dts: align SPI NOR node name with dtschema
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164997061511.10394.677075662266988243.git-patchwork-notify@kernel.org>
Date: Thu, 14 Apr 2022 21:10:15 +0000
References: <20220407143027.294678-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220407143027.294678-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu,  7 Apr 2022 16:30:27 +0200 you wrote:
> The node names should be generic and SPI NOR dtschema expects "flash".
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm/boot/dts/da850-evm.dts                  | 2 +-
>  arch/arm/boot/dts/dm8168-evm.dts                 | 2 +-
>  arch/arm/boot/dts/spear1310-evb.dts              | 2 +-
>  arch/arm/boot/dts/spear1340-evb.dts              | 2 +-
>  arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi | 2 +-
>  arch/arm/boot/dts/stm32mp157c-ev1.dts            | 4 ++--
>  6 files changed, 7 insertions(+), 7 deletions(-)

Here is the summary with links:
  - ARM: dts: align SPI NOR node name with dtschema
    https://git.kernel.org/soc/soc/c/56147a156e7e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


