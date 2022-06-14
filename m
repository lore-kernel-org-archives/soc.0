Return-Path: <SRS0=lTRj=WV=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5180EC43334
	for <soc@archiver.kernel.org>; Tue, 14 Jun 2022 10:42:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1D047C3411E; Tue, 14 Jun 2022 10:42:23 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7C655C3411B;
	Tue, 14 Jun 2022 10:42:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7C655C3411B
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-yb1-f180.google.com ([209.85.219.180]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MxV4T-1nm2Hy0YDh-00xpVs; Tue, 14 Jun 2022 12:42:19 +0200
Received: by mail-yb1-f180.google.com with SMTP id r3so14455801ybr.6;
        Tue, 14 Jun 2022 03:42:18 -0700 (PDT)
X-Gm-Message-State: AJIora8O83T1lD+bfWL/f7iB9qKSJw+hrUG+Q6Bl37e/bmT50xkjGq8n
	6zUYO7Uc1Uf/JB07B/qQeh0QnjAA1YuzNOGbw44=
X-Google-Smtp-Source: AGRyM1u6BlNZePQaiEYdbfT4gFiK0Xn992NOenYqFrbDIeUHsQsd0C4/8zDUMmJUO2awoVTP7FmYkvrgx8xfclApE7Q=
X-Received: by 2002:a25:69c4:0:b0:65c:ed2b:9106 with SMTP id
 e187-20020a2569c4000000b0065ced2b9106mr4223896ybc.394.1655203337779; Tue, 14
 Jun 2022 03:42:17 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1655194858.git.qinjian@cqplus1.com> <0574ed0ad1e9ec4c12645fe2d2dde8f701d285e5.1655194858.git.qinjian@cqplus1.com>
In-Reply-To: <0574ed0ad1e9ec4c12645fe2d2dde8f701d285e5.1655194858.git.qinjian@cqplus1.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 14 Jun 2022 12:42:01 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0XgDS-iJEfOrTjTRGODosxj0gc748PAH_hc534DkyswQ@mail.gmail.com>
Message-ID: <CAK8P3a0XgDS-iJEfOrTjTRGODosxj0gc748PAH_hc534DkyswQ@mail.gmail.com>
Subject: Re: [PATCH v18 10/10] ARM: dts: Add Sunplus SP7021-Demo-V3 board
 device tree
To: Qin Jian <qinjian@cqplus1.com>
List-Id: <soc.lore.kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, DTML <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Tx2JUlEtvTxv7Cvquhfw75aBGZ1O7f62SbEhUOVIAslCRTOlttw
 qHgF9thuyytm7Fo9KLnYGHp3Ii+yZ8FA7VopsA3vUN1cQ7cGEuvtoQEORMSvUWSkIbmeon3
 wKwwFwYdtjBqe0ZGhFNbu93FuIRw5sU10VgcxHeLni7eR4C/H38OJpG93aakm1eCg9yXePW
 uBd9sFAwyLhN2WgwEvZrg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:g2Ln0YWcWeo=:fmcZNVhrKXhs6I4nl6wLWS
 vd+7LoGYtgqCZDL+cx6Ms+Ok8i68PTsgKEAaNlB2WmpGENOqxXfN2nKPmC07Cxz/OHhH73OzA
 VGM4qmQ8qFcOsBvdANzatgUfJVAm4DErkJyRKHHb2YIssyx72dz1tsi3/ecEGAXjoP/eE8ODW
 2/k0igtY6nIMKsV9pbTMJu3zo+M1efT0Byc5l06bCtI/m6SXAWxmAP+sHybwABOPV4i/TWR/6
 bgOcoucXrDN0omJ8qgF2fstKIrZmsoojPYoNOhohOq9mjKnsg1q+YB7cVEWRiAeWaGDJrsvNT
 2nKpXxpkPK2SwLjvBisWNV2XJRMsB/AWgVz6pVt4Y8O88ICcuqeTB31Eh89a2gd7bOsQtAM3+
 ZaCAVV+OFDmAO4N6qSpQfac4aSHsS+QOmPtNUzJlfoQHSxnrHUIuQawjxuqgljRtJ/4AExkZt
 /G7nLb9J2K1kV90xR4FSwMq/EoTwSBXDWzuY1Sj2UFnAICOESMN6iC4C50JkiT9Tw/J2ZIp7b
 czlCrgKLnS8IppJh2t+kY8AavchArIIjDV3BEVYzhK/kUbqIQ0+ACvUhQUEx5Obx3YGRxfc5L
 JCtlmwEZNk4JoaSOaWJKItPwsjHs/B3LJGB0q/4Io9IhbD3Z8DImKOJhIpln2It/Ag3sW/eJY
 YBGbTb7tqBO2+EaYnaH8HcYjbsaItYAu6eNDac1dTQi/VlcuwxNJ0Yj5S5uCtEIckQ7ZKhU3w
 wHNCevDs93HmejAKT+5VNpqC2gUfDlgOZdIV1Q==

 beOn Tue, Jun 14, 2022 at 10:31 AM Qin Jian <qinjian@cqplus1.com> wrote:
>
> Add the basic support for Sunplus SP7021-Demo-V3 board.
>
> Signed-off-by: Qin Jian <qinjian@cqplus1.com>
> ---
> Fix the comments from Krzysztof.

I'll wait for a final Ack from Krzysztof before applying this.


A few more details I noticed:


> +/ {
> +       compatible = "sunplus,sp7021";
> +       model = "Sunplus SP7021";
> +
> +       aliases {
> +               serial0 = &uart0;
> +               serial1 = &uart1;
> +               serial2 = &uart2;
> +               serial3 = &uart3;
> +               serial4 = &uart4;
> +       };

Some of these are disabled, presumably because they are not
actually connected on all boards. Better move the aliases to the .dts file
and only list the ports that are in fact used, using the numbering that
matches the labels on the board, not the numbers inside of the SoC

> +
> +       soc {
> +               compatible = "simple-bus";
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               ranges;
> +               interrupt-parent = <&intc>;
> +
> +               intc: interrupt-controller@9c000780 {
> +                       compatible = "sunplus,sp7021-intc";
> +                       reg = <0x9c000780 0x80>, <0x9c000a80 0x80>;
> +                       interrupt-controller;
> +                       #interrupt-cells = <2>;
> +               };

All child nodes below /soc have registers in the 0x9c000000 range. I would
suggest you use a matching 'ranges' property to translate these into a
zero-based
address like

/soc {
       ranges = <0 0x9c000000 0x10000>;

      interrupt-controller@780 {
             reg = <0x780 0x80>, <0xa80 0x80>;
             ...
      };
};

> +               clkc: clock-controller@9c000004 {
> +                       compatible = "sunplus,sp7021-clkc";
> +                       reg = <0x9c000004 0x28>,
> +                             <0x9c000200 0x44>,
> +                             <0x9c000268 0x04>;
> +                       clocks = <&extclk>;
> +                       #clock-cells = <1>;
> +               };
> +
> +               rstc: reset@9c000054 {
> +                       compatible = "sunplus,sp7021-reset";
> +                       reg = <0x9c000054 0x28>;
> +                       #reset-cells = <1>;
> +               };


Maybe sort the nodes by address, or possibly by name.

       Arnd
