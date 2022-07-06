Return-Path: <SRS0=xyye=XL=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 559A5C43334
	for <soc@archiver.kernel.org>; Wed,  6 Jul 2022 15:01:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1129AC341C6; Wed,  6 Jul 2022 15:01:35 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 70AF4C3411C;
	Wed,  6 Jul 2022 15:01:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 70AF4C3411C
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-yb1-f182.google.com ([209.85.219.182]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N2VKr-1nSO781Bz5-013wcn; Wed, 06 Jul 2022 17:01:25 +0200
Received: by mail-yb1-f182.google.com with SMTP id 76so12160423ybd.0;
        Wed, 06 Jul 2022 08:01:24 -0700 (PDT)
X-Gm-Message-State: AJIora/vIgNNrOGTFZXyvQB99EFmYRkI3J+mRxteIqGvGqp9BntgLsfd
	DJ96otLBoi88ZuZNuEt2eQBdPj29SmGvzuzkl0E=
X-Google-Smtp-Source: AGRyM1umUC3WLeZlmJt9WhhCXt632xH5c1TSYZPaema52uTt6F/+nW7yUSNfOjLzvYo07C+MTUQ72TTNkGVtiR4Edpk=
X-Received: by 2002:a25:7c41:0:b0:66d:766a:4815 with SMTP id
 x62-20020a257c41000000b0066d766a4815mr41195052ybc.480.1657119683920; Wed, 06
 Jul 2022 08:01:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1656396767.git.qinjian@cqplus1.com>
In-Reply-To: <cover.1656396767.git.qinjian@cqplus1.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 6 Jul 2022 17:01:07 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1HoB74TA9EKJFuPLuw_zJfy_p7fwkm0M45+jaGkK6ivA@mail.gmail.com>
Message-ID: <CAK8P3a1HoB74TA9EKJFuPLuw_zJfy_p7fwkm0M45+jaGkK6ivA@mail.gmail.com>
Subject: Re: [PATCH v20 00/11] Add Sunplus SP7021 SoC Support
To: Qin Jian <qinjian@cqplus1.com>
List-Id: <soc.lore.kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, DTML <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:uTyST7ZRtbP5npjvox/kYsCreznDzPN64AQWmMKwiUTxFdKZURe
 TAn8AwgFv8qfT8uAfeuV98K/Ik/zP/Mb49OrzxMwQxBOpveiEKlnoVJOTZRUQQRgwauv3jN
 KLrnzECSHx6h5by7XCliZaJgj7tlMYsMUVWe6Cq8FkLPjFFeCmiTCkOLm3NZ81cyUjBnL2y
 hDNAJgcovkbNerZqCgjeA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2WCLEJVZfLo=:KEwUAxC8n2riJbR5oSfXlm
 JmAAjrixnQkbff0xm5TXKL6pQ5o2gL1TVST2zsKSKmzQB/3wGB7SqeDdfL4oUlZCBJHIMdB1j
 hk3z0lrRwvsRlI+/OQVMn7yO4k0JOug4wbQqzc1zO+ewBwkXOL5DSv/5DT++0oG+UsxoHeNTA
 NtGf6Bqb1Yc+IxYUug/nrZGYsxSmV1U8qCQHgbCPLmaUu6IFkoykbU6pD/HIvuPa1jVfEaxuQ
 KdsTSThvBx9ss0oQw7OPxDtgqrXe2lD9JfR54ts9SiQtcaQ57CPzj8KqCG+rB6+CKyZdfcnS2
 Qu+UkiRqXPJ8SJP7IK61kwbFKJULOAI44SosbwwqGx0i5Fns4c1lkX03YfFlz5wXg+ua5znIi
 KFQ4a5Sc+hGOd4IxQwbYta05lKn1N/BAz8XYHbLw6ahy2j4gLvcnF6KYP6pBjMSr27fKeFWfA
 F0rq3TD6vVHlrNF9kwgYZOqXa1mHbq1bp4Fi+gyG1KfFh++xyiNpqPmptcq5g/Ks4pRtfgZcj
 XQTXrlv9/kaL3I3M4Xwh0p769RHrMOOLVlZodASPOQsFw+XeKSyMwhin+erceiY3PLgHfVMPg
 TDlYGLfb8BCJWWLKeRuBid6PMEsQ2H0F/HsK62AWYJDUoN2Q46quv2e/Vu3X3CiTt5iaZkWZG
 6VvJSzoW3qUaO8R9MtN+uk6MVvgP6BmCdhcgUybt1PVGZLwYwgHpEX2nkZArGwBuFZ9pl2thE
 vsfyQlQjL7Oz/dTffB0bAelWNH2+nLQy4/xQUCt01+4E7aJnf6T6oGPEuw6Kzh2YtO7Ojp1MF
 WezeQc4hhnG/qxwVbl3lbQm/RENR2RYlipPh1TaRgIWYCINR+/C7CZ5SsgqctbcnFspBmm6dp
 89HNCzwLo9s0C9HCHXkg==

On Tue, Jun 28, 2022 at 8:26 AM Qin Jian <qinjian@cqplus1.com> wrote:
>
> This patch series add Sunplus SP7021 SoC support.
>
> Sunplus SP7021 is an ARM Cortex A7 (4 cores) based SoC. It integrates many
> peripherals (ex: UART, I2C, SPI, SDIO, eMMC, USB, SD card and etc.) into a
> single chip. It is designed for industrial control.
>
> SP7021 consists of two chips (dies) in a package. One is called C-chip
> (computing chip). It is a 4-core ARM Cortex A7 CPU. It adopts high-level
> process (22 nm) for high performance computing. The other is called P-
> chip (peripheral chip). It has many peripherals and an ARM A926 added
> especially for real-time control. P-chip is made for customers. It adopts
> low-level process (ex: 0.11 um) to reduce cost.
>

As far as I can tell, all review comments have been fully addressed,
but I'm missing an Ack from Stephen Boyd so I can apply it through
the SoC tree.

        Arnd
