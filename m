Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F6FC433F5
	for <soc@archiver.kernel.org>; Thu,  7 Apr 2022 12:24:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C5829C385B0; Thu,  7 Apr 2022 12:24:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AA9DEC385A7;
	Thu,  7 Apr 2022 12:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649334247;
	bh=lDcwojToO/KDxiQ4Ff00t90mZRFzEDTdkn5FuRmE0KU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=f/wSDIZCY8dRVmJEjh1o82h98SX/2QNjWOLZWh8mHIv77PRurv0PN6x+XSOWrA1Q2
	 nNPxjlwpVJyWtd4kg8ylT3UONnV4FsEHxZSdlT2Q4XAWxC+4aq/xP/HXBi3qnQkHr7
	 QeGcirdtw0EbCtvAotH7mEltjIOSwJ2+A9Nlt6CTcCn6hdKO/M/B5hHBJqOzvzNtwr
	 NFFwEHbBSPBPHAUFDHdcNLRXaFXOtJi25wUq6SSvq8rRiEKnW8xpvf34PEFXl+rS1l
	 B+Gun7fLg/dqroW1YhzBumT168UuX/t5rIn03r0PkS9tl4ZSDOnLwIL8dj5TF3ui+o
	 1TBl8RJKYzf7A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 891D4E8DD5F;
	Thu,  7 Apr 2022 12:24:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [RESEND PATCH] arm: dts: imx: Fix boolean properties with values
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164933424755.10369.3135891656209060891.git-patchwork-notify@kernel.org>
Date: Thu, 07 Apr 2022 12:24:07 +0000
References: <Yk3mR5yae3gCkKhp@robh.at.kernel.org>
In-Reply-To: <Yk3mR5yae3gCkKhp@robh.at.kernel.org>
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 6 Apr 2022 14:13:11 -0500 you wrote:
> Boolean properties in DT are present or not present and don't take a value.
> A property such as 'foo = <0>;' evaluated to true. IOW, the value doesn't
> matter.
> 
> It may have been intended that 0 values are false, but there is no change
> in behavior with this patch.
> 
> [...]

Here is the summary with links:
  - [RESEND] arm: dts: imx: Fix boolean properties with values
    https://git.kernel.org/soc/soc/c/3b881035e959

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


