Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C8F6C433F5
	for <soc@archiver.kernel.org>; Mon,  9 May 2022 21:40:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 30ABCC385C5; Mon,  9 May 2022 21:40:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 14CB4C385C0;
	Mon,  9 May 2022 21:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652132437;
	bh=euTFHAt82rIphXC9Y8vuflk4nltffL2KYvh0AcNKg20=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=TwHemb2vWJmuJuOghVJNRza8KV6xyFUQNIAm3PpQa/S3UGaR/y8ehJJtpRoxCm0FG
	 dICgPg9SVIejXzixOkq7h+NlndTgUVzUvR5enPCq6/aro0wEtDlGQlAFBTv/PtuX49
	 wo0aJwhJtsFItI92GbhUNtJ8fsuGUoIFYCj4LVlhzQZG/RdJaFhhm04oHR9GcK2TwK
	 mPS5eE44xgKPj1A1qlNgkq1eEWdUhLbeo2jjm7bNAEgz48hUt9P+bxKlkYo07/IAxt
	 xQorSKaneUzWazliuVMNELOBfGzhA+kWyjuMbAppGGIie3E0eWDNGCEa9x3c2GFsui
	 SuXOEIQTVeV5Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E5772F03928;
	Mon,  9 May 2022 21:40:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] HiSilicon ARMv7 SoC updates for v5.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165213243693.32686.6442333821479240067.git-patchwork-notify@kernel.org>
Date: Mon, 09 May 2022 21:40:36 +0000
References: <62762DF0.30602@hisilicon.com>
In-Reply-To: <62762DF0.30602@hisilicon.com>
To: Wei Xu <xuwei5@hisilicon.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 7 May 2022 16:29:36 +0800 you wrote:
> Hi ARM-SoC team,
> 
> Please consider to pull the following changes.
> Thanks!
> 
> Best Regards,
> Wei
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] HiSilicon ARMv7 SoC updates for v5.19
    https://git.kernel.org/soc/soc/c/60166b3c6961

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


