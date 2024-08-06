Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35887C52D6F
	for <soc@archiver.kernel.org>; Tue,  6 Aug 2024 20:08:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 25439C4AF0D; Tue,  6 Aug 2024 20:08:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FDCAC32786;
	Tue,  6 Aug 2024 20:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722974899;
	bh=7JEOzmY7Bes2oX9LP/IqFSDcRszJv9A3w/xkFB0nSTY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ea5RkxPbHHCsgw/MgD3A3a203DKmp5BFcb6LMrl2h55ravmQTXOghx8mqyEcXqaP2
	 bin181e2glh9kM5UWr3fV2YRJLiaFfHQ7g07nAy2nT9reovl9w45R8Rgcm3e2aBvmZ
	 7xr3bUAUndm8MS782AKcYYb1rL7fqO336Q18lyi+4mHGT7Nbeh8WBBjozTlT3I0IrE
	 7+rTwsTZoEsbQBfGSjc6s87/bnouIKh6812MhU+RprPbqRb8Zw7o/LDUEgya6+90Jy
	 szHIGLPLkdUPtBZnWZLhzYVdvVp0w4aJRYUBG2fIo1uT0ztCEJkWaBifdmvNBaUKs+
	 oCC0abUyyrfuQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EBAC23824F34;
	Tue,  6 Aug 2024 20:08:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: ti: K3 devicetree updates for v6.11 - part2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172297489776.1692635.14769674168026930250.git-patchwork-notify@kernel.org>
Date: Tue, 06 Aug 2024 20:08:17 +0000
References: <aacd1e96-9ff4-4222-9f4d-29e63041f7fb@ti.com>
In-Reply-To: <aacd1e96-9ff4-4222-9f4d-29e63041f7fb@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 15 Jul 2024 23:37:42 +0530 you wrote:
> Hi ARM SoC Maintainers,
> 
> Please pull below PR which consists of a late fix to my earlier pull request:
> https://lore.kernel.org/linux-arm-kernel/37f251a1-f3bd-402f-ab22-cf786c3871d7@ti.com/
> 
> The following changes since commit 6406c5d5512c0814b8c155df7f833a98d9069a72:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: ti: K3 devicetree updates for v6.11 - part2
    https://git.kernel.org/soc/soc/c/b4f8192afb40

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


