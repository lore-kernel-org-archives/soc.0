Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABAF4CCA486
	for <soc@archiver.kernel.org>; Tue, 14 Jun 2022 20:33:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 74401C341D5; Tue, 14 Jun 2022 20:33:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 58730C341C4;
	Tue, 14 Jun 2022 20:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655238815;
	bh=SOB5pycPqdr4gyJXBRg2V5/KIgLHkJ6sqrGVbTKVomI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=rMnTftKo2icnPyz45duurxKNIJJ/j1LTtJI+rWNyiw4MOA4cSo97dGfIrKGPxpnMV
	 L8r9A2M5xxi4unJbZuGcHvVh5PsBetRIGYS61YSbacHo14lNhuoYWtnd856pKM9epR
	 7ltzaZcw9RcjO9aYJWVEGWJzaNy62JgVSr3aYNOQfqGk0ZzvLVeHmjQpH206fJHLr+
	 441vnCG6dplIOw9cCjpun9PUwWshPIFZfxtaN25hrbui78v/iH14tAKjJNXxhXzJ1w
	 TdbiKeq5+cBzcoLXmGx4CBfkMWxVpT4SZmOCQ6BlPNrJ1Dh9RGII08L6oxT6N4PP00
	 daBqzNcLqdjXQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 39564E73872;
	Tue, 14 Jun 2022 20:33:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 1/2] bus: bt1-apb: Don't print error on -EPROBE_DEFER
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165523881523.29335.4042993461878607356.git-patchwork-notify@kernel.org>
Date: Tue, 14 Jun 2022 20:33:35 +0000
References: <20220610104030.28399-1-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20220610104030.28399-1-Sergey.Semin@baikalelectronics.ru>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 10 Jun 2022 13:40:29 +0300 you wrote:
> The Baikal-T1 APB bus driver correctly handles the deferred probe
> situation, but still pollutes the system log with a misleading error
> message. Let's fix that by using the dev_err_probe() method to print the
> log message in case of the clocks/resets request errors.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> [...]

Here is the summary with links:
  - [v2,1/2] bus: bt1-apb: Don't print error on -EPROBE_DEFER
    https://git.kernel.org/soc/soc/c/be5cddef05f5
  - [v2,2/2] bus: bt1-axi: Don't print error on -EPROBE_DEFER
    https://git.kernel.org/soc/soc/c/5e93207e962a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


