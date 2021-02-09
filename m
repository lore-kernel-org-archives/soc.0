Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67841C433E0
	for <soc@archiver.kernel.org>; Tue,  9 Feb 2021 23:13:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3F57664E6B; Tue,  9 Feb 2021 23:13:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DB1E864E58;
	Tue,  9 Feb 2021 23:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612912406;
	bh=/ZdFo17bf6cB7ILhJGSUVyxXy6CWWcTEIOoF4R2L8wI=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LW83VrPUK9X4MKRYm5yuQkOWtp1t9Pcvx7ZaXVW2HsHXKY7lmqQT9BGU9wjAh4gKe
	 ZbiIu0Ypm0G2XK8hVKGmmIqp1wOwAM9PmJOZtb7G112ET1DwDaeRACqt4CkW9jOA9j
	 ai2Z3Qdd3TDuiLOFTrhKbVDwTFgrCQQ7F7otd6bywPVGfQnPv4iIloyWReWDXOF90I
	 bUU0QCe0K20QLN7R0UezgMzJMvo1bNvwx7waT/ybkoI1pTRsFh2dmbmzcQEmU167wO
	 pGvwaWEyA3gI3FHae7rjezFvQ9b21iC75yJnDD+UIXuN2FKsn4Shzjw8w65tsiti6I
	 gBqOD0KHwmqiw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Tony Lindgren <tony@atomide.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-omap@vger.kernel.org,
	arm@kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Defconfig changes for omaps for v5.12
Date: Wed, 10 Feb 2021 00:13:18 +0100
Message-Id: <161291238380.977540.4016262354354191841.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <pull-1612421637-483551@atomide.com>
References: <pull-1612421637-483551@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 4 Feb 2021 08:54:15 +0200, Tony Lindgren wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.12/defconfig-signed
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: c76fe896d6fd55654a6d0235e220e01a0c70bfb2

       Arnd
