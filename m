Return-Path: <SRS0=gU5w=SW=atomide.com=tony@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 851DCC433F5
	for <soc@archiver.kernel.org>; Mon,  7 Feb 2022 06:54:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 313CFC340F2; Mon,  7 Feb 2022 06:54:48 +0000 (UTC)
Received: from muru.com (muru.com [72.249.23.125])
	by smtp.kernel.org (Postfix) with ESMTP id 25456C340F0;
	Mon,  7 Feb 2022 06:54:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 25456C340F0
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=atomide.com
Received: from localhost (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTPS id 4FDBE80E1;
	Mon,  7 Feb 2022 06:54:16 +0000 (UTC)
Date: Mon, 7 Feb 2022 08:54:37 +0200
From: Tony Lindgren <tony@atomide.com>
To: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
Cc: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
	Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>, soc@kernel.org,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, jan.kiszka@siemens.com,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] arm64: dts: ti: k3-am65: disable optional
 peripherals by default
Message-ID: <YgDCLaBHA3DDQAUd@atomide.com>
References: <20220203140240.973690-1-matthias.schiffer@ew.tq-group.com>
 <20220204143108.653qk2ihnlhsr5aa@prior>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220204143108.653qk2ihnlhsr5aa@prior>

Hi,

* Nishanth Menon <nm@ti.com> [220204 14:30]:
> Rob, Tony, Arnd, SoC maintainers,
> 
> On 15:02-20220203, Matthias Schiffer wrote:
> > All peripherals that require pinmuxing or other configuration to work
> > should be disabled by default. Dependent DTS are adjusted accordingly.

Disabling SoC internal devices by default is not a good policy. The
devices are available even if not pinned out. Disabling device by default
causes runtime PM to not work as the kernel will completely ignore the
disabled devices. And this means you add a dependency to some certain
version of a bootloader for PM to work.

Additionally tagging devices as disabled by default (and then again
re-enabling them in the board specific dts files) is just pointless
churn and bloat. See for example commit 12afc0cf8121 ("ARM: dts: Drop
pointless status changing for am3 musb") :)

If you really want to disable some devices for memory usage or other
reasons, do it in the board specific dts files.

> https://lore.kernel.org/linux-arm-kernel/20201112183538.6805-1-nm@ti.com/
> reversal all over again.
> 
> Is there a specific pattern we are intending to use here? Because, if we
> are going down this path (which would be a major churn across multiple
> downstream trees as well) - I'd rather have this as a documented
> standard and not just a TI approach and will need to be done across all
> K3 devices.
> 
> Are you aware of such a documented guideline, rather than "word of
> mouth"? Maybe I have'nt looked deep enough, but checking..

For SoCs that don't implement runtime PM the policy can be different
without causing any harm. But for any SoCs implementing runtime PM, an
unknown state from the bootloader is not going to work.

Regards,

Tony
