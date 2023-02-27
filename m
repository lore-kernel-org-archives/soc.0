Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 521ADC7EE23
	for <soc@archiver.kernel.org>; Mon, 27 Feb 2023 13:50:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2B502C433A1; Mon, 27 Feb 2023 13:50:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 09E54C433EF;
	Mon, 27 Feb 2023 13:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677505818;
	bh=9lKXkXqjYirF/KN5hcaU8eJhH1JPkObfkNSweUUwiGM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=vE99F0xFHSu+0xYPotXgzj5niZIFgF53asj0dH8YzFhfonzusV9rlYSnX6xuanLEB
	 xk0f3xUVEO7j4JbSiN5eNUweot40OejZjEXuGI32d7Sxmaso0cq6J9RTIfvJq9b0IJ
	 38hbxy+hkbWfs0/bONGO33L5yWCkm5n9SsqYPtMuOZLsKJsdRzZ9hmnkFFDHuBwyY3
	 lx0taZ7VaOot7Nj4ud3rPl1XhlGaBv1rhfiy/v/nREaUE6o/Ue/VpziKF8MGxhnnuy
	 8it1xI9miQfIjpSXQoGYUayjb758JzElJ2o1v4UWi/oqX/lPhauNgcke9/poeit3MA
	 iW/MHeqcIroeg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E1FF7E50D60;
	Mon, 27 Feb 2023 13:50:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: dts: aspeed: p10bmc: Update battery node name
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167750581792.1456.3684139701686785319.git-patchwork-notify@kernel.org>
Date: Mon, 27 Feb 2023 13:50:17 +0000
References: <20230221003352.1218797-1-joel@jms.id.au>
In-Reply-To: <20230221003352.1218797-1-joel@jms.id.au>
To: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 21 Feb 2023 11:03:52 +1030 you wrote:
> From: Eddie James <eajames@linux.ibm.com>
> 
> The ADC sensor for the battery needs to be named "iio-hwmon" for
> compatibility with user space applications.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> Link: https://lore.kernel.org/r/20230202152759.67069-1-eajames@linux.ibm.com
> Fixes: bf1914e2cfed ("ARM: dts: aspeed: p10bmc: Fix ADC iio-hwmon battery node name")
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> 
> [...]

Here is the summary with links:
  - ARM: dts: aspeed: p10bmc: Update battery node name
    https://git.kernel.org/soc/soc/c/a8cef541dd5e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


