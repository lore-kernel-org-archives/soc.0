Return-Path: <SRS0=YOEr=PV=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 712D7C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Nov 2021 23:44:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C68A61050
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Nov 2021 23:44:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2C68A61050
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1CRz/w3J/vNg3agMw3AMgCNChDrm5W9TqFux6JFBEJI=; b=moaNwMOAqfaeEt
	6kZYOO8l2UthiHfRNUmMXYRXDXSQ0G1oCCkpDSaRIlVib0DS/lplRbQ+VEahZykl1O/E82HoKn/0x
	qmiR1eUh+xM1MEVPBCmQWtXrkAcS0PsP36qFLzuLg49gop7dbwbMc5e3R+zsacqvPq+//amuHbXlH
	94aBz7kILXC8wrctQD8USHjKnQ0mF9HtTMtkDubchg0QSHa3B8qy9KMYRmmE7jpIvtMmyzLUTn9tj
	KF6XAiqP+qGsgW/WSapQqvsmmkvO1vcxG2CIAGzIQ08HFZoXpk/3ZZIyF6CkmyyKQtAwRtT2Ietjw
	bs3oBxuWjZ2zh7wqL/Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mi3QW-003RQR-7p; Tue, 02 Nov 2021 23:42:48 +0000
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mi3QR-003RPF-VB
 for linux-arm-kernel@lists.infradead.org; Tue, 02 Nov 2021 23:42:45 +0000
Received: by mail-ua1-x931.google.com with SMTP id p37so66672uae.8
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 02 Nov 2021 16:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O8/enUMhz+riyzQ2Zd8RV/GG8++DAENfi7ZT3OLtTzs=;
 b=n6VZ9pT7W0nCDLDr1BLiRtznprYVOhzyzxWqZRe3Dzld4TwJqFhWdnGQW72uIy7/c7
 p6Nrb/7UBpO+s3/fv4uTWtVhC5cYgoEwnFU0SM/AAySBDub0b7xVhk1qn3OmW5B9/mL0
 kSsOnYbgWoZDhcmz5tEqx+gN35vEQAcbAehYBDycY/faaZN06EJJYFJ6ncuw15SrmLML
 tjXvJ3p90QRX6fPR+tknrlMNS5RLBEH6o4xnzEQiePE4LLoIF68xw2+d08xWrSi5zsQr
 Wujoh0Yww4IpvOExhcUbhf+Tv51Leih2LL2HrCQKs5MRLal3pntCsG4k69eG/va0jX8v
 0dbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O8/enUMhz+riyzQ2Zd8RV/GG8++DAENfi7ZT3OLtTzs=;
 b=h40NLf2wuZpbPZOl8MWL9OVheCdJoikmai6n7JK0hiVJq3eP5ylMns0Pb+Be6Vk3dN
 BQw2RLiNtLyle7qL7eYB7bncOBaF26w+SzXqwJHRqNCMZBhbdSIRVzjGrfR24zckDUrw
 gTcKHgh/lr83XCQy0C04QJLjbooM3CgDTwOFfHPIJXJ8TZfnF25OyI7kLsqARip/8nvS
 7UXrTrV3aho4l39iaU+s8re7h3PR7kcwOz/Ljc0XxFO2MU0WV9qPlVFWP+7r58OAmCB/
 5WKnS1sH8Gf2tRlG0H2MwskzMOhEYjMqMahUrF5NAwwJXAABWrWjK4Ax5Q8u5d44F2YH
 D+9Q==
X-Gm-Message-State: AOAM531gjlb3XDsQ8okysz1jp65mrDDuMR9Tc72wuQoAp8eSbH+gttdg
 26O/Z6Zt/Vql6e904RDkSyOaMaZla9pUOkTPFuQ=
X-Google-Smtp-Source: ABdhPJwurPunbhgaMhr2aohB9ULiuMaCOL1VxU+6z5Q9/nzQIcTtnZQ7HFyfuV8GL22sGJRc0itAFSRr6ZB6VOkTllQ=
X-Received: by 2002:a67:af13:: with SMTP id v19mr4403884vsl.5.1635896562431;
 Tue, 02 Nov 2021 16:42:42 -0700 (PDT)
