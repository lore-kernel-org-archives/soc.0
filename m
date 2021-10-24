Return-Path: <SRS0=tGbD=PM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DC40C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Oct 2021 18:09:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6223E61052
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Oct 2021 18:09:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6223E61052
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QZSEGFztbD9Yb5Vm/xiw6kkRA5svEdpJ6ru3ZPLUwgQ=; b=Fu4tXJSKbaRFOo
	toFT2Fnq+NTnnNgQEbpUUKzgVNJhOvGQvbc3u6k6b7hghYvSteu4VYApYc9SKZOfjmvEJfK9rOeMR
	eNwNtQHX92eGzZh11yGzDb78Y0XHkH9PRAZD0SaNQYKZycR93jaXCpSTZHZJL9wSL/wsyWRnP3RAm
	PyArbDComMyRMyhcIABCcj4DB3w42gMBXgjy9QUO00p7soEc8WA5R/pKcoAA2drqMNGvJGSxjBk4y
	S98zmbGfcEBnAl50uabXQ4+L4z6S3hTz8Fnyhm6A9HDsCzKKbVphnyqLpaiZOtoOQi9gnswdp9Gud
	LJzo6XbKijfkFvvjsmeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mehu6-00ERPm-5H; Sun, 24 Oct 2021 18:07:30 +0000
