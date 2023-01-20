Return-Path: <SRS0=7BPJ=5R=armlinux.org.uk=linux+soc=kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB77C25B4E
	for <soc@archiver.kernel.org>; Fri, 20 Jan 2023 14:58:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BAA99C433A0; Fri, 20 Jan 2023 14:58:08 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 59BF6C433D2
	for <soc@kernel.org>; Fri, 20 Jan 2023 14:58:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 59BF6C433D2
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5hEd6GbPouO0m/SPHIbcH1VHpKAsYUN20L0u+iHY3A8=; b=y17PMsa7QoO1H9uuHwshE7k0hZ
	MNNkeGHz7B8hVV5em/5MiO3qCEQGbHD+58JbwCdSncYrzMd5nsfztuWWIOkXo8L9e5SaQJdPDrrnn
	3fHjxg6hxMTehvMYSVsDUdGB88Msgn5Ztj9dWetjwdkCINezAqCyg6WdJVF6MFnHuiJHIcb/xeSD5
	wZrU4yw1esJpX4VcHhRp5piOjJ+rBHPjl/0mro3jyBePCe9P/ATErewkB6Lx+MJhRzmfYswQhiqaf
	jYOHx0tq0JySNC/eAOZfW52wZvtSG5GZKFwxW5xSW/MXCbk8wQMPum/r8OOw77e4NWFaao77Y5KxZ
	hXO/+MFA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36234)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1pIsq5-0006xe-Th; Fri, 20 Jan 2023 14:57:57 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1pIsq3-0001XN-JC; Fri, 20 Jan 2023 14:57:55 +0000
Date: Fri, 20 Jan 2023 14:57:55 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
	Marek Vasut <marex@denx.de>,
	Marcel Ziswiler <marcel.ziswiler@toradex.com>, soc@kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 8/9] ARM: multi_v7_defconfig: Add options to support
 TQMLS102xA series
Message-ID: <Y8qr8wl8WdJfQ9We@shell.armlinux.org.uk>
References: <20230119144236.3541751-1-alexander.stein@ew.tq-group.com>
 <20230119144236.3541751-9-alexander.stein@ew.tq-group.com>
 <acab1d7a-ef00-a3be-f73c-6cb9d01687b9@linaro.org>
 <2168770.1BCLMh4Saa@steina-w>
 <e08e6325-4b2b-c1ce-b33a-877de2c0babe@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e08e6325-4b2b-c1ce-b33a-877de2c0babe@linaro.org>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Fri, Jan 20, 2023 at 12:35:41PM +0100, Krzysztof Kozlowski wrote:
> Defconfig=y is only for critical stuff needed to bring initramfs. Time
> is not needed for initramfs.

Are I2C drivers "critical stuff"? What about AHCI drivers? What about
all the USB HCI drivers? USB Storage can certainly be loaded from an
initramfs, yet it's =y. LED triggers? Loads of RTC drivers that are
marked as =y? XOR drivers? VIRTIO drivers? Filesystems? I seem to
remember Red Hat sets even popular filesystems to be a module in their
kernel.

Clearly, "defconfig=y is only for critical stuff" is rather false in
practice, and I suspect is little more than a desire rather than a
rule. I suspect it's more "defconfig=y is for stuff that makes most
platforms successfully boot without an initramfs".

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
