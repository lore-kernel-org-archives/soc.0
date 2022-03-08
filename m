Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6063DC4167B
	for <soc@archiver.kernel.org>; Tue,  8 Mar 2022 16:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 21239C34101; Tue,  8 Mar 2022 16:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0BEA8C340FE;
	Tue,  8 Mar 2022 16:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646757015;
	bh=VYhaVnJImWVFprQsEWgV0natZS5XU0sz9oDUDHkCY8E=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=GgZoFiEaw+83hVmAxWHHA37HIS0XplDoG/QmN5RgUU0y9r3NwGMfUq0l/+lvooKLK
	 3gfl4DNb7TzY99lZm22hNn7p72ZGnA/fM+XqtQCjb5uozXuiVy+HEVlMd3ol+12usH
	 sQFVqZJHSIr0wwDQW+c22PnICE05dagnxw5ZHQwcREtgmtpmXg8mBEWVyrNi2Bo93t
	 RVtwQkozMpc77ZGYfFuqJhkGeXqpXODbkVrUER1UspBW6TaQ7UEXDRXR3E+GJ1A8gg
	 zVLZm4cHoZDANR9dvxq6YYQ1PYfrSNFyLX0pZnfA3Gx9ibmsuaB8ahiJQoowvY8brE
	 rOSUTTHnUtLHA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E981CF0383D;
	Tue,  8 Mar 2022 16:30:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: at91: soc for 5.18 #2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164675701495.9628.11444603041312968179.git-patchwork-notify@kernel.org>
Date: Tue, 08 Mar 2022 16:30:14 +0000
References: <20220304144216.23340-1-nicolas.ferre@microchip.com>
In-Reply-To: <20220304144216.23340-1-nicolas.ferre@microchip.com>
To: Nicolas Ferre <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 4 Mar 2022 15:42:17 +0100 you wrote:
> From: Nicolas Ferre <nicolas.ferre@microchip.com>
> 
> Arnd, Olof,
> 
> One more patch for 5.18 on the SoC branch.
> You already have the patch made by Conor "soc: microchip: make
> mpfs_sys_controller_put static" in your tree, so I didn't add it here.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: at91: soc for 5.18 #2
    https://git.kernel.org/soc/soc/c/d3d009847a11

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