Received: from mout.kundenserver.de ([212.227.126.134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mehtq-00EROT-4L
 for linux-arm-kernel@lists.infradead.org; Sun, 24 Oct 2021 18:07:15 +0000
Received: from mail-wm1-f41.google.com ([209.85.128.41]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N9MlI-1mhvNz1ujs-015FMc for <linux-arm-kernel@lists.infradead.org>; Sun, 24
 Oct 2021 20:07:11 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 84-20020a1c0457000000b003232b0f78f8so10563277wme.0
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 24 Oct 2021 11:07:10 -0700 (PDT)
X-Gm-Message-State: AOAM5338sfomhrumKIozglTBx8MpBylEFA+b/Br7Nhxy2hPdnvJ8OAXY
 gjV9X31hObyJNXBbZUl8YdXMJFmLnDmIk225bBk=
X-Google-Smtp-Source: ABdhPJxtbVJrHWYPggYA8yPeJNUl2q0CmjGNKBR3lA5Z+IxWQD60zbwZCG/IT3XsglTcMiUM4ygKRYscIv8VMUDJQ9I=
X-Received: by 2002:a7b:ce93:: with SMTP id q19mr1339077wmj.98.1635098830063; 
 Sun, 24 Oct 2021 11:07:10 -0700 (PDT)
MIME-Version: 1.0
References: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
 <20211024154027.1479261-4-Mr.Bossman075@gmail.com>
In-Reply-To: <20211024154027.1479261-4-Mr.Bossman075@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sun, 24 Oct 2021 20:06:54 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2sZtPAh-++7oH59g9BQSzXN+yheFxeac0XBJjzbFqakQ@mail.gmail.com>
Message-ID: <CAK8P3a2sZtPAh-++7oH59g9BQSzXN+yheFxeac0XBJjzbFqakQ@mail.gmail.com>
Subject: Re: [PATCH 03/13] dt-bindings: imx: Add pinctrl binding doc for
 i.MXRT1050
To: Jesse Taube <mr.bossman075@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: NXP Linux Team <linux-imx@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Stefan Agner <stefan@agner.ch>, 
 Linus Walleij <linus.walleij@linaro.org>, gregkh <gregkh@linuxfoundation.org>, 
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 SoC Team <soc@kernel.org>, 
 Russell King - ARM Linux <linux@armlinux.org.uk>, Abel Vesa <abel.vesa@nxp.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Jiri Slaby <jirislaby@kernel.org>, 
 giulio.benetti@benettiengineering.com, 
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, 
 Leonard Crestez <leonard.crestez@nxp.com>, b20788@freescale.com, 
 Andy Duan <fugang.duan@nxp.com>, linux-clk <linux-clk@vger.kernel.org>, 
 DTML <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mmc <linux-mmc@vger.kernel.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
X-Provags-ID: V03:K1:5hj2rHpKcU1rP191cfuWObq8xS9CvFsKa1ksyTl9ajWFpx6voCF
 zbP52NJ6Bt2A3tlGeZdbJzgYpl64QEEFkp2m3xWtruLZm/LbIc5DBJUdTrD6Mpj+gyfdP0D
 u9McJkkwgLhuFFY7qQZZekru+U9KWSfdxZqjpKo7gymhbjidpKP0nyZucWR5o+HT/7C5x/6
 J+SgFdyUHpeafBsst/+tw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xCu4jqSAg6o=:DMiYswl2QPVxSp4qHCJDk3
 i96CvAQIQzY+qAtoBJLwWLD2vLz1Zh7cZ6Fp5JsusMZq798uXw0y0oMpqszDevQOg3jo1R68K
 g3bwPMVgGqdrgowtu+Z0EZzocCFG1lw/INV9q2xb8Q18iVC2RuTomKXpTBpvVxR5e88t3KEGi
 jpEQE6CtKwu4Es58wVOVCNBU4eLtDNI/dcwv5DbLN2Fi3ZlZiTamqhfoWcaUN9+zNNhu1JILG
 rqkKn7eLEizo2DrZOzh/dBGm0HXfMhMhgcPJd/uLLCLKaTfvBzID79E+gwLqdzjwqtjgbc9/G
 KxTo0NN5teeU0MimQbJ9B97wVpE00qHACoqeEf1QwVBk9hvZL7hCGtDCC7x04kuSIzxt+I04S
 9wS4A49K8rogGGx1jWfYvO+/p4rQX/LGa/vK3ixEkAZgNcqqWF8rxCnDtlA7Iv9cVzmXOuGi8
 ySYxbZkOQ8lbvO3Mc1+rN9Y4LAXX2QV7aA6SjoliRBjHarzHuvQomBevB85mU7WHSfxmw0C+1
 V/u7u+d8MvghQ9G54myeil9jU2dOarX1XoZmtfkCSjkghr2f35v6WEFRJUeC4bSl83jiM6eWN
 C6/3dvtUzRMdK7iHbyg2PFlwyaroakA6Yj0aLoJ+56k7gME2zvagCNIcb/Jf6uxu4duehR7Aw
 xaSFEHT0RpvDyNCpNebvgNXIC20I/F5waCq4CyKfuAgEVUxlbWI9BzhUL2bUY4NSDTYBxyLEJ
 BIYLdpfY0dodAhWx4gGNOHhxFgLKQ0PMdYiYIYw++x2/3dmfWG7t6jS3SdyBIpismCIbXOdGP
 q40gOHiozVwqq25N8zrx7Kzz/vkltuKE84is5C6v7Yjp5Dap+g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211024_110714_486769_7EC862E4 
X-CRM114-Status: GOOD (  13.20  )
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
Message-ID: <20211024180654.1i4QgLhp3DeMiPgH4vBCxiXSXCKwndnhBGfjUOxhPVs@z>

On Sun, Oct 24, 2021 at 5:40 PM Jesse Taube <mr.bossman075@gmail.com> wrote:
> +/*
> + * The pin function ID is a tuple of
> + * <mux_reg conf_reg input_reg mux_mode input_val>
> + */
> +
> +#define MXRT1050_IOMUXC_GPIO_EMC_00_SEMC_DA00                          0x014 0x204 0x000 0x0 0x0
> +#define MXRT1050_IOMUXC_GPIO_EMC_00_FLEXPWM4_PWM0_A                    0x014 0x204 0x494 0x1 0x0
> +#define MXRT1050_IOMUXC_GPIO_EMC_00_LPSPI2_SCK                         0x014 0x204 0x500 0x2 0x1
> +#define MXRT1050_IOMUXC_GPIO_EMC_00_XBAR_INOUT2                                0x014 0x204 0x60C 0x3 0x0
> +#define MXRT1050_IOMUXC_GPIO_EMC_00_FLEXIO1_D00                                0x014 0x204 0x000 0x4 0x0
> +#define MXRT1050_IOMUXC_GPIO_EMC_00_GPIO4_IO00                         0x014 0x204 0x000 0x5 0x0

The constants don't appear to be needed in this header at all, as the binding
looks completely generic with a tuple of five values, so  you could simply
open-code the numbers where they are used, no need to include these
in a driver.

        Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
