Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B27C001E0
	for <soc@archiver.kernel.org>; Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5D104C433B8; Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4761EC43391;
	Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691831689;
	bh=omnwuAqK7fEOwyyjHFLaaTP0FDTXeHgsSTdfc7+YVZo=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=bCZgzVv5fanQfGgNE0PU+TgsMeMXBt/ibHDwcTzMee6maAmkh6Q9AfMahAG5VWnO9
	 TI0mr65WB0dRmAtiMI/ju2hGhJWjW+kcnks450O3fwS3+mTUusv+HIUr3gYr/QWHj9
	 vSMqKSSAKZaNiKO5kFIBQEKxkST7UE9UG/GF+5GvGS8vUP/xaLVNfgp8l6aedJJbUX
	 DRckHaDpl3PhGyrekZu2Xuq+flB63yx2aIxx/+4P+rTWvEaY9JqyBpoiPd33ZUCaVT
	 qbkyd/q9sZbK0OshIqJI8j9xG+miF0mKm3OoJDHwRTI2/xLX7rswo8F0C94iYObNvk
	 4td8ubvkBeiFA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2EF87E33090;
	Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 00/23] ARM: DT include cleanups
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169183168918.30475.17785365982363586858.git-patchwork-notify@kernel.org>
Date: Sat, 12 Aug 2023 09:14:49 +0000
References: <20230803-dt-header-cleanups-for-soc-v2-0-d8de2cc88bff@kernel.org>
In-Reply-To: <20230803-dt-header-cleanups-for-soc-v2-0-d8de2cc88bff@kernel.org>
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 03 Aug 2023 16:42:40 -0600 you wrote:
> Arnd, This is all the remaining ARM and SoC related patches of DT
> include cleanups which have not be applied by sub-arch maintainers.
> 
> A few of these are v2, but most are just resends of v1.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> 
> [...]

Here is the summary with links:
  - [v2,01/23] ARM: l2x0: Add explicit includes for init and types
    https://git.kernel.org/soc/soc/c/c0b736d3b578
  - [v2,02/23] ARM: sti: Drop unused includes
    https://git.kernel.org/soc/soc/c/b8678ca577e1
  - [v2,03/23] ARM: alpine: Drop unused includes
    https://git.kernel.org/soc/soc/c/17f269e70382
  - [v2,04/23] ARM: berlin: Drop unused includes
    https://git.kernel.org/soc/soc/c/fe260f5e65e1
  - [v2,05/23] ARM: dove: Drop unused includes
    https://git.kernel.org/soc/soc/c/9d2af67ba0c8
  - [v2,06/23] ARM: hpe: Drop unused includes
    https://git.kernel.org/soc/soc/c/fcd346e833e9
  - [v2,07/23] ARM: mmp: Drop unused includes
    https://git.kernel.org/soc/soc/c/89ce0a2fc143
  - [v2,08/23] ARM: nomadik: Drop unused includes
    https://git.kernel.org/soc/soc/c/23174ee58007
  - [v2,09/23] ARM: npcm: Drop unused includes
    https://git.kernel.org/soc/soc/c/152d11a0b509
  - [v2,10/23] ARM: nspire: Drop unused includes
    https://git.kernel.org/soc/soc/c/ce2ab51a1861
  - [v2,11/23] ARM: pxa: Drop unused includes
    https://git.kernel.org/soc/soc/c/48f1138f9c43
  - [v2,12/23] ARM: rockchip: Drop unused includes
    https://git.kernel.org/soc/soc/c/ab7c1ad11da4
  - [v2,13/23] ARM: versatile: Drop unused includes
    https://git.kernel.org/soc/soc/c/d6c97c96d2b4
  - [v2,14/23] ARM: mvebu: Explicitly include correct DT includes
    https://git.kernel.org/soc/soc/c/1402f75d9bdc
  - [v2,15/23] ARM: spear: Explicitly include correct DT includes
    https://git.kernel.org/soc/soc/c/544885aa0750
  - [v2,16/23] bus: Explicitly include correct DT includes
    https://git.kernel.org/soc/soc/c/53c5ae638da0
  - [v2,17/23] firmware: Explicitly include correct DT includes
    https://git.kernel.org/soc/soc/c/5b45759c0b58
  - [v2,18/23] soc: aspeed: Explicitly include correct DT includes
    https://git.kernel.org/soc/soc/c/96b75c9d4bf2
  - [v2,19/23] soc: mediatek: Explicitly include correct DT includes
    https://git.kernel.org/soc/soc/c/d01e0aec6d50
  - [v2,20/23] soc: rockchip: Explicitly include correct DT includes
    https://git.kernel.org/soc/soc/c/0e7ed4dda9ef
  - [v2,21/23] soc: sunxi: Explicitly include correct DT includes
    https://git.kernel.org/soc/soc/c/adedd5d129b1
  - [v2,22/23] soc: xilinx: Explicitly include correct DT includes
    https://git.kernel.org/soc/soc/c/1c37c34e2d1e
  - [v2,23/23] soc: fsl: Explicitly include correct DT includes
    https://git.kernel.org/soc/soc/c/5df5b2e04749

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


