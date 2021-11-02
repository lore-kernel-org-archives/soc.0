Return-Path: <SRS0=YOEr=PV=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E446C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Nov 2021 23:39:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A12260FC2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Nov 2021 23:39:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4A12260FC2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A7mm1vzIq8MtTmr4eDIKQigEkJto8kdXobcQ3fk+5z8=; b=AY0o3vQbLn6gTq
	rN0krWkPFxuz8Hn+Qvm9bX2B8xJh6S8LOnYo6F8Giof1fCILf3z1+SicUc/lNBXoabi42C/5atjWb
	t3Tj8xdSj5WGw3mIJYC68WStJ5W6LmcCYpN8h/mYnzmaqNr83kFVq1vSyv7MWwv3p2Dx0PXY4ml9Z
	1C2t01JpO8rDWq8OXQ9p1v6CWAHCgn8TLCRzCBgPv6yNTJAJ/KuHK5VKt90+XqR/mTG5idzo5DQNM
	DxVdokuBpGrZ3sEquG2PTQBLgkIJzmVJqywVf2r/BquMToBeSVHm2R2ATOO/sFAJBMhjLvuNU2GrY
	EyVEsbccQ+n2NRwb5kyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mi3M1-003QJm-RT; Tue, 02 Nov 2021 23:38:10 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mi3Lx-003QIj-S5
 for linux-arm-kernel@lists.infradead.org; Tue, 02 Nov 2021 23:38:07 +0000
Received: by mail-qv1-xf35.google.com with SMTP id j9so713863qvm.10
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 02 Nov 2021 16:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=VDFUI6+9Gqle4Fl3GuOcqR9GGqL6hKFREJxfpi8AcUg=;
 b=DWclfIX0rDqNx+2O/T+hKL5tIPSEoGQxWRd3THANNkvDydCU3FkXzg2qmZDK/IJEgS
 pYzQB8gDR9PeLDzxiIZLvHya59tfFQLn/IBO5UW8vyr+tZmbHAAGGfvFSAn/ANu2XtLu
 AbvSadfIhQlpm/mG+J2lnVlL8Rf46Rx0LRn+Ns+mxvSgtNV/9UQ1bnQRakIJnflPNy/K
 qDrVNBV9ptlFTeUbzeNzNpqe74l1a+ZCd/JUNIuCUgGxQg7wKWmNFUTjHkMt2exeWbMS
 yIRLC+QkddF7lAZ7DBrTcaO784Zp/AnPgoJdHO7zkY54iOTF6yWt4yX0InDBlt0Kdz4V
 ezkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VDFUI6+9Gqle4Fl3GuOcqR9GGqL6hKFREJxfpi8AcUg=;
 b=X0jqZGuxInfLCdSLMrjpNgZImEAWKA8wONUg0qmGZfLAXQE8PFpHD66kaffXbRoIUW
 yESRoddBnpNw42OXrkEoEa/p0Y2CsCYDcx0m2XzlqfjKdIvb0sa8+7T6fqPVzSthMPLe
 Ny3bnKO9pXRC7bCaGOED1WK+l+PNY8o+pZEkZDnzudNxDyLRpQfwwryvlOT9aPj7eUba
 rVPLNtyPeLYwOeCv6hcDzBckwvRDOVQFID2yEk+yphd9aSv1hgw5KRgtjFfRpa1C7JWk
 /AdgPNrNyju3LhtWwMCjIPtWvWkCs3vsj2MzHkLek7njuccpPqL71QggxfL1wLO+w1Qn
 fJeQ==
X-Gm-Message-State: AOAM533yYkjrGd/V3vDfRMEHwOJ+1YXb/2XxGKx7jZs1N2ClUeKrBgdN
 MyOK8TrRMbLSiAZaXEdeXGs=
