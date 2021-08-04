Return-Path: <SRS0=4PUS=M3=biot.com=bert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D00EC4338F
	for <soc@archiver.kernel.org>; Wed,  4 Aug 2021 16:42:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 27FEC60EEA; Wed,  4 Aug 2021 16:42:05 +0000 (UTC)
Received: from yawp.biot.com (yawp.biot.com [88.99.24.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7847360238
	for <soc@kernel.org>; Wed,  4 Aug 2021 16:42:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7847360238
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=biot.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=biot.com
Received: from debian-spamd by yawp.biot.com with sa-checked (Exim 4.93)
	(envelope-from <bert@biot.com>)
	id 1mBJxy-007EtD-R1
	for soc@kernel.org; Wed, 04 Aug 2021 18:42:03 +0200
Received: from [2a02:578:460c:1:ae1f:6bff:fed1:9ca8]
	by yawp.biot.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <bert@biot.com>)
	id 1mBJxs-007Esc-7G; Wed, 04 Aug 2021 18:41:56 +0200
Subject: Re: [PATCH 3/5] ARM: dts: Add basic support for EcoNet EN7523
To: Mark Rutland <mark.rutland@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>, John Crispin <john@phrozen.org>,
 Felix Fietkau <nbd@nbd.name>
References: <20210730134552.853350-1-bert@biot.com>
 <20210730134552.853350-4-bert@biot.com>
 <20210730144627.GB19569@C02TD0UTHF1T.local>
From: Bert Vermeulen <bert@biot.com>
Message-ID: <d0ff051b-280c-4021-f4ee-7bfda5e356d3@biot.com>
Date: Wed, 4 Aug 2021 18:41:55 +0200
MIME-Version: 1.0
In-Reply-To: <20210730144627.GB19569@C02TD0UTHF1T.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 7/30/21 4:46 PM, Mark Rutland wrote:
> On Fri, Jul 30, 2021 at 03:45:50PM +0200, Bert Vermeulen wrote:
>> +	timer {
>> +		compatible = "arm,armv8-timer";
> 
> This should be "arm,armv7-timer".
> 
>> +		interrupt-parent = <&gic>;
>> +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
>> +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
>> +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
>> +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
> 
> GICv3 doesn't have a cpumask in its PPI description, so the
> GIC_CPU_MASK_SIMPLE() bits should be removed.

Ok, will fix.

>> +		clock-frequency = <25000000>;
> 
> Please have your FW configure CNTFRQ on each CPU; the clock-frequency
> property in the DT is a workaround for broken FW, and it's *vastly*
> preferable for FW to configure this correctly (e.g. as it means VMs
> should "just work").

I've since got hold of the modified U-Boot that runs on my eval board, and 
indeed it doesn't set CNTFRQ. So the kernel does need this, for the moment.

I may get a chance to upstream support for this SoC in U-Boot, but I can't 
control what people are going to ship with their board. Is it ok to leave 
this in?


-- 
Bert Vermeulen
bert@biot.com
