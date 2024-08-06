Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8369C52D70
	for <soc@archiver.kernel.org>; Tue,  6 Aug 2024 20:27:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D1D8FC4AF0C; Tue,  6 Aug 2024 20:27:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC3D2C32786;
	Tue,  6 Aug 2024 20:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722976070;
	bh=vXIcnMF6mRtpbcmm5cQDutZNPfDGBHuDUhOhrP7K5Qs=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=alZ0l+kPI+xVcNhpOfHY8zVuwmXVpqlyVzKBFb2khDsfzz+u4ObCf2zZr6ItmVqf/
	 UtF+g48ownzK57hMurxyDoHRNLuGJIm3gEhRRdZlRPOQXfEyifWUpBPpsscKH7O/jK
	 iVSEjntn4Kcfhq6KUNcd685JSYgpcFTicjXRf9pAZuNHzh7WZUVpSimHvCGPqIVvgx
	 KZfsv7K7EZoLrC5/sSduOgu5MnACbVLVkx/rkJopsUFLhxoZecW+IVnwS5R0NmLvsv
	 oA26oIIBmaAm2BBspkKSE0L/IniFUsnRy9pHO3SmgJaWnmnupHiRJlI2krTN44ab/n
	 vywn437FcOLSg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE2C339D6562;
	Tue,  6 Aug 2024 20:27:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: TI K3 fixes for v6.11
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172297606925.1692635.1356321292697962377.git-patchwork-notify@kernel.org>
Date: Tue, 06 Aug 2024 20:27:49 +0000
References: <20240806122659.vmasq2qjy6457bbs@peroxide>
In-Reply-To: <20240806122659.vmasq2qjy6457bbs@peroxide>
To: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 6 Aug 2024 07:26:59 -0500 you wrote:
> Hi SoC maintainers,
> 
> Please find DT fixups for the v6.11 rc cycle - This tag includes the
> previous late PR
> https://patchwork.kernel.org/project/linux-soc/patch/aacd1e96-9ff4-4222-9f4d-29e63041f7fb@ti.com/
> 
> The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: TI K3 fixes for v6.11
    https://git.kernel.org/soc/soc/c/d50a762b62cf

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


