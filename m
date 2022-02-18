Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87886C4167D
	for <soc@archiver.kernel.org>; Fri, 18 Feb 2022 20:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5E57AC340F6; Fri, 18 Feb 2022 20:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 47E02C340F8;
	Fri, 18 Feb 2022 20:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645216811;
	bh=eNIlkpxCj4xrWFnESKpnusJ2v+Sfhxw+Kc/5ncwMdf8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=LRrAj402oEIaKctXU4rnF3gj3cwHy61oVtH8DQp38TPbtBOlqCfdyDEb07a35/C3n
	 duefhvCbKiZTgDgv6Hiw6+ixsoAsxxreVu0SpZYkZR19WuSLUAhaPvwJRZT06roMUE
	 0RcGTyFTKF1tEGS3QRr3yJa85FsQFa9m5nG+b1jOFP5IDBfMCvpJDM9Dc8C+C0aAVP
	 vg49tnG2dTzEb7MziuuKdXI6Bex0z7jnA6YZLR6n5YgcHW7iO3g5rFOqXK+IvcST0F
	 tDPbrSanqGWaYbw0bYTQrXXwRjK8Aof2nDTJZpuktqvtHCdc+Tyn4X/rADEOtc3PtT
	 5Xr8AipwVf+yw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2A389E7BB1A;
	Fri, 18 Feb 2022 20:40:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_scmi: Fix for v5.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164521681116.10306.5641369399458544305.git-patchwork-notify@kernel.org>
Date: Fri, 18 Feb 2022 20:40:11 +0000
References: <20220214144245.2376150-1-sudeep.holla@arm.com>
In-Reply-To: <20220214144245.2376150-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 14 Feb 2022 14:42:45 +0000 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_scmi: Fix for v5.17
    https://git.kernel.org/soc/soc/c/98e437f134b3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


