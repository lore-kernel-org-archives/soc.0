Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC94C3065E
	for <soc@archiver.kernel.org>; Mon,  1 Jul 2024 21:00:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8B82FC4AF0F; Mon,  1 Jul 2024 21:00:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 70AA4C4AF0C;
	Mon,  1 Jul 2024 21:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719867637;
	bh=UuJ+S1gGx9bCin5QJiUGHXz/WwCtgKhdBreWTbYmRCQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=tWw+7TgWt9ZRcLBUwQU6toQDLRzQmQwtLqWzNLwS/zZTlCj2PiT7iIhcGx0Mkgyo7
	 YLptR7S5XQBCCybu/oUD/Y1CQZIMTZNIOkbX3c/PzOHl8DrluvlLv4wImV2+mumzIa
	 V5pOtY8zCFyKBLWLNU6Nqu7HlwQpxDuJ6R7qOw4pQa2w+wmfP9k5gjeXXnvoNlj5F/
	 V09k6ymuQSZXQAYD18tQHhtRFW1L38pDoNMgC6SLfAIItpemyyZkQT6kXodFpDVfKx
	 vn3UaaFRtf9zZUbyx15X3+P/vOs8VElvVf+r35xdUch6lg/Fj2jkh/kUoHJ4zFJ2xw
	 t2P8ua5EWJkfA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 575FCC4333A;
	Mon,  1 Jul 2024 21:00:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v13 0/8] Turris Omnia MCU driver
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171986763734.7657.5378232958439993899.git-patchwork-notify@kernel.org>
Date: Mon, 01 Jul 2024 21:00:37 +0000
References: <20240701113010.16447-1-kabel@kernel.org>
In-Reply-To: <20240701113010.16447-1-kabel@kernel.org>
To: =?utf-8?q?Marek_Beh=C3=BAn_=3Ckabel=40kernel=2Eorg=3E?=@ci.codeaurora.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon,  1 Jul 2024 13:30:02 +0200 you wrote:
> Hello Arnd et al.
> 
> this is v13 of the series adding Turris Omnia MCU driver.
> 
> Changes since v12:
> - added blank lines between _DEF_GPIO macro definitions in patch 3,
>   requested by Bart
> 
> [...]

Here is the summary with links:
  - [v13,1/8] dt-bindings: firmware: add cznic,turris-omnia-mcu binding
    https://git.kernel.org/soc/soc/c/f5e6f47f2af0
  - [v13,2/8] platform: cznic: Add preliminary support for Turris Omnia MCU
    https://git.kernel.org/soc/soc/c/992f1a3d4e88
  - [v13,3/8] platform: cznic: turris-omnia-mcu: Add support for MCU connected GPIOs
    https://git.kernel.org/soc/soc/c/dfa556e45ae9
  - [v13,4/8] platform: cznic: turris-omnia-mcu: Add support for poweroff and wakeup
    https://git.kernel.org/soc/soc/c/90e700fd12b6
  - [v13,5/8] platform: cznic: turris-omnia-mcu: Add support for MCU watchdog
    https://git.kernel.org/soc/soc/c/ab89fb5fb92c
  - [v13,6/8] platform: cznic: turris-omnia-mcu: Add support for MCU provided TRNG
    https://git.kernel.org/soc/soc/c/41bb142a4028
  - [v13,7/8] ARM: dts: turris-omnia: Add MCU system-controller node
    https://git.kernel.org/soc/soc/c/04515932e52c
  - [v13,8/8] ARM: dts: turris-omnia: Add GPIO key node for front button
    https://git.kernel.org/soc/soc/c/ade990619444

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


