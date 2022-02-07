Return-Path: <SRS0=gU5w=SW=atomide.com=tony@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D9AAC433FE
	for <soc@archiver.kernel.org>; Mon,  7 Feb 2022 11:25:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D5571C340F0; Mon,  7 Feb 2022 11:25:17 +0000 (UTC)
Received: from muru.com (muru.com [72.249.23.125])
	by smtp.kernel.org (Postfix) with ESMTP id B5AA4C340EB;
	Mon,  7 Feb 2022 11:25:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B5AA4C340EB
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=atomide.com
Received: from localhost (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTPS id EB08280E1;
	Mon,  7 Feb 2022 11:24:52 +0000 (UTC)
Date: Mon, 7 Feb 2022 13:25:14 +0200
From: Tony Lindgren <tony@atomide.com>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>, soc@kernel.org,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, jan.kiszka@siemens.com,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: ti: k3-am65: disable optional
 peripherals by default
Message-ID: <YgEBml9HvFzSl289@atomide.com>
References: <20220203140240.973690-1-matthias.schiffer@ew.tq-group.com>
 <20220204143108.653qk2ihnlhsr5aa@prior>
 <YgDCLaBHA3DDQAUd@atomide.com>
 <5944ba0ce568eaf507917799b1dfd89a3d0ca492.camel@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5944ba0ce568eaf507917799b1dfd89a3d0ca492.camel@ew.tq-group.com>

* Matthias Schiffer <matthias.schiffer@ew.tq-group.com> [220207 08:45]:
> Generally I think that it's a bootloader's responsiblity to disable
> unneeded devices - the kernel may not even have a driver for some
> peripherals, leading to the same behaviour as a "disabled" status. For
> this reason I believe that it should always be okay to set unneeded
> devices to "disabled", and it should be considered a safe default.

Not possible, think kexec for example :) How would the previous kernel
even know what to disable if Linux has no idea about the devices?

If there are issues you're seeing, it's likely a bug in some of the
device drivers for not checking for the necessary resources like
pinctrl for i2c lines.

> I'm not sure what the consensus on these issues is. I'm more familiar
> with NXP's i.MX and Layerscape SoCs, where it's common to have all
> muxable peripherals set to "disabled" in the base DTSI, and a quick
> grep through a few dts directories gives me the impression that this is
> the case for most other vendors as well.

This approach only works for SoCs that don't need the kernel to idle
devices for runtime PM.

Regards,

Tony
