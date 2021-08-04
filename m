Return-Path: <SRS0=0Qs2=M3=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF8A8C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Aug 2021 16:43:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9CBB60EEA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Aug 2021 16:43:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A9CBB60EEA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=biot.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qhuUhxP7coOxGbbdKa8/ZFoaoTfe1ZS+OJ/pAbYTOxM=; b=q87aM93eJl5Dee9ZMYntAQluHp
	yzXYCM8pDnKAt/gpK6lezlT5h9LQXEVkZ5F5vmGMDhUMdyoJKRgHVKwETRhpU1LtyqW1kMNxMMnHp
	Z+3eKSPf9pnfag+CaNX5b7v+9yop2onxF/15A93rNCxVR0EYB18Ya63QRl+mB+zDYyHUyeVrf+CbY
	K38q1l3j/tofT3mJxZt44oFp7Xi3JlznRLO9lMVxGAn7N6nopPQA/Zh7KG9nfZp17wWtIBCfZ0dtU
	N5FOgA45g0mw8rITqKmbM2mva8XlvZO1Ubpb5aFizIYc+rS6s9vc1Lczi1Omb4NF/WjDfgxprLVNo
	hh/2LsMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBJyB-006nKS-OL; Wed, 04 Aug 2021 16:42:15 +0000
Received: from yawp.biot.com ([2a01:4f8:10a:8e::fce2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBJy8-006nIO-1B
 for linux-arm-kernel@lists.infradead.org; Wed, 04 Aug 2021 16:42:13 +0000
Received: from debian-spamd by yawp.biot.com with sa-checked (Exim 4.93)
 (envelope-from <bert@biot.com>) id 1mBJy3-007Etl-2V
 for linux-arm-kernel@lists.infradead.org; Wed, 04 Aug 2021 18:42:07 +0200
Received: from [2a02:578:460c:1:ae1f:6bff:fed1:9ca8]
 by yawp.biot.com with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
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
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_094212_130253_9DEE4B55 
X-CRM114-Status: GOOD (  17.65  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210804164155.TATLOdRPNzO65ub96-phv58gEvo50egVDeNyRUj6rQ8@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
