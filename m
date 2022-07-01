Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39BA2CCA480
	for <soc@archiver.kernel.org>; Fri,  1 Jul 2022 20:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1D97CC341D1; Fri,  1 Jul 2022 20:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EC912C341CB;
	Fri,  1 Jul 2022 20:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656708097;
	bh=2GiFKjdS5hSf0U8ksKFfQpUz90W00H4kfYv+xoihqyE=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=K8WIhUpc7sF04jY5umDzxxqKazeT/5+Qtvut/9tiXkJAKPZPKt1OBFrFD2LhzzNMn
	 mlhbd+53b18MOPHJOkm/hP/bjiHH3KlXLVOYUxiOJz2uze9QIgMH5UfUXNs8ahioFq
	 dnKdwcsc7bQ92XEJ39jDNalI1Kbh+rOcI3a7aCOdaEbTV2O+6mWKAby9hhkmo1U5yN
	 zIf+UjZGsMwDG5/YQ8orcU21BkJRF+rfC32RcvltfH1RmGFQQOuN8DFVUuzQYL6vgW
	 ZzqMsPnXO5L5nFQxvVvgam2tPYf5d2dC1S6pPTA9cAuMjlWzqhIXWsePSvvpqM6rAL
	 zFXvKSskiYo4g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D89B2E49BBC;
	Fri,  1 Jul 2022 20:41:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 00/40] dt-bindings: input: gpio-keys: rework matching
 children
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165670809688.26141.7639449989196510180.git-patchwork-notify@kernel.org>
Date: Fri, 01 Jul 2022 20:41:36 +0000
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>:

On Wed, 15 Jun 2022 17:52:24 -0700 you wrote:
> Hi,
> 
> Merging
> =======
> 1. dt-bindings: rebased on top of Rob's:
>    https://lore.kernel.org/all/20220608211207.2058487-1-robh@kernel.org/
> 
> [...]

Here is the summary with links:
  - [v3,01/40] dt-bindings: input: gpio-keys: enforce node names to match all properties
    (no matching commit)
  - [v3,02/40] dt-bindings: input: gpio-keys: reference input.yaml and document properties
    (no matching commit)
  - [v3,03/40] dt-bindings: input: gpio-keys: accept also interrupt-extended
    (no matching commit)
  - [v3,04/40] dt-bindings: pinctrl: nuvoton,wpcm450-pinctrl: align key node name
    (no matching commit)
  - [v3,05/40] arm64: dts: apm: correct gpio-keys properties
    https://git.kernel.org/soc/soc/c/2453119fe6ee
  - [v3,06/40] arm64: dts: broadcom: align gpio-key node names with dtschema
    https://git.kernel.org/soc/soc/c/ea559c81b616
  - [v3,07/40] arm64: dts: freescale: align gpio-key node names with dtschema
    (no matching commit)
  - [v3,08/40] arm64: dts: freescale: align led node names with dtschema
    (no matching commit)
  - [v3,09/40] arm64: dts: hisilicon: align gpio-key node names with dtschema
    https://git.kernel.org/soc/soc/c/111b4da2c2fc
  - [v3,10/40] arm64: dts: hisilicon: correct gpio-keys properties
    https://git.kernel.org/soc/soc/c/717b3096da2e
  - [v3,11/40] arm64: dts: marvell: align gpio-key node names with dtschema
    (no matching commit)
  - [v3,12/40] arm64: dts: marvell: armada-3720: align lednode names with dtschema
    (no matching commit)
  - [v3,13/40] ARM: dts: marvell: align gpio-key node names with dtschema
    (no matching commit)
  - [v3,14/40] ARM: dts: marvell: correct gpio-keys properties
    (no matching commit)
  - [v3,15/40] arm64: dts: mediatek: align gpio-key node names with dtschema
    (no matching commit)
  - [v3,16/40] arm64: dts: mediatek: mt7622-bananapi-bpi-r64: align led node names with dtschema
    (no matching commit)
  - [v3,17/40] arm64: dts: mediatek: mt7622-rfb1: correct gpio-keys properties
    (no matching commit)
  - [v3,18/40] ARM: dts: mediatek: align gpio-key node names with dtschema
    (no matching commit)
  - [v3,19/40] arm64: dts: tegra: align gpio-key node names with dtschema
    (no matching commit)
  - [v3,20/40] ARM: dts: tegra: align gpio-key node names with dtschema
    (no matching commit)
  - [v3,21/40] arm64: dts: qcom: align gpio-key node names with dtschema
    (no matching commit)
  - [v3,22/40] arm64: dts: qcom: correct gpio-keys properties
    (no matching commit)
  - [v3,23/40] arm64: dts: qcom: sdm630-sony-xperia-nile: drop unneeded status from gpio-keys
    (no matching commit)
  - [v3,24/40] arm64: dts: qcom: align led node names with dtschema
    (no matching commit)
  - [v3,25/40] ARM: dts: qcom: align gpio-key node names with dtschema
    (no matching commit)
  - [v3,26/40] arm64: dts: rockchip: align gpio-key node names with dtschema
    (no matching commit)
  - [v3,27/40] ARM: dts: rockchip: align gpio-key node names with dtschema
    (no matching commit)
  - [v3,28/40] ARM: dts: rockchip: rk3288-tinker: correct gpio-keys properties
    (no matching commit)
  - [v3,29/40] arm64: dts: ti: align gpio-key node names with dtschema
    (no matching commit)
  - [v3,30/40] arm64: dts: xilinx: align gpio-key node names with dtschema
    (no matching commit)
  - [v3,31/40] ARM: dts: xilinx: align gpio-key node names with dtschema
    (no matching commit)
  - [v3,32/40] ARM: dts: omap: align gpio-key node names with dtschema
    (no matching commit)
  - [v3,33/40] ARM: dts: omap: correct gpio-keys properties
    (no matching commit)
  - [v3,34/40] ARM: dts: animeo: align gpio-key node names with dtschema
    https://git.kernel.org/soc/soc/c/523b53bb750d
  - [v3,35/40] ARM: dts: animeo: correct gpio-keys properties
    https://git.kernel.org/soc/soc/c/91503e5a3b5a
  - [v3,36/40] ARM: dts: aspeed: align gpio-key node names with dtschema
    (no matching commit)
  - [v3,37/40] ARM: dts: aspeed: correct gpio-keys properties
    (no matching commit)
  - [v3,38/40] ARM: dts: at91: align gpio-key node names with dtschema
    (no matching commit)
  - [v3,39/40] ARM: dts: at91: correct gpio-keys properties
    (no matching commit)
  - [v3,40/40] ARM: dts: at91: drop unneeded status from gpio-keys
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


