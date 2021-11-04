Return-Path: <SRS0=ZqES=PX=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E14BC433EF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Nov 2021 01:07:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA1ED6113B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Nov 2021 01:07:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EA1ED6113B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J6fr3PJCdHdOLuGY0Jopxp1HiM++CU8iR1hUumvo4fU=; b=vXIv4rrfFjryUl
	+/Lydcerr66WJtpjA6G5ItchzJ0/bBcZCyT9DxmV3I451rWftrkcdq4SNHEFgc1zXAcHzWwfu2jpm
	8HZSVoeTkt/0h4E+pxCFwU2HFFR702RYnG5hMciH88v8LFdWQW22kjH7NQIJ4tPZbBArGMw0UZTxD
	bRTud33laRsM3dQPyDHg8V2BgoWOiu+cHNRHnUTejvSjCdcfupq+5vjx5GODmPsohdTAhzqPNCBF9
	ZCRdQvzKW7DnF66dCxU6hXXLY1Zt9+4D2fRvmeUkU1S/fS5NY4E1/GVdPsnqBFbMvgd1M1g9Tc568
	o5Xk6N7WrWvgzgYMJHTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miRCM-007SYl-2C; Thu, 04 Nov 2021 01:05:46 +0000
Received: from mail-oi1-f178.google.com ([209.85.167.178])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miRCE-007SWz-GT
 for linux-arm-kernel@lists.infradead.org; Thu, 04 Nov 2021 01:05:43 +0000
Received: by mail-oi1-f178.google.com with SMTP id bn12so6588849oib.2
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 03 Nov 2021 18:05:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mGavWcXNjdvsaFGjH3yLVdsxiECxJZKPSKveuDvmokQ=;
 b=62DwCeOTS6LLY488Qm93CXhZdtoODS4MSAXxHyHMT0iCfSuPzjtnRDHqVqqRtRl0Bq
 /tejuUl8laOtckMSrLnLfU6+GaKJb9DDCF8KhSoEGyZzrwiFOL8vzhwDRNC3AFeA93Nk
 ozZsb2Izw0n/SErnUzd5rqRr8WA8sjjmbVyRUI7p6Rd0MT8u/XIU+3mChomV48WWKWBH
 e3WtPSmqCSasAqVF398EOjDtyoq4H2e4tqsUBE1zPK63ay55z0JVL/NTt73k3kplqZFH
 bOfQfdI/rBit+Fr6R+mTkEIFtNEf/DX32dgPLtXqQtTZev+7q8zlFJ9UtSBv908kD2cD
 okTA==
X-Gm-Message-State: AOAM5313SQnSbu4B9CQfp63uB5m+obE6DhCfCQwkFNSM1QsUUw3SomxT
 G6uWX3ceUgLLQnNYYgV97Q==
X-Google-Smtp-Source: ABdhPJwcF6k+uaPsW687lTM1lrQbGJ72CwyhOXZbDNl0jW49yDGyFkCfZIMrsqrxXE6V9BAJwSV6Qw==
X-Received: by 2002:a54:4e97:: with SMTP id c23mr13542906oiy.153.1635987933167; 
 Wed, 03 Nov 2021 18:05:33 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id z12sm247106oid.45.2021.11.03.18.05.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 18:05:32 -0700 (PDT)
Received: (nullmailer pid 2115444 invoked by uid 1000);
 Thu, 04 Nov 2021 01:05:31 -0000
Date: Wed, 3 Nov 2021 20:05:31 -0500
From: Rob Herring <robh@kernel.org>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
List-Id: <soc.lore.kernel.org>
Cc: Jesse Taube <mr.bossman075@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
 NXP Linux Team <linux-imx@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
 Stefan Agner <stefan@agner.ch>, Linus Walleij <linus.walleij@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org, 
 Russell King - ARM Linux <linux@armlinux.org.uk>, Abel Vesa <abel.vesa@nxp.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Jiri Slaby <jirislaby@kernel.org>, 
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
Subject: Re: [PATCH v2 11/13] mmc: sdhci-esdhc-imx: Add sdhc support for
 i.MXRT series
Message-ID: <YYMx28VvhR7nvMlt@robh.at.kernel.org>
References: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
 <20211102225701.98944-12-Mr.Bossman075@gmail.com>
 <CAOMZO5AxMXxDkNDqGJDhtepqSUxGRCWO+L=c67O==4fx66M7XQ@mail.gmail.com>
 <c1610093-95ae-68d3-57ae-93b1bc9715d7@gmail.com>
 <20211102233017.bvZyNHgwkuFX2SrymY1886iySuCFjH3IP1hlSc3HduY@z>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211102233017.bvZyNHgwkuFX2SrymY1886iySuCFjH3IP1hlSc3HduY@z>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211103_180538_580053_AD2F14DD 
X-CRM114-Status: GOOD (  27.59  )
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
Message-ID: <20211104010531.3d3gLhZKqlswIlOqlCeHwqJ2qfo6RzW26dlT_y409Wc@z>

On Wed, Nov 03, 2021 at 12:30:17AM +0100, Giulio Benetti wrote:
> Hi Fabio, Jesse, All,
> 
> On 11/3/21 12:25 AM, Jesse Taube wrote:
> > 
> > 
> > On 11/2/21 19:17, Fabio Estevam wrote:
> > > On Tue, Nov 2, 2021 at 7:57 PM Jesse Taube <mr.bossman075@gmail.com> wrote:
> > > 
> > > >    static struct esdhc_soc_data usdhc_imx8qxp_data = {
> > > >           .flags = ESDHC_FLAG_USDHC | ESDHC_FLAG_STD_TUNING
> > > > @@ -357,6 +363,7 @@ static const struct of_device_id imx_esdhc_dt_ids[] = {
> > > >           { .compatible = "fsl,imx7ulp-usdhc", .data = &usdhc_imx7ulp_data, },
> > > >           { .compatible = "fsl,imx8qxp-usdhc", .data = &usdhc_imx8qxp_data, },
> > > >           { .compatible = "fsl,imx8mm-usdhc", .data = &usdhc_imx8mm_data, },
> > > > +       { .compatible = "fsl,imxrt-usdhc", .data = &usdhc_imxrt_data, },
> > > 
> > > I thought Rob suggested to use the SoC name, so this would be:
> > > 
> > Uh i think that may have been for the UART.
> > > { .compatible = "fsl,imxrt1050-usdhc", .data = &usdhc_imxrt1050_data, },
> > > 
> > > The same applies to the other bindings in the series.
> > > 
> > > This way it would be possible to differentiate between future
> > > supported i.MX RT devices.
> > > 
> > This makes sense will do in V3.
> > 
> 
> If we add every SoC we will end up having a long list for every device
> driver. At the moment it would be 7 parts:
> 1) imxrt1020
> 2) imxrt1024
> .
> .
> .
> 7) imxrt1170

You don't need a driver update if you use a fallback. When you add 
the 2nd chip, if you think it is 'the same', then you do:

compatible = "fsl,imxrt1024-usdhc", "fsl,imxrt1050-usdhc";

That requires no driver update until the driver needs to handle some 
difference. And when there is a difference, you don't need a DT update.

You could make "fsl,imxrt-usdhc" the fallback from the start if you are 
adverse to the first way.

Rob

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
