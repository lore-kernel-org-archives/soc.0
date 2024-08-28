Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D39C7113D
	for <soc@archiver.kernel.org>; Wed, 28 Aug 2024 20:43:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 570E0C4CEC3; Wed, 28 Aug 2024 20:43:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C9BDC4CEC1;
	Wed, 28 Aug 2024 20:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724877795;
	bh=UQBNVCNvNBuxXc4RpnxStwzhIStibcAe88eQSvgwTM4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=GHLV1lIdVo+ovrumD0YaYtEzTm2G9sqrgMJj76jPJA2/BbsIDH/8T4EozBDhvM0CJ
	 2WieVsjyLpaRx/j5+8Z24aH1tXEzeHYucggAQScPKAc8gKawxkC3RWyM6vUZMCkOWv
	 1i7++7pNBV8VIJv57PaUW2X6E2MxThkwKywqpqQKQ5wervmocd69N8fpAkpC1MCErr
	 qUhRFEegsNfQKc1E+ZPBp1yLbaYXEJsTxez3XyGtE3otlkQEF57tsg4hevKhZZ/k64
	 4hQNhu8pML6j2IFpl7Vp9TxRBKNQm5cYSbrW7/Gf5JpjivEx8mGmRbuf7qszTOme1P
	 58uspooCmtqmg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B014F3809A80;
	Wed, 28 Aug 2024 20:43:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] OMAP fixes for v6.11-rc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172487779548.1420116.12854515868937089853.git-patchwork-notify@kernel.org>
Date: Wed, 28 Aug 2024 20:43:15 +0000
References: <7h4j7eyhyh.fsf@baylibre.com>
In-Reply-To: <7h4j7eyhyh.fsf@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 20 Aug 2024 14:58:46 -0700 you wrote:
> As discussed here[1], I'll be stepping in to help support on the legacy
> OMAP devices, so here's a first pull from me with a fix for the v6.11-rc
> cycle.
> 
> Please pull,
> 
> Kevin
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] OMAP fixes for v6.11-rc
    https://git.kernel.org/soc/soc/c/0351a9841ba1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


