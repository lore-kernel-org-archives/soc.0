Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26CE9CDB485
	for <soc@archiver.kernel.org>; Tue, 17 Oct 2023 22:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0A29EC433C7; Tue, 17 Oct 2023 22:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E8793C43391;
	Tue, 17 Oct 2023 22:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697580027;
	bh=6Mhh9nRbbrc7vACAH2mlnJNZWocEK9aMOvCf5uAyEkw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=doDzfTZETaahlsOg6k9c8bs3eWdqaCOVvL9njHKXhxZb4nUjaKtFmARy/+DLNIjxS
	 n4vOae92In5IZZinVUEvenbF2mqHWmo7ASp9+TXuRfAeZPlaXdM2D3P14jL3hr2V4w
	 EScAwdLLY59eG3beouPDMHzQFxNITUhgqk1pUuLrxkrG9P/IsNtAG4wWNPZqJI+X5n
	 cybq6I8kWkLTc8TZ1SPmfNJJAgKdCRQtgdmgDEriTHyKwHkUklVBw6k40ILraZ87hr
	 6K0qmDCfe7MipGMxpE+v2tHeT0aeeSuBhRqsMfbps4/iGMM7gjnqzsPwu0ZF86x0KX
	 a78uDT2Vr0p1g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BA434C0C40E;
	Tue, 17 Oct 2023 22:00:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] amlogic defconfig update for v6.7
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169758002775.24805.8628356490921800356.git-patchwork-notify@kernel.org>
Date: Tue, 17 Oct 2023 22:00:27 +0000
References: <2e08bd06-09e0-4352-8207-bc3b5d26fba4@linaro.org>
In-Reply-To: <2e08bd06-09e0-4352-8207-bc3b5d26fba4@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 16 Oct 2023 10:40:46 +0200 you wrote:
> Hi,
> 
> Here's an Amlogic Defconfig changeset for v6.7 enabling drivers that are
> used with most of the Amlogic based boards:
>    - KEYBOARD_GPIO_POLLED=m used to support buttons on pre-G12A boards, the old
>      SoC do not support dual-edge gpio interrupts, so we rely on polling instead
>    - KHADAS_MCU_FAN_THERMAL=m & MFD_KHADAS_MCU=m to control FAN over the MCU on Khadas VIM boards,
>      those boards have an on-board MCU that controls (in addition of boot stuff) the FAN pins
>    - MEDIA_CEC_SUPPORT=y & CEC_MESON_G12A_AO=m to enable the CEC bus
>    - RTC_DRV_PCF8563=m to enable support for RTC on most SBC boards
>    - VIDEO_MESON_VDEC=m to enable HW Video Decoder
>    - MESON_DDR_PMU=m to enable DDR PMU perf driver on G12A & SM1 SoCs
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] amlogic defconfig update for v6.7
    https://git.kernel.org/soc/soc/c/40fa0489a294

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


