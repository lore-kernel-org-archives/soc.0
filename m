Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF5F4C00140
	for <soc@archiver.kernel.org>; Wed, 10 Aug 2022 20:20:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 91EB3C43470; Wed, 10 Aug 2022 20:20:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 75EABC433D6
	for <soc@kernel.org>; Wed, 10 Aug 2022 20:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660162814;
	bh=eUBscyEncYBHz+eCgtpM/y5fs7Uoa05nS+bQp8TkPEM=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=AzL/nhi0W2Oan0LijjuO9B01l2nML3Xm2HXjUyyjFrleXiFdNS6AouNyzLtxcNxUP
	 y1U1WJFAndoyzjJeYUEe/pT76TA11P3IYiufszEZT3O5a0KGddSro69E1kKTA/SDzs
	 asdzr6Y0zO+8uyeShjJPWPnviP8jzobCV8Zfgu82dF1/baKHCYTlaiwN/jmsZnNMAU
	 ZLBUCsISrPI+mYuwTOq+m2gg5mbsVGSaZy7zt5uKzxRw9n17JR67vzihG5fpq4u6iS
	 h7jELRfYmcSeiO1P9WjOOVm29TpkRBzmkH4LIVj7KIE5qYERH9Lt+baNEfwFr6Sze+
	 gWPhYzG7RjZcw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4CC32C43142;
	Wed, 10 Aug 2022 20:20:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166016281425.21460.3666639877105582011.git-patchwork-summary@kernel.org>
Date: Wed, 10 Aug 2022 20:20:14 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Series: MAINTAINERS updates for PolarFire SoC
  Submitter: Conor Dooley <conor.dooley@microchip.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=666611
  Lore link: https://lore.kernel.org/r/20220810140243.2685416-1-conor.dooley@microchip.com
    Patches: [RESEND,1/2] MAINTAINERS: add PolarFire SoC dt bindings
             [RESEND,2/2] MAINTAINERS: add the Polarfire SoC's i2c driver


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


