Return-Path: <SRS0=r7Jl=MI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CA66C12002
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jul 2021 21:31:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFC0E61374
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jul 2021 21:31:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFC0E61374
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y+LJ7Ryl9KLDNkeSnllwVJ8WMZiSzErOIO/iVXtW2wQ=; b=xJ31fwh7MWc4ed
	L4GMuQ/gypgiJw9+iwmdAROrAIQyUkulkoPeY3STKSx9GDn15v83NqdhEa9rpa2c1qYJVu4XyDMTU
	mZxFO6Jh2yzeDPB3glrUMgHnhkAwFf7DNGYVra2r+Qe3T7Kij9n9xP4J3dJNvAjZFhj9RK6lGHrUq
	A2WoMoZ3yrXSqUMjwDwN/53y8ECorI9NIEf8wBPqW/ThdFG7IeEL79/Dn7gmE/JrsMIA+uu/lsf1j
	Rve2XBnR3QhRLowOERXsDeqCi6Rln+xs/5uf7pMqo759nJ4lgiZHfdghV7l1K5c8YWsIjXhdQUtd5
	/zhvtwy0+OM2drZz240g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4VOz-005JnF-Ot; Fri, 16 Jul 2021 21:29:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4VKl-005I95-F7; Fri, 16 Jul 2021 21:25:24 +0000
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
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 linux-rpi-kernel@lists.infradead.org,
 Scott Branden <sbranden@broadcom.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 bcm-kernel-feedback-list@broadcom.com, Ray Jui <rjui@broadcom.com>,
 soc@kernel.org, linux-arm-kernel@lists.infradead.org,
 Saravana Kannan <saravanak@google.com>
Subject: Re: [PATCH] ARM: multi_v7_defconfig: Make NOP_USB_XCEIV driver
 built-in
Date: Fri, 16 Jul 2021 23:24:51 +0200
Message-ID: <162647049955.3478428.13083675923781610518.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <1625915095-23077-1-git-send-email-stefan.wahren@i2se.com>
References: <1625915095-23077-1-git-send-email-stefan.wahren@i2se.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_142523_573122_3EBB94EB 
X-CRM114-Status: UNSURE (   8.60  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210716212451.xyHokKrk23hkwXimzNy2fNKfxzScoOfxpUVE-cb9zFw@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
