Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5865C43334
	for <soc@archiver.kernel.org>; Fri,  8 Jul 2022 07:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9018DC341CE; Fri,  8 Jul 2022 07:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7392CC341C0;
	Fri,  8 Jul 2022 07:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657266613;
	bh=UFN92HzOt0WDsN4i5I134W+xMfXFHnxhyIljSS1G2Bg=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=luCTEeXyes7AlNtmG4Nnj0IgzXDChlBh0KoaqEnBW4NGBwSUaSg24nGRb7OX28tQt
	 Ui/NdYL6wFr3i5DLZ6wBIvk/Iu6H/Y1Cmks8svODdJplW9Lf0ifQDLRcK7xQn9Gm9L
	 91ONQ43Sf8iZbnqLfvy7DPL4IqtK6f7+JfKxZvZzUJ4ElixzBUB3FhBAIh7U4WVf4H
	 1Ol5ZNYde1vWUS6ziHs0pFXfT2sVK8ONPIbfOQQzLJT00MlI17sfthpfIW9/C8ounz
	 co1FTeba+gHaqxgRAGe4FclJVbJBwGT0pQuYEy2ysqK/x/GqtzIJgra0o/qrWweDwq
	 MK7z7VBQ3ByJg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 53DF2E45BDE;
	Fri,  8 Jul 2022 07:50:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [RESEND#2 PATCH v4] MAINTAINERS: add polarfire rng,
 pci and clock drivers
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165726661333.10888.15359815728601780243.git-patchwork-notify@kernel.org>
Date: Fri, 08 Jul 2022 07:50:13 +0000
References: <20220707142041.4096246-1-conor.dooley@microchip.com>
In-Reply-To: <20220707142041.4096246-1-conor.dooley@microchip.com>
To: Conor Dooley <conor.dooley@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 7 Jul 2022 15:20:42 +0100 you wrote:
> Hardware random, PCI and clock drivers for the PolarFire SoC have been
> upstreamed but are not covered by the MAINTAINERS entry, so add them.
> Daire is the author of the clock & PCI drivers, so add him as a
> maintainer in place of Lewis.
> 
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> 
> [...]

Here is the summary with links:
  - [RESEND#2,v4] MAINTAINERS: add polarfire rng, pci and clock drivers
    https://git.kernel.org/soc/soc/c/2058dc831ff8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


