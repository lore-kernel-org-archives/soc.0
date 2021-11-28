Return-Path: <SRS0=trny=QP=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4983FC433F5
	for <soc@archiver.kernel.org>; Sun, 28 Nov 2021 20:52:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 164C0C53FCD; Sun, 28 Nov 2021 20:52:09 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 83BDCC004E1;
	Sun, 28 Nov 2021 20:52:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 83BDCC004E1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f49.google.com with SMTP id i13so12457063qvm.1;
        Sun, 28 Nov 2021 12:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=qqPM+9oSDb+C5bIeKnOOrRzc8/vgXxoC8kEuwdzzRWw=;
        b=U8bfBlf50QNx7gO7ZwS/b3DqSZSeOSkUK9UCiRLAZjJxnMuOeA+dkXUvZ9mvCje4gn
         invyo19u7+X9Z0rCrL+xEk4Hiz5XCSddUHEhCEhw/zBEX0GYcVaT5tWix39WBP6XIVdR
         P8QQdTDjjKLbzsBnfVdcFpIus/y4FqSil3NPOZTwI2gFKKVgEZI2rRaKhBJaCvExQ3xo
         f2Bnb2M3jI8L6gOUK+EmDUYeUtwwi1ujzxx4S4yZyhlaq5EpgGOdoDVmNIC1nzl8zHD6
         XBV/VqJhIjtMBVBgR45Lm9fhrWX6O7QOY/mTu58wzyK0kEtA9ZykgjFyT5KlUEicxowV
         Dw/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=qqPM+9oSDb+C5bIeKnOOrRzc8/vgXxoC8kEuwdzzRWw=;
        b=1A8gPVDp8jmDfEjAbluCd4GoEyOzkV4hesSSnoefwML1F1JCws1ccIz1SLviuo4H16
         tkcZBdeSIYG8qdoPCgiozwyewpW2cvyjuSJk6tSlH8IH2uTTBRput1d/kY7JjpmI1g4Q
         sQRYZ71TVPFBepT5MGKcSj1VYww98XAdqRX4IVyxleC745WnuLOhBSk1/28hIjHYyNQZ
         O5jzmMiXjfBMaG2nfnAzgay5hXrz2NT/FOwLd7CKly98E4usMh5SMrs4qXKZ2SvBYVKF
         mAZnRz0kOP2Va2LCpu8b6msofd6KatqJIZOFfI8HmorPx8YKtnf0kUuZDMO09Yahuhoc
         zqLQ==
X-Gm-Message-State: AOAM5311YdKzefpSPxjmXGJWHyw38cRRLNkAHrjVebuWCHrJIRRtNlqW
	nDr3U47N1aMnOGATX1TliSg=
X-Google-Smtp-Source: ABdhPJzZQz4CT0EURXLXhGl2+VC8pnUS0sthHbH3Vr1M4IAGTRE5tMIHPru9BRyy4GWTHa0dIsc5ZQ==
X-Received: by 2002:a05:6214:29ed:: with SMTP id jv13mr38813189qvb.8.1638132727522;
        Sun, 28 Nov 2021 12:52:07 -0800 (PST)
Received: from [10.4.10.5] (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id 139sm6696350qkn.37.2021.11.28.12.52.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Nov 2021 12:52:07 -0800 (PST)
Message-ID: <dae68360-456e-3db8-57ed-2287dc7cfd57@gmail.com>
Date: Sun, 28 Nov 2021 15:52:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v3 07/13] clk: imx: Add initial support for i.MXRT clock
 driver
Content-Language: en-US
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
References: <20211125211443.1150135-1-Mr.Bossman075@gmail.com>
 <20211125211443.1150135-8-Mr.Bossman075@gmail.com>
 <CAOMZO5Dqo6c=4nGCOakMKG8fn=V1HA7-O26t3GmwWtD-FbZiPg@mail.gmail.com>
From: Jesse Taube <mr.bossman075@gmail.com>
In-Reply-To: <CAOMZO5Dqo6c=4nGCOakMKG8fn=V1HA7-O26t3GmwWtD-FbZiPg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/28/21 15:50, Fabio Estevam wrote:
> On Thu, Nov 25, 2021 at 6:14 PM Jesse Taube <mr.bossman075@gmail.com> wrote:
>>
>> From: Jesse Taube <mr.bossman075@gmail.com>
>>
>> This patch adds initial clock driver support for the i.MXRT series.
>>
>> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
>> Suggested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>> V1->V2:
>> * Kconfig: Add new line
>> * clk-imxrt.c: Remove unused const
>> * clk-imxrt.c: Remove set parents
>> * clk-imxrt.c: Use fsl,imxrt-anatop for anatop base address
>> V2->V3:
>> * Remove unused ANATOP_BASE_ADDR
>> * Move to hw API
>> * Add GPT's own clock
>> * Add SEMC clocks to set muxing to CRITICAL
>> ---
>>   drivers/clk/imx/Kconfig     |   4 +
>>   drivers/clk/imx/Makefile    |   1 +
>>   drivers/clk/imx/clk-imxrt.c | 156 ++++++++++++++++++++++++++++++++++++
> 
> Wouldn't it be better to name it clk-imxrt1050.c instead?
we can have multiple imxrt versions in there like the other IMX clk 
drivers, is this okay?
> 
