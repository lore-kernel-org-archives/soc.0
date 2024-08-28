Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73861C7112F
	for <soc@archiver.kernel.org>; Wed, 28 Aug 2024 20:42:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5AC2AC4CEC3; Wed, 28 Aug 2024 20:42:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45003C4CEC1;
	Wed, 28 Aug 2024 20:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724877722;
	bh=v3sJJVIzThR7KOqlw9x0OSnXV1kh6dgzU5ZtINw1kaQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=h776ZOJ7VRu0GtikEwBb6crJ1PMeMreWW/fbufAZKTyC94ewn18w836l1JziUr8Oy
	 5WmN4fV3+idOiKJCpp8RLSi5h0xYzi9K+7wHKvst9Z/r6V2EgvYW5fygkGcmBeX+1Y
	 wBUx+vYyEeGGga2Xu6/JK7H1Oi1AuThDj4vEr/Fmudy54GdHdw9qh4doFM0No1VELP
	 oF7vgdkcIJG7cshlUpLPkh+eiBK5oMX+4jw4AwDYjWNTyvkpwf4qnuCNdqVoGzAzPC
	 cDEnJKOdcIqWfIQXWt5uU0romWDL1WB4XPu5ni8nczwrX/VVrx9EEanWwprY0P4eep
	 jH34L0LSEB+Gg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADDF73809A80;
	Wed, 28 Aug 2024 20:42:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm Arm64 DeviceTree fixes for v6.11
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172487772248.1420116.8322766221810729384.git-patchwork-notify@kernel.org>
Date: Wed, 28 Aug 2024 20:42:02 +0000
References: <20240826152426.1648383-1-andersson@kernel.org>
In-Reply-To: <20240826152426.1648383-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 26 Aug 2024 10:24:25 -0500 you wrote:
> The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:
> 
>   Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git qcom-arm64-fixes-for-6.11
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm Arm64 DeviceTree fixes for v6.11
    https://git.kernel.org/soc/soc/c/ec57571b5dda

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


