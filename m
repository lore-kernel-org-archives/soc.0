Return-Path: <SRS0=mpRk=HM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1CC3C43331
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Feb 2021 12:58:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9664064E3B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Feb 2021 12:58:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9664064E3B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KDlwTsuWeE86f7RO21mjnDGji9p9Uyba2c7J3L1B3rY=; b=A7wmHtGIdipjTnKVeQasvFO2v
	kKdy6oby8fvw7h8OLeIMR9ULd42e+6NxTdmhEAMS0r6OvXC0h+Z7M/HV2aDDhCYntspXdB7YTrpDT
	amDsUi7oBvOXb1AI7HqScIBBfkk5WMZ1ua+udPN7M6Uf1X9IgfidzwgTWR2dMnLREC5d7YzbEx3ss
	8ZbkQxh2VYXsg4xGGWjHkSoRqmJz28CbKpSE4O9YqKY/7fTNSLqk5Vh44GrxSceaScH8w1Hb5iXlw
	bOXCMBVlnDmFTbkhkUrgY2f0b5hqhsaWWNlyJTrfJOo53cPLne04Ar2aaTzbBZmvXfrn+l/COme/F
	5ZxU1juOQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9p2h-00026x-4H; Wed, 10 Feb 2021 12:56:27 +0000
Received: from marcansoft.com ([2a01:298:fe:f::2] helo=mail.marcansoft.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9p2X-00022x-QC
 for linux-arm-kernel@lists.infradead.org; Wed, 10 Feb 2021 12:56:19 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: marcan@marcan.st)
 by mail.marcansoft.com (Postfix) with ESMTPSA id B7B3541FA3;
 Wed, 10 Feb 2021 12:56:10 +0000 (UTC)
Subject: Re: [PATCH 18/18] arm64: apple: Add initial Mac Mini 2020 (M1)
 devicetree
To: Daniel Palmer <daniel@0x0f.com>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-19-marcan@marcan.st>
 <20210208110441.25qc6yken4effd6c@kozik-lap>
 <cd67b2ce-9676-31b4-85f7-de1ec9b2bf72@marcan.st>
 <YCOzLSqdsr83xf0b@atomide.com>
 <4481998a-27f6-951e-bb4f-a9d2b95f211f@marcan.st>
 <YCPE2lPpBlhCi7TH@atomide.com>
 <4dd911d8-ce84-bf4d-3aae-95ef321b4a97@marcan.st>
 <CAFr9PXkLRKHguszidJX2Qit0QUJ0QxFi3H=Wp2HDqpfJQYZEVw@mail.gmail.com>
From: Hector Martin <marcan@marcan.st>
Message-ID: <3d61ca6d-98a1-b78a-07da-cd20834de5a1@marcan.st>
Date: Wed, 10 Feb 2021 21:56:08 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAFr9PXkLRKHguszidJX2Qit0QUJ0QxFi3H=Wp2HDqpfJQYZEVw@mail.gmail.com>
Content-Language: es-ES
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_075618_093130_59A951D8 
X-CRM114-Status: GOOD (  18.19  )
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
Cc: Arnd Bergmann <arnd@kernel.org>, DTML <devicetree@vger.kernel.org>,
 Tony Lindgren <tony@atomide.com>, Marc Zyngier <maz@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, SoC Team <soc@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Olof Johansson <olof@lixom.net>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210210125608.FUwXoGEB7XxgnG7ukGFupHXyJeREZt30cvTvVzDxrNM@z>

On 10/02/2021 21.24, Daniel Palmer wrote:
> This exact problem exists for MStar/SigmaStar too.
> As it stands there is no documentation to show what the actual clock
> tree looks like so everything is guess and I need to come up with numbers.
> I'm interested to see what the solution to this is as it will come up again
> when mainlining chips without documentation.

So far the answer seems to be to take the best guess available, and then 
we get to fix it until we have real users and breaking DT compatibility 
is no longer an option... :-)

>> The purpose of the clock in this particular case is just to make the
>> uart driver work, since it wants to know its reference clock; there is
>> work to be done here to figure out the real clock tree
> 
> FWIW arm/boot/dts/mstar-v7.dtsi has the same issue: Needs uart,
> has no uart clock. In that instance the uart clock setup by u-boot
> is passed to the uart driver as a property instead of creating a fake
> clock.

In our case it's an existing driver (with patches) that is already 
integrated with the clock infrastructure, so it makes sense to use a 
fixed-clock instead of just an ad-hoc property.

-- 
Hector Martin (marcan@marcan.st)
Public Key: https://mrcn.st/pub

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
