Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 118B2C4345F
	for <soc@archiver.kernel.org>; Tue, 30 Apr 2024 13:40:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 02534C4AF1B; Tue, 30 Apr 2024 13:40:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DF70AC4AF19;
	Tue, 30 Apr 2024 13:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714484433;
	bh=hGRgvj+PqyqXzWOLLJcR0JY0j/FMfJmThIZ1EyEx624=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=kgbwTD7vYqyWBJbMFc1nX/87WMdHjzjBwtjADMENDlW4elEVkIIUWVF0cOlYSF955
	 Js4lyda44+sKp3RDjijUPPghHaWRXKsm7MjYMWntUcEDgALhJrlJIN/djHMWjNgE2+
	 9ItcNAdB8VVpUIdZFkb9aQAHe2CFtbdPyatPrxUfXhkOy2QeXTrNS4Uf5U9lVFq1J+
	 OTqpUkzHbR8payO1yWlNA2ZLPDbLfu4j7lk8gL7yt2AiWq/jHu9hF0EyhqDE4M/QCa
	 M3CBbmXQ7PZaq0U+Vczuotv8lH8vs5m5xab5WcdHJqBqmzSAa0y1JQJizUt0VFxe9Z
	 YJzqxPF79prwA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CF174C43619;
	Tue, 30 Apr 2024 13:40:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/4] Broadcom defconfig-arm64 changes for 6.10
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171448443384.21603.1419357006432696937.git-patchwork-notify@kernel.org>
Date: Tue, 30 Apr 2024 13:40:33 +0000
References: <20240429213703.2327834-1-florian.fainelli@broadcom.com>
In-Reply-To: <20240429213703.2327834-1-florian.fainelli@broadcom.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 29 Apr 2024 14:37:00 -0700 you wrote:
> The following changes since commit 4cece764965020c22cff7665b18a012006359095:
> 
>   Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.10/defconfig-arm64
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4] Broadcom defconfig-arm64 changes for 6.10
    https://git.kernel.org/soc/soc/c/470971427311
  - [GIT,PULL,2/4] Broadcom devicetree changes for 6.10
    (no matching commit)
  - [GIT,PULL,3/4] Broadcom devicetree-arm64 changes for 6.10
    https://git.kernel.org/soc/soc/c/7ecef37ec5ea
  - [GIT,PULL,4/4] Broadcom drivers changes for 6.10
    https://git.kernel.org/soc/soc/c/1c9fc3420da8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