X-Google-Smtp-Source: ABdhPJxZ9E6SGKd4V2qIEhjfOAf1okxxeTzu4O+sd/JwEx3NZ1FjLuwJ3N9jwneBbIQUfOi0xTWATQ==
X-Received: by 2002:a0c:ecc7:: with SMTP id o7mr8789778qvq.46.1635896284646;
 Tue, 02 Nov 2021 16:38:04 -0700 (PDT)
Received: from [10.4.10.38]
 (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com.
 [146.115.144.188])
 by smtp.gmail.com with ESMTPSA id n15sm354561qkp.102.2021.11.02.16.38.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 16:38:04 -0700 (PDT)
Message-ID: <9d480d93-c350-f219-e069-d12e16dabb13@gmail.com>
Date: Tue, 2 Nov 2021 19:38:02 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v2 07/13] clk: imx: Add initial support for i.MXRT clock
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
References: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
 <20211102225701.98944-8-Mr.Bossman075@gmail.com>
 <CAOMZO5C9wY-BRbF-3D+mvaK3DaYi1kURt5QX-r3=umqpsT+hhw@mail.gmail.com>
From: Jesse Taube <mr.bossman075@gmail.com>
In-Reply-To: <CAOMZO5C9wY-BRbF-3D+mvaK3DaYi1kURt5QX-r3=umqpsT+hhw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_163805_949628_2A973166 
X-CRM114-Status: GOOD (  19.87  )
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
Message-ID: <20211102233802.lubK8DQkpXZ3ZVF-e2PNnsMMjzaX9QcKF1lbPGLvHeQ@z>



On 11/2/21 19:34, Fabio Estevam wrote:
> On Tue, Nov 2, 2021 at 7:57 PM Jesse Taube <mr.bossman075@gmail.com> wrote:
> 
>> +#include "clk.h"
This is necessary for the indices.
>> +#define ANATOP_BASE_ADDR       0x400d8000
OOPs my bad will fix.
> 
> This is now unused. Please remove it.
> 
>> +       clk[IMXRT1050_CLK_USDHC1] = imx_clk_gate2("usdhc1", "usdhc1_podf", ccm_base + 0x80, 2);
>> +       clk[IMXRT1050_CLK_USDHC2] = imx_clk_gate2("usdhc2", "usdhc2_podf", ccm_base + 0x80, 4);
>> +       clk[IMXRT1050_CLK_LPUART1] = imx_clk_gate2("lpuart1", "lpuart_podf", ccm_base + 0x7c, 24);
>> +       clk[IMXRT1050_CLK_LCDIF_APB] = imx_clk_gate2("lcdif", "lcdif_podf", ccm_base + 0x74, 10);
>> +       clk[IMXRT1050_CLK_DMA] = imx_clk_gate("dma", "ipg", ccm_base + 0x7C, 6);
>> +       clk[IMXRT1050_CLK_DMA_MUX] = imx_clk_gate("dmamux0", "ipg", ccm_base + 0x7C, 7);
> 
> The imx clock drivers have been converted to the clk_hw API.
> 
Oh will do, didn't know this.
> For a reference, please check:
> f1541e15e38e ("clk: imx6sx: Switch to clk_hw based API")
> 
> The same conversion could be done here.
> 
>> +       imx_check_clocks(clk, ARRAY_SIZE(clk));
>> +       clk_data.clks = clk;
>> +       clk_data.clk_num = ARRAY_SIZE(clk);
>> +       of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data);
>> +       clk_prepare_enable(clk[IMXRT1050_CLK_PLL1_ARM]);
>> +       clk_prepare_enable(clk[IMXRT1050_CLK_PLL2_SYS]);
>> +       clk_prepare_enable(clk[IMXRT1050_CLK_PLL3_USB_OTG]);
>> +       clk_prepare_enable(clk[IMXRT1050_CLK_PLL3_PFD1_664_62M]);
>> +       clk_prepare_enable(clk[IMXRT1050_CLK_PLL2_PFD2_396M]);
> 
> If these clocks are essential for the SoC to work, then you could pass
> the CLK_IS_CRITICAL flag instead of calling clk_prepare_enable()
> 
I'll look into that Thx

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
