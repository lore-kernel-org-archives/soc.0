Return-Path: <SRS0=3DD1=SZ=walle.cc=michael@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31986C433F5
	for <soc@archiver.kernel.org>; Thu, 10 Feb 2022 13:34:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EC7ECC340E5; Thu, 10 Feb 2022 13:34:00 +0000 (UTC)
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 06731C004E1;
	Thu, 10 Feb 2022 13:33:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 06731C004E1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=walle.cc
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 174772223A;
	Thu, 10 Feb 2022 14:33:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1644500037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h4J9FNtfm4H/Vg71/QaYcfYokCooPLvGFhwoek79uZ4=;
	b=tBW2U+BezYR7cRv34ugVojO8BVegO4GvsvIVx96sgpfvYpEg7+FhV4za3XE4aUorURukY+
	zoxMZzMaaDomROmP5OQ1mN2xstEe5d9y7ajPDXVSusFXS6dmhUiqwfNeD7h1ivmip8Y4s4
	qXduz6AcEor7KH7607j0ios1t0rY5No=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 10 Feb 2022 14:33:57 +0100
From: Michael Walle <michael@walle.cc>
To: Kavyasree.Kotagiri@microchip.com
List-Id: <soc.lore.kernel.org>
Cc: Tudor.Ambarus@microchip.com, Manohar.Puri@microchip.com,
 Nicolas.Ferre@microchip.com, UNGLinuxDriver@microchip.com,
 alexandre.belloni@bootlin.com, arnd@arndb.de, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 olof@lixom.net, robh+dt@kernel.org, soc@kernel.org
Subject: Re: [PATCH v4] ARM: dts: add DT for lan966 SoC and 2-port board
 pcb8291
In-Reply-To: <CO1PR11MB4865B76B9B26EE938E3E67CE922F9@CO1PR11MB4865.namprd11.prod.outlook.com>
References: <42662481-51a4-2a4b-e39b-d3b8401cbb2c@microchip.com>
 <20220210123704.477826-1-michael@walle.cc>
 <CO1PR11MB4865B76B9B26EE938E3E67CE922F9@CO1PR11MB4865.namprd11.prod.outlook.com>
User-Agent: Roundcube Webmail/1.4.12
Message-ID: <51e33e946b096c903b0cacb5681fc6f1@walle.cc>
X-Sender: michael@walle.cc

Am 2022-02-10 14:02, schrieb Kavyasree.Kotagiri@microchip.com:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know 
>> the
>> content is safe
>> 
>> Hi,
>> 
>> >  arch/arm/boot/dts/Makefile            |   2 +
>> >  arch/arm/boot/dts/lan966x.dtsi        | 237 ++++++++++++++++++++++++++
>> >  arch/arm/boot/dts/lan966x_pcb8291.dts |  61 +++++++
>> 
>> Please rename this to lan966x-pcb8921.dts. All (most?) of the device
>> tree files use the dash as a seperator between the SoC and the board.
>> 
> Ok, I will change in my v6.
> Please have a look at my v5 patch where I already addressed all the
> node naming changes.

My comments besides the renaming still apply.

-michael
