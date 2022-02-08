Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC42DC433F5
	for <soc@archiver.kernel.org>; Tue,  8 Feb 2022 09:21:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B884FC340EF; Tue,  8 Feb 2022 09:21:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9F873C340EE;
	Tue,  8 Feb 2022 09:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644312109;
	bh=T2JF78W3hzozsNSrS8W9jDLSzpJ3JF7SW8Ttv9CbHII=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=h0bGchfiGK6JW6sLVXEFiiA5/Ijg1VaDVmu9Qj+AHJk7dEfV1G0Wu7qbbFEqmdKOo
	 VNIKIfPs5cKjZrAGjW3ZnLm65qOFq8KaiFdZH6YM07sMOv/dbFgMddNDpQqCNakn1u
	 xprCMTkF/iB8L2EokJtC9NnZX2fmGf6ShryI5oQOoqd8OGCXgCjOiXYqSxvbC/3D/A
	 skDrI5pRQjbepcWkK22JFi7wfIOJkKch/7ISpQuFjIIg+c4gMjQXDobLHHHOxHZc8e
	 QLriVM2G9FZhnLkpOorVNXgT8jrfpCdlX9INU0baspfrNwSmZN4xrAFuVsl4IQ/WLL
	 hlWWoFjnQml+g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 88F7FE6D45A;
	Tue,  8 Feb 2022 09:21:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] OP-TEE fix for v5.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164431210955.18327.6453909388729460721.git-patchwork-notify@kernel.org>
Date: Tue, 08 Feb 2022 09:21:49 +0000
References: <20220203132323.GA4132001@jade>
In-Reply-To: <20220203132323.GA4132001@jade>
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 3 Feb 2022 14:23:23 +0100 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull this OP-TEE driver fix which decouples driver private shared
> memory objects from the original tee_context. This fixes the root cause of
> a shutdown problem where the driver would dead-lock waiting for tee-supplicant.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] OP-TEE fix for v5.17
    https://git.kernel.org/soc/soc/c/63a8728579a8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


