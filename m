Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CBD2C4332F
	for <soc@archiver.kernel.org>; Thu, 25 Nov 2021 15:30:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 516DD60C49; Thu, 25 Nov 2021 15:30:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 3AC0A610CA;
	Thu, 25 Nov 2021 15:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637854209;
	bh=0Ukw56FOLeiY1/1XfMAOVifhPRy9DQ/cgSCHtE6+k5Y=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=DhY5Dgvf9e2uxLuhHk5NXgKwu/gFMlj5iFetb419JABthptnj5Fc5QSXUO6rT/CI2
	 UFCHEliC43pjV7/2iSTK+34csx9ACGKa9i2+b609DAuSyd4d5SIM3qOfhxQL8yxlwt
	 CZ1G1582vLTFCylzb/1Dgtikh8vyDQN/Af84UoUqMqj+rUFKnV6ZHq1ipHivn5rhHh
	 8CPtIyv/2+hGFxUB2zWpNENqDD2IBQFIQzhHSyB4Nk7d3QOJyOvlRZQvdZXkNUe790
	 GdWTn0RDFuLN7r3D+Wj3oAqVz3vh1Xz6I0zwnMXolnFkjbrB3lGN0iTsCv+1ck02iF
	 hy6LBMBJ5AJlw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 2831C60A21;
	Thu, 25 Nov 2021 15:30:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] MAINTAINERS: Update maintainer entry for keystone platforms
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163785420916.25928.15701338833563791957.git-patchwork-notify@kernel.org>
Date: Thu, 25 Nov 2021 15:30:09 +0000
References: <20211123001725.21422-1-nm@ti.com>
In-Reply-To: <20211123001725.21422-1-nm@ti.com>
To: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 22 Nov 2021 18:17:25 -0600 you wrote:
> Switch the kernel tree for keystone to the consolidated ti tree and add
> myself as primary maintainer for keystone platforms to offset Santosh's
> workload.
> 
> Signed-off-by: Nishanth Menon <nm@ti.com>
> ---
>  MAINTAINERS | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Here is the summary with links:
  - MAINTAINERS: Update maintainer entry for keystone platforms
    https://git.kernel.org/soc/soc/c/82be5f5bd390

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


