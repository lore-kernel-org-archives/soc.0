Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 686EDC43470
	for <soc@archiver.kernel.org>; Fri,  9 Apr 2021 07:50:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DB5D1611C1; Fri,  9 Apr 2021 07:50:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id C34FF611AE;
	Fri,  9 Apr 2021 07:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617954610;
	bh=aj6bl9SRcMnAikRat+8jvVGFdi1ZJVghEWDVg3fybEU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=nKxh4K2UZr0/udewqV42LSxJzBPLee26GRR9AylE9bJk/O1Z+bgOu7VesQNsuQbsa
	 SA/jPrOfTfqeqmWvtWzlS7OgCxS6y7em0uDDaQZ0zYAst7NdvXM62+it+LwFCk1iP5
	 LZEUMzWIRg98ks3bjEz2jJxAw3VgeY4kQ0/i7lwjBDNKt39X26a9QbuKdIDI2VnR7I
	 e71sLGbSUbrzZ7fes+M3LTDLLmSv3MuuQLZJQ60rTLrPrSXI/ll5c5WBYPF5xx1Kp2
	 8pY0s+TOo1CbxFXRqSVHgnV9n4idlw8Hq4yCOjipZVmWJb/HD38q7eAS/HtrCUwTKM
	 VL3JsvEkIPnyg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id B970360C09;
	Fri,  9 Apr 2021 07:50:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: nuvoton: Add WPCM450 support
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161795461075.18683.853781825206266465.git-patchwork-notify@kernel.org>
Date: Fri, 09 Apr 2021 07:50:10 +0000
References: <CACPK8Xdj20TcJckH8fx757ACa4hT4j3bZEctT0Przjv8XJd7KA@mail.gmail.com>
In-Reply-To: <CACPK8Xdj20TcJckH8fx757ACa4hT4j3bZEctT0Przjv8XJd7KA@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Fri, 9 Apr 2021 06:46:27 +0000 you wrote:
> Hello Soc maintainers,
> 
> Here's a support for a Nuvoton soc contributed by Jonathan. There are
> changes for the irq controller, timer and serial port that have been
> merged by other maintainers. I've picked up the arch and device tree
> changes on his behalf to go through the soc tree.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: nuvoton: Add WPCM450 support
    https://git.kernel.org/soc/soc/c/39b95079f68c

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


