Return-Path: <SRS0=RiwB=TE=walle.cc=michael@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FDEDC433F5
	for <soc@archiver.kernel.org>; Mon, 21 Feb 2022 07:28:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 22E6AC340EB; Mon, 21 Feb 2022 07:28:20 +0000 (UTC)
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DABACC340E9;
	Mon, 21 Feb 2022 07:28:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DABACC340E9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=walle.cc
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id A20DA2223A;
	Mon, 21 Feb 2022 08:28:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1645428488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VPDNd8ZGaYr6EuNj8Vq7XPMc5Y8ydaZmaBuwz3fu05k=;
	b=Bz3JOih8aagS5xYhpXGfMg/U0AF67+eE/wQZVOlzOf3PO1yxDzqloVpN1H1g6jccjfJqxh
	pGrLeQAocT6ZOTagme52OZ55YgOkUnX7cqu/Z5dCO8uaZRN3bhaXRbtqGUqmcb/IdL/tls
	T4eY3v6QJSW2HmXjtrp2n5kv2C2CZxE=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 21 Feb 2022 08:28:06 +0100
From: Michael Walle <michael@walle.cc>
To: Kavyasree.Kotagiri@microchip.com
List-Id: <soc.lore.kernel.org>
Cc: Manohar.Puri@microchip.com, UNGLinuxDriver@microchip.com,
 alexandre.belloni@bootlin.com, arnd@arndb.de, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Nicolas.Ferre@microchip.com, olof@lixom.net, robh+dt@kernel.org,
 soc@kernel.org
Subject: Re: [PATCH v4] ARM: dts: add DT for lan966 SoC and 2-port board
 pcb8291
In-Reply-To: <CO1PR11MB4865E667CB963C8B5DE5000B923A9@CO1PR11MB4865.namprd11.prod.outlook.com>
References: <20220209111318.21112-1-kavyasree.kotagiri@microchip.com>
 <20220209184600.1230365-1-michael@walle.cc>
 <CO1PR11MB486534A2987684CC7402CE06922F9@CO1PR11MB4865.namprd11.prod.outlook.com>
 <97bcfa4417d5f8c41cc6aa1e411c8747@walle.cc>
 <CO1PR11MB4865E913D083C1D80D4E1F80922F9@CO1PR11MB4865.namprd11.prod.outlook.com>
 <b98f40575f88a0bbf205d628f73cccac@walle.cc>
 <CO1PR11MB4865B205DF4490D37E96524792379@CO1PR11MB4865.namprd11.prod.outlook.com>
 <426e31325066cfa9f0ab50860289e12a@walle.cc>
 <CO1PR11MB4865E667CB963C8B5DE5000B923A9@CO1PR11MB4865.namprd11.prod.outlook.com>
User-Agent: Roundcube Webmail/1.4.12
Message-ID: <ee1e083c29359f2afb21d0b1457cdce0@walle.cc>
X-Sender: michael@walle.cc

Am 2022-02-21 06:44, schrieb Kavyasree.Kotagiri@microchip.com:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know 
>> the
>> content is safe
>> 
>> Am 2022-02-18 13:28, schrieb Kavyasree.Kotagiri@microchip.com:
>> >> EXTERNAL EMAIL: Do not click links or open attachments unless you know
>> >> the
>> >> content is safe
>> >>
>> >> Am 2022-02-10 12:52, schrieb Kavyasree.Kotagiri@microchip.com:
>> >> >> EXTERNAL EMAIL: Do not click links or open attachments unless you
>> know
>> >> >> the
>> >> >> content is safe
>> >> >>
>> >> >> Am 2022-02-10 10:40, schrieb Kavyasree.Kotagiri@microchip.com:
>> >> >> >> EXTERNAL EMAIL: Do not click links or open attachments unless you
>> >> know
>> >> >> >> the
>> >> >> >> content is safe
>> >> >>
>> >> >> >> > +     clocks {
>> >> >> >> [..]
>> >> >> >> > +
>> >> >> >> > +             nic_clk: nic_clk {
>> >> >> >>
>> >> >> >> What does nic_clk stand for? If I had to guess, it
>> >> >> >> has something to do with network. But..
>> >> >> >>
>> >> >> > NIC clock is the clock used by AXI, AHB fabric and APB bridges which
>> >> >> > connects all the peripherals.
>> >> >> > It is named so because the AXI fabric is based on NIC400 IP from ARM
>> >> >>
>> >> >> Ok, thanks for clarification.
>> >> >>
>> >> >>
>> >> >> >> > +             watchdog: watchdog@e0090000 {
>> >> >> >> > +                     compatible = "snps,dw-wdt";
>> >> >> >> > +                     reg = <0xe0090000 0x1000>;
>> >> >> >> > +                     interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
>> >> >> >> > +                     clocks = <&nic_clk>;
>> >> >> >>
>> >> >> >> Btw. can we disable all nodes by default and enable them
>> >> >> >> in the board dts files?
>> >> >> > I would like to have only board specific nodes enabled in dts files
>> >> >> > and rest of them in dtsi file
>> >> >>
>> >> >> And how do you know which ones are board specific? E.g. I would like
>> >> >> to add our board which is also based on the lan9668. Maybe I don't
>> >> >> want a watchdog (or whatever node). Of course I could use
>> >> >>
>> >> >> &watchdog {
>> >> >>    status = "disabled";
>> >> >> };
>> >> >>
>> >> >> But IMHO opt-in is better. At least thats what we are doing for
>> >> >> the layerscape over on arm64.
>> >> >>
>> >> > Basically, I am disabling only the nodes which have pinctrl settings
>> >> > in dtsi file
>> >> > and enable in dts to make sure there are no conflicts on pins on the
>> >> > board.
>> >>
>> >> Thats not what I'm asking. I would like to see *optional* nodes
>> >> disabled by default. Whether the watchdog is optional might be
>> >> debatable, but what about the usb controller and the qspi
>> >> controller? They don't have shared pins AFAIK, so according
>> >> to your rule, they will be enabled by default and each board
>> >> which doesn't have anything connected on these pins would have
>> >> to disabled it.
>> >>
>> >> Please keep in mind that this .dtsi will also be used by boards
>> >> not manufactured by microchip.
>> >>
>> > I agree with you - "disabling optional nodes in dtsi"
>> > I have gone through all the nodes.
>> > Confirmed and moved enabling optional node watchdog
>> > to dts file.
>> 
>> Great, I just wanted to get to an agreement how the optional nodes
>> should be handled. If it turns out, some are still optional or
>> some aren't. It is easy to just mark them disabled and enable them
>> in the board dts files in a later patch.
>> 
> Sorry, I didn't get you. Do you still see optional nodes in my dtsi?
> I think GPIO controller, Interrupt controller, XDMA, timers, AES, SHA, 
> TRNG are
> not optional. So, I keep them enabled in dtsi.

Agreed. Once you posted a new version, I'll post an RFC (or a regular
patch depending how fast this is picked up) for our board based on the
LAN966x.

-michael
