Return-Path: <SRS0=tGbD=PM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E48A7C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Oct 2021 16:10:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2C8260F70
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Oct 2021 16:10:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A2C8260F70
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o53MJ9pK0nE8f3QjXy+z5HpwisXtlEdFw4vloZh7kfw=; b=bb/ZD67k/Ctk7xb7ZUGVhdZsPV
	rtf4dnXNeBcO0YghcXXlfrRpkImKJoZHn0RgYzNZX48k83nmSh6AxA+K9jurNKCEI8Vn9VYL+aAz6
	SzatvfdXYIQbxuZ1iKMU487CKvkdTLcGrOXqXTRPZ9fmWcDuZGFgcgBiIuTtzLjBIfxLKMdJ59v3p
	g/7bunaRPlxLY1WxGAjghhmv+3O/revJcppc9Qq/uLEYy3URuQIGpE51ALbRWOrxgOvbCTcF6j62x
	bnGj3lVvZ+dwFUV9coFF9BQ46sJG7Zo5nGfMbbaPM45C5MkqtaW4qGppUeQXQXDLIRZuDuM6eU9cK
	fTyWGu1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1meg3A-00EKB9-Ty; Sun, 24 Oct 2021 16:08:45 +0000
Received: from [2601:1c0:6280:3f0::aa0b]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1meg37-00EKAb-Vh; Sun, 24 Oct 2021 16:08:42 +0000
Subject: Re: [PATCH 07/13] clk: imx: Add initial support for i.MXRT clock
 driver
To: Jesse Taube <mr.bossman075@gmail.com>, linux-imx@nxp.com
List-Id: <soc.lore.kernel.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, ulf.hansson@linaro.org, aisheng.dong@nxp.com,
 stefan@agner.ch, linus.walleij@linaro.org, gregkh@linuxfoundation.org,
 arnd@arndb.de, olof@lixom.net, soc@kernel.org, linux@armlinux.org.uk,
 abel.vesa@nxp.com, adrian.hunter@intel.com, jirislaby@kernel.org,
 giulio.benetti@benettiengineering.com, nobuhiro1.iwamatsu@toshiba.co.jp,
 leonard.crestez@nxp.com, b20788@freescale.com, fugang.duan@nxp.com,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-serial@vger.kernel.org
References: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
 <20211024154027.1479261-8-Mr.Bossman075@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <72428614-6ad3-5023-8e03-25ac440e82fd@infradead.org>
Date: Sun, 24 Oct 2021 09:08:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211024154027.1479261-8-Mr.Bossman075@gmail.com>
Content-Language: en-US
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
Message-ID: <20211024160839.qSPQhq9rMfPCyj9lKNkuw1PlUovH_8IaT7NF1FK4gVE@z>

On 10/24/21 8:40 AM, Jesse Taube wrote:
> diff --git a/drivers/clk/imx/Kconfig b/drivers/clk/imx/Kconfig
> index 47d9ec3abd2f..19adce25167d 100644
> --- a/drivers/clk/imx/Kconfig
> +++ b/drivers/clk/imx/Kconfig
> @@ -98,3 +98,6 @@ config CLK_IMX8QXP
>   	select MXC_CLK_SCU
>   	help
>   	  Build the driver for IMX8QXP SCU based clocks.
> +config CLK_IMXRT
> +	def_bool SOC_IMXRT
> +	select MXC_CLK

Hi,
Please keep one blank line between config entries,
the way that the rest of that file is.
(and pretty much all other Kconfig files)

thanks.
-- 
~Randy

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
