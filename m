Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B7ECCA479
	for <soc@archiver.kernel.org>; Wed, 13 Jul 2022 21:00:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6E0C6C385A2; Wed, 13 Jul 2022 21:00:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 509A0C34114;
	Wed, 13 Jul 2022 21:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657746019;
	bh=rHSXCWljdTcJjLxHTuu2IakEfCO8uFACsMBYxdyePbk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Vmd8xh1uHLR9AG3vMmhLrj5QC4Z82W48S4qa26uZ2JqPtfRP9QbBRkFKd3dVhOPoe
	 3+ujaCj2crvDQmTDKII17AcJ4OZtX5imIteAzsw9DWul6E5AN+mwD0fEw/Xwe6CDax
	 TdgaBeTEg+ro77EJMLDSM7GaFQz9VnXQ9uwVqksvw+SrcJLwzQlI66NehNGrWAPrlr
	 e18lU0hE+z/NW127vzFKRmMJsh6E8uzdbyRX94D4DQ1skoluiT+bf9G0itucUHwEQR
	 wvRkPLrh63stk5kt22NAJcoYfi9aEwC3Ak3yKUJ7RQq8MfMhMA/22glqvz2Hhot0gc
	 STHLPhPdDWJBQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 33105E4522E;
	Wed, 13 Jul 2022 21:00:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/1] Broadcom devicetree-arm64 fixes for 5.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165774601920.1051.9381381443645152040.git-patchwork-notify@kernel.org>
Date: Wed, 13 Jul 2022 21:00:19 +0000
References: <20220712231222.97850-1-f.fainelli@gmail.com>
In-Reply-To: <20220712231222.97850-1-f.fainelli@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 12 Jul 2022 16:12:22 -0700 you wrote:
> The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:
> 
>   Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.19/devicetree-arm64-fixes
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/1] Broadcom devicetree-arm64 fixes for 5.19
    https://git.kernel.org/soc/soc/c/52905140c3ed

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


