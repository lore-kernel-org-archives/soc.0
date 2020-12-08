Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6CDDC19437
	for <soc@archiver.kernel.org>; Tue,  8 Dec 2020 23:50:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7015623B1A; Tue,  8 Dec 2020 23:50:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607471429;
	bh=LvETwcTaKhwZopMJVxbbX3b/+kPplLoA/hP/IvHa3BA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=tEQGq1byqtBOdTDKJyYJJCkPLLqzGt9+z01CdsNFpHiOg+nYjwCq/tQRb2gkR4jbD
	 LknFuOm2HjblVjULaYuHqqR94o6dLk6pfMHzKOsqXnxBuwz582wqXmv233IRxneQdE
	 9hHWf9EbexYjlPMmfabVaIWhDtSScjx5Z6Sjr/JLrHAm6pYLM6bPcr/hOwYFaMMN+L
	 y/Hts8FzI90aPSh3w8BoFRLBoHBhaCnrcTH0RVcjLtnkfuf+HFhOGkvUZ448PoP5W1
	 Tp3C3uIRRdGvZRmAUTJ5vfD8kpSO6JqykEKvCnKgMPimJd9wdYTA0Il5Uaf7aacB0R
	 TVtFvH0nuBUbw==
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Reset controller changes for v5.11
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <160747142928.19687.2343010081366934570.git-patchwork-notify@kernel.org>
Date: Tue, 08 Dec 2020 23:50:29 +0000
References: <d586ada0073f2ac50a02274f42bf07bfb0603835.camel@pengutronix.de>
In-Reply-To: <d586ada0073f2ac50a02274f42bf07bfb0603835.camel@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Fri, 04 Dec 2020 15:25:02 +0100 you wrote:
> Dear SoC maintainers,
> 
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Reset controller changes for v5.11
    https://git.kernel.org/soc/soc/c/03c48a830e9d

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


