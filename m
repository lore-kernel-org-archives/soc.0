Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFCE0E94129
	for <soc@archiver.kernel.org>; Fri,  6 Oct 2023 21:11:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D0BFAC43397; Fri,  6 Oct 2023 21:11:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BB16AC43391;
	Fri,  6 Oct 2023 21:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696626685;
	bh=TgiuZ4sy04UBl5TuL555tpv7znD5Rca4R0RHo9taTL8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=bCR0P8oGrLKiKrNGD+jqgw17v3B5VO+ttSZ3Sw2cTl1wx4+VWM4lrhesNTEb2fJIV
	 rZfE9rpy6U3GJRDhmE22icA3oQcPiav6sNetpTW/+IOxOZenW4/7B3Q1zxaKPXuH12
	 3I1gVn3UR+PqbCJyhCT8noc7iQviLFaDsdK03wCFlMGRMWl6XXWbLnQ3uNuWEGypVr
	 lAlF35bmhFn/UNSD1h/TeBgf7ECNZlemD4UzWQKB9w35h941y93e6/h+CLVzbmMxb6
	 b5ny5AWy25j2t1vI1y9zzImzgBwsER+85DXwmX66HjhUXkp30A7XrAzV2nSHDqJBbp
	 hLc5IV8IJZggg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A8171E11F5C;
	Fri,  6 Oct 2023 21:11:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] AMDTEE fix for v6.6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169662668568.6539.6568940224144300851.git-patchwork-notify@kernel.org>
Date: Fri, 06 Oct 2023 21:11:25 +0000
References: <20231003171835.GA669924@rayden>
In-Reply-To: <20231003171835.GA669924@rayden>
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 3 Oct 2023 19:18:35 +0200 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull this small AMDTEE driver fix addressing a possible
> user-after-free vulnerability.
> 
> Note that this isn't a usual Arm driver update. This targets AMD instead,
> but is part of the TEE subsystem.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] AMDTEE fix for v6.6
    https://git.kernel.org/soc/soc/c/a41e95a7c19b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


