Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B5FDC12002
	for <soc@archiver.kernel.org>; Fri, 16 Jul 2021 21:25:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 42434613C0; Fri, 16 Jul 2021 21:25:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5F3B3613F3;
	Fri, 16 Jul 2021 21:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626470723;
	bh=p4nCIqTjZ1rE+wPwTE294vuDzvFtHcntg9bXWSZdjyA=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=huFXhSzNWYCXAt5DZ7DB/hqCaGZkyfuPLEWJVVjhqyGn93VtoP0NYIFr/tYbOmT/J
	 2DT5b8rS3yqazus7zQIrgb9AkioFhKyE2AT2Lmdm4R/bYQoy2pS49aJGRm7TYEIIeh
	 a77O8HpWfnrmj0j+wVpYLpCCmobOJmxmpzKvbnvtZx9zYlaxegKHv+H2mFWBTg5qU7
	 6sdz1pu7h19JJhpJeNSZIs7k1jmql3yY09AKyVFrnP0jnd37oCoHpRdBfNjKDGelFT
	 EqsD6Sjvq1PXYzv0Mtq0uO/qjSRTm5dqWFq24Lvkkj7PsOW+EHEo1MyK858IebwXqq
	 s3g8JWMwZREzw==
From: Arnd Bergmann <arnd@kernel.org>
To: Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Stefan Wahren <stefan.wahren@i2se.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	linux-rpi-kernel@lists.infradead.org,
	Scott Branden <sbranden@broadcom.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	bcm-kernel-feedback-list@broadcom.com,
	Ray Jui <rjui@broadcom.com>,
	soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Saravana Kannan <saravanak@google.com>
Subject: Re: [PATCH] ARM: multi_v7_defconfig: Make NOP_USB_XCEIV driver built-in
Date: Fri, 16 Jul 2021 23:24:51 +0200
Message-Id: <162647049955.3478428.13083675923781610518.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <1625915095-23077-1-git-send-email-stefan.wahren@i2se.com>
References: <1625915095-23077-1-git-send-email-stefan.wahren@i2se.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sat, 10 Jul 2021 13:04:55 +0200, Stefan Wahren wrote:
> The usage of usb-nop-xceiv PHY on Raspberry Pi boards with BCM283x has
> been a "regression source" a lot of times. The last case is breakage of
> USB mass storage boot has been commit e590474768f1 ("driver core: Set
> fw_devlink=on by default") for multi_v7_defconfig. As long as
> NOP_USB_XCEIV is configured as module, the dwc2 USB driver defer probing
> endlessly and prevent booting from USB mass storage device. So make
> the driver built-in as in bcm2835_defconfig and arm64/defconfig.

Applied to arm/fixes, thanks!

[1/1] ARM: multi_v7_defconfig: Make NOP_USB_XCEIV driver built-in
      commit: ab37a7a890c1176144a4c66ff3d51ef2c20ed486

       Arnd
