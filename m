Return-Path: <SRS0=rvNc=5Q=ew.tq-group.com=alexander.stein@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9856C46467
	for <soc@archiver.kernel.org>; Thu, 19 Jan 2023 15:27:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CF01BC433F0; Thu, 19 Jan 2023 15:27:47 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 57FE6C433D2;
	Thu, 19 Jan 2023 15:27:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 57FE6C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674142065; x=1705678065;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Fan4CH7rMTs971QPB7GBxYLxAh59SKl4VCqfYSc+19Y=;
  b=oKKPEjhe6dG3R44dfhJR6iaxLnKbCmBAhQjnFj7RZEhaZ4z5CmeV1gNf
   p00uwwTzZ/U+4eHysQ4BiyX0f06gWBN2CI1nm2F2wahvBO8jsvbzawZ3G
   NNG3k5Om0aZATLHqq44gdEMh0uIAtDt0WJuOFum8vhzuUAfDLavxKSm0P
   yM2UAVOdyl9Cfe30kdldJJm2M2mSzGAjYazlLPqr/jzfnGv3O9aEk1faX
   RfN/0DVsRESRqsQC/mVk55hbhJtj3W+KXI82OIR6FXLfMq5NXq8SfhWjw
   v3/rNVPysXXvfzEn4nQWIrl62xhTT2kEm0yef/W/4Pr25ak9RpDvjqmHs
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,229,1669071600"; 
   d="scan'208";a="28538910"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 19 Jan 2023 16:27:41 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 19 Jan 2023 16:27:41 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Thu, 19 Jan 2023 16:27:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674142061; x=1705678061;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Fan4CH7rMTs971QPB7GBxYLxAh59SKl4VCqfYSc+19Y=;
  b=Y4ZXSfPsmou0BqtmC/HsSTlVirenHbure0fK64PMB2e7zhGlocBbFGlc
   sX7432u5lFS/Va/Nk0HlIxGPqW1QxCG5edSCmA/+IGRh4s6Qmrpbk23Zl
   uLjQEV6hL3V14Gj//zZ77lwR8JTW7Khq3dz6WibOmsn+IOm8g3GjAzhrF
   2NOZWf6r/Ahv5YRLQQ/b7Q06KagHQ4KMojVwpxSua+hGbD513/HnKN6Ti
   PS2RBKZFzSqKKRrdDt5N19DcigYVJeDcWP9Vpd/5WHnucuK0t8X+9IWLp
   mU8YaPocdX3ZasBz06ZSj89rNTJRaZvpcmE3AyCws7H+O5NSiNqiitOjp
   A==;
X-IronPort-AV: E=Sophos;i="5.97,229,1669071600"; 
   d="scan'208";a="28538909"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 19 Jan 2023 16:27:41 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 4F701280056;
	Thu, 19 Jan 2023 16:27:41 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Olof Johansson <olof@lixom.net>, Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, Russell King <linux@armlinux.org.uk>, Marek Vasut <marex@denx.de>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 9/9] [DNI] ARM: multi_v7_defconfig: Enable CONFIG_ARM_LPAE for multi_v7_config
Date: Thu, 19 Jan 2023 16:27:39 +0100
Message-ID: <2617470.BddDVKsqQX@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <f1de9cd9-a163-4b56-adf8-319eaf85e38e@app.fastmail.com>
References: <20230119144236.3541751-1-alexander.stein@ew.tq-group.com> <20230119144236.3541751-10-alexander.stein@ew.tq-group.com> <f1de9cd9-a163-4b56-adf8-319eaf85e38e@app.fastmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Arnd,

thanks for the fast response.

Am Donnerstag, 19. Januar 2023, 16:09:05 CET schrieb Arnd Bergmann:
> On Thu, Jan 19, 2023, at 15:42, Alexander Stein wrote:
> > This is necessary to support PCIe on LS1021A.
> > 
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> 
> Can you explain why this is actually required? I can see that the
> ranges in the PCIe device point to a high address (0x4000000000,
> 2^40), but I can't tell if this is hardwired in the SoC or a
> setting that is applied by software (either the bootloader or
> the PCIe driver).

The RM ([1]) memory map (Table 2-1) says that 'PCI Express 1' is located at 
'400000_0000', 'PCI Express 2' at '480000_0000', so I assume this is hardcoded 
in SoC.
It also explicitly lists in that table PCIe 1&2 is only accessible with 40-bit 
addressing.

> If you can reprogram the memory map, I would expect this to fit
> easily into the 32-bit address space, with 1GB for DDR3 memory
> and 1GB for PCIe BARs.

I'm not sure which part of memory map you can reprogram and where, but I guess 
this is fixed on this SoC.

> I don't mind having a defconfig with LPAE enabled, I think this
> can be done using a Makefile target that applies a config
> fragment on top of the normal multi_v7_defconfig, you can find
> some examples in arch/powerpc/configs/*.config.

Ah, nice. This can be a good starter. Thanks.

Best regards,
Alexander

[1] https://www.nxp.com/webapp/Download?colCode=LS1021ARM



