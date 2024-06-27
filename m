Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4857DC3DA41
	for <soc@archiver.kernel.org>; Thu, 27 Jun 2024 15:01:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 34381C4AF17; Thu, 27 Jun 2024 15:01:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1EB2EC4AF0E;
	Thu, 27 Jun 2024 15:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719500464;
	bh=H+9x5evNGbjx83HxzPSgjQnAX6WaH5DHzkJb5CoU7aY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=bBmnENxRMPzzNyUtTySFyMEuhdIHjqMCuEmGPfo3WJaOup+qB0pmktL4RlW4KwVb9
	 gPijWqKrFgErcYYkwr7z2wn832R+M2YUdNy/GDD52A+Mz93tmL8T3UShItlvMoIAFj
	 vkJl91ljmoDnljr+FeyuW+Pevo8Eva77vlEobYZRSKCW0g5wv7LubKyt8GMGv3H3A7
	 69h/LAk1Q2jtc8vyByoK0MJQpsIonXJyLzlWlgoClydKlCXa8b1pfBozZWSFIvvKxn
	 czdjmLFBMz3Vj85BVRSdEHjoIBTIcDHCA7XpYhKbhyhhGOvVPN6V/8828nlUASJLhB
	 7wR939TftyQZw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 115A6C32765;
	Thu, 27 Jun 2024 15:01:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL][UPDATED] firmware: arm_ffa: Updates for v6.11
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171950046406.29698.10353835462144718666.git-patchwork-notify@kernel.org>
Date: Thu, 27 Jun 2024 15:01:04 +0000
References: <20240624103451.2870146-1-sudeep.holla@arm.com>
In-Reply-To: <20240624103451.2870146-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 24 Jun 2024 11:34:49 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> This version is updated to drop the PSCI fix that was merged separately.
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,UPDATED] firmware: arm_ffa: Updates for v6.11
    https://git.kernel.org/soc/soc/c/87dcb2f0791b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


