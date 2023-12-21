Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD39C47422
	for <soc@archiver.kernel.org>; Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8B2F8C116B7; Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 755CAC4936D;
	Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703180466;
	bh=fN/57N4rAup4jxlCwGpL+Xda+TDbFpaJgkRxYzZxFoU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=AxP3r+6pwLFhai1pwVHOwggT8BNYUX9KIZMuH2eJz3WwSMh7zhpeFZsBk8pweaYoZ
	 5kcriseX0ujhdsuGCoKd9wDgeCv8NfzP7UViZ8Af9CGStZb0/MgejT2FOcMMartL8p
	 tUYRo1HAy2qk8PBeN467opKF77r5ZZdni+MVQ1gtyRMSAQP/DZfQ94h9FCIyiwq1SK
	 RYCGtxQ9zuR4fey0aquQUfNES3VnQVSB1c7GsfbUmIBN0CPhgLP81bGiPnOliSe7Od
	 6uaR+sLQ8V2taamw7T1LDJbfl+RWd4JVTOMdD/Q8ne9vZLSLHqSy92u8FTTicq/NNl
	 8NhZZgOf3k5yA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 63776DD4EF2;
	Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: mvebu: dt for v6.8 (#1)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170318046640.3302.1509580129580874718.git-patchwork-notify@kernel.org>
Date: Thu, 21 Dec 2023 17:41:06 +0000
References: <87o7ekbyv2.fsf@BL-laptop>
In-Reply-To: <87o7ekbyv2.fsf@BL-laptop>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 20 Dec 2023 17:52:17 +0100 you wrote:
> Hi,
> 
> Here is the first pull request for dt for mvebu for v6.8.
> 
> Gregory
> 
> The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: mvebu: dt for v6.8 (#1)
    https://git.kernel.org/soc/soc/c/37782cc1c6b0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


