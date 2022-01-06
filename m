Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF7EC433FE
	for <soc@archiver.kernel.org>; Thu,  6 Jan 2022 19:40:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 99385C36AEF; Thu,  6 Jan 2022 19:40:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8380EC36AED;
	Thu,  6 Jan 2022 19:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641498038;
	bh=2aDk9uqMWa4xg01U9Mxf6C8v3wLC4ELza965pO5NTyU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=nRVy8gdb03EUTBD+DYNWSXbyx1iVxq1LSYkZsFKRSu12cLkJBsXTTBajH0LCjq1UG
	 k7kN0D0dLEondX4c+zzPrJdgzDxB1/F8+iUFYRQ8BaMaSFG8oYxPqtc99Y97CQGu/2
	 6tfOe81xX9TlYERE6JGiABYHWxZ3gB06KaC2IWtG23gJJx5Z7RbsgSLVFxY7UMtIeg
	 g2U7lJue3MNS7ho8RfXd8zN1AKUDaLE42E3QzUwHv0VooNPnT3lXyp4lvQyarMW/ky
	 07Mu0FIy+QzbIKDmG7jOFgPMOwJ1TDP6NoimaDEZmvT6u9OWsitdBCNDyY14ArNSKb
	 XwVZ+fDrYQlIg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 725EAF79405;
	Thu,  6 Jan 2022 19:40:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: socfpga: fix for v5.16, part 3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164149803845.26637.9494755273032321058.git-patchwork-notify@kernel.org>
Date: Thu, 06 Jan 2022 19:40:38 +0000
References: <20211227103644.566694-1-dinguyen@kernel.org>
In-Reply-To: <20211227103644.566694-1-dinguyen@kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Olof Johansson <olof@lixom.net>:

On Mon, 27 Dec 2021 04:36:44 -0600 you wrote:
> Hi Arnd/Olof,
> 
> Please pull in these 2 patches for v5.16. The reason for this dts compatible
> change is that the commit 98d948eb833 ("spi: cadence-quadspi: fix write
> completion support") is already part of v5.16, thus we need these 2 patches to
> be in v5.16.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: socfpga: fix for v5.16, part 3
    https://git.kernel.org/soc/soc/c/8922bb6526ac

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


