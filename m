Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89839CCA47B
	for <soc@archiver.kernel.org>; Tue, 14 Jun 2022 20:33:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 49951C341C7; Tue, 14 Jun 2022 20:33:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 26CA3C3411F;
	Tue, 14 Jun 2022 20:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655238815;
	bh=D2C+Ad2yqHc3jGr47vjebe5dk3gbT6Su6j7YXHQnLU8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=V4qlWXVHlcZH5ySziayDUkFsZx8fSbFqj5i+I+AfTeVHpSf5nMWYrZnxA6tucGZjO
	 SGTjwImgqreOa3tdibUXA18KlJ2B2+hpLp9l4gXxwdC2YRq2wz4DeX7IBWZsTS4irl
	 iImxgteg5qUY/Qq0MFsyDE0WXSz7nq4KKuHfEIiQ2b0JNjeOEZLEYz40Dok1HKP+3a
	 aV8KZHnlz1KaTStqZkJrB9hUfnUDusAyim1AO6kUvfCtkwORdEVq5wk2SpfV+uaJZA
	 F2yTbiUyS4bBdEqvPn2NSfoYa0QMkDiovbt17QAtaqA6DKHaAJ7bWcI/e9qBkUCFtK
	 NPyXOGgv5K1ew==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0712DFD99FF;
	Tue, 14 Jun 2022 20:33:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] Broadcom drivers fixes for 5.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165523881502.29335.17929193985880295553.git-patchwork-notify@kernel.org>
Date: Tue, 14 Jun 2022 20:33:35 +0000
References: <20220608093132.1465703-1-f.fainelli@gmail.com>
In-Reply-To: <20220608093132.1465703-1-f.fainelli@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed,  8 Jun 2022 02:31:31 -0700 you wrote:
> The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:
> 
>   Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.19/drivers-fixes
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] Broadcom drivers fixes for 5.19
    https://git.kernel.org/soc/soc/c/dbdaca130007
  - [GIT,PULL,2/2] Broadcom maintainers fixes for 5.19
    https://git.kernel.org/soc/soc/c/965890425271

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


