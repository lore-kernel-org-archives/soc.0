Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69099C433B4
	for <soc@archiver.kernel.org>; Mon, 19 Apr 2021 15:10:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 424ED61007; Mon, 19 Apr 2021 15:10:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 2A9DB611CE;
	Mon, 19 Apr 2021 15:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1618845009;
	bh=2RymQ85ZwlhynL3Am9EEuNaYELs6tpNhI5+O4c2i9wk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=YFLWzocbVv4cTpEmZVZXYlIMR/VlyIYPhYBz28kK4fr6hnGDab14XBYQ+2/MmZdNd
	 AwcY9A3czlRNCA0SZRbIkJOJ79dyRaIpdBh8jGUc3Cao6roXzDl9SMzslYjYRM0iVe
	 IBvpt3qHwhwMArpCP55Gs+MsZr0qxzaduDxtAM0zGvJmUsQWqrSDUUFce/hKotoash
	 c2qUHhgAN+5S9Kuoo0+YCjk7lOARXPA/45bacqaQEKR3uMQk6V6Uhi/oSiPvEB9+Nz
	 A+CCPzztkT9XceaG8K+JQeum6kEJBzqD3v7IYcm3G8Toypwvmqk09icNZwojwduP++
	 bOYKZXYwYZoeg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 1E8B060970;
	Mon, 19 Apr 2021 15:10:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/3] ARM: mstar: Add initial support for M5Stack UnitV2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161884500912.21313.417382182251384944.git-patchwork-notify@kernel.org>
Date: Mon, 19 Apr 2021 15:10:09 +0000
References: <20210417011015.2105280-1-daniel@0x0f.com>
In-Reply-To: <20210417011015.2105280-1-daniel@0x0f.com>
To: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (refs/heads/for-next):

On Sat, 17 Apr 2021 10:10:12 +0900 you wrote:
> This series adds basic support for the soon to be released M5Stack
> UnitV2 based on the SigmaStar SSD202D.
> 
> With the rest of the commits in my tree the SPI NAND, ethernet, USB etc
> should work so the UnitV2 should be fully usable with a mainline-ish
> kernel.
> 
> [...]

Here is the summary with links:
  - [1/3] dt-bindings: vendor-prefixes: Add vendor prefix for M5Stack
    https://git.kernel.org/soc/soc/c/f8d6fb74bbb7
  - [2/3] dt-bindings: arm: mstar: Add compatible for M5Stack UnitV2
    https://git.kernel.org/soc/soc/c/c5208ff7f6c2
  - [3/3] ARM: dts: mstar: Add a dts for M5Stack UnitV2
    https://git.kernel.org/soc/soc/c/3060a15ccaed

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


