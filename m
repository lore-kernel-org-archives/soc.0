Return-Path: <SRS0=gtIS=QK=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E10C433EF
	for <soc@archiver.kernel.org>; Tue, 23 Nov 2021 03:13:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8EA4761040; Tue, 23 Nov 2021 03:13:41 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3630D60F70;
	Tue, 23 Nov 2021 03:13:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3630D60F70
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f46.google.com with SMTP id bu11so14008059qvb.0;
        Mon, 22 Nov 2021 19:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Sy7JaU2EDn5D2wYuyqGh4o1BUOWyto7RBqAd1Ba53AU=;
        b=lVp7SmTyo4bC69l84XIYCHz429co3+/tXnqFK2KvZYRvxj033ZXlq4sMn3O909lClG
         +N+9j3w1xiNNav8B0rlgJcmcOdN68BneiSvVDGyU09Um+v1tbjGePFsIhd7/EToH7l8J
         HUD23gTBNqiq5XGH66V6+U9Ka0g1iOPSgLkdLuJWraWOUtPu0XpNwBLK8f/pPICHEY/8
         006+EwPmVljhmm7lIvtfzCbXZ4PK7f2yJdvf/SaM9he1ethAi5EPThqtU/PG3q7fuYLs
         3LiLGCqaSXLSSeq91QI5QDT/1d45+OGepRTlfdUwE2zJHML/yiOB5cEESjb8mWKcgH4Z
         Ie/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Sy7JaU2EDn5D2wYuyqGh4o1BUOWyto7RBqAd1Ba53AU=;
        b=mNLrEBFF2cRiWyDMfsOgO94srBe109HtabejF6rAnW25iMOpBdsZWCZbT5VNhzNZq8
         TfNRh+iWgaIQhrJ3ymGAMEwkQ//a/xr7XdOOxKRc3omwcbZgQ2EYpvl3Joop9x6EPBq3
         37iq5P5BStznnmeMD6WiWkEwCt8muvlEVfo1o2+GEKbhUAF+jwxkGcDWR6fqzvrfLSCF
         xw6EfCINZn27Zpb13eMTm+iogexup0R0BXq+S+5PC5uCfw1nd41lDJZu2R+OhY8L91do
         Is1z+029hVWOWAb/BjONfjF5CJd+X9P2eLu0Eap4787d0m/rcCwechDziocrMupSpxAw
         DfCA==
X-Gm-Message-State: AOAM531w+97w8r5+mKUFUCXQGh7V8/4t1isbah2ttkqzlEtyU0b8Is91
	q7Km/cTnbJgU57dQGZcCHMI=
X-Google-Smtp-Source: ABdhPJxtys1Np0ntBaXrohAUw6BXAy5s++dHp2Us2B8HDqjYlTZcDXxEGJseqdiYfXGmvv6z/n3M5w==
X-Received: by 2002:a05:6214:2427:: with SMTP id gy7mr2449608qvb.38.1637637220347;
        Mon, 22 Nov 2021 19:13:40 -0800 (PST)
Received: from [10.4.10.38] (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id j126sm5502755qke.103.2021.11.22.19.13.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Nov 2021 19:13:39 -0800 (PST)
Message-ID: <9bcb9068-25f5-edfb-98a0-92a7e9cc1909@gmail.com>
Date: Mon, 22 Nov 2021 22:13:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 11/13] mmc: sdhci-esdhc-imx: Add sdhc support for
 i.MXRT series
Content-Language: en-US
To: Bough Chen <haibo.chen@nxp.com>, dl-linux-imx <linux-imx@nxp.com>
List-Id: <soc.lore.kernel.org>
Cc: "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
 Aisheng Dong <aisheng.dong@nxp.com>, "stefan@agner.ch" <stefan@agner.ch>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "arnd@arndb.de" <arnd@arndb.de>, "olof@lixom.net" <olof@lixom.net>,
 "soc@kernel.org" <soc@kernel.org>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 Abel Vesa <abel.vesa@nxp.com>,
 "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
 "jirislaby@kernel.org" <jirislaby@kernel.org>,
 "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>,
 "nobuhiro1.iwamatsu@toshiba.co.jp" <nobuhiro1.iwamatsu@toshiba.co.jp>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>
References: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
 <20211102225701.98944-12-Mr.Bossman075@gmail.com>
 <DB7PR04MB401021F7155E723194BA857E908C9@DB7PR04MB4010.eurprd04.prod.outlook.com>
