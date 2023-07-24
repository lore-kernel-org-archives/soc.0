Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F19C00528
	for <soc@archiver.kernel.org>; Mon, 24 Jul 2023 14:05:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 79023C433D9; Mon, 24 Jul 2023 14:05:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 635DFC433CB;
	Mon, 24 Jul 2023 14:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690207549;
	bh=LXUXaC90wAzZtDNGOJLjmOXc1nGWsMDI35VLhonoq90=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Pau+gkAkWeaMP7dIfdzFzX0IHpJzplGh06XOZQo9vg2VtWO5outXUl1ZgBf6aY/xl
	 egqq8DPvh1zICJLEFCWAbzVF0oekO8aZEye/Z3vFCrBGDL/SjF7vorsaABzFHPbaJi
	 LYvp6iGtBRZATzEnjr3E/J5beDP/hBJAQb4TEcLzuk27Qj/Qq1SQVca+X9Ko+m5uhk
	 5dQkLZhkaWFr6NOGM3YX401B+b2lieSSrvWuBO+mHR+lu2AkKO2YNwFjOOOjfaj9ZM
	 gYxFJDzttdF2tLUQWC2OD5t9RsFG0y67aF2mm/5nv0WEXnNgVfZH2JeD8GlYQTx+JI
	 cZWrsCAmpmD5Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 36795E1F658;
	Mon, 24 Jul 2023 14:05:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCHv3 0/2] update at91 usart compatible for sam9x60
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169020754922.21041.4056845278265067382.git-patchwork-notify@kernel.org>
Date: Mon, 24 Jul 2023 14:05:49 +0000
References: <20230718065735.10187-1-durai.manickamkr@microchip.com>
In-Reply-To: <20230718065735.10187-1-durai.manickamkr@microchip.com>
To: Durai Manickam KR <durai.manickamkr@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 18 Jul 2023 12:27:33 +0530 you wrote:
> There is only one debug unit in the sam9x60 SOC and it has the chipid
> register. So defining these dbgu compatible strings to the flexcom usart
> is not correct and causes the SOC detection failure. So removing these
> dbgu compatible strings defined under the flexcom usart and updating
> the yaml file accordingly.
> ---
> v2 changes:
> 1. Updating the dt-bindings documentation and send one more patch for
> the yaml file.
> 
> [...]

Here is the summary with links:
  - [PATCHv3,1/2] dt-bindings: serial: atmel,at91-usart: update compatible for sam9x60
    https://git.kernel.org/soc/soc/c/92d39d018347
  - [PATCHv3,2/2] ARM: dts: at91: sam9x60: fix the SOC detection
    https://git.kernel.org/soc/soc/c/f6ad3c13f1b8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


