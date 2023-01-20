Return-Path: <SRS0=9ZLf=5R=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99063C05027
	for <soc@archiver.kernel.org>; Fri, 20 Jan 2023 14:01:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4AD93C4339B; Fri, 20 Jan 2023 14:01:00 +0000 (UTC)
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A195DC433D2;
	Fri, 20 Jan 2023 14:00:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A195DC433D2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 018D932003C0;
	Fri, 20 Jan 2023 09:00:56 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Fri, 20 Jan 2023 09:00:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1674223256; x=1674309656; bh=dl1KqIdtbC
	BDaAXu4lD0whfqXaxoV53e6flJTv79748=; b=PR0Nb041rqyYyrcTm7H+Kr2m71
	U7fa36JoXGSCHkmSK5x7vorPz0CHPWM8l/S7aJIuzgrRU3HAvoQNOj0naijf7bAn
	DedySQog95l6zOwywvJpNcLgqwG66h12a0mnhE3RNsEnlrsdZFwKLNMD78vgPnHo
	h6yw0Sb3gmOUUXk1nPpDeSkdgjlTE9WCp4fWmcyH6oQfR1jboyp3b1ivXUaKdbhd
	W+qh+++chHpzG1WgKiRXUdrP90xgipj/amLpZFfPCb8nBaflPXoy0Ujg68JBrHYY
	Tv0/kpbXjIn893T3xzh3NyX3Ra7O/tK3yOoyYFXgXeOHkzjTEcjGI+zYUFWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1674223256; x=1674309656; bh=dl1KqIdtbCBDaAXu4lD0whfqXaxo
	V53e6flJTv79748=; b=DmKhxtlTXNcwn6ZRHQZTxNIVwKas54sQ/Bp4SamSIKvP
	g5iZmQx014L2UFguapmDuPdqp9xSen9naVK0mqjl3Q6YIkgkFYYXkj+lF1VrWAvD
	w26potPXGX5NrKthaLbRAntYxFtKqJBSZ/tABUCfXPNMDuKPLHUM/DwIsuBdO/W1
	7uf7DkY/G7twsIeXiPmmQoFs19sq1CV9XTAMSHfzwHaTsPaJC4rnOxDg3Z5fq8+Z
	lF1J9Lu5Nh8LheugfjzE+hNaKq104Ee3wx1ghFUDPF6Uvgxd+BVx6NkVNGlhFnRC
	TYDl0yJwQJy/kvNWym7JWNGK2r8o+SvRATg076NkDg==
X-ME-Sender: <xms:lp7KY5puWGWrjH3NcxJd2YEaIqSUdLwVIkzLgrQG1jz30l6UWDsuTg>
    <xme:lp7KY7qP82ORb3rZ_2wsqd4MWAVtu-xmpUJIVAom6Z4-xJ3c3H4ZckFgDFKugioIW
    LpqXL1nmTA_vHvEToA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudduvddgiedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:lp7KY2OmrSSq_FdyrfbpdOHuANeP5UDLBBcfors64pPD5Zo2UWRPcQ>
    <xmx:lp7KY042lCNopuoSnpMZ9fx17eykMtXbgVsj9Z6dJ8CYFJ4ps0bCGw>
    <xmx:lp7KY473ED-VrBtiRxhwOBkl_q9JvYyLqLs86eN1L2XDXQ4r-JzlFw>
    <xmx:mJ7KY5GGeyn2e_uI0A1q8_VjaxSonmT3E_pxpznXnPlEG_cflt5wbA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id A47A5B60086; Fri, 20 Jan 2023 09:00:54 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-85-gd6d859e0cf-fm-20230116.001-gd6d859e0
