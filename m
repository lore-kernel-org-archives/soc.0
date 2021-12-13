Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A4B5C433EF
	for <soc@archiver.kernel.org>; Mon, 13 Dec 2021 14:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 45713C34603; Mon, 13 Dec 2021 14:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 302FFC3460C;
	Mon, 13 Dec 2021 14:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639405229;
	bh=bRC+j2pA0gsOFhCv7YFltqYvbWY8xOTEonTonVjKCAI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=kcDYkL1RP8rbMNpIIHVp50w1zOwrB2fDEbv5qjj2GMoJpOvIaYtZMBka7mcjUnNAp
	 5j8OFMPzP3SRBNeuqpgJEgL/w8YTpvLQwjZ7Nekz+UgowOOTYKbJNcFTzUcnxgBfps
	 wCJADglx7y/9rDR0acQq+9Qx0XQseSCIzBxQX+H3gfJ6TGaOlnR2BY5xQ1mT/Nq8L7
	 TwvOjIRxjxp97GjwK9t62TAX/qG6yhjH7KUJ0DLb3cKKiz6BRfqFZ3pB1wvbOU0HB2
	 /lNi9BuRVYWvq8ziJcEgupxtvPDEbVhdSFnjI1BnNrn2+ynnTq5jmu4O5pYL/HCWi5
	 rVbw0hjWHN2/g==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 1FBE3609F5;
	Mon, 13 Dec 2021 14:20:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Apple SoC fixes for 5.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163940522912.6863.6964086053125565190.git-patchwork-notify@kernel.org>
Date: Mon, 13 Dec 2021 14:20:29 +0000
References: <cc9a1a67-3b2d-ae9f-5733-859111eb78c1@marcan.st>
In-Reply-To: <cc9a1a67-3b2d-ae9f-5733-859111eb78c1@marcan.st>
To: Hector Martin <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 7 Dec 2021 14:52:22 +0900 you wrote:
> Hi SoC folks,
> 
> Please merge these Apple SoC fixes for 5.16.
> 
> These fix some minor post-merge DT issues we found.
> 
> -Hector
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Apple SoC fixes for 5.16
    https://git.kernel.org/soc/soc/c/f6bdc6106727

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


