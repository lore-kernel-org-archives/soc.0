Return-Path: <SRS0=MX/P=5R=ew.tq-group.com=alexander.stein@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D93FAC25B4E
	for <soc@archiver.kernel.org>; Fri, 20 Jan 2023 12:43:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 97719C4339C; Fri, 20 Jan 2023 12:43:33 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EA4D8C433D2;
	Fri, 20 Jan 2023 12:43:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EA4D8C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674218610; x=1705754610;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JN8ajwXrj642G4YxWODrXWlILk4BXwrwlIJtEA6ptZI=;
  b=SOBK9paC7WzqN+h9WJ75t0Yx3TLs1faqs/qO1P111Ig1TgIJ2H8pfDvp
   EaFxNUZb3SRQEW/Iod0+L3hmsMU4qGeamQKzYJvB++M2CYp3MRNAqFDCH
   TXPLFOyiH9O8fHnWFS0rCq73vnnK/hd0qWVdoYgg66P3YytIqAPLbK/AL
   Sbtnyy1VmHGniWsBKYXUnXAlkCPHFwMYID0+wDl2Zsxx/ne063OyxCW50
   kCwjYrl6tx2e5YqYFw8Ev7Refv8pH5CHv1lci8DKlq46npq3ea+ZDVzZx
   Ocz+oDUNvrT6VsrKdGVz2CcuNDUKxjlFN/3VQv1TyzQlv9QYu9Y/iABeQ
   A==;
X-IronPort-AV: E=Sophos;i="5.97,232,1669071600"; 
   d="scan'208";a="28559993"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 20 Jan 2023 13:43:27 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 20 Jan 2023 13:43:27 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Fri, 20 Jan 2023 13:43:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674218607; x=1705754607;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JN8ajwXrj642G4YxWODrXWlILk4BXwrwlIJtEA6ptZI=;
  b=m3iisd6tyEiZvf/a9fXJ3fgOgLloyNHPNOINcnghTsVUOKJC53dxcZCh
   eSvpI0rhXBPVARX74QQxPcEo22eIFuVizBAnpDFSPLNPaBmj9hM9BjL/N
   7sM2SblCS9ObWQ26ZS52nHu71Mj2rpLHF+ZXtzKUzxoNLnG2fDxnVErdN
   Hc7PzfBZieBSLF3lgxmrUw96NwXYGeezQfBGKRGwpMiMlGxc3MtNEo4rc
   V8PDuJ5MYoayU9PDq2ZoaOvhqmGmLxKPc1bRxKttEytXKeimPHZsebjLW
   D4jQ41iAFci1IVJFp6h1lJwsMX2t9aiQdqfVKK19G9Fz/Lp0Eb+PT+2TB
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,232,1669071600"; 
   d="scan'208";a="28559992"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 20 Jan 2023 13:43:26 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 9BA23280056;
	Fri, 20 Jan 2023 13:43:26 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Olof Johansson <olof@lixom.net>, Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, Russell King <linux@armlinux.org.uk>, Marek Vasut <marex@denx.de>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 9/9] [DNI] ARM: multi_v7_defconfig: Enable CONFIG_ARM_LPAE for multi_v7_config
Date: Fri, 20 Jan 2023 13:43:26 +0100
Message-ID: <3629553.RUnXabflUD@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <9e2aa58c-10dc-49d0-a492-4d724cf29c2b@app.fastmail.com>
References: <20230119144236.3541751-1-alexander.stein@ew.tq-group.com> <2617470.BddDVKsqQX@steina-w> <9e2aa58c-10dc-49d0-a492-4d724cf29c2b@app.fastmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi Arnd,

Am Donnerstag, 19. Januar 2023, 17:07:30 CET schrieb Arnd Bergmann:
> On Thu, Jan 19, 2023, at 16:27, Alexander Stein wrote:
> > Am Donnerstag, 19. Januar 2023, 16:09:05 CET schrieb Arnd Bergmann:
> >> On Thu, Jan 19, 2023, at 15:42, Alexander Stein wrote:
> >> > This is necessary to support PCIe on LS1021A.
> >> >=20
> >> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> >>=20
> >> Can you explain why this is actually required? I can see that the
> >> ranges in the PCIe device point to a high address (0x4000000000,
> >> 2^40), but I can't tell if this is hardwired in the SoC or a
> >> setting that is applied by software (either the bootloader or
> >> the PCIe driver).
> >=20
> > The RM ([1]) memory map (Table 2-1) says that 'PCI Express 1' is located
> > at
> > '400000_0000', 'PCI Express 2' at '480000_0000', so I assume this is
> > hardcoded in SoC.
> > It also explicitly lists in that table PCIe 1&2 is only accessible with
> > 40-bit addressing.
> >=20
> >> If you can reprogram the memory map, I would expect this to fit
> >> easily into the 32-bit address space, with 1GB for DDR3 memory
> >> and 1GB for PCIe BARs.
> >=20
> > I'm not sure which part of memory map you can reprogram and where, but I
> > guess this is fixed on this SoC.
>=20
> Ok, I see it now. It looks like they fell victim to the
> cursed "Principles of ARM=AE Memory Maps White Paper"
> document and messed it up even further ;-)
>=20
> In particular, it seems that the memory map of the PCI address
> spaces is configurable, but only within that area you listed.
> I see that section "28.4.2 PEX register descriptions" does list
> a 64-bit prefetchable address space in addition to the 32-bit
> non-prefetchable memory space, but the 64-bit space is not
> listed in the DT. It would be a good idea to configure that
> as well in order for devices to work that need a larger BAR,
> such as a GPU, but it wouldn't help with fitting the PCIe
> into non-LPAE 32-bit CPU address space.

I'm not sure if I can follow you here. Do you have some keywords of what's=
=20
missing there?

> In the datasheet I also see that the chip theoretically
> supports 8GB of DDR4, which would definitely put it beyond
> the highmem limit, even with the 4G:4G memory split. Do you
> know if there are ls1021a devices with more than 4GB of
> installed memory?

Where did you find those 8GB? Section 16.2 mentions it supports up to 4 ban=
ks/
chip-selects which I would assume is much more. Also the memory map has a D=
RAM=20
region 2 for memory region 2-32GB. But yes this exceeds 32bit addressing.
I'm not aware of ls1021 devices with more than 4GB memory. Our modules only=
=20
support up to 2GB.

Best regards,
Alexander



