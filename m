Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 805F6C433DB
	for <soc@archiver.kernel.org>; Tue,  2 Feb 2021 21:39:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6211564F64; Tue,  2 Feb 2021 21:39:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B1BB264E4A;
	Tue,  2 Feb 2021 21:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612301942;
	bh=SjD1cjmLFC497TWFKRsyO8SSBPhERWQg48ow+XPBcig=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dQTBQxEOQ1WMeAKk6t2h7c7iTmTDbu5SL8GOGIBQZcNEKJjTiEUtJeLIrIUSJ/JKq
	 ssU12qxdKCBR7U7TToj/1b8AyKSO1V4Egpbt0tKoeCB4wlPtmJGy/CoOZ2WpcsLpdZ
	 06FiN3Vu8dLt7aTfkAVVxdQM2lpbjswZSNkOl5Didykljnu9MQsYVDMwqExXQta7aJ
	 5UAWTKyo2ohI9HOAiLjR9/+DCo0roJeIvca1dgO9e0gJvpvbUnOrOgvBSQ57vkkGFt
	 x7j2IseScB6NSqXLmBY15dlfF/6vxvDfKyZuSEZ1iLkfXZPcNjoAo+HsCir4eV/rsz
	 B/hP+mbKehdOg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Florian Fainelli <f.fainelli@gmail.com>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	bcm-kernel-feedback-list@broadcom.com,
	olof@lixom.net,
	khilman@kernel.org,
	Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 1/6] Broadcom defconfig changes for 5.12
Date: Tue,  2 Feb 2021 22:38:56 +0100
Message-Id: <161230191188.1903274.2876240133281287107.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210131221721.685974-1-f.fainelli@gmail.com>
References: <20210131221721.685974-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sun, 31 Jan 2021 14:17:15 -0800, Florian Fainelli wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.12/defconfig
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: 071359e719af26ef27ac626053e236523c5d9d2b

       Arnd