Mime-Version: 1.0
Message-Id: <7ab893a2-2b4f-47c3-be42-684c3d8ceb5f@app.fastmail.com>
In-Reply-To: <3629553.RUnXabflUD@steina-w>
References: <20230119144236.3541751-1-alexander.stein@ew.tq-group.com>
 <2617470.BddDVKsqQX@steina-w>
 <9e2aa58c-10dc-49d0-a492-4d724cf29c2b@app.fastmail.com>
 <3629553.RUnXabflUD@steina-w>
Date: Fri, 20 Jan 2023 15:00:35 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Alexander Stein" <alexander.stein@ew.tq-group.com>,
 "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
 "Olof Johansson" <olof@lixom.net>, "Shawn Guo" <shawnguo@kernel.org>,
 "Li Yang" <leoyang.li@nxp.com>, "Russell King" <linux@armlinux.org.uk>,
 "Marek Vasut" <marex@denx.de>,
 "Marcel Ziswiler" <marcel.ziswiler@toradex.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 9/9] [DNI] ARM: multi_v7_defconfig: Enable CONFIG_ARM_LPAE for
 multi_v7_config
Content-Type: text/plain

On Fri, Jan 20, 2023, at 13:43, Alexander Stein wrote:
> Am Donnerstag, 19. Januar 2023, 17:07:30 CET schrieb Arnd Bergmann:
>> On Thu, Jan 19, 2023, at 16:27, Alexander Stein wrote:
>> 
>> In particular, it seems that the memory map of the PCI address
>> spaces is configurable, but only within that area you listed.
>> I see that section "28.4.2 PEX register descriptions" does list
>> a 64-bit prefetchable address space in addition to the 32-bit
>> non-prefetchable memory space, but the 64-bit space is not
>> listed in the DT. It would be a good idea to configure that
>> as well in order for devices to work that need a larger BAR,
>> such as a GPU, but it wouldn't help with fitting the PCIe
>> into non-LPAE 32-bit CPU address space.
>
> I'm not sure if I can follow you here. Do you have some keywords of what's 
> missing there?

Prefetchable_Memory_Base_Register, section 28.4.2.20 in the
document you pointed me to. 

PCIe addressing is usually split up into I/O space (kilobytes of
registers), non-prefetchable memory space (megabytes of registers
and memory and prefetchable 64-bit memory space (gigabytes of
device memory).

The prefetchable space is indicated by bit '30' of the first
word in the ranges property, so if that is configured, you
would see a third line there starting with 0xc2000000 or
0x42000000. Without this, PCIe cards that have prefetchable
BARs fall back to the non-prefetchable one, which may be
too small or less efficient. This is usually only relevant
for framebuffers on a GPU, but there are probably other
devices as well.

>> In the datasheet I also see that the chip theoretically
>> supports 8GB of DDR4, which would definitely put it beyond
>> the highmem limit, even with the 4G:4G memory split. Do you
>> know if there are ls1021a devices with more than 4GB of
>> installed memory?
>
> Where did you find those 8GB? Section 16.2 mentions it supports up to 4 banks/
> chip-selects which I would assume is much more. Also the memory map has a DRAM 
> region 2 for memory region 2-32GB. But yes this exceeds 32bit addressing.
> I'm not aware of ls1021 devices with more than 4GB memory. Our modules only 
> support up to 2GB.

I think I misread this, as section 2.2 mentions you can have
four chip-selects that are limited to either 2GB or 8GB each,
for a theoretical maximum of 26GB. As long as the practical
limit is 4GB or less, I think we're fine here. Linus Walleij
has is working on a prototype for changing the memory
management code to handle up to 4GB of contiguous RAM without
highmem, which will become relevant in the future as we get
rid of highmem support. On this chip, the first 4GB of
installed memory are not contiguous in the physical address
space, so this will need another set of patches on top.

As long as you only use the first chip-select with 2GB
of installed memory, very little will change for you.

It might be worthwhile to check if your system works
correctly with ARM_LPAE=y, VMSPLIT_2G=y and HIGHMEM=n,
which should be the best configuration for your system
anyway and will keep working after highmem gets removed.

    Arnd
