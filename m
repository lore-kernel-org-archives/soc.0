Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98B40CE7B09
	for <soc@archiver.kernel.org>; Thu, 28 Sep 2023 08:01:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7DD06C433D9; Thu, 28 Sep 2023 08:01:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 677BDC433CA;
	Thu, 28 Sep 2023 08:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695888103;
	bh=NK5LpfjH9wTiKgEAowwnfd4vMik8z3vppw88SmHsr5s=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=u1mxqlddMyj10inwX1p/N9dW1IbeEG+RFtiiv1LdanMqLqrNgykg2oKIaHQgy38HG
	 8G/iHUR+pYCnAqmjpKXjCRQG88fLxY206Jb2QHjO1aUirmsKksShMJmcIAu9jDhjzS
	 S5YfeN3yvywl09DJbvOJxafUNlgs9ZO8CJFpM4lmgSQyd9zN5cI0WdO+EYXFk0royS
	 QF8nUlnQMRRJbLcW2XLpz5txtyQKLGhYJ0Nw1+PsLSkQxp+oMQZ2x42GBGY1WCtktc
	 /5lpgVljQCMApOJqcYYCdLPBj/OKhyWoDNgtAYtEdDld4V60Gyl+Jh4jlzo/YmbJ13
	 KEZj8lVBcD/Jw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5665DE2A057;
	Thu, 28 Sep 2023 08:01:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/4] Add AMD Pensando Elba Device Tree 
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169588810334.3136.477770241257028673.git-patchwork-notify@kernel.org>
Date: Thu, 28 Sep 2023 08:01:43 +0000
References: <20230925195610.47971-1-blarson@amd.com>
In-Reply-To: <20230925195610.47971-1-blarson@amd.com>
To: Brad Larson <blarson@amd.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 25 Sep 2023 12:56:06 -0700 you wrote:
> The Elba System Controller is dropped from this patch series.  The
> following Elba enablement patches have been merged.
> 
> f2156989bf30 spi: cdns: Add compatible for AMD Pensando Elba SoC
> f5c2f9f95843 spi: cadence-quadspi: Add compatible for AMD Pensando Elba SoC
> 2c8606040a80 spi: dw: Add support for AMD Pensando Elba SoC
> 6282a6ceef62 spi: dw: Add AMD Pensando Elba SoC SPI Controller
> aad53d4ee756 mmc: sdhci-cadence: Support mmc hardware reset
> b5dbcf1f1d1a mmc: sdhci-cadence: Add AMD Pensando Elba SoC support
> e095b78ef2db mmc: sdhci-cadence: Support device specific init during probe
> d3e32f847891 mmc: sdhci-cadence: Enable device specific override of writel()
> 82e4726b00e9 dt-bindings: mmc: cdns: Add AMD Pensando Elba SoC
> 8e993c5888fa dt-bindings: mfd: syscon: Add amd,pensando-elba-syscon compatible
> 
> [...]

Here is the summary with links:
  - [1/4] dt-bindings: arm: add AMD Pensando boards
    https://git.kernel.org/soc/soc/c/b0292fd8be37
  - [2/4] MAINTAINERS: Add entry for AMD PENSANDO
    https://git.kernel.org/soc/soc/c/fbf37376f8ac
  - [3/4] arm64: Add config for AMD Pensando SoC platforms
    https://git.kernel.org/soc/soc/c/646fe2e4b390
  - [4/4] arm64: dts: Add AMD Pensando Elba SoC support
    https://git.kernel.org/soc/soc/c/34dc1baba215

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


