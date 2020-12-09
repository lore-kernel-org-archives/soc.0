Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E3BEC19425
	for <soc@archiver.kernel.org>; Wed,  9 Dec 2020 17:10:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C1F0F23BEF; Wed,  9 Dec 2020 17:10:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607533810;
	bh=PgmXMGxPV6qLShT0u3L1tVnjUXdRDypU8g6YmmYaHvw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=kP2l1s92sqv/BfA1REb2lJkrNhrmq/tSib1DnHBYzFP+ocOY5gEUTpSiXiT0zPpTZ
	 mp8jI+Q+5nr+S+kAWDBgdfufVqjZFQsDExXgqO+4Pz/1SbHK34jnsnRHZPIY90C2fw
	 HdeebOIQ+WE2PzB+HxwZLaUh/OgL2pBj5nHbWd4/VvnTQ+KrhOLDDdVbuM/m2OSLnM
	 BEyo0E8RoEizQXtQwGZJSUb6S1pmrRvthFxQ8lL6Km3elq1UMDTypeU/6YKqRjHhLk
	 qk7SI3nDciyxgBlV6th0M+RApKsJvSxQU5B6GI1CeomPiLgsA99UVuHEWOP/SwZc4y
	 wlByUvIc86w3Q==
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 00/10] ARM: mstar: Add basic support for i2m and SMP
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <160753381064.14869.11839386923629723288.git-patchwork-notify@kernel.org>
Date: Wed, 09 Dec 2020 17:10:10 +0000
References: <20201201134330.3037007-1-daniel@0x0f.com>
In-Reply-To: <20201201134330.3037007-1-daniel@0x0f.com>
To: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (refs/heads/for-next):

On Tue,  1 Dec 2020 22:43:20 +0900 you wrote:
> Sorry for spamming this. I wanted to fix the DT parts
> before anyone spent time looking at the DT related commits
> in v1.
> 
> This series adds basic support for the infinity2m series
> of chips. For now the SigmaStar SSD202D which is a dual
> Cortex A7 in a QFN128 package.
> 
> [...]

Here is the summary with links:
  - [v2,01/10] dt-bindings: mstar: Add binding details for mstar, smpctrl
    https://git.kernel.org/soc/soc/c/80e73332ee82
  - [v2,02/10] dt-bindings: vendor-prefixes: Add honestar vendor prefix
    https://git.kernel.org/soc/soc/c/43181b5d8072
  - [v2,03/10] dt-bindings: mstar: Add Honestar SSD201_HT_V2 to mstar boards
    https://git.kernel.org/soc/soc/c/8c50a8b359c4
  - [v2,04/10] ARM: mstar: Add infinity2m support
    https://git.kernel.org/soc/soc/c/ba2290b1b750
  - [v2,05/10] ARM: mstar: Add common dtsi for SSD201/SSD202D
    https://git.kernel.org/soc/soc/c/572ef97bc734
  - [v2,06/10] ARM: mstar: Add chip level dtsi for SSD202D
    https://git.kernel.org/soc/soc/c/dbbaf35d589e
  - [v2,07/10] ARM: mstar: Add dts for Honestar ssd201htv2
    https://git.kernel.org/soc/soc/c/418cb58b4566
  - [v2,08/10] ARM: mstar: Add smp ctrl registers to infinity2m dtsi
    https://git.kernel.org/soc/soc/c/570e471ce054
  - [v2,09/10] ARM: mstar: Wire up smpctrl for SSD201/SSD202D
    https://git.kernel.org/soc/soc/c/ecaafac1eb73
  - [v2,10/10] ARM: mstar: SMP support
    https://git.kernel.org/soc/soc/c/5919eec0f092

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


