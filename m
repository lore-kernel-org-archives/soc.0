Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D6AC52D70
	for <soc@archiver.kernel.org>; Tue,  6 Aug 2024 20:08:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 93DCBC4AF0E; Tue,  6 Aug 2024 20:08:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E1CAC32786;
	Tue,  6 Aug 2024 20:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722974900;
	bh=enShANiSP4s8VAdO3jvdjfv3FmZUzMYRte5gn3N/Q64=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=NCH+GOGXlCHk5kGrVwpFt6dWsChB2nQ2RktBXdH5XLvHYzUSwfZ5IDuR65ysBbRdl
	 IuXoNddFeS6VE6iOmoyYclaNbNL/abkQidrTgwXQ5wDvu3m9yBWI+bzNXIZZWjzwRo
	 ntyFehsfx6LonRMXYs6zISJJQRbbSefdFcsoNh+XWXkBYUGEAcWWM0eTfuj58PAqK0
	 xSEFhQk4LDyP1VUDF9UVVF/6m0KhoOBGAW8iQCU2oVWUMyPYzxozw1c5kBbxSclEym
	 oIOLdwnqWxn7IQFCH1XCyiuZVCOWWe9LG7FLzC1ezZ3vaJ4PfvNXNzYiUzUHLN888j
	 2NdQ4HXu2L3IA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 712C13824F34;
	Tue,  6 Aug 2024 20:08:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/4] Make turris-omnia-mcu driver parts optional
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172297489900.1692635.11704760683506921347.git-patchwork-notify@kernel.org>
Date: Tue, 06 Aug 2024 20:08:19 +0000
References: <20240719085756.30598-1-kabel@kernel.org>
In-Reply-To: <20240719085756.30598-1-kabel@kernel.org>
To: =?utf-8?q?Marek_Beh=C3=BAn_=3Ckabel=40kernel=2Eorg=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 19 Jul 2024 10:57:52 +0200 you wrote:
> Hi Arnd,
> 
> this series solves the Kconfig dependency issues of the turris-omnia-mcu
> driver by making the GPIO, poweroff & wakeup, watchdog and TRNG parts of
> the driver optional, under new Kconfig options. The dependencies to
> subsystems are moved under these new options.
> 
> [...]

Here is the summary with links:
  - [1/4] platform: cznic: turris-omnia-mcu: Make watchdog code optional
    https://git.kernel.org/soc/soc/c/eedc64f9100c
  - [2/4] platform: cznic: turris-omnia-mcu: Make TRNG code optional
    https://git.kernel.org/soc/soc/c/adc8f76f772b
  - [3/4] platform: cznic: turris-omnia-mcu: Make poweroff and wakeup code optional
    https://git.kernel.org/soc/soc/c/7a44f54b40c7
  - [4/4] platform: cznic: turris-omnia-mcu: Make GPIO code optional
    https://git.kernel.org/soc/soc/c/e1e95875512a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


