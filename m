Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E6AC3DA42
	for <soc@archiver.kernel.org>; Mon,  8 Jul 2024 19:50:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 90291C4AF0C; Mon,  8 Jul 2024 19:50:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7A6E7C3277B;
	Mon,  8 Jul 2024 19:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720468245;
	bh=8QPxMjl+yKVK8fxQSIjeRdphp9m0/kKcv8kgLEiIEcs=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=quhRIHQLH/guWDgTV0Nqkv8uhgML9fQjG0RwxTl4hyy1D/ii2uk/vhR5ABGH4Afo0
	 BS4j5QZe267SoJVAz8mxHtR3EAOIAlFV9smfzvqx6qKCxmYW4HbylB5xzg7t/SDceN
	 GF45aoQtqYMlcx4MFw6AlUja4/rv8foP2hUS8UZGmc9lsG1/F3XEitOz39cgE4HvuN
	 79TAbyfgJoSjjUOuea9du1d549Y9qlDC7+BXJ9W4uBQjSy5/ECi+aCTmrLrgAbt+S6
	 F3Ki6k0OaZo6vnVPtAtfURMq3Y+zv2wurIf3Ud0p2rlxedoEUdK/JXzIV744sfvvn9
	 KpCq1eTafB3HA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6EC01DF3713;
	Mon,  8 Jul 2024 19:50:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: multi_v7_defconfig: Add MCP23S08 pinctrl support
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172046824544.24660.14780334102558290840.git-patchwork-notify@kernel.org>
Date: Mon, 08 Jul 2024 19:50:45 +0000
References: <20240705134407.2833659-1-alexandre.torgue@foss.st.com>
In-Reply-To: <20240705134407.2833659-1-alexandre.torgue@foss.st.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 5 Jul 2024 15:44:07 +0200 you wrote:
> From: Christophe Roullier <christophe.roullier@foss.st.com>
> 
> Enable MCP23S08 I/O expanders to manage Ethernet PHY
> reset in STM32MP135F-DK board.
> 
> Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> 
> [...]

Here is the summary with links:
  - ARM: multi_v7_defconfig: Add MCP23S08 pinctrl support
    https://git.kernel.org/soc/soc/c/d7d906675de2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


