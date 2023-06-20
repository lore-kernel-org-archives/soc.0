Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A44ECC3DA40
	for <soc@archiver.kernel.org>; Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 756C8C433D9; Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5E596C433CC;
	Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687296112;
	bh=IFFha/0BkTbLRfxJJoXZHVjKeBG5BwnZI+HqnTKL368=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=N9rEDy80aEHkWSbfeuBlU6Nx3f7A6630hpZ6698XnV8W0X7h0giafHHgSEPoS2PlB
	 hsMQUVuRftIfji5pwE/XQw62RmeQmIFkyBjMDN/aFLywqjxow0NnU0kpLRONo/lKOF
	 K32wC22LaFcjuyus0QOavq1HrYwj6IFZ9U0OsmLejVxVETBLjC/VEBqyGsbJ91PY/L
	 hd4OWenZdz6cUChRP+mmNYhh2vUpZi6yEiCDpZYutpe8ragZlGSfSddm8BJgrVLvA7
	 7Gh5gv7YFHI5I0tK9D+kWvIsfCUfsfnR/jz7/P7Eu5OuU1F1hgHvSLGtjjokf4kQVf
	 n2GeFfqq1veTQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 29A55C395C7;
	Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH PULL] arm64: dts: exynos: Remove clock from Exynos850
 pmu_system_controller
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168729611216.12258.7590441946801906780.git-patchwork-notify@kernel.org>
Date: Tue, 20 Jun 2023 21:21:52 +0000
References: <20230612180102.289745-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230612180102.289745-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 12 Jun 2023 20:01:02 +0200 you wrote:
> From: Sam Protsenko <semen.protsenko@linaro.org>
> 
> As described in the corresponding binding documentation for
> "samsung,exynos850-pmu", the "clocks" property should be used for
> specifying CLKOUT mux inputs. Therefore, the clock provided to exynos850
> pmu_system_controller is incorrect and should be removed. Instead of
> making syscon regmap keep that clock running for PMU accesses, it should
> be made always running in the clock driver, because the kernel is not
> the only software accessing PMU registers on Exynos850 platform.
> 
> [...]

Here is the summary with links:
  - [PULL] arm64: dts: exynos: Remove clock from Exynos850 pmu_system_controller
    https://git.kernel.org/soc/soc/c/12109610a5ce

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


