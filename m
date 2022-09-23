Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6150C6FA93
	for <soc@archiver.kernel.org>; Fri, 23 Sep 2022 14:51:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8730CC433C1; Fri, 23 Sep 2022 14:51:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 719ADC433D6;
	Fri, 23 Sep 2022 14:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663944667;
	bh=9vgyNnVGV6TqJAWj5LQkmvD3lsbAZlVbg8jACDJKI7w=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=QHRaTPpUHe15Z4viR7iLkOvEcLNnsjzN4WhfrUynuqGNVXPcemOUR90llxXJD8mX5
	 kKaEIfBr27SsjVY8m+5ljiNmEe2De5mSvng7EkFKnCxsdKfBkQAjOmdEIIroh/Es6H
	 7I/eocTXNkr4pOrzDqHmRVqU2miNeZvzlZMcvHJMdyTwR8VgX78K9OsTD4KeL0lKcf
	 RbyfonvoyF3AhR8YpqOnPozsW1rPzSgMBofVoWpeFOqq7m7oUEASQ33V1cE6YVTB02
	 4jEW/Q6QsV7rUmHJm8hoL9UnDQrnHOj/+diqLFCRDsqgGnVus2/yH9J+e6yipE9PbO
	 uSRuj4Gmu/NEg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 56C6AE50D70;
	Fri, 23 Sep 2022 14:51:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: dts: integrator: Tag PCI host with device_type
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166394466735.12526.10276193243752527496.git-patchwork-notify@kernel.org>
Date: Fri, 23 Sep 2022 14:51:07 +0000
References: <20220919092608.813511-1-linus.walleij@linaro.org>
In-Reply-To: <20220919092608.813511-1-linus.walleij@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 19 Sep 2022 11:26:08 +0200 you wrote:
> The DT parser is dependent on the PCI device being tagged as
> device_type = "pci" in order to parse memory ranges properly.
> Fix this up.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> 
> [...]

Here is the summary with links:
  - ARM: dts: integrator: Tag PCI host with device_type
    https://git.kernel.org/soc/soc/c/4952aa696a9f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


