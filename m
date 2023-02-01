Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81367C05027
	for <soc@archiver.kernel.org>; Wed,  1 Feb 2023 16:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3CEB5C4339C; Wed,  1 Feb 2023 16:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 20CA9C433D2;
	Wed,  1 Feb 2023 16:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675269020;
	bh=zWfkc10yu+7RdGc4BLfI9lBNxadHvEnB1UUeSsJ4aYA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=GnM5a7Mj5Ce74c8nauaVcM6K3QYHKPJ/ePlsrUOreLx+dn5/tLVRUN1fXS4wI3LQo
	 cRNBRqVNsxWl4/J3seiHdzaWAp+JoC2ZXPkqDZKGSG3rGv5DMjHGkxXPe56AMbPfXv
	 Cj+I6z5t/gAFHagvljC+kkXiO+RyvY6nRs4dqroJ67WmogrcG1WR7pwM8mxYFnnkUC
	 BqTZdXwCOnMBSefhLtBJuK2EJx172OjQmU2DDVB5eG89aRcSp/4ED1dD6F6Gm6Pxun
	 O/SJLgVlwIYipNhFk/nyUvnN+osWurxOUgCBFDz/JwcRfUU6UmmXJB9HXb99Eb/mA2
	 b+MhxlYOu3h5Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id F0FFFE270CD;
	Wed,  1 Feb 2023 16:30:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: dts: wpcm450: Add nuvoton,shm = <&shm> to FIU node
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167526901998.23236.5766254889039510642.git-patchwork-notify@kernel.org>
Date: Wed, 01 Feb 2023 16:30:19 +0000
References: <20230201044158.962417-1-joel@jms.id.au>
In-Reply-To: <20230201044158.962417-1-joel@jms.id.au>
To: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed,  1 Feb 2023 15:11:58 +1030 you wrote:
> From: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> 
> The Flash Interface Unit (FIU) should have a reference to the Shared
> Memory controller (SHM) so that flash access from the host (x86 computer
> managed by the WPCM450 BMC) can be blocked during flash access by the
> FIU driver.
> 
> [...]

Here is the summary with links:
  - ARM: dts: wpcm450: Add nuvoton,shm = <&shm> to FIU node
    https://git.kernel.org/soc/soc/c/5efb648042a1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


