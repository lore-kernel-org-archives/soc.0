Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2BF5C47DA7
	for <soc@archiver.kernel.org>; Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B68C6C116CA; Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 99424C116B5;
	Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703246467;
	bh=eVlarMYXd0aRLLsYD2y0E+N9OsKtoM9IzKQOd6dE24o=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=rc034oPzli0oUhwZAYw3pE0B57ROTfcsmLfbvgPvNIpIEFpw23QLLHfQwknJjKDsj
	 C1z/G7OagaiaFiTvBkCAwCEtsXuXWTyVkbHb1g1x2RhvmpVXqqkdLtPeXVNb2Gk6jc
	 0hCurQF/wtJYOpH6tKRZDIJV0CFR9P5NLkzXJvmslUahpXysHTV/Am4gg2Kx+Fn3et
	 5sCOOpCBHpcSKsWchsnMxG4WiSSLem4vz1uEJwEVFM6g71ke8iCzgLUCdOoQnNR+NI
	 fJEWosHSA0pDKCFt/dQtvid3nUXU9VIZO71tq87foXzpQBtn2CNvLks1BQIJg8scWA
	 epk16xxMcXJPQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 74925DD4F0B;
	Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] OP-TEE cleanup for v6.8
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170324646747.10550.5417295504556416026.git-patchwork-notify@kernel.org>
Date: Fri, 22 Dec 2023 12:01:07 +0000
References: <20231214132237.GA3092763@rayden>
In-Reply-To: <20231214132237.GA3092763@rayden>
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 14 Dec 2023 14:22:37 +0100 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull these two small patches for the OP-TEE driver that remove a
> redundant custom workqueue and add a description of an argument of a
> optee_handle_rpc().
> 
> Note that this pull request is made on top of optee-supplicant-fix-for-v6.7
> 7269cba53d90 ("tee: optee: Fix supplicant based device enumeration")
> which was merged into v6.7-rc5, but in turn was based on top of v6.6. I
> did it like this because the Tested-bys where provided in this context.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] OP-TEE cleanup for v6.8
    https://git.kernel.org/soc/soc/c/3408005e304e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


