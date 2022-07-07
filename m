Return-Path: <SRS0=wHrc=XM=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97251C433EF
	for <soc@archiver.kernel.org>; Thu,  7 Jul 2022 13:34:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 653CFC341C6; Thu,  7 Jul 2022 13:34:10 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E73A9C3411E;
	Thu,  7 Jul 2022 13:34:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E73A9C3411E
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-yb1-f173.google.com ([209.85.219.173]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MBDva-1oIm6y3TeY-00ClDS; Thu, 07 Jul 2022 15:34:07 +0200
Received: by mail-yb1-f173.google.com with SMTP id g4so32536490ybg.9;
        Thu, 07 Jul 2022 06:34:06 -0700 (PDT)
X-Gm-Message-State: AJIora8JbqfAKRStoW5YSnrBK6xxCQe7m4QUlmJ+QjQ9IaBjCdcsy+f8
	pN0nHNFYssybqIrEWM37ZJYFf1vNInWLR80tCzg=
X-Google-Smtp-Source: AGRyM1uVpCRoROO6rAh+vA5ak8N4SGshcVRH0JW9GvyB4UqceUAu6tZ1eCC16Bwe+GMTjR8QSqM1egSeZk3ZR5FMhlQ=
X-Received: by 2002:a25:7c41:0:b0:66d:766a:4815 with SMTP id
 x62-20020a257c41000000b0066d766a4815mr46624953ybc.480.1657200845543; Thu, 07
 Jul 2022 06:34:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220707132054.GA10610@logan-ThinkPad-T14-Gen-1>
In-Reply-To: <20220707132054.GA10610@logan-ThinkPad-T14-Gen-1>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 7 Jul 2022 15:33:48 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0P2u+LdXcU7As=dfNbg_J2eWfhgB9TT1-xVyH0v6OM5Q@mail.gmail.com>
Message-ID: <CAK8P3a0P2u+LdXcU7As=dfNbg_J2eWfhgB9TT1-xVyH0v6OM5Q@mail.gmail.com>
Subject: Re: [PATCH v3] The Yosemite V3.5 is a facebook multi-node server
 platform that host four OCP server. The BMC in the Yosemite V3.5 platform
 based on AST2600 SoC.
To: Logananth Sundararaj <logananth13.hcl@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, DTML <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-aspeed <linux-aspeed@lists.ozlabs.org>, 
	OpenBMC Maillist <openbmc@lists.ozlabs.org>, garnermic@gmail.com, thangavel.k@hcl.com, 
	naveen.mosess@hcl.com, patrick@stwcx.xyz, velumanit@hcl.com
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:HQ3iWQe663O2T+7tUxh2rarX0DT2BNwWOSgU3QcELxLTeJyQrGb
 j7xqsetvIx27wzF3f6gg6UI+jG9rM7S0q8ro/BpSUdh3DiS1vFCIrHyRR1qhw8N7XH3uhIM
 yQWFOUm8Gfbo41jYPNCkl4k+/k1P24/c54mC9X+k6qCbFlEX737BMftFAlE3AdzM7s0ZKz1
 GDcejkpd7ktXFkTMe+aSw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9pWTvk6EVEs=:63B5w3lDweuFz1n2WgyEvI
 93VgOHmqJPpw4PdkWuvJjLryApwo6mp9fBjcHqQSdTZZqfBY8bbmCvM/2x/jI+VASD1EV7WIq
 PKUiU5MQIlxhb75hWXxYlKyqAvgfkHwcSkscZdnqmef6Q3JN5DtMCY2ViTypkNXDWnSTk/99f
 g8Mj5gYvBgz0mVkj8bLDj+VhIDNv6s0w5fG5uc3yGmi8mDDG8GmB3xWlvrE6+xZd9S/V1UdCi
 8NoXfLKV6KDMUT+xftcchzusDx7Qp7Ggu98pyrMcM0LKkCcFAw8G9A7P9P29bTjRpcnLav3bR
 vbywvKE8IBvsFP3PtyYMRDuORVdUFQwgJUDiVWjswrGviQW6Sw1emI56ReZR+d7ecvg1kTsWd
 jAiz6+anaLAhwvl49dRt6X5CUVTLIPP/AKxbHSKfHR1DT95cwEXPw7iz1Nax+7s8PxApdkw6x
 a7fdnP+B9Lql0i+hGZzy6T8LVwzlABHKwKWHyAktKDRPrm9Hf43DQoqvAXS7kHoMSknbQSSpP
 fl81f2q9mKEemn6yRmPeE6mXlem1F9YHrJLs3+FRRKckCgvjUh2SitQMGBs9TiaFU2j8WHBIM
 COeYU1NNkhpCVuqON94GV6tZeRSTFoVVDBUn0hSwc406gjeIfIl/JN246EyTUqdEvtc9PiG8A
 m/g8ZP9MB4RTmXEA22H8ouZYUjzxHJRKD7sqHzZBv0CYtUD8UcbZRg5Gdy5yLp4S5HfNxXtuQ
 il6NoU5Ydq3J9vhJdVAsTk9J3BNOnsCCU2rCFLunIpwpjk/k4rPujvxag63DPpVBIGZYEXDAM
 VElrYEhxjBbqCmqpt5WAWzkKiZhrAqVGF5Z7+/vtUClIEIg/+i/4oPdjYar3hd7PPMKxgukOP
 rr1Rtj0zJtZhl6FivalKhjlaFvg1fc+t62sRS8uQs=

On Thu, Jul 7, 2022 at 3:20 PM Logananth Sundararaj
<logananth13.hcl@gmail.com> wrote:
>
> This patch adds linux device tree entry related to
> Yosemite V3.5 specific devices connected to BMC SoC.
>
> Signed-off-by: Logananth Sundararaj <logananth_s@hcl.com>


Something went wrong with the patch description, it looks like you dropped
the subject and sent the first paragraph as the subject instead.

> +/ {
> +       model = "Facebook fby35";
> +       compatible = "facebook,fby35", "aspeed,ast2600";
> +
> +       aliases {
> +               serial4 = &uart5;
> +       };

Why not start at serial0 here?

> +       chosen {
> +               stdout-path = &uart5;
> +               bootargs = "console=ttyS4,57600n8 root=/dev/ram rw vmalloc=384M";
> +       };

The bootargs should really come from the boot loader.

Why do you need the vmalloc=384M? That seems excessive.

> +
> +       memory@80000000 {
> +               device_type = "memory";
> +               reg = <0x80000000 0x80000000>;
> +       };

The memory location and size is usually also set by the boot loader

        Arnd
