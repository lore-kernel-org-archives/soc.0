Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80530C433DB
	for <soc@archiver.kernel.org>; Tue,  2 Feb 2021 21:39:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5D84F64F67; Tue,  2 Feb 2021 21:39:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AE83F64E3D;
	Tue,  2 Feb 2021 21:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612301944;
	bh=hsuoG3FXLRuRqlYKdloDpY6Zo+Uz0VKlBVBK1myw/QY=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k+g6tYdhrKnJ+e9xYMakShEJE0uI/KkUILY5S1Q/onhITyKOYxcYKeVfDuptPX+/n
	 +SuP5PqxwZ4bpxeVxiVANxSU0nnP1MZjOwD5BVIEPINBWa5cLDkmMw2T6/9/iLepV+
	 YzRk4CKQQVnt92d2bU/UNAbCK19nGLJKoBb8BsznwlBYasqICItwAA8JJiK2kfPt5n
	 w6r1oAFNLf8WLlOCYZ6UyXVxJUQNtKLHaI6SS27Dx2T3dkL0XoO+UehXzyiArqusZ9
	 u8UknqJ/ThObrCJThkCYomKOm/c7AQGp5H2oUsF8f0esYoU1zBS9NiF0ObX+oFKmor
	 hCMFERJyOxqRw==
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
Subject: Re: [GIT PULL 2/6] Broadcom defconfig-arm64 changes for 5.12
Date: Tue,  2 Feb 2021 22:38:57 +0100
Message-Id: <161230191197.1903274.18250892208608684043.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210131221721.685974-2-f.fainelli@gmail.com>
References: <20210131221721.685974-1-f.fainelli@gmail.com> <20210131221721.685974-2-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sun, 31 Jan 2021 14:17:16 -0800, Florian Fainelli wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.12/defconfig-arm64
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: c0ec73899d43dfe2600b9b2a5c130401a907c98a

       Arnd
