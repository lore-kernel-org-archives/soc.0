Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D21F5C61DA0
	for <soc@archiver.kernel.org>; Thu, 26 Jan 2023 10:00:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9DEA8C4339B; Thu, 26 Jan 2023 10:00:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 88E4BC433A0;
	Thu, 26 Jan 2023 10:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674727217;
	bh=e9TtCXyZy77FBKIMIEyFuig0/TbS/i6LIg3jTko/+SQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=R2Ga58PNf3ZMI8XxgA6b4OiPtdxn/NISae0tt3VO8NE5l9HwPASi64qAXJ3WwERQ7
	 dDK5vI7nsmLHIwlh5XXqCwcu+oxCYivwNZBCvSmZn8eCjY0RgSlXgTzRlHIlJLdSzs
	 0sT2KEZ7giyn7k2224BnxqBlQ8YXluR0ffKFKphk9LNg23auOQKqJLOI1SjZjyReGp
	 lek75/hOw/dS5ln2WgI+MbmHhw9zBIsjSJgQgPjk1YKfkPXgKvig+0LVSN3vGqc7Wc
	 X/oJj9YAHbMeu1f2bq2aywMCso2Xj4SbmX90crh8DH7RMZn62nxq/gLqC5HQ1Fxjwm
	 PFZChKw342iag==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 68933F83ED4;
	Thu, 26 Jan 2023 10:00:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Ux500 DTS updates
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167472721742.24700.7098372257408492466.git-patchwork-notify@kernel.org>
Date: Thu, 26 Jan 2023 10:00:17 +0000
References: <CACRpkdY24Lv0F3ct2R6ALPpAdxWz_vEjrPAGNSF3pcoOj-Xqcg@mail.gmail.com>
In-Reply-To: <CACRpkdY24Lv0F3ct2R6ALPpAdxWz_vEjrPAGNSF3pcoOj-Xqcg@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 25 Jan 2023 22:43:07 +0100 you wrote:
> Hi SoC folks,
> 
> here are some minor Ux500 DTS updates for the v6.3 kernel,
> details in the signed tag.
> 
> Please pull it in!
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Ux500 DTS updates
    https://git.kernel.org/soc/soc/c/42bea43c1f91

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


