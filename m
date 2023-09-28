Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A959FCE7B0A
	for <soc@archiver.kernel.org>; Thu, 28 Sep 2023 08:01:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8EB69C43397; Thu, 28 Sep 2023 08:01:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 77CE5C433CB;
	Thu, 28 Sep 2023 08:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695888103;
	bh=RgbMXhJt+jpM82N9ALT3n0YLMpcBPl70XBVnWtnbADM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=arW7zbwF8/aciw9hq0n9/W+y4cjhpzbPqXDeHaOnR0j5OjOC7UUiPIuOd2MQmXUGj
	 IfTcm4gxDn7g7MMyFNY67EoUxSLNm/wdx47ce9+ULOJoRy54Ecr/uvUXTSw+r6WQmb
	 3Jr2QzbVn8Hm0+jS7SwWQoMSx/NI7gcPDkDZD+UQTC0aJUetarxtDfLv9IYTdsT/1C
	 vPYIR5mOV8I3vMYBszBavMjhXKMWDJFGFoKJb2ktUZEactQtsD4CMvUxQCFc5x4K1O
	 zf6x5omaV4TidTfLdydkMimgZzV6n31xQntAqBApQPjJDOICg81a5n8jDcl8Jdd2d2
	 JSVzJhtGQARnQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5F330C395E0;
	Thu, 28 Sep 2023 08:01:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 0/1] ARM: defconfig: cleanup orphaned CONFIGs
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169588810338.3136.7239660668863867475.git-patchwork-notify@kernel.org>
Date: Thu, 28 Sep 2023 08:01:43 +0000
References: <20230919125112.15515-1-twoerner@gmail.com>
In-Reply-To: <20230919125112.15515-1-twoerner@gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 19 Sep 2023 08:51:10 -0400 you wrote:
> Drop CONFIG_ options from defconfigs whose code has been removed.
> 
> v4:
> Re-submit the ARM patch (alone) with a better subject line and CC'ing the
> correct people to help ensure it gets picked up. v4 drops the patches for
> mips, powerpc, and loongarch which have already been applied.
> 
> [...]

Here is the summary with links:
  - [v4,1/1] ARM: defconfig: cleanup orphaned CONFIGs
    https://git.kernel.org/soc/soc/c/8d21670105fe

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


