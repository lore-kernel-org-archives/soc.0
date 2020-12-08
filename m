Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6105C433FE
	for <soc@archiver.kernel.org>; Tue,  8 Dec 2020 17:10:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B913A23B18; Tue,  8 Dec 2020 17:10:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607447422;
	bh=PbyFNiTjSSucuQaIDfQCbyVLaq4ZIEMj2GFXrmBkpYI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=pAsPn1wuqZ78dQWHk+yFJa/Xnf4luYe0BP9/zMmMQWAoS+JzeQIirOB/X3v+dBsGK
	 8gIVa/4pGL5x70q/VUGo1fchmuf4YCpWYukH5BvjGJZEJpareEFCWqjJCM5Oc8i2KS
	 s0H6pAbSQnbtUOFKy3DpTzqjpuqDjIu/rv6xK0JKFQoT6POKyhBw4RanZoVDMV5fFN
	 8HU6LClLKFt94mS93HqU1buZ4xQCunv2Nnyg6HK0PBe2R2ybj0YPsFuXL5jGKdDWuG
	 dOlekB9HPZXhHmNrbQgGtewwRN/QtR6T1KZYI2KLHev8DUdHXRwy9LPOEqH4etYi2q
	 4fY/eu3YY7aMA==
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [RFC 1/2] MAINTAINERS: correct SoC Git address (formerly: arm-soc)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <160744742260.1206.5432124713863429212.git-patchwork-notify@kernel.org>
Date: Tue, 08 Dec 2020 17:10:22 +0000
References: <20201201211516.24921-1-krzk@kernel.org>
In-Reply-To: <20201201211516.24921-1-krzk@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (refs/heads/arm/fixes):

On Tue,  1 Dec 2020 23:15:15 +0200 you wrote:
> The SoC Git was moved from arm/arm-soc.git to soc/soc.git.  Correct the
> ARM Sub-architectures entry.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - [RFC,1/2] MAINTAINERS: correct SoC Git address (formerly: arm-soc)
    https://git.kernel.org/soc/soc/c/c99055ec2c39
  - [RFC,2/2] MAINTAINERS: add a limited ARM and ARM64 SoC entry
    https://git.kernel.org/soc/soc/c/db2082700a0c

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


