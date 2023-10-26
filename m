Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37464C25B6E
	for <soc@archiver.kernel.org>; Thu, 26 Oct 2023 16:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 08E62C433CD; Thu, 26 Oct 2023 16:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E63AFC433CA;
	Thu, 26 Oct 2023 16:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698339030;
	bh=iVSBTw3yhH7a4Vbop3cRahwsQWYe8G5aq7pl406/7A0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=l0B1akPqcYmwhho1QwQ/nAg/NBpE9kjshFCYMwlvkgjkRWx3H7p8Ic0lZU5LVqaC3
	 0oMhw9t29Hq23ikO+uuCR/qEcl+d4UAK8ycrHwhYNJ99TjvKJ7YVFmjqGo0giu0h8i
	 Rnuxrz9KIXXclm+lFeUNIJwxbKI0xep0e3fhWC/Y4Yiluvhjh50SqIP1826015z6co
	 I8+AfFc2C3Q+qlVEBoO6uFpOrt6gYUsS8/dZudYRukhn9hNCvlY6nNQROL9SLZLDw0
	 9L4nkjQhExH+5uNL/r0Cem5WGYVvDfW+lg2F3joQwmlgaHl3e9k+1th+NtjLSeUF2+
	 KM7nxgBsg0OCQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C4CCEC691EF;
	Thu, 26 Oct 2023 16:50:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Few more ARM64 defconfig updates for v6.7
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169833903080.20019.9921192035499456061.git-patchwork-notify@kernel.org>
Date: Thu, 26 Oct 2023 16:50:30 +0000
References: <20231025191841.1015192-1-andersson@kernel.org>
In-Reply-To: <20231025191841.1015192-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 25 Oct 2023 12:18:40 -0700 you wrote:
> The following changes since commit b46d856cb9b3bd2fef54cc8caec8595a232a23b6:
> 
>   arm64: defconfig: Enable M31 USB phy driver (2023-09-19 20:01:52 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-6.7-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Few more ARM64 defconfig updates for v6.7
    https://git.kernel.org/soc/soc/c/56185e024952

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


