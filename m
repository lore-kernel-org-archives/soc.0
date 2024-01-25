Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82979C48286
	for <soc@archiver.kernel.org>; Thu, 25 Jan 2024 17:51:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 616CCC43330; Thu, 25 Jan 2024 17:51:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 45825C433F1;
	Thu, 25 Jan 2024 17:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706205098;
	bh=1cWlk96UVdjaM3Wi8OGMizJwt2Mytny41iMAO6ZhaVk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=P8fgyUhUl7ZOx2t/VGHvujE8g+kBOjE0DsFNGIdpx7pHnLB8NFVAdpqZcUpqzbfcA
	 LlCj3rGboOf902Px3jvCZyl/AKC9Xu/YAgGFRe+QamsGGEUsYOnr4Rc8stwd6zNuez
	 0IvyIwMjTHOegURyiRoEIDlbF/LsaDaYqsxFDpBzeqUcvNzb22XfAGuKllBiWtc3zU
	 bYWHI7tL5qc1hWNEUZYUFpr2g2u2OLpxfHuEDk+u0PHgMJ1+OouwsGZzfyuYtJ10zF
	 JPyjHWs1XBp5wQA1J55k/DEWFj2/eIX3vxmQFpMyhmDrOA5+2N9ibeqakDAoFPIW0v
	 Q0uMT3HO782OA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2B8CED8C966;
	Thu, 25 Jan 2024 17:51:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_ffa: Fixes for v6.8
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170620509817.10279.15676035755722670183.git-patchwork-notify@kernel.org>
Date: Thu, 25 Jan 2024 17:51:38 +0000
References: <20240122161652.3551159-1-sudeep.holla@arm.com>
In-Reply-To: <20240122161652.3551159-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 22 Jan 2024 16:16:50 +0000 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_ffa: Fixes for v6.8
    https://git.kernel.org/soc/soc/c/8ad2c84e2ecb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


