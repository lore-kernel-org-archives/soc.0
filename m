Return-Path: <SRS0=3DD1=SZ=walle.cc=michael@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A31C2C433F5
	for <soc@archiver.kernel.org>; Thu, 10 Feb 2022 09:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8DCDAC340ED; Thu, 10 Feb 2022 09:50:29 +0000 (UTC)
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 37C8AC004E1;
	Thu, 10 Feb 2022 09:50:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 37C8AC004E1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=walle.cc
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id D2B99223EA;
	Thu, 10 Feb 2022 10:50:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1644486626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DVCxNyNvPkbMQcEKg8ORdo0LOt/uaTbu/hLOmPArtaw=;
	b=icSLTfk5pjfOEhowZinpJNH6ieyAkZGgik2WzyfLogOnOR15CipBMQAb/mgxK3Z3rnOBsZ
	dqHD4hiO0WTurBJpGyJrtYlsqtvGp13DaNmofKnd36M/3LHUUNfAIA74iXdGmVtzVBNAod
	nKzhCf3AQR8sbbZv9Kx1udFHggyQTlQ=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 10 Feb 2022 10:50:25 +0100
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
In-Reply-To: <CO1PR11MB486534A2987684CC7402CE06922F9@CO1PR11MB4865.namprd11.prod.outlook.com>
References: <20220209111318.21112-1-kavyasree.kotagiri@microchip.com>
 <20220209184600.1230365-1-michael@walle.cc>
 <CO1PR11MB486534A2987684CC7402CE06922F9@CO1PR11MB4865.namprd11.prod.outlook.com>
User-Agent: Roundcube Webmail/1.4.12
Message-ID: <97bcfa4417d5f8c41cc6aa1e411c8747@walle.cc>
X-Sender: michael@walle.cc

Am 2022-02-10 10:40, schrieb Kavyasree.Kotagiri@microchip.com:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know 
>> the
>> content is safe

>> > +     clocks {
>> [..]
>> > +
>> > +             nic_clk: nic_clk {
>> 
>> What does nic_clk stand for? If I had to guess, it
>> has something to do with network. But..
>> 
> NIC clock is the clock used by AXI, AHB fabric and APB bridges which
> connects all the peripherals.
> It is named so because the AXI fabric is based on NIC400 IP from ARM

Ok, thanks for clarification.


>> > +             watchdog: watchdog@e0090000 {
>> > +                     compatible = "snps,dw-wdt";
>> > +                     reg = <0xe0090000 0x1000>;
>> > +                     interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
>> > +                     clocks = <&nic_clk>;
>> 
>> Btw. can we disable all nodes by default and enable them
>> in the board dts files?
> I would like to have only board specific nodes enabled in dts files
> and rest of them in dtsi file

And how do you know which ones are board specific? E.g. I would like
to add our board which is also based on the lan9668. Maybe I don't
want a watchdog (or whatever node). Of course I could use

&watchdog {
   status = "disabled";
};

But IMHO opt-in is better. At least thats what we are doing for
the layerscape over on arm64.

-michael
