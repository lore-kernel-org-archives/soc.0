Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A61C3DA41
	for <soc@archiver.kernel.org>; Mon, 29 Apr 2024 16:41:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1601FC4AF48; Mon, 29 Apr 2024 16:41:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0020BC4AF1D;
	Mon, 29 Apr 2024 16:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714408888;
	bh=qruFsCxn6uhfj6gzDjO2o6ZrVjQI6Dfq/nQu9TWjFys=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=vJjcB9ic3igfpEJEFktzUAFhsiG8EYfVPWqWfDpXv8rOMV+wCm/iukeMxgcJ6543p
	 UOX8jNwzzJ3+2GozVFrVKN3CWCLGewnfixnPZHyU/oLmZ1VySb78xkPdWjMLzqD4Ns
	 j0SZ6y8t8IDW7dfvGGSN3fnvnOJiWIPRFv2yz3FMfch/gSNFpdaG0Rzwf5aUN6eHA0
	 fOPuX1JYxvfAVVkdAYL9Upnmf5IBi3RO6UuWn2TiV/117qC2n35CKWl6UJUHd6SP0g
	 VEbz8o/xeuBTfcG9g4VXMkTfRGi75RqOo6ECCKs6SSDRtmAvLJc7qcp7gEA3ZaL/Dg
	 VvmpVGZf3OIHQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E04A5C54BAF;
	Mon, 29 Apr 2024 16:41:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Allwinner device tree changes for 6.10
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171440888791.20509.12508722920197990233.git-patchwork-notify@kernel.org>
Date: Mon, 29 Apr 2024 16:41:27 +0000
References: <20240426164510.GA101219@jernej-laptop>
In-Reply-To: <20240426164510.GA101219@jernej-laptop>
To: Jernej Skrabec <jernej@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 26 Apr 2024 18:45:10 +0200 you wrote:
> Hi!
> 
> Please pull following device tree changes for 6.10.
> 
> Best regards,
> Jernej
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Allwinner device tree changes for 6.10
    https://git.kernel.org/soc/soc/c/681d855f798b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


