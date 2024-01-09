Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14961C47258
	for <soc@archiver.kernel.org>; Tue,  9 Jan 2024 07:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EB977C43394; Tue,  9 Jan 2024 07:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5B02C433A6;
	Tue,  9 Jan 2024 07:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704786025;
	bh=0/MoSnmucMystuBThE9nvycG1LwejZTWPzexlfOX0jk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=KeZKCEzIhBv32t327DO1U7P4Idq3PfmSYd80nsuUL/Pir5sy05j/QFBKJ/dm0ngWF
	 VldRXUIrv/ARFgs+VrASBMPzMHLpa2mJviDVEF3V4oNVvg63F9mjm86ysd3xTd3z1V
	 8gF1n0LqfX/g+NjL+hMFJkC0JAATlVX2u0kfmD1dUPaH5RxCxOxCqjS9yuXB+u0F2I
	 IldDr0sa+nDr+wahohTdIZnjkdExbEvqgQxbKUg7Ok1Qm2kIDC1FhBVZEKFVLDzPR9
	 M69xbfs/5YNULVGauo/zbgVShNm+jO+pL35uNhNvss71r6/JC/7UaChiKcAn1WNAA8
	 Yg3sb/0asllww==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BA53ED8C971;
	Tue,  9 Jan 2024 07:40:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: davinci: always select CONFIG_CPU_ARM926T
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170478602576.21956.8540572626636842232.git-patchwork-notify@kernel.org>
Date: Tue, 09 Jan 2024 07:40:25 +0000
References: <20240108110055.1531153-1-arnd@kernel.org>
In-Reply-To: <20240108110055.1531153-1-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon,  8 Jan 2024 12:00:36 +0100 you wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The select was lost by accident during the multiplatform conversion.
> Any davinci-only
> 
> arm-linux-gnueabi-ld: arch/arm/mach-davinci/sleep.o: in function `CACHE_FLUSH':
> (.text+0x168): undefined reference to `arm926_flush_kern_cache_all'
> 
> [...]

Here is the summary with links:
  - ARM: davinci: always select CONFIG_CPU_ARM926T
    https://git.kernel.org/soc/soc/c/40974ee421b4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


