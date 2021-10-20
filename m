Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A1AEC433F5
	for <soc@archiver.kernel.org>; Wed, 20 Oct 2021 21:19:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3F45561284; Wed, 20 Oct 2021 21:19:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D87CB611ED;
	Wed, 20 Oct 2021 21:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634764792;
	bh=vOnga4+S7JQrf1JZSTQEgsG2EIm/hjoP9XGkyTTjbPU=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X+PXFzWbpJg/rQR+RoWb1aNexHOEKH8g4s31+icgyTlJGoZMtysHPCWabXkfD22jz
	 jdG7BuuA2ra6UcUQMaoVJBWFv8rtdNNe4CwSJk0IBpPTFAhl6md9Toz6YB+R8/XmvL
	 SQ5Hi9YORPOdXNxhNRJIhrZtm5/e0OwUddxa3qhLa1tZ5fxgi8VAoQdakdtA3G34U3
	 fG/o7PYe17CHWLBuSdNUpRgRTl26XJftSRuE/7QOzPExeAnYcblhHExuS32F9YlNs5
	 nGsSM55Y7kbqxAUYXNfzrEubb1twKdZVDSFryXMOc2IKvbaOTyv6Y46qXmbrYIeVP5
	 qPHPuwiwaIJ1Q==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Romain Perier <romain.perier@gmail.com>,
	arm@kernel.org,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: Re: [GIT PULL] ARM: dts: mstar: updates for v5.16 v2
Date: Wed, 20 Oct 2021 23:19:47 +0200
Message-Id: <163476478083.3883860.2276304001113700666.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211020163010.3079-1-romain.perier@gmail.com>
References: <20211020163010.3079-1-romain.perier@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 20 Oct 2021 18:30:10 +0200, Romain Perier wrote:
> Here's the ARM DTS changes for v5.16:
>  - mstar-v7: Mark the arch timer as not being initialized by the firmware
>    and rely on the physical timers.
>  - mstar-v7: enable rtc
> 
> Regards,
> Romain
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 06fab4a544a288220abd3803b8a2e88c17c049ff

       Arnd
