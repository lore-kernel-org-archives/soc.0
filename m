Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A74EC52D6F
	for <soc@archiver.kernel.org>; Tue,  6 Aug 2024 20:27:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4ECABC4AF0C; Tue,  6 Aug 2024 20:27:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3931BC32786;
	Tue,  6 Aug 2024 20:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722976069;
	bh=FahPCKGVv21AqJFY1PrZJ1xvbRYs/YhlavGqVjQWHA8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=UNDImyJOki7fzf06PTUfrxzcr2mUEBsW1wXoMH/EqCrzTXyqN1FqxHyccwxHgYYRM
	 qyvTyWD50MRDi6hYA5jqw4UJXzTCT87qzOiGTMwnv/IQF7gCaBhcyfOConp1z8A/Xz
	 jeSteIfpez18uAbUUBZbpOvZ9og2KU8M1KSFklKhEqTV7H21n7TzkyD35Huhl51HdS
	 K8tigy4g10/21tEbk3BxZ6ZMZxUYcP8HdSnaT7w/t2QTHspqXjr344PHFFzvkOvIwQ
	 JMCc7z0LqjtGoAo6ZpuguwVkVmU/vdBAnum+pkiZiH9EDva9STNa++uTLNLFb6IUTL
	 jxsDZHUtnYHRA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3528439D6562;
	Tue,  6 Aug 2024 20:27:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: ti: K3 devicetree updates for v6.11 - part2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172297606803.1692635.11206407747437989455.git-patchwork-notify@kernel.org>
Date: Tue, 06 Aug 2024 20:27:48 +0000
References: <aacd1e96-9ff4-4222-9f4d-29e63041f7fb@ti.com>
In-Reply-To: <aacd1e96-9ff4-4222-9f4d-29e63041f7fb@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 15 Jul 2024 23:37:42 +0530 you wrote:
> Hi ARM SoC Maintainers,
> 
> Please pull below PR which consists of a late fix to my earlier pull request:
> https://lore.kernel.org/linux-arm-kernel/37f251a1-f3bd-402f-ab22-cf786c3871d7@ti.com/
> 
> The following changes since commit 6406c5d5512c0814b8c155df7f833a98d9069a72:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: ti: K3 devicetree updates for v6.11 - part2
    https://git.kernel.org/soc/soc/c/03186cc52719

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


