Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AEA2C3DA40
	for <soc@archiver.kernel.org>; Wed,  5 Jul 2023 20:42:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 80E8FC433B8; Wed,  5 Jul 2023 20:42:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6A6E1C433CA;
	Wed,  5 Jul 2023 20:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688589724;
	bh=QbeLgv7fcqDhCAWE0I10WlxcWzjolCHeXB5UIoNqy9w=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Utqa7voYcM/rwB1eoZ/3j94S/1MMP9BL1R3MKZ4Ce8O4ENBnEF8Q9HzNLhXjqSWUn
	 nGQs3QyGp22U2zfLEynd5QNhCDnUxzdC174DhTGeAg2jG4cKW+ZsIHh2v5T836cuCD
	 HrVBPskBCBFVDYNFNrBIU4BwzWXVfK3DFa3epeBkbcDtQYUzDaqdUFN+myA6OS/py3
	 FvEP362MyChodBYO2rq9yTfF+Zea5EV1K680qQRBrhPvHRavd/3gAQ0I6lpv/jXgTo
	 0nmH1/aMpkqI+1WNY2rjnVAEwmOXL+7POa9Dt8gj3JOASb8BPjLtpGMJMRFRf7gQbj
	 op/lzswK2t02A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 574DBC691F1;
	Wed,  5 Jul 2023 20:42:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: dts: st: add missing space before {
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168858972435.10612.14329942192067699021.git-patchwork-notify@kernel.org>
Date: Wed, 05 Jul 2023 20:42:04 +0000
References: <20230705150033.293832-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230705150033.293832-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed,  5 Jul 2023 17:00:33 +0200 you wrote:
> Add missing whitespace between node name/label and opening {.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm/boot/dts/st/spear1310.dtsi                    |  2 +-
>  arch/arm/boot/dts/st/spear1340.dtsi                    |  2 +-
>  arch/arm/boot/dts/st/stih407-family.dtsi               |  2 +-
>  arch/arm/boot/dts/st/stih407-pinctrl.dtsi              | 10 +++++-----
>  arch/arm/boot/dts/st/stm32f429-disco.dts               |  2 +-
>  arch/arm/boot/dts/st/stm32f746-pinctrl.dtsi            |  2 +-
>  arch/arm/boot/dts/st/stm32f769-pinctrl.dtsi            |  2 +-
>  arch/arm/boot/dts/st/stm32h7-pinctrl.dtsi              |  6 +++---
>  arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi            |  4 ++--
>  arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1.dtsi   |  6 +++---
>  .../arm/boot/dts/st/stm32mp157a-microgea-stm32mp1.dtsi |  6 +++---
>  11 files changed, 22 insertions(+), 22 deletions(-)

Here is the summary with links:
  - ARM: dts: st: add missing space before {
    https://git.kernel.org/soc/soc/c/7fb75904d7ce

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


