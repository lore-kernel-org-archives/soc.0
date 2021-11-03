Return-Path: <SRS0=8DV1=PW=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32CBAC433EF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Nov 2021 02:20:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA56360E0C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Nov 2021 02:20:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EA56360E0C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ow3Z1kVsTJTiKewn1/Gqe1wuwbIEVgu0Th5pESK/7eo=; b=WX5tV5AwtNjl90
	lTJwWZ8jAwT2MTNsIvT70eldEdHlbuGzSleaqhQFDhFT6mwHA9Zav9fsNjMzoHegdgWHWTTQNVN5w
	a1E/hlj2yUGxgcJ+wOJmYpbcusRFF0X6vZ1aWJcGG/T89son0KkfDn0CgTqNMFlg6txhPRUTtThdN
	KXzTYb7XCDETEh1i7Y2A/+sdcsADLX20GPQRth/ndR90KmoiykEQEeJXydwXO2m2NJAAjoJAVaVAq
	5J89QHc8iOnxU48fcIj+61u9rxNRYib/lMI42jyvrv4RhFDa9jsi2D6Hq+rT6ZWYSGvbJe0WWBSFt
	arVSysKXPDwImZMy4P5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mi5rw-003rWZ-4P; Wed, 03 Nov 2021 02:19:16 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mi5rt-003rVk-Ap
 for linux-arm-kernel@lists.infradead.org; Wed, 03 Nov 2021 02:19:14 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id bu11so1235553qvb.0
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 02 Nov 2021 19:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=L6N++OXbiQ++WWRxdLoBQIcLBmefSWDWQ3m0E3cuKUs=;
 b=QDvkU+3x9rPI046k0PUyt5niFs4wNe+UzIm+fLt/bZUbPNBPkfgNawdhqePx+1HSkn
 bKR+udI4YDieAFP9AWzR19vifU7sAg8eAYvMJQzQd+GtwXcRbuuD4ebXyJlAShYRuYHc
 v1gBTGNXVPSOdfDXkD626nKdU2aGCTzo61gg38xBPkt38PqWvoKmz44uBYKL/dX0KxLj
 C+G5gD4nHiT8mXQ6UfBN9o2Xu62m9HrS81gnVZh25X6KUErMohg/Ov2iBN1QMwTTzRWy
 k3GSJ9c1ikCSblEP/gzGnqQc09JS1QzqBp+CEgi8UBZiJMbvFdYmxzuozDhK28BR/r+i
 xF7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=L6N++OXbiQ++WWRxdLoBQIcLBmefSWDWQ3m0E3cuKUs=;
 b=e50p8loLhqMLYTsrO1hWNswoMr6HL+noGcE3wgkq9ksfUI6CpMLlgkpf58K7msM4uH
 6ev9lRfQV998ElKcFyHwD+8555DiUzdm0CGdYIN4+H6VQN8Cb84Kel0sNHUUtdTJvP63
 9cnh+Qa7cuyQS1EaFDne53GKRzPF+fJDMeYZ+R9KXRbdvMZVpMvZZ5PnaOsnaK3f5HzS
 NggcQsJke6nCRMJzq9gGigHlqxoKTh6v03nRXp6Hiuypv8DEFrB00n8+eVzj+kxT7ukP
 KtRV1Cla3gnqR7UaHj5eh2udwJ3Uq44Mp7D0we2/sZziYy+G3aise4xhZi+cgB7kML0n
 ULmA==
X-Gm-Message-State: AOAM532xXNAk9GJU4vSMaxxvlCyIu5Id6ahYjDLsqBE6dg4RUNQAPnFy
 jupHzcgNw0BZoMIr7KoMwDI=
X-Google-Smtp-Source: ABdhPJyStGa6ALGT7a9HuLOAfF37IRWpJUhJou9Ga7+i3LE11S7fpDMhER3fzk6jVgwNT6vkr4BY4w==
X-Received: by 2002:ad4:43e8:: with SMTP id f8mr40707115qvu.41.1635905950891; 
 Tue, 02 Nov 2021 19:19:10 -0700 (PDT)
Received: from [10.4.10.38]
 (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com.
 [146.115.144.188])
 by smtp.gmail.com with ESMTPSA id s13sm605316qki.23.2021.11.02.19.19.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 19:19:10 -0700 (PDT)
Message-ID: <2fbe7ced-60a7-2fd2-6032-e4ddae21b565@gmail.com>
Date: Tue, 2 Nov 2021 22:19:08 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v2 12/13] ARM: dts: imx: add i.MXRT1050-EVK support
Content-Language: en-US
From: Jesse Taube <mr.bossman075@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: NXP Linux Team <linux-imx@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sascha Hauer <kernel@pengutronix.de>, Ulf Hansson <ulf.hansson@linaro.org>,
 Dong Aisheng <aisheng.dong@nxp.com>, Stefan Agner <stefan@agner.ch>,
 Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Russell King - ARM Linux <linux@armlinux.org.uk>,
 Abel Vesa <abel.vesa@nxp.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Jiri Slaby <jirislaby@kernel.org>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 linux-clk <linux-clk@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-serial@vger.kernel.org