MIME-Version: 1.0
References: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
 <20211102225701.98944-13-Mr.Bossman075@gmail.com>
In-Reply-To: <20211102225701.98944-13-Mr.Bossman075@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 2 Nov 2021 20:42:31 -0300
Message-ID: <CAOMZO5DV-6dKnaGMgARhtv7mq-nOr9jO-XUWAJDmJWwNxc+B1g@mail.gmail.com>
Subject: Re: [PATCH v2 12/13] ARM: dts: imx: add i.MXRT1050-EVK support
To: Jesse Taube <mr.bossman075@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: NXP Linux Team <linux-imx@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
 Stefan Agner <stefan@agner.ch>, Linus Walleij <linus.walleij@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org, 
 Russell King - ARM Linux <linux@armlinux.org.uk>, Abel Vesa <abel.vesa@nxp.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Jiri Slaby <jirislaby@kernel.org>, 
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_164244_050066_92EAA7B1 
X-CRM114-Status: GOOD (  13.97  )
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
Message-ID: <20211102234231.Eq7rx2eO33YyJexroFkmsD9HpmdOxJIid7ehRk94HeM@z>

On Tue, Nov 2, 2021 at 7:57 PM Jesse Taube <mr.bossman075@gmail.com> wrote:

> +/ {
> +       model = "NXP IMXRT1050-evk board";
> +       compatible = "fsl,imxrt1050-evk", "fsl,imxrt1050";
> +
> +       chosen {
> +               bootargs = "root=/dev/ram";

No need to pass bootargs here.

> +               stdout-path = &lpuart1;
> +       };
> +
> +       aliases {
> +               gpio0 = &gpio1;
> +               gpio1 = &gpio2;
> +               gpio2 = &gpio3;
> +               gpio3 = &gpio4;
> +               gpio4 = &gpio5;
> +               mmc0 = &usdhc1;
> +               serial0 = &lpuart1;
> +       };
> +
> +       memory@0 {

memory@80000000

Building with W=1 should give a dtc warning due to the unit address
and reg mismatch.

> +               device_type = "memory";
> +               reg = <0x80000000 0x2000000>;
> +       };
> +

Unneeded blank line.
> +
> +&iomuxc {
> +       pinctrl-names = "default";
> +
> +       imxrt1050-evk {

No need for this imxrt1050-evk container.

> +               pinctrl_lpuart1: lpuart1grp {
> +                       fsl,pins = <
> +                               MXRT1050_IOMUXC_GPIO_AD_B0_12_LPUART1_TXD
> +                                       0xf1

Put it on a single line. It helps readability. Same applies globally.
> +&usdhc1 {
> +       pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
> +       pinctrl-0 = <&pinctrl_usdhc0>;
> +       pinctrl-1 = <&pinctrl_usdhc0>;
> +       pinctrl-2 = <&pinctrl_usdhc0>;
> +       pinctrl-3 = <&pinctrl_usdhc0>;
> +       status = "okay";
> +
> +       cd-gpios = <&gpio2 28 GPIO_ACTIVE_LOW>;

Make 'status' to be the last property. Remove the blank line.

> +               edma1: dma-controller@400e8000 {
> +                       #dma-cells = <2>;
> +                       compatible = "fsl,imx7ulp-edma";
> +                       reg = <0x400e8000 0x4000>,
> +                               <0x400ec000 0x4000>;
> +                       dma-channels = <32>;
> +                       interrupts = <0>,
> +                               <1>,
> +                               <2>,
> +                               <3>,
> +                               <4>,
> +                               <5>,
> +                               <6>,
> +                               <7>,
> +                               <8>,
> +                               <9>,
> +                               <10>,
> +                               <11>,
> +                               <12>,
> +                               <13>,
> +                               <14>,
> +                               <15>,
> +                               <16>;

Please group more elements into the same line.

Putting one entry per line makes it extremely long.

> +               gpio5: gpio@400c0000 {
> +                       compatible = "fsl,imxrt-gpio", "fsl,imx35-gpio";
> +                       reg = <0x400c0000 0x4000>;
> +                       interrupts = <88>,
> +                               <89>;

Put the interrupts into a single line.

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
