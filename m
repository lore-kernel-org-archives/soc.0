Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B255EC47073
	for <soc@archiver.kernel.org>; Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 85AEAC4163D; Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 67ADEC433B8;
	Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703246467;
	bh=i5zur05cdluM8p67qnT/2pOG0B8z2Pj+FAU0MXgbVC0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=JLW9U7wrtvlrhHUx8eoWiSPMkqxWIUWdo/4xLlxLtagRweMcZkhWWRpFcUu+Ohd9l
	 T/PgmKOVFF9OWQAHc6wQ2n+pFVvqSlsoVzKVblRyMRuz/o3SYT92z1oFBb0SWv+LAM
	 n9A2y9XgiCWrcKkarubPcDSqmirZRG81gDJ5MojgNPeiLmfUEY/jeroBAm+xZTiTzn
	 huVQalEH5mK+Z862ily8DfkOpA63r8UTfAdWQnAMUE5d5f98f/l41Ee3DAE3/3Lksu
	 YQjfI428mSSMuUWEE8joX3mQf6IoxXPeUIq/t4eD2SF0L2Pcfv8uTP6/K8FqTTAayG
	 VJhLU/oeZPovw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2DB52DD4EF5;
	Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v7 00/16] Add minimal Tensor/GS101 SoC support and
 Oriole/Pixel6 board
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170324646718.10550.5545145907495300081.git-patchwork-notify@kernel.org>
Date: Fri, 22 Dec 2023 12:01:07 +0000
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
    https://git.kernel.org/soc/soc/c/81306efd22ff
  - [v7,02/16] dt-bindings: arm: google: Add bindings for Google ARM platforms
    (no matching commit)
  - [v7,03/16] dt-bindings: serial: samsung: Add google-gs101-uart compatible
    https://git.kernel.org/soc/soc/c/bad3bc0a23b7
  - [v7,04/16] dt-bindings: serial: samsung: Make samsung,uart-fifosize a required property
    https://git.kernel.org/soc/soc/c/2072496129b7
  - [v7,05/16] dt-bindings: soc: samsung: usi: add google,gs101-usi compatible
    https://git.kernel.org/soc/soc/c/d793f7c471fb
  - [v7,06/16] dt-bindings: clock: google,gs101: fix incorrect numbering and DGB suffix
    https://git.kernel.org/soc/soc/c/5b02a863ba50
  - [v7,07/16] clk: samsung: clk-pll: Add support for pll_{0516,0517,518}
    https://git.kernel.org/soc/soc/c/13ff3bdafdd5
  - [v7,08/16] clk: samsung: clk-gs101: Add cmu_top, cmu_misc and cmu_apm support
    https://git.kernel.org/soc/soc/c/2c597bb7d66a
  - [v7,09/16] pinctrl: samsung: Add gs101 SoC pinctrl configuration
    (no matching commit)
  - [v7,10/16] watchdog: s3c2410_wdt: Add support for WTCON register DBGACK_MASK bit
    https://git.kernel.org/soc/soc/c/6584cd349010
  - [v7,11/16] watchdog: s3c2410_wdt: Update QUIRK macros to use BIT macro
    https://git.kernel.org/soc/soc/c/d429928dde2d
  - [v7,12/16] watchdog: s3c2410_wdt: Add support for Google gs101 SoC
    https://git.kernel.org/soc/soc/c/796bb2d3a16c
  - [v7,13/16] tty: serial: samsung: Add gs101 compatible and common fifoszdt_serial_drv_data
    https://git.kernel.org/soc/soc/c/c95f5b21a0ea
  - [v7,14/16] arm64: dts: exynos: google: Add initial Google gs101 SoC support
    (no matching commit)
  - [v7,15/16] arm64: dts: exynos: google: Add initial Oriole/pixel 6 board support
    (no matching commit)
  - [v7,16/16] MAINTAINERS: add entry for Google Tensor SoC
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


