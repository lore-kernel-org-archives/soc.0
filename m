Return-Path: <SRS0=9Wb0=TU=atomide.com=tony@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0107FC433EF
	for <soc@archiver.kernel.org>; Wed,  9 Mar 2022 14:03:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DD1D2C340F3; Wed,  9 Mar 2022 14:03:32 +0000 (UTC)
Received: from muru.com (muru.com [72.249.23.125])
	by smtp.kernel.org (Postfix) with ESMTP id E7AB0C340E8;
	Wed,  9 Mar 2022 14:03:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E7AB0C340E8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=atomide.com
Received: from localhost (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTPS id 1289480C1;
	Wed,  9 Mar 2022 14:02:07 +0000 (UTC)
Date: Wed, 9 Mar 2022 16:03:29 +0200
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
Message-ID: <YiizsYnKB0X9bDY2@atomide.com>
References: <20220203140240.973690-1-matthias.schiffer@ew.tq-group.com>
 <20220204143108.653qk2ihnlhsr5aa@prior>
 <YgDCLaBHA3DDQAUd@atomide.com>
 <5944ba0ce568eaf507917799b1dfd89a3d0ca492.camel@ew.tq-group.com>
 <YgEBml9HvFzSl289@atomide.com>
 <9923df6525212389b86cb635624bcfb5c27a8bc5.camel@ew.tq-group.com>
 <YgJZbdOlazrde7O/@atomide.com>
 <1356e93cd5b101c3d896e35250c66959ed631544.camel@ew.tq-group.com>
 <YihvWFdr1cT7cyk5@atomide.com>
 <5058591a3e0f0cb82b26cffe888d87b4d1bdd713.camel@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5058591a3e0f0cb82b26cffe888d87b4d1bdd713.camel@ew.tq-group.com>

* Matthias Schiffer <matthias.schiffer@ew.tq-group.com> [220309 11:09]:
> while I agree that it would be great if drivers could just detect when
> hardware is not available, this is simply not how most drivers work -
> when you instantiate the driver via a non-disabled(/reserved/...) DT
> node, the driver expects a usable device.
> 
> Especially for busses like I2C, there is no way for a driver to
> reliably detect whether the bus is usable or not. (There are several
> states that can't really be distinguished: Is pinmuxing missing, or
> does the device not need any muxing? Is a line low because it is not
> actually connected to anything, or is there another master currently
> using the bus, or is the bus stuck due to a faulty device?)

Well how about set only the problem devices with status = "disabled"
with a proper comment in the SoC dtsi file?

See for example what has been done in arch/arm64/boot/dts/apple that
has been pretty widely reviewed and done with a good taste :)

Not sure what can be done to idle the unused devices in the disabled
case though, maybe some firmware call to disable all unclaimed devices
could be done if it does not exist already. The firmware may not have
the capability to idle devices that need firmware loaded to idle them
for example though.

Regards,

Tony
