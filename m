Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1D20C3DA41
	for <soc@archiver.kernel.org>; Tue,  9 Jul 2024 13:50:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7FF3CC4AF0C; Tue,  9 Jul 2024 13:50:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 63FD8C4AF0A;
	Tue,  9 Jul 2024 13:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720533033;
	bh=+e+z5/vxKV23JnhNQB2IwF6mAXT4xSJgVm80x0a9l08=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ZH0isJFAxxLVmmQ2Ncygw4UgfMTaS8yu4VVjXGnxTSUY8YmG4Yga/Gg7FPVj5BEAM
	 AiqX/WbLkHD7iEnIJ9ePAFEzS9BHYAjJH21bboD1QMKZADU5fEXrIvIXmtbM4BK9D2
	 VC8qWRMBtWeJBlsPJugYbmEr8nj93Z1yn7u0G/HR6E7G5QwXtTYx5m8TER8U73iSOi
	 O5bPA1wyBRCeMGksxYqQdfm/Whn6fESgt02TrO7JkTTFUc7qJ96ywGEjSkE/ipWmeD
	 QxfUob0+QQV/g6eXdI5f8JIO0ZU0EQ4RmVPhWqbYUZ1Ad/6g5dyp5aSfQcCIeF2NSu
	 Akq5+A7uCGilQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 540E6C4332D;
	Tue,  9 Jul 2024 13:50:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 00/10] ARM: pxa: use software nodes/properties for GPIOs
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172053303334.5265.1693075747057703666.git-patchwork-notify@kernel.org>
Date: Tue, 09 Jul 2024 13:50:33 +0000
References: <20240628180852.1738922-1-dmitry.torokhov@gmail.com>
In-Reply-To: <20240628180852.1738922-1-dmitry.torokhov@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 28 Jun 2024 11:08:40 -0700 you wrote:
> This series converts legacy pxa boards (spitz, gumstix) to use software
> nodes/properties to describe various GPIOs instead of relying on GPIO
> lookup tables. The benefit is that structure and behavior is closer to
> DT-described GPIOs.
> 
> The very first patch ("ARM: spitz: fix GPIO assignment for backlight")
> is actually a fix that IMO should be applied sooner rather than later,
> the rest of patches are enhancements. The reason it is sent with the
> rest of the series is that later changes contextually depend on it.
> 
> [...]

Here is the summary with links:
  - [01/10] ARM: spitz: fix GPIO assignment for backlight
    https://git.kernel.org/soc/soc/c/78ab3d352f29
  - [02/10] ARM: pxa: consolidate GPIO chip platform data
    https://git.kernel.org/soc/soc/c/917195d6f829
  - [03/10] ARM: pxa/gumstix: convert vbus gpio to use software nodes
    https://git.kernel.org/soc/soc/c/f1d6588af93b
  - [04/10] ARM: spitz: Simplify instantiating SPI controller
    https://git.kernel.org/soc/soc/c/6eabaf9d6e2a
  - [05/10] ARM: spitz: Use software nodes to describe SPI CS lines
    https://git.kernel.org/soc/soc/c/224b9329fb9f
  - [06/10] ARM: spitz: Use software nodes to describe audio GPIOs
    https://git.kernel.org/soc/soc/c/9d91c7c39e3c
  - [07/10] ARM: spitz: Use software nodes to describe LCD GPIOs
    https://git.kernel.org/soc/soc/c/1447c7df3820
  - [08/10] ARM: spitz: Use software nodes to describe MMC GPIOs
    https://git.kernel.org/soc/soc/c/444b89875fc0
  - [09/10] ARM: spitz: Use software nodes to describe LED GPIOs
    https://git.kernel.org/soc/soc/c/29c4e69f8e12
  - [10/10] ARM: spitz: Use software nodes for the ADS7846 touchscreen
    https://git.kernel.org/soc/soc/c/38b2482a27c8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


