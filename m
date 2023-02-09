Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D36C64EC5
	for <soc@archiver.kernel.org>; Thu,  9 Feb 2023 14:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CC79FC433A1; Thu,  9 Feb 2023 14:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B3667C433AC;
	Thu,  9 Feb 2023 14:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675951221;
	bh=/E4x6gp5w+uQ8RXb3Zkh7hzHlFUmwiC+KrWSoB1qcIY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=O6/JwN+KjjPwSB3/1HvTiKfZ1ypAElVRbY/zb1CcX/WBjzR5Ndu8/Wt/idOBx7DzY
	 iCJVxOfc1LM7kkNM6+Ulk5FDzVXr+t5eAoegpWmYGdjL7gW2uC3wI6Q0Nzr45TeIN5
	 2zjQEwP/eg0HDZQrJO0zOrNly24irmvoZ3g0D9Tkvbj+KZcqZ0lqZj+n8mqQ9rxWJD
	 VWLOVwJWdOpJDMjg+S8cH71jMLmWBoAprintc0dnjRmCIvRYZRGLW5hhL+3BsDIIIq
	 imtNFFitMOBrv0kR9YrmrhQreL4Wtc+e9qxeBxUniRtrZGvvCPFmyFR/7PhtYWhon8
	 Zz4mLRpgtTqlg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8C3DEE4D02E;
	Thu,  9 Feb 2023 14:00:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: uniphier: Fix property name in PXs3 USB node
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167595122156.31919.1065216047648680113.git-patchwork-notify@kernel.org>
Date: Thu, 09 Feb 2023 14:00:21 +0000
References: <20230207021429.28925-1-hayashi.kunihiko@socionext.com>
In-Reply-To: <20230207021429.28925-1-hayashi.kunihiko@socionext.com>
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue,  7 Feb 2023 11:14:29 +0900 you wrote:
> The property "snps,usb2_gadget_lpm_disable" is wrong.
> It should be fixed to "snps,usb2-gadget-lpm-disable".
> 
> Cc: stable@vger.kernel.org
> Fixes: 19fee1a1096d ("arm64: dts: uniphier: Add USB-device support for PXs3 reference board")
> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> 
> [...]

Here is the summary with links:
  - arm64: dts: uniphier: Fix property name in PXs3 USB node
    https://git.kernel.org/soc/soc/c/2508d5efd7a5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


