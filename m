Return-Path: <SRS0=Q2eW=JF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34038C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 16:36:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDD22610CF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 16:36:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDD22610CF
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=W6evJbSciELcCt6MLthz+li6AWcUXvmZfRv/DB9OWz8=; b=fiDiEWwo6Gx4xfWPRqRDhLCCE
	2AJ42hbH2Nh/ucvGQl4rys17PguzzNucv2hdE1vVzzGXLn3LzVAKPLK8OdIojxHl+AQ4YAKeVRpmP
	qyn1M6LHwc4QpQGT3v34MP9/b0wt5ONI/mWPp3GhBkHivrg4eDrIQkr6CPwDN0sWsRbAk9Qh6Xo69
	xnxDh475mYv+njbJaqZ1dmxfwfE9DWIRiRywx4QEUFdJsG410Eii6SpdqNKrVVckB6Kza1/6imu2k
	49mGq7/Y5cZsuJ71viP2JTGuXDHpgTn/EerGYamnObsvJXUMFmJJi6IFPfXsq9UP0Swwsnkn7PCM/
	SrjFBalbQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUXcI-008e0k-4l; Thu, 08 Apr 2021 16:34:50 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUXcC-008dwa-2C
 for linux-arm-kernel@lists.infradead.org; Thu, 08 Apr 2021 16:34:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1617899684; x=1649435684;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=WfEHTG10xBDz0nGkP9+hAXfmCPTtjRlM1cFKSmKMj8w=;
 b=lqpBtPv0JKED1A8Z8G3zbye/zEvAA8vQ6zwGUPwOUC8q9R8WAFxk+pkc
 vHv4JivWihAmHPG7yD061q0OqpaMcDEZvYRYbwkbvLTqbYyBg/YvLpJeJ
 UKxONQvXQaH4VCKkd26qmu8n+HcYdql+6cVlO+9MwSZw3gAdYM1Fvy5O5
 dMt/C7sPc4T6/nO8zg3FiIV6BKWOnGx9pg42Eku+9xuk1/T/2AG4hySKc
 FI1trHKlnhXhYmzTS0uIBe2sBKctyRtvV2XBsOVOF6Ysql0G9zPXT3FVV
 h5UicQJzLKzmwRVrnF0+wVGr5//z+ycTSY53BmEN9GylwQn2jeyDTY7dZ A==;
IronPort-SDR: BE/jK9+Ral/0gW3kccI5onJb+ppx+Z2xYiJlIZAeJXXvcODPTV1kxD0QpVbVweHO1hygS62k3S
 LwlSUl8fUYEuYxUN4apHFzFV0OIVCtH+CPdHc5wrf03a3j70pgB/TFYoTy9DYC130RyYDYG4lG
 vIqzZXeHxAMQfEKLJEJ4R1qIqx4tHAwmNaJKjpFNHkZfDs7sW9FzdIvGhy4iasMlcFyacDxInM
 9tgcys81AKGSpYEDren4npe4wb7Gh85j8+wT+LixeG45JLMXkwgNNQuj07syYVGA5bfam2BVRe
 T4k=
X-IronPort-AV: E=Sophos;i="5.82,206,1613458800"; d="scan'208";a="112922907"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 08 Apr 2021 09:34:41 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 8 Apr 2021 09:34:40 -0700
Received: from [10.12.88.246] (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Thu, 8 Apr 2021 09:34:38 -0700
Subject: Re: [GIT PULL] ARM: at91: dt for 5.13
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@kernel.org>, <soc@kernel.org>, Olof Johansson
 <olof@lixom.net>, <arm@kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Ludovic Desroches
 <ludovic.desroches@microchip.com>, Linux Kernel list
 <linux-kernel@vger.kernel.org>
References: <20210407114415.13180-1-nicolas.ferre@microchip.com>
 <161789493817.1630479.5024717274217057698.b4-ty@arndb.de>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
Message-ID: <71b2bd27-0d3b-3331-4f79-85b22594e20b@microchip.com>
Date: Thu, 8 Apr 2021 18:34:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <161789493817.1630479.5024717274217057698.b4-ty@arndb.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_173444_704210_12BBA8E9 
X-CRM114-Status: GOOD (  17.58  )
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
Message-ID: <20210408163437.pFjAHfGWqz-B5_ZDIz1ZDpotOUyFyxF9QkXnty63FB8@z>

Hi Arnd,

On 08/04/2021 at 17:24, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> On Wed, 7 Apr 2021 13:44:15 +0200, nicolas.ferre@microchip.com wrote:
>> Arnd, Olof,
>>
>> Here is first batch of dt changes for 5.13. Please pull.
>>
>> Thanks, best regards,
>>    Nicolas
>>
>> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
>>
>> [...]
> 
> Merged into arm/dt, thanks!
> 
> I saw two new warnings from 'make dtbs_check W=1':
> 
> arch/arm/boot/dts/at91-sama5d2_ptc_ek.dt.yaml: /: 'etm@73C000' does not match any of the regexes: '@(0|[1-9a-f][0-9a-f]*)$', '^[^@]+$', 'pinctrl-[0-9]+'
> arch/arm/boot/dts/at91-kizbox3-hs.dt.yaml: /: 'etm@73C000' does not match any of the regexes: '@(0|[1-9a-f][0-9a-f]*)$', '^[^@]+$', 'pinctrl-[0-9]+'

Oh, got it: it's the upper case letter withing the etm hex address. I 
used this one to mach what was done in the reg property. I'm fixing both 
of them and sending the patch to the ml right now.

Tell me if I add it to a subsequent pull-request or if you prefer to 
take it the soonest in order to not generate additional warnings upstream.

BTW, I now have a dtschema at the proper level of support for running 
"make dtbs_check W=1" and will do it before sending pull-requests in the 
future.

Thanks for the heads-up. Best regards,
   Nicolas

> 
> merge commit: e2b064fec8e49112f7dac779fcec12ded40728c2
> 
>         Arnd
> 


-- 
Nicolas Ferre

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
