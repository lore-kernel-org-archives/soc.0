Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4051BC04FE0
	for <soc@archiver.kernel.org>; Mon, 14 Aug 2023 17:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 200CFC433AD; Mon, 14 Aug 2023 17:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0A966C43397;
	Mon, 14 Aug 2023 17:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692033027;
	bh=DYoXWqqdLGTaNhjIY9L7Wi9Gk4Rw8Q5xLQl5+NVDwxU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=dj8/AE1XZcNK3VM8XCoeMCaqUggzHwZ67pVLIFpl9UUQzeiyxsdKASwGB604DrAfX
	 gic03CL2p6FnP3UixiIMsDQyH2Nc/5+GqS5MNoDpXhW2KGi5HNWNwvUy6VHp57YC8B
	 4G7QVAoT18tZjRkdFsgShqPYdUCN+hfBWS6nS3luPJ64ZHwGf22kLvmhEq/dcVgnQF
	 qewZY9mnWBJhu5WiERkynOdj/qwHjjJ/SscXenrqAKGaplS0f5wQ9tXZX4AHvnOW4j
	 a6LHtmPCqKk+KzG/aiUzaqfSrr8BT/TleUZUAaca1XFG6Xg+WOgE+rrhP210u7/g7I
	 hp7cNHiVmmjPA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DF131E93B38;
	Mon, 14 Aug 2023 17:10:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH PULL] ARM: s5pv210: Explicitly include correct DT includes
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169203302690.15030.17834825068754621772.git-patchwork-notify@kernel.org>
Date: Mon, 14 Aug 2023 17:10:26 +0000
References: <20230814114051.25840-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230814114051.25840-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 14 Aug 2023 13:40:51 +0200 you wrote:
> From: Rob Herring <robh@kernel.org>
> 
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it was merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> [...]

Here is the summary with links:
  - [PULL] ARM: s5pv210: Explicitly include correct DT includes
    https://git.kernel.org/soc/soc/c/8787bc51a7e2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


