Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DBE9C43217
	for <soc@archiver.kernel.org>; Sat,  8 Jan 2022 22:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 83362C36AFD; Sat,  8 Jan 2022 22:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6C4F6C36AF7;
	Sat,  8 Jan 2022 22:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641679214;
	bh=nmRPnGix9vNT8w8JVAn0g28YOQjayiLMKaGR4/9TH1E=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=PFHvgO9nDsG0VowtQSLSYOPcTFMcnb6xTaUSzH5Db8PvkpFjGDe7MZflSJdyuRpxm
	 RA1VCyDu8nM6wJcyGkWCJRpZWsDoMSRqtceKsovhkJhhFOcnOmL2Go4evtHx1gW7CH
	 Aah3aDi26oLhiBfgJjWWG6858J8XMH8WDVcKWrp/n9SAe5JAl/gkkgMSm/Yx0i+wrL
	 4aLkX2xvulMHx9VZXwt9BMufVo40W3h/P96WylpMS1/nxCaHon8q26hVMWFuISZ9BX
	 BPE0w3qlsUqi66lXQLsZuotnoODlsaulsX4uKhmpB9Lt+ATyQASVoYcgcZv9eMM7ey
	 2ilo7kaMwa0rA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 549AFF7940F;
	Sat,  8 Jan 2022 22:00:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] ARM: configs: aspeed: Add support for USB flash drives
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164167921434.24856.3951996326109167746.git-patchwork-notify@kernel.org>
Date: Sat, 08 Jan 2022 22:00:14 +0000
References: <20211222004123.128157-1-joel@jms.id.au>
In-Reply-To: <20211222004123.128157-1-joel@jms.id.au>
To: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Olof Johansson <olof@lixom.net>:

On Wed, 22 Dec 2021 11:11:23 +1030 you wrote:
> From: Adriana Kobylak <anoo@us.ibm.com>
> 
> Add support to detect USB flash drives and create the /dev/sd* devices.
> Also add support for vfat to support USB drives formatted as FAT32.
> This support will be used to enable firmware updates via USB flash
> drives where the firmware image is stored in the USB drive and it's
> plugged into the BMC USB port.
> 
> [...]

Here is the summary with links:
  - [v2] ARM: configs: aspeed: Add support for USB flash drives
    https://git.kernel.org/soc/soc/c/bda9b8122e53

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


