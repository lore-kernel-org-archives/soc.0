Return-Path: <maz@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=BAYES_00,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57CC3C4338F
	for <soc@archiver.kernel.org>; Fri, 30 Jul 2021 17:23:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2098760F4A; Fri, 30 Jul 2021 17:23:48 +0000 (UTC)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 1897B60F46;
	Fri, 30 Jul 2021 17:23:48 +0000 (UTC)
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <maz@kernel.org>)
	id 1m9WEc-0023SG-2d; Fri, 30 Jul 2021 18:23:46 +0100
MIME-Version: 1.0
Date: Fri, 30 Jul 2021 18:23:45 +0100
From: Marc Zyngier <maz@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: Bert Vermeulen <bert@biot.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Arnd
 Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>, John Crispin <john@phrozen.org>, Felix
 Fietkau <nbd@nbd.name>
Subject: Re: [PATCH 3/5] ARM: dts: Add basic support for EcoNet EN7523
In-Reply-To: <20210730174704.48c9a94f@slackpad.fritz.box>
References: <20210730134552.853350-1-bert@biot.com>
 <20210730134552.853350-4-bert@biot.com>
 <20210730174704.48c9a94f@slackpad.fritz.box>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <24022638b2ba18c14731efe4f11ed8ab@kernel.org>
X-Sender: maz@kernel.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: andre.przywara@arm.com, bert@biot.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, arnd@arndb.de, olof@lixom.net, soc@kernel.org, robh+dt@kernel.org, john@phrozen.org, nbd@nbd.name
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false

On 2021-07-30 17:47, Andre Przywara wrote:
> On Fri, 30 Jul 2021 15:45:50 +0200
> Bert Vermeulen <bert@biot.com> wrote:
> 
>> +		compatible = "arm,gic-v3";
>> +		interrupt-controller;
>> +		#interrupt-cells = <3>;
>> +		#address-cells = <1>;
>> +		#size-cells = <1>;
>> +		reg = <0x09000000 0x20000>,
> 
> Mmh, 128K for the distributor, is that actually right? Is that to cover
> some GIC-500 MBI aliases? I don't think we announce this in the DT,
> though?

We do, but not this way. There is a documented binding to that effect.

         M.
-- 
Jazz is not dead. It just smells funny...
