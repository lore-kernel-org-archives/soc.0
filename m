Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0434CC54E41
	for <soc@archiver.kernel.org>; Fri, 23 Feb 2024 13:10:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C34CCC433C7; Fri, 23 Feb 2024 13:10:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A475FC43399;
	Fri, 23 Feb 2024 13:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708693828;
	bh=0P/nY/CNCraS6lR0yBtnHtUyt5TxKKq3a7nNaB3jdo8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=kfKtQ7R3G/Qh5zta+Ujeq8UdsZSE7BFvKiEriWoAuxGX0Fmt237c+XHxcbHTa0FF/
	 /XnpFqXsS+kZPzNxhMbtNiIEQR2OHPSLGeVlIhLlMh+kx8CRwvVnPk1GQeHgLvE1yS
	 aAmNVjmY83woW6YeBjVKhv5/B2H0EEwTtEZdYdysk0COPYXxN2lw/BWNwVo830ztZx
	 LdcGK5zc9st6v+QxFc5+kYtxhU+hIs70HyhH09f81jvq+pwwkcIehH9E9zKvh0hAgR
	 id3VOnCHsdoTLRmiuu8UcLka5C6P9o5PdoiB4CRSn0YuLVwiWXfzAmwGiQPq2nGTXn
	 fQi20atDrj0IQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 84DDAC39563;
	Fri, 23 Feb 2024 13:10:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Renesas fixes for v6.8
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170869382854.28623.5516231928976682736.git-patchwork-notify@kernel.org>
Date: Fri, 23 Feb 2024 13:10:28 +0000
References: <cover.1708597150.git.geert+renesas@glider.be>
In-Reply-To: <cover.1708597150.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 22 Feb 2024 11:42:51 +0100 you wrote:
> Hi SoC folks,
> 
> The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:
> 
>   Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Renesas fixes for v6.8
    https://git.kernel.org/soc/soc/c/dcb8e53e339e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


