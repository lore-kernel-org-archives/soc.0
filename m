Return-Path: <SRS0=mpRk=HM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE064C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Feb 2021 11:09:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACCD864E25
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Feb 2021 11:09:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACCD864E25
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=o+mfzL3ixpFPmiDHr7RMGMO6UauVIbdzM4t58YE3BrQ=; b=LQl6D7GOaVgj3jY1J3zBZ0veM
	fPZb7fAS/fOrIXWm3OV4eqLU1ZVcLjzLJcq2dnyuaFQrdKim3Ej8nVHLx9fEsspcZvsp2zuPNdABw
	4EozcZn7WzUUnxvD+Gj1P7vEXLXAuOogwRcuRlKKhoUcCzxkkQXKWdKGeD1D8XIx/kclKI+Y8/W3q
	QVFxUipNtcXXs3h0vDwvQSUNGPSk3XlivMPhJPZH4kd8+BUa04ftab+ZlguL7oNDm2Ul8tWGIn7yk
	02Iuw6XQxJZWBe0B5Sy3O5mM094o8jhVxFvPhZo7mhHfaM4UaCJwplX3ZtY/3kFqXX51pqtZ//NsH
	n6VPUjDhg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9nLm-0000k4-RG; Wed, 10 Feb 2021 11:08:02 +0000
Received: from marcansoft.com ([212.63.210.85] helo=mail.marcansoft.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9nLj-0000if-OU
 for linux-arm-kernel@lists.infradead.org; Wed, 10 Feb 2021 11:08:01 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: marcan@marcan.st)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 3B9FC41FA3;
 Wed, 10 Feb 2021 11:07:52 +0000 (UTC)
To: Tony Lindgren <tony@atomide.com>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-19-marcan@marcan.st>
 <20210208110441.25qc6yken4effd6c@kozik-lap>
 <cd67b2ce-9676-31b4-85f7-de1ec9b2bf72@marcan.st>
 <YCOzLSqdsr83xf0b@atomide.com>
From: Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 18/18] arm64: apple: Add initial Mac Mini 2020 (M1)
 devicetree
Message-ID: <4481998a-27f6-951e-bb4f-a9d2b95f211f@marcan.st>
Date: Wed, 10 Feb 2021 20:07:49 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <YCOzLSqdsr83xf0b@atomide.com>
Content-Language: es-ES
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_060759_920426_7E03F439 
X-CRM114-Status: GOOD (  15.80  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, devicetree@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, soc@kernel.org, robh+dt@kernel.org,
 Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210210110749.24nlqJqfl5GROOeCM-hCT8FpPbZfIdch1VYyG_F0dY4@z>

On 10/02/2021 19.19, Tony Lindgren wrote:
> * Hector Martin 'marcan' <marcan@marcan.st> [210208 12:05]:
>> On 08/02/2021 20.04, Krzysztof Kozlowski wrote:
> ...
> 
>>>> +	clk24: clk24 {
>>>
>>> Just "clock". Node names should be generic.
>>
>> Really? Almost every other device device tree uses unique clock node names.
> 
> Yeah please just use generic node name "clock". FYI, we're still hurting
> because of this for the TI clock node names years after because the drivers
> got a chance to rely on the clock node name..
> 
> Using "clock" means your clock driver code won't get a chance to wrongly
> use the node name and you avoid similar issues.

That means it'll end up like this (so that we can have more than one 
fixed-clock):

clocks {
     #address-cells = <1>;
     #size-cells = <0>;

     clk123: clock@0 {
         ...
         reg = <0>
     }

     clk456: clock@1 {
         ...
         reg = <1>
     }
}

Correct?

Incidentally, there is just one example in the kernel tree of doing this 
right (in arch/arm/boot/dts/imx6qdl-tx6.dtsi). All the others that use 
non-mmio clocks called `clock`, including the various tegra devicetrees, 
violate the DT spec by not including a dummy reg property matching the 
unit-address.

-- 
Hector Martin (marcan@marcan.st)
Public Key: https://mrcn.st/pub

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
