Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D0CE7F132
	for <soc@archiver.kernel.org>; Tue, 26 Sep 2023 21:03:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6A015C116CB; Tue, 26 Sep 2023 21:03:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 54505C43140;
	Tue, 26 Sep 2023 21:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695762233;
	bh=GB0pLSXgJ7eCCTQuj4akVkLblmpNBdAX/Jj3s5xOjgc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ttFCwhnfKAl1Kk/iX+lTWJsHrvYxUZaHo9SxXGOE5O9uCpy2xtb4T0PWO47UYS19Y
	 kw1MLuXiDn+dzIocIX/Er4eJlDF80eYjZAg+tb4zSO1ByEmJnPDcFnQJCK41q8NXyJ
	 Pe/H9itXomSxGW/kdslvPmLoQHkk2jKQQHBjxxCoY/P6T2kjLv0/da2WnjnWjvlcQU
	 wrdaXQ2T3Lb0bQpZblbMQRbjE7SuNnZ/NG/R0QNNNJr3eOKGVMPorKKj5wM+JsOp6H
	 SGYO6sv/6rhTKv4KRUBIKb9LhEhpV/8EOElYqLs11McPtHKz5s85KcorqRj/uLh6xJ
	 Lq+xUyfF1ChKA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 40539E29AFF;
	Tue, 26 Sep 2023 21:03:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH RESEND] MAINTAINERS: aspeed: Update git tree URL
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169576223325.24546.9071411759240019798.git-patchwork-notify@kernel.org>
Date: Tue, 26 Sep 2023 21:03:53 +0000
References: <20230922223405.24717-2-zev@bewilderbeest.net>
In-Reply-To: <20230922223405.24717-2-zev@bewilderbeest.net>
To: Zev Weiss <zev@bewilderbeest.net>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Joel Stanley <joel@jms.id.au>:

On Fri, 22 Sep 2023 15:34:06 -0700 you wrote:
> The description for joel/aspeed.git on git.kernel.org currently says:
> 
>     Old Aspeed tree. Please see joel/bmc.git
> 
> Let's update MAINTAINERS accordingly.
> 
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> Acked-by: Joel Stanley <joel@jms.id.au>
> 
> [...]

Here is the summary with links:
  - [RESEND] MAINTAINERS: aspeed: Update git tree URL
    https://git.kernel.org/soc/soc/c/534c673b4e02

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


