Return-Path: <SRS0=YOEr=PV=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78743C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Nov 2021 23:27:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D90660EB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Nov 2021 23:27:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3D90660EB9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GTRX1Dcmlq9l3CdxCkagt/pIutQQ1pckS6KeD9WRCl0=; b=G9667XZypoeU5y
	ExoRAkNMFL4aEaHXXwCvfgP+HAX51jURqT7DO78RysRhb9xtocVahnOcyRpA0hRk+sdMJfcaG4aCb
	P1lHgF4fmiywyfS4jBxFlKGUJ2N1+7oWOg3URSu4L3MX7tFq9p2KT7x+mYtxTJ4ZnnloiEKtelWqr
	8GTrxkBy4oo82Kz5mSZkgcb6zko1Kregbu26c//7dkWmQSYeAXKUI3BA6qTRMCSbINkiV3dqsA6Dp
	LX/vvo6L8897djq1bkRhXnoeupPk4KfuDxyj5PLEUkWWSQNw1/KX6a5hhRzAzUshVV+hdPQLbjuna
	Ja7sewW4EPP58FhoFRwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mi3AF-003O2v-PV; Tue, 02 Nov 2021 23:25:59 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mi3AB-003O1x-OV
 for linux-arm-kernel@lists.infradead.org; Tue, 02 Nov 2021 23:25:57 +0000
Received: by mail-qv1-xf31.google.com with SMTP id d6so706880qvb.3
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 02 Nov 2021 16:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=1Q2vdfG7RGBNovRi6ZQgZ1wF88cREbVfT7Wm+Vm56C0=;
 b=nin7+qKSHkzYWEGvEdvgnH3/O8EKsM31mjLCTIVDC0RU6Gjmc6FDyPc3T7eF1RLPbV
 q+so6Yb1Mj9jH6UXA2ptlzJYWBOKXBKRIrWI6pfZntqMT5T8QuT7O6mLm5RZqOThkg8j
 VfijQqx9EXqMw/1Lt/mInH5GPH3krcyc3y8Xl/JPvvxIZzizcIU8bUJUjFq3RzlipP7B
 QKzywxYCjyBUh0Bqv/3+7N6sbK+brvEPio3NBypN15XXjUPuKu92W7ydx+jERRd1+w+Y
 4bmPiTDHiXBJr8+sl6WQ3KzH+8mU+04ZEHriY+Drn+c4+lfz5PorTr4Kb6P+mM5+LlQK
 +tfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1Q2vdfG7RGBNovRi6ZQgZ1wF88cREbVfT7Wm+Vm56C0=;
 b=rvITs/kksRghDxgMG5oXFdGbS0XTunHdONKF2WcjGqq7HS+HbAIFNt+ykuscNUjf4q
 pdWpc9BJkRt4EMCiOes70fhB0FHYPJnDP3/j1ojbI9zf4czSvGvTdeIL5M9M0c2AaJlq
 7k+VVyN4EiZUqEYdRFBYE4Zu9zHmngnR6a/jSlDB9fSoqXlQ0Zj8FCSBtCoN4GOAev14
 MWUsCqVFB3NwoSe/vwEyoib2ZTU7xZg2XZMBXhZrR19rGVr/faM/2UWVrmlorbC6v4DP
 HbqwYxox3ehsYusW8Lo1kvmyC7vZPNWxBeMcjPTwlQNa0JKyvB/7l5oy8nZiKI4XroDC
 wy5w==
X-Gm-Message-State: AOAM532/AP0wbq5/811xkmvIUxTnJqtiZk+5eBdqqITeopJCaBJd8UK7
 T2jIU1HaW3BJNjvqGx0BYMo=
X-Google-Smtp-Source: ABdhPJy433blIlKuyCcnmKWrFmRgcmIIJ8Ghs12aXE0aeRJk94WZUPEN2SxC+eIuy2D2cCyxLBwFRA==
X-Received: by 2002:ac8:3d49:: with SMTP id u9mr42492742qtf.264.1635895554931; 
 Tue, 02 Nov 2021 16:25:54 -0700 (PDT)
Received: from [10.4.10.38]
 (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com.
 [146.115.144.188])
 by smtp.gmail.com with ESMTPSA id k16sm295890qkj.70.2021.11.02.16.25.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 16:25:54 -0700 (PDT)
Message-ID: <c1610093-95ae-68d3-57ae-93b1bc9715d7@gmail.com>
Date: Tue, 2 Nov 2021 19:25:52 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v2 11/13] mmc: sdhci-esdhc-imx: Add sdhc support for
 i.MXRT series
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
References: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
 <20211102225701.98944-12-Mr.Bossman075@gmail.com>
 <CAOMZO5AxMXxDkNDqGJDhtepqSUxGRCWO+L=c67O==4fx66M7XQ@mail.gmail.com>
From: Jesse Taube <mr.bossman075@gmail.com>
In-Reply-To: <CAOMZO5AxMXxDkNDqGJDhtepqSUxGRCWO+L=c67O==4fx66M7XQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_162555_867709_94023773 
X-CRM114-Status: GOOD (  19.23  )
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
Message-ID: <20211102232552.k8--3T7HeMOY1nVuG3qtj5xi-brSg26zNQmrpos6Pb0@z>



On 11/2/21 19:17, Fabio Estevam wrote:
> On Tue, Nov 2, 2021 at 7:57 PM Jesse Taube <mr.bossman075@gmail.com> wrote:
> 
>>   static struct esdhc_soc_data usdhc_imx8qxp_data = {
>>          .flags = ESDHC_FLAG_USDHC | ESDHC_FLAG_STD_TUNING
>> @@ -357,6 +363,7 @@ static const struct of_device_id imx_esdhc_dt_ids[] = {
>>          { .compatible = "fsl,imx7ulp-usdhc", .data = &usdhc_imx7ulp_data, },
>>          { .compatible = "fsl,imx8qxp-usdhc", .data = &usdhc_imx8qxp_data, },
>>          { .compatible = "fsl,imx8mm-usdhc", .data = &usdhc_imx8mm_data, },
>> +       { .compatible = "fsl,imxrt-usdhc", .data = &usdhc_imxrt_data, },
> 
> I thought Rob suggested to use the SoC name, so this would be:
> 
Uh i think that may have been for the UART.
> { .compatible = "fsl,imxrt1050-usdhc", .data = &usdhc_imxrt1050_data, },
> 
> The same applies to the other bindings in the series.
> 
> This way it would be possible to differentiate between future
> supported i.MX RT devices.
> 
This makes sense will do in V3.

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
