Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACF98C43219
	for <soc@archiver.kernel.org>; Wed, 13 Oct 2021 19:40:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 97790611CE; Wed, 13 Oct 2021 19:40:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 79CF3611CC;
	Wed, 13 Oct 2021 19:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634154007;
	bh=4GZFg3RFihSBoK3+ogh4rgVNK0iUpH5ElY2JquISVsc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=I70ArvV7tEDWlIrHBmCYHAotHIUkGOf44aTK9OSy9+rH6K6v0vHxZMyLitJJ1nfz4
	 M0r7vyY0h9Kq6/mIWeQnur9eFjNNMIxpLJ7srzJnhQkrEGX+d8yGZ0t/rDqWfmY5Ig
	 a6yLCA9Qld1h1CkeID/uM3daYtduvvnS0pebXG5YcHNOP9OuyzOe4yeCXkYsHgVci5
	 7eSVIapxz1tE+GjTUZxHQso2Uu4CoHgeMo/QQXYgPsVBfJud3YDOc9IB23QGCz3+kB
	 PpD41I1UMf6/cwoYG1TnqDqvP55PLUQ52RLYGYdbExqJ620uFdMeM+5Iev8YgOLn5w
	 RhF3p7vp/m0OQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 6D82060966;
	Wed, 13 Oct 2021 19:40:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] another OP-TEE fix for v5.15
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163415400744.8098.10510293442412935922.git-patchwork-notify@kernel.org>
Date: Wed, 13 Oct 2021 19:40:07 +0000
References: <20211013122854.GA1542549@jade>
In-Reply-To: <20211013122854.GA1542549@jade>
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 13 Oct 2021 14:28:54 +0200 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull this OP-TEE driver fix to unregister OP-TEE client devices
> from the TEE bus when the OP-TEE driver is unloaded.
> 
> Note that this is based on the previous already merged OP-TEE driver
> fix.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] another OP-TEE fix for v5.15
    https://git.kernel.org/soc/soc/c/3536ac5d771b

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


