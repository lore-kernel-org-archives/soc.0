Return-Path: <SRS0=LkPm=LG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CAC1C48BCF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Jun 2021 09:24:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00E726108E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Jun 2021 09:24:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00E726108E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ur9sxEgjlkkScSRNG0i3ZF2xLGNdmEU4blmo83PCQBk=; b=TIl7RgZNl3zOggeKmNEBw9eOUZ
	3d3qfqfWeUswo0pyRCPsfL0bC3GagKRgb/7RwUkWpfzici+m1Cdb/ICTG3DwWAchMo+f8tfCBVqK9
	k8LFK1liSbNDTp5ielBa/DcQBd8yqES4QF8OBFWu/qfO3KU2EAhFRnXAMBYj4qCYt2am/1pjqCebK
	39oQiKw5QU3jSkwviXqN4EO4stYNTS1OdjTaR1hk3cGUs2PiEYG5rJcaoMSAwhA4i0C1P8ByEDiuQ
	wfLOAibgNAw0vb7VSSjmIxraQAf/JwqRoLHO3tLD6ATVQHRRJJxDSpnCn/+IMKHy6MwadZJjxww9Y
	GM8npkAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrzrI-008Bz9-6O; Sat, 12 Jun 2021 09:23:16 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrzrD-008Bxs-Nw
 for linux-arm-kernel@lists.infradead.org; Sat, 12 Jun 2021 09:23:13 +0000
Received: by mail-wm1-x334.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso9968144wmh.4
 for <linux-arm-kernel@lists.infradead.org>;
 Sat, 12 Jun 2021 02:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=SLFVhursGu66Uj/3K3eYasv4quV8R1dSmz2H6vx5rpU=;
 b=WK28YEY+mxu0dajuAkqICfBIey1HTQatNZpyxGFo9qbiP9NBSr6fYEGQvGgZht6PvO
 zgZ3hO18JVXKaAmM5D+5Inm/QkSMB7qXQbOQMcjwXtI7AAGd9Ds6z+FYgTdRksPvHV9K
 NRddoj35bs0eD2qSjrmIN2XTtz9Sj39v/8mp/NQ0Hiizde9SEIpqONigfIa8lP7VWcFS
 +/oUqFA8gS2wSPDguVPykI/8tTIbcYVfG8Q7ozpdmng2VRC6U5s/yctnI7Y+29vn4FV5
 ajmyKmYRbD4drWDkWw9aUhJJtnFT2ke+bxA1q0v9yiwYG/hvWurJMQqq5/CXSvr/AVqv
 ohFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=SLFVhursGu66Uj/3K3eYasv4quV8R1dSmz2H6vx5rpU=;
 b=eul2Od2BqiSpLwnzd16c5nXGxVYOE++gJ4g1MzGqNXgUuXKvlewbXG8/nWmCxmWh2c
 GwNUOLvIEtySSZgUHQn04xeZiArKC0JKR2kKuOv8fgNHKu631UXXV2BdIDoK3VAljnxO
 aCxKi1Pwv/54etuCxRuqMgdZFrH1g+lE+MGP10K3gqCBZ5kLG/S24gSQjAzo/nrcWmMH
 MCs6HO8p8KA0JmNeC48uY9P3JXINf2c4LFj0cx76xB2EMA5Isf8JZmljr6eL2baLCIM2
 cvOGN5J3D1gl1SdCH1YGWTXAYnNmcuW4eAYIek+LZ+8ZolPy7BVN+ErNZ9fMAnut7QMh
 5XeA==
X-Gm-Message-State: AOAM532kdZRt5VFtYkjBE/p0XakdG/lQxiQOK30T+YCn+GX0XOPISnVk
 5LNLaLQjz+j0zcsjPcEC7Ldr7hFxZRdQ/Q==
X-Google-Smtp-Source: ABdhPJzgicMpzLh5bZMPsx62eBNKrcy04WIKYCttKwTTO0YhKS4Ms+svmfp8nsdqmDgGKwUZ4BIHQw==
X-Received: by 2002:a7b:c1ce:: with SMTP id a14mr24077747wmj.180.1623489788393; 
 Sat, 12 Jun 2021 02:23:08 -0700 (PDT)
Received: from localhost.localdomain (haganm.plus.com. [212.159.108.31])
 by smtp.gmail.com with ESMTPSA id a3sm10262253wra.4.2021.06.12.02.23.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Jun 2021 02:23:08 -0700 (PDT)
Subject: Re: [PATCH v2 2/5] ARM: dts: NSP: Add Meraki MX64/MX65 to Makefile
To: Vladimir Oltean <olteanv@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Krzysztof Kozlowski
 <krzk@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20210610232727.1383117-1-mnhagan88@gmail.com>
 <20210610232727.1383117-3-mnhagan88@gmail.com>
 <20210611202434.flnqrzbbxicw5c3t@skbuf>
From: Matthew Hagan <mnhagan88@gmail.com>
Message-ID: <e9d5fffd-4483-8342-c97e-a115894ca93b@gmail.com>
Date: Sat, 12 Jun 2021 10:23:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210611202434.flnqrzbbxicw5c3t@skbuf>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210612_022311_818247_4F20A4B9 
X-CRM114-Status: GOOD (  18.56  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210612092306.9_rdS9WLZLKSg3D9pL6PV0RGvpVIx6fzDtqde2iuaSY@z>


On 11/06/2021 21:24, Vladimir Oltean wrote:
> On Fri, Jun 11, 2021 at 12:27:14AM +0100, Matthew Hagan wrote:
>> Add Makefile entries for the Meraki MX64/MX65 series devices.
>>
>> Signed-off-by: Matthew Hagan <mnhagan88@gmail.com>
>> ---
>>  arch/arm/boot/dts/Makefile | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>> index f8f09c5066e7..033d9604db60 100644
>> --- a/arch/arm/boot/dts/Makefile
>> +++ b/arch/arm/boot/dts/Makefile
>> @@ -154,6 +154,12 @@ dtb-$(CONFIG_ARCH_BCM_NSP) += \
>>  	bcm958525xmc.dtb \
>>  	bcm958622hr.dtb \
>>  	bcm958623hr.dtb \
>> +	bcm958625-meraki-mx64.dtb \
>> +	bcm958625-meraki-mx64-a0.dtb \
>> +	bcm958625-meraki-mx64w.dtb \
>> +	bcm958625-meraki-mx64w-a0.dtb \
>> +	bcm958625-meraki-mx65.dtb \
>> +	bcm958625-meraki-mx65w.dtb \
>>  	bcm958625hr.dtb \
>>  	bcm988312hr.dtb \
>>  	bcm958625k.dtb
>> -- 
>> 2.26.3
>>
> It is odd to add the device trees to the Makefile in a separate patch
> compared to their actual introduction. Does the tree even compile at
> this stage?

Will rectify this. Thanks!


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