References: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
 <20211102225701.98944-13-Mr.Bossman075@gmail.com>
 <CAOMZO5DV-6dKnaGMgARhtv7mq-nOr9jO-XUWAJDmJWwNxc+B1g@mail.gmail.com>
 <e2f81ad7-9c58-3e39-fbb0-5ef3132bba7d@gmail.com>
In-Reply-To: <e2f81ad7-9c58-3e39-fbb0-5ef3132bba7d@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_191913_432019_0EEF26B4 
X-CRM114-Status: GOOD (  22.24  )
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
Message-ID: <20211103021908.4VXDcD_rlL8aW7hIL9c1Jglq7WRWMxfBq2duNrd3dN0@z>



On 11/2/21 19:54, Jesse Taube wrote:
> 
> 
> On 11/2/21 19:42, Fabio Estevam wrote:
>> On Tue, Nov 2, 2021 at 7:57 PM Jesse Taube <mr.bossman075@gmail.com> wrote:
>>
>>> +/ {
>>> +       model = "NXP IMXRT1050-evk board";
>>> +       compatible = "fsl,imxrt1050-evk", "fsl,imxrt1050";
>>> +
>>> +       chosen {
>>> +               bootargs = "root=/dev/ram";
>>
>> No need to pass bootargs here.
>>
>>> +               stdout-path = &lpuart1;
>>> +       };
>>> +
>>> +       aliases {
>>> +               gpio0 = &gpio1;
>>> +               gpio1 = &gpio2;
>>> +               gpio2 = &gpio3;
>>> +               gpio3 = &gpio4;
>>> +               gpio4 = &gpio5;
>>> +               mmc0 = &usdhc1;
>>> +               serial0 = &lpuart1;
>>> +       };
>>> +
>>> +       memory@0 {
>>
>> memory@80000000
>>
>> Building with W=1 should give a dtc warning due to the unit address
>> and reg mismatch.
> Oh that makes sense.
> I guess I'm going to have to figure out how to get warnings to work as I
> couldn't last time I tried.
Oh i got it to work I did something dumb...
I didn't give a warning for this i still changed it of course.
>>
>>> +               device_type = "memory";
>>> +               reg = <0x80000000 0x2000000>;
>>> +       };
>>> +
>>
>> Unneeded blank line.
>>> +
>>> +&iomuxc {
>>> +       pinctrl-names = "default";
>>> +
>>> +       imxrt1050-evk {
>>
>> No need for this imxrt1050-evk container.
> I was wondering if that was needed, u-boot has it, good to know.
>>
>>> +               pinctrl_lpuart1: lpuart1grp {
>>> +                       fsl,pins = <
>>> +                               MXRT1050_IOMUXC_GPIO_AD_B0_12_LPUART1_TXD
>>> +                                       0xf1
>>
>> Put it on a single line. It helps readability. Same applies globally.
>>> +&usdhc1 {
>>> +       pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
>>> +       pinctrl-0 = <&pinctrl_usdhc0>;
>>> +       pinctrl-1 = <&pinctrl_usdhc0>;
>>> +       pinctrl-2 = <&pinctrl_usdhc0>;
>>> +       pinctrl-3 = <&pinctrl_usdhc0>;
>>> +       status = "okay";
>>> +
>>> +       cd-gpios = <&gpio2 28 GPIO_ACTIVE_LOW>;
>>
>> Make 'status' to be the last property. Remove the blank line.
>>
>>> +               edma1: dma-controller@400e8000 {
>>> +                       #dma-cells = <2>;
>>> +                       compatible = "fsl,imx7ulp-edma";
>>> +                       reg = <0x400e8000 0x4000>,
>>> +                               <0x400ec000 0x4000>;
>>> +                       dma-channels = <32>;
>>> +                       interrupts = <0>,
>>> +                               <1>,
>>> +                               <2>,
>>> +                               <3>,
>>> +                               <4>,
>>> +                               <5>,
>>> +                               <6>,
>>> +                               <7>,
>>> +                               <8>,
>>> +                               <9>,
>>> +                               <10>,
>>> +                               <11>,
>>> +                               <12>,
>>> +                               <13>,
>>> +                               <14>,
>>> +                               <15>,
>>> +                               <16>;
>>
>> Please group more elements into the same line.
>>
>> Putting one entry per line makes it extremely long.
>>
>>> +               gpio5: gpio@400c0000 {
>>> +                       compatible = "fsl,imxrt-gpio", "fsl,imx35-gpio";
>>> +                       reg = <0x400c0000 0x4000>;
>>> +                       interrupts = <88>,
>>> +                               <89>;
>>
>> Put the interrupts into a single line.
>>
> Ah all these make sense, will fix, sry about that.
> 

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
