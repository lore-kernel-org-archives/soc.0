Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E57C4321E
	for <soc@archiver.kernel.org>; Thu,  7 Apr 2022 12:24:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B6303C385A4; Thu,  7 Apr 2022 12:24:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 99175C385A8;
	Thu,  7 Apr 2022 12:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649334247;
	bh=//YvO8WGxVkN5BpvWl9xi2/UbRFcDN+VPIsHZms2aF8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=HmMnbxcu0gHWj9Rmz3FRVDORYQ7B5sKZcksm9rjM2FAExN7j4604VZ0kd8ry9XFvw
	 bQsTeWCogoL51A/O/SmLLh1S/KtkgnKtHZHYOLbeAaF7DZgImaJCx6okwwD1S3EvgA
	 mI9TbV2YKhLGW1VHX2KDVY/EPFmGUuz5etIYbaFDT7X4Ue54CLfOsz5NzUCgFzPg20
	 P0iH38PnO5RSllS8hbbOhxz3IQP043S6Ke1ULFKUIG26/S7aXU2k1bXI4DSu2xcNZk
	 X179TQDgpdbVuB8J16ovMHeKp7M7KRLnyZeqZQtH/xX9aAebqZlIoFxVt+ymgrg4iv
	 ASp+r8BSPisKQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 802C1E85B8C;
	Thu,  7 Apr 2022 12:24:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm: configs: imote2: Drop defconfig as board support
 dropped.
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164933424752.10369.17302918056186741399.git-patchwork-notify@kernel.org>
Date: Thu, 07 Apr 2022 12:24:07 +0000
References: <20220405135252.10283-1-Jonathan.Cameron@huawei.com>
In-Reply-To: <20220405135252.10283-1-Jonathan.Cameron@huawei.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 5 Apr 2022 14:52:52 +0100 you wrote:
> Missed the defconfig when removing the board files causing
> failures in builds using this defconfig.
> 
> Fixes: 28f74201e37c ("ARM: pxa: remove Intel Imote2 and Stargate 2 boards")
> Reported-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> [...]

Here is the summary with links:
  - arm: configs: imote2: Drop defconfig as board support dropped.
    https://git.kernel.org/soc/soc/c/1f5fb1dc7497

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


