Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 676D5C47074
	for <soc@archiver.kernel.org>; Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5AB28C4166B; Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 43783C433B9;
	Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703180466;
	bh=pAqHLWpK3cJ9a/TB66VAcuLTsCAydG+KPKrVPhR8xOk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=cXKhlqkeFwNWBKNDVIDqh9LbAskMAm9Bd2DDK+NIXbVkVn21i6I9wlaUYWfkZB5WY
	 hOGUc19tXHCxay2j8y5YdJ9o9rJSExYpVaJAhyOnL6L/AfdquFfty1NABZAKPCexGh
	 rh7ckYbZ9n2LmtopXkD02rtd1sknMkeRNGC9NHyhOGLUIZzHp/MmsZcEvMNC5JThrO
	 g53EnNQIcZOtiLfFV0VVddQ3xAX5TFR6fW3TQyxa3uJ1tqNkS9H5LzAdaSafGBhYF5
	 o0ixRXy/jXjJksczRHNYoyfwUwjmydTfW3Hl6G+ECUgCKSJQhKlNezUPHsTcbByoEm
	 zFWZKuV2lBgBw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2EE16DD4F0B;
	Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v7 00/16] Add minimal Tensor/GS101 SoC support and
 Oriole/Pixel6 board
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170318046618.3302.10895876662041456813.git-patchwork-notify@kernel.org>
Date: Thu, 21 Dec 2023 17:41:06 +0000
References: <20231211162331.435900-1-peter.griffin@linaro.org>
In-Reply-To: <20231211162331.435900-1-peter.griffin@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>:

On Mon, 11 Dec 2023 16:23:15 +0000 you wrote:
> Hi folks,
> 
> This series adds initial SoC support for the GS101 SoC and also initial board
> support for Pixel 6 phone (Oriole).
> 
> Thankyou to everyone who has reviewed and tested the previous series. Your
> time and effort doing so is much appreciated! If any relevant subsystem
> maintainers can send a acked-by that would be much appreciated. In particular
> 
> [...]

Here is the summary with links:
  - [v7,01/16] dt-bindings: watchdog: Document Google gs101 watchdog bindings
    (no matching commit)
  - [v7,02/16] dt-bindings: arm: google: Add bindings for Google ARM platforms
    https://git.kernel.org/soc/soc/c/b3582328b9c5
  - [v7,03/16] dt-bindings: serial: samsung: Add google-gs101-uart compatible
    (no matching commit)
  - [v7,04/16] dt-bindings: serial: samsung: Make samsung,uart-fifosize a required property
    (no matching commit)
  - [v7,05/16] dt-bindings: soc: samsung: usi: add google,gs101-usi compatible
    (no matching commit)
  - [v7,06/16] dt-bindings: clock: google,gs101: fix incorrect numbering and DGB suffix
    (no matching commit)
  - [v7,07/16] clk: samsung: clk-pll: Add support for pll_{0516,0517,518}
    (no matching commit)
  - [v7,08/16] clk: samsung: clk-gs101: Add cmu_top, cmu_misc and cmu_apm support
    (no matching commit)
  - [v7,09/16] pinctrl: samsung: Add gs101 SoC pinctrl configuration
    (no matching commit)
  - [v7,10/16] watchdog: s3c2410_wdt: Add support for WTCON register DBGACK_MASK bit
    (no matching commit)
  - [v7,11/16] watchdog: s3c2410_wdt: Update QUIRK macros to use BIT macro
    (no matching commit)
  - [v7,12/16] watchdog: s3c2410_wdt: Add support for Google gs101 SoC
    (no matching commit)
  - [v7,13/16] tty: serial: samsung: Add gs101 compatible and common fifoszdt_serial_drv_data
    (no matching commit)
  - [v7,14/16] arm64: dts: exynos: google: Add initial Google gs101 SoC support
    https://git.kernel.org/soc/soc/c/ea89fdf24fd9
  - [v7,15/16] arm64: dts: exynos: google: Add initial Oriole/pixel 6 board support
    https://git.kernel.org/soc/soc/c/6a5713fc7853
  - [v7,16/16] MAINTAINERS: add entry for Google Tensor SoC
    https://git.kernel.org/soc/soc/c/9d71df3e6eb7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


