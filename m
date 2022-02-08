Return-Path: <SRS0=VvZd=SX=ew.tq-group.com=matthias.schiffer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE7CC433EF
	for <soc@archiver.kernel.org>; Tue,  8 Feb 2022 10:53:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5D847C340E9; Tue,  8 Feb 2022 10:53:35 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3F4DDC004E1;
	Tue,  8 Feb 2022 10:53:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3F4DDC004E1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1644317612; x=1675853612;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UbrGQyvULXin7BBC8wqdS8uqSO3Rl+MipBC4/fpyAFA=;
  b=pCY6/aBZoVp4xO36opDoGo6hXtb9GWHdRA01OPLUtv7dvMrL1BL4kGDs
   rkSFU3YhL+CsDtyrSvj0b94+3OfPq3gD5Qm8xC1t9n8wKUuzosA0q7o5s
   fwuGgQKt2Du23XcRODGTgOLSj1wykySM8fmmz/Ju3Hv1lLGmOrBkkjE5/
   AUSdvfOqsuQzcjO+LeguvKUxAxpet+fp03h5cVJO2bwk4wIBkWLoZdiOB
   HI/Mga55pbm1s8SUqcDFZGWwJ8/Z6arYPd6XrU33wDrMWIRsr+k1lML98
   zRQ+THkX+61qXn2jdyEoKRlHiOWnMFE7ZzzCzD10JwCCpwBOqjWaAc/uw
   g==;
X-IronPort-AV: E=Sophos;i="5.88,352,1635199200"; 
   d="scan'208";a="21957534"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 08 Feb 2022 11:53:29 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 08 Feb 2022 11:53:29 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Tue, 08 Feb 2022 11:53:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1644317609; x=1675853609;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UbrGQyvULXin7BBC8wqdS8uqSO3Rl+MipBC4/fpyAFA=;
  b=VWnvEgqtDGvLWpFibWP78PUxgQe4FS9HDx/QNP3mgMele6QiMfx+TOYn
   WkoDBxcdmrChiv28+5qECk6WOShr8EBEiPiDAxgB8FEY+JNyuD1C279JE
   oTAac32IfRRg1AFGZE5pcLbT9thlMFtvb4uHPVB3wB6EdbDdfWp5jnjfx
   SBa8eo5NFRVDC2wSbEmWtFvMLn9xXghyL+KYLcGmfUOY3JOcNHuoIz/30
   Ap9danfx8+pIpDiK2VyIo3puV44kUkzyGG4drWcxVtrFtB40sYM5zKXdp
   hOHeKy7XtK628/97U7w9Z9THRGrW4zXI+t3XFMUJvsuHjfwrMFrSn2RVz
   Q==;
X-IronPort-AV: E=Sophos;i="5.88,352,1635199200"; 
   d="scan'208";a="21957533"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 08 Feb 2022 11:53:29 +0100
Received: from schifferm-ubuntu (SCHIFFERM-M2.tq-net.de [10.121.201.138])
	by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 3B223280065;
	Tue,  8 Feb 2022 11:53:29 +0100 (CET)
Message-ID: <9923df6525212389b86cb635624bcfb5c27a8bc5.camel@ew.tq-group.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: ti: k3-am65: disable optional
 peripherals by default
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof
 Johansson <olof@lixom.net>, soc@kernel.org, Vignesh Raghavendra
 <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, jan.kiszka@siemens.com,
  linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nishanth Menon <nm@ti.com>
Date: Tue, 08 Feb 2022 11:53:27 +0100
In-Reply-To: <YgEBml9HvFzSl289@atomide.com>
References: <20220203140240.973690-1-matthias.schiffer@ew.tq-group.com>
	 <20220204143108.653qk2ihnlhsr5aa@prior> <YgDCLaBHA3DDQAUd@atomide.com>
	 <5944ba0ce568eaf507917799b1dfd89a3d0ca492.camel@ew.tq-group.com>
	 <YgEBml9HvFzSl289@atomide.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Mon, 2022-02-07 at 13:25 +0200, Tony Lindgren wrote:
> * Matthias Schiffer <matthias.schiffer@ew.tq-group.com> [220207
> 08:45]:
> > Generally I think that it's a bootloader's responsiblity to disable
> > unneeded devices - the kernel may not even have a driver for some
> > peripherals, leading to the same behaviour as a "disabled" status.
> > For
> > this reason I believe that it should always be okay to set unneeded
> > devices to "disabled", and it should be considered a safe default.
> 
> Not possible, think kexec for example :) How would the previous
> kernel
> even know what to disable if Linux has no idea about the devices?

Well, optimally, bootloader and all kernels would agree on the devices
that are actually available, but I get your point.

> 
> If there are issues you're seeing, it's likely a bug in some of the
> device drivers for not checking for the necessary resources like
> pinctrl for i2c lines.

I don't think it's common for individual drivers to care about pinctrl
unless switching between different pin settings is required at runtime.
Many drivers can be used on different hardware, some of which may
require pinmuxing, while others don't.

Also, what is the expected behavior of a driver that is probed for an
unusable device? Wouldn't this require some as-of-yet nonexisting
status between "okay" and "disabled" that conveys something like "probe
this device, initialize (and disable) PM, but don't register anything",
so no unusable devices become visible to userspace (and possibly other
kernel drivers)?

> 
> > I'm not sure what the consensus on these issues is. I'm more
> > familiar
> > with NXP's i.MX and Layerscape SoCs, where it's common to have all
> > muxable peripherals set to "disabled" in the base DTSI, and a quick
> > grep through a few dts directories gives me the impression that
> > this is
> > the case for most other vendors as well.
> 
> This approach only works for SoCs that don't need the kernel to idle
> devices for runtime PM.

I'm pretty sure that most modern SoCs I looked at have runtime PM, and
it is simply expected that unusable devices are never enabled in the
first place, so there is no need for the kernel to know about them.

Regards,
Matthias




> Regards,
> 
> Tony

