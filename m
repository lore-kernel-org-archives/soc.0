Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4104C41513
	for <soc@archiver.kernel.org>; Mon, 24 Jul 2023 14:05:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 72605C433C7; Mon, 24 Jul 2023 14:05:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 58112C433C8;
	Mon, 24 Jul 2023 14:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690207549;
	bh=GA615cikx096lpqa8SgVA8LydMX1MHlL0g7hCuSR/2w=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=lJotEQVhG+iyVXt7zvkA4xZJpTlkkV1qE4s5S8qzVxgXD7JquXLhiFd3rkbnVxBWr
	 ENysFCUonRzmcI+IxTngYYBdhTmqHDy3wZiIRJ/TxL5s5R2YmE7ryPz4MPjemJ4rzr
	 BbCL3oC71ElCDZ3XBsR/ZGL+PfzCkTHN0u8p0FLYSjuIoL1amgpcDjelSympuc6QGD
	 +Swn/wwpiOzntBj0O4G+V/k9AY2uR7XDm9kItf+cRu1bTtupAmvGACXJBDJbbZTPLr
	 0pjPXq/XGwswpxW1MbAZ/eSMoQiQWr1WZWm3CCGFIXGGWGtiCHcmhGGS5V7Q41wTUs
	 WcmTIHtjec66g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 30727E21EDD;
	Mon, 24 Jul 2023 14:05:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: dts: at91: sam9x60: fix the SOC detection
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169020754919.21041.8506507719200449216.git-patchwork-notify@kernel.org>
Date: Mon, 24 Jul 2023 14:05:49 +0000
References: <20230712100042.317856-1-durai.manickamkr@microchip.com>
In-Reply-To: <20230712100042.317856-1-durai.manickamkr@microchip.com>
To: Durai Manickam KR <durai.manickamkr@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 12 Jul 2023 15:30:42 +0530 you wrote:
> Remove the dbgu compatible strings in the UART submodule of the
> flexcom for the proper SOC detection.
> 
> Fixes: 99c808335877 (ARM: dts: at91: sam9x60: Add missing flexcom definitions)
> Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
> ---
>  arch/arm/boot/dts/microchip/sam9x60.dtsi | 26 ++++++++++++------------
>  1 file changed, 13 insertions(+), 13 deletions(-)

Here is the summary with links:
  - ARM: dts: at91: sam9x60: fix the SOC detection
    https://git.kernel.org/soc/soc/c/f6ad3c13f1b8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


