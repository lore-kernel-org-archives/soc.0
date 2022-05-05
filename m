Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10000C433FE
	for <soc@archiver.kernel.org>; Thu,  5 May 2022 11:10:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CB614C385A8; Thu,  5 May 2022 11:10:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B5539C385A4;
	Thu,  5 May 2022 11:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651749013;
	bh=69LfuDXSjd6gUWQPktC2bbwqtw6SYidoW26m4W38if0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=NWwkRFARJ+jENcnts2wrvPcQwJ+SlhAkqMlFoNWbBMD94KjMRAVuSgzoyD1rTg3wX
	 mDMuRsYgtbOw3EcmWZMGnxrJrPI7UmrOd5y0GEWwbpvVejT+TOWJX25QExGFeoLMIC
	 tGx+LceY7/NTj234xhsUqytfm4PbpcjlNt392+cPHdojmvxD9LiJPMOlFewSbkCTqZ
	 X9NfQfNMtdF1cx8laqKktMyU/yOWcVmtmA4k6jDhI0J4ksZFgFmd+VhD5hqVXlfDJE
	 x9lIAAJpGK7m9/i8PYWh9goGEAfTFBpirgcPQgg//UDGISO3c4Z4eLwkm0tLF0v9RP
	 1Uy6f4ikmhlrA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 93D04E8DBDA;
	Thu,  5 May 2022 11:10:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: versatile: Add missing of_node_put in dcscb_init
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165174901360.921.6282922765029607542.git-patchwork-notify@kernel.org>
Date: Thu, 05 May 2022 11:10:13 +0000
References: <20220428230356.69418-1-linus.walleij@linaro.org>
In-Reply-To: <20220428230356.69418-1-linus.walleij@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 29 Apr 2022 01:03:56 +0200 you wrote:
> From: Peng Wu <wupeng58@huawei.com>
> 
> The device_node pointer is returned by of_find_compatible_node
> with refcount incremented. We should use of_node_put() to avoid
> the refcount leak.
> 
> Signed-off-by: Peng Wu <wupeng58@huawei.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> 
> [...]

Here is the summary with links:
  - ARM: versatile: Add missing of_node_put in dcscb_init
    https://git.kernel.org/soc/soc/c/23b44f9c649b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