From: Jesse Taube <mr.bossman075@gmail.com>
In-Reply-To: <DB7PR04MB401021F7155E723194BA857E908C9@DB7PR04MB4010.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/2/21 22:19, Bough Chen wrote:
>> -----Original Message-----
>> From: Jesse Taube [mailto:mr.bossman075@gmail.com]
>> Sent: 2021年11月3日 6:57
>> To: dl-linux-imx <linux-imx@nxp.com>
>> Cc: mturquette@baylibre.com; sboyd@kernel.org; robh+dt@kernel.org;
>> shawnguo@kernel.org; s.hauer@pengutronix.de; kernel@pengutronix.de;
>> festevam@gmail.com; ulf.hansson@linaro.org; Aisheng Dong
>> <aisheng.dong@nxp.com>; stefan@agner.ch; linus.walleij@linaro.org;
>> gregkh@linuxfoundation.org; arnd@arndb.de; olof@lixom.net;
>> soc@kernel.org; linux@armlinux.org.uk; Abel Vesa <abel.vesa@nxp.com>;
>> adrian.hunter@intel.com; jirislaby@kernel.org;
>> giulio.benetti@benettiengineering.com; nobuhiro1.iwamatsu@toshiba.co.jp;
>> Mr.Bossman075@gmail.com; linux-clk@vger.kernel.org;
>> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
>> linux-kernel@vger.kernel.org; linux-mmc@vger.kernel.org;
>> linux-gpio@vger.kernel.org; linux-serial@vger.kernel.org; Jesse Taube
>> <mr.bossman075@gmail.com>
>> Subject: [PATCH v2 11/13] mmc: sdhci-esdhc-imx: Add sdhc support for
> i.MXRT
>> series
>>
>> From: Jesse Taube <mr.bossman075@gmail.com>
>>
>> Add support for i.MXRT1050's sdhc.
>>
>> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>---
>> V1->V2:
>> * Nothing done
>> ---
>>   drivers/mmc/host/sdhci-esdhc-imx.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c
>> b/drivers/mmc/host/sdhci-esdhc-imx.c
>> index afaf33707d46..c852a6df5611 100644
>> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
>> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
>> @@ -305,6 +305,12 @@ static struct esdhc_soc_data usdhc_imx7ulp_data = {
>>   			| ESDHC_FLAG_PMQOS | ESDHC_FLAG_HS400
>>   			| ESDHC_FLAG_STATE_LOST_IN_LPMODE,
>>   };
>> +static struct esdhc_soc_data usdhc_imxrt_data = {
>> +	.flags = ESDHC_FLAG_USDHC | ESDHC_FLAG_MAN_TUNING
>> +			| ESDHC_FLAG_HS200 | ESDHC_FLAG_ERR004536
>> +			| ESDHC_FLAG_BROKEN_AUTO_CMD23,
>> +};
>> +
> 
> Hi Jesse,
> 	I have few question here.
> 	Why only use manual tuning here? Does this usdhc don't support
> standard tuning? or meet any issue when use standard tuning?
No std tuning works, so does cmd23, i changed it to use them.
> 	Please also double check why not use ADMA in default? Any issue
> found?
Yes this is the output with ADMA:
[0.00] mmc0: Unable to allocate ADMA buffers - falling back to standard DMA
NOTE: I did not look into why this occurs.
> 	
> 
> Best Regards
> Haibo Chen
>>
>>   static struct esdhc_soc_data usdhc_imx8qxp_data = {
>>   	.flags = ESDHC_FLAG_USDHC | ESDHC_FLAG_STD_TUNING @@ -357,6
>> +363,7 @@ static const struct of_device_id imx_esdhc_dt_ids[] = {
>>   	{ .compatible = "fsl,imx7ulp-usdhc", .data = &usdhc_imx7ulp_data, },
>>   	{ .compatible = "fsl,imx8qxp-usdhc", .data = &usdhc_imx8qxp_data, },
>>   	{ .compatible = "fsl,imx8mm-usdhc", .data = &usdhc_imx8mm_data, },
>> +	{ .compatible = "fsl,imxrt-usdhc", .data = &usdhc_imxrt_data, },
>>   	{ .compatible = "nxp,s32g2-usdhc", .data = &usdhc_s32g2_data, },
>>   	{ /* sentinel */ }
>>   };
>> --
>> 2.33.1
> 
