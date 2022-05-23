Return-Path: <SRS0=4JMP=V7=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E48C433F5
	for <soc@archiver.kernel.org>; Mon, 23 May 2022 09:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0BFD5C385A9; Mon, 23 May 2022 09:40:11 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AD1A0C385AA;
	Mon, 23 May 2022 09:40:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AD1A0C385AA
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-yb1-f176.google.com ([209.85.219.176]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MatZt-1nGzls222N-00cSWC; Mon, 23 May 2022 11:40:07 +0200
Received: by mail-yb1-f176.google.com with SMTP id o80so24411221ybg.1;
        Mon, 23 May 2022 02:40:06 -0700 (PDT)
X-Gm-Message-State: AOAM533ox8SNGDU9H9z7lRBqiHT/vvhiCC2EFRIWjmhmjIwMfIOPyFDb
	iW1S6seuHLChSQRMJs4WzQ0SK0J6y+jgo3XcJZs=
X-Google-Smtp-Source: ABdhPJwPSWjf0+4YNJaSIgYV3+A8L+w17pCRPMTjSGU6t40/PC+JSliP4KqFNtyVOp/6cKrGh1RaU8G2YIBlaJLXrPQ=
X-Received: by 2002:a25:c747:0:b0:64f:62fb:f55e with SMTP id
 w68-20020a25c747000000b0064f62fbf55emr13651825ybe.106.1653298805675; Mon, 23
 May 2022 02:40:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220522155046.260146-1-tmaimon77@gmail.com> <20220522155046.260146-19-tmaimon77@gmail.com>
In-Reply-To: <20220522155046.260146-19-tmaimon77@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 23 May 2022 11:39:48 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1LCkM-w_Oi2qUqgq_Qxsg64uoGg5aaz=X8pBENHBhj0A@mail.gmail.com>
Message-ID: <CAK8P3a1LCkM-w_Oi2qUqgq_Qxsg64uoGg5aaz=X8pBENHBhj0A@mail.gmail.com>
Subject: Re: [PATCH v1 18/19] arm64: dts: nuvoton: Add initial NPCM845 EVB
 device tree
To: Tomer Maimon <tmaimon77@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Avi Fishman <avifishman70@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Joel Stanley <joel@jms.id.au>, Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, gregkh <gregkh@linuxfoundation.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Olof Johansson <olof@lixom.net>, Jiri Slaby <jirislaby@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Bjorn Andersson <bjorn.andersson@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Marcel Ziswiler <marcel.ziswiler@toradex.com>, Vinod Koul <vkoul@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, robert.hancock@calian.com, 
	"nathan=20Neusch=C3=A4fer?=" <j.neuschaefer@gmx.net>, Lubomir Rintel <lkundrak@v3.sk>, SoC Team <soc@kernel.org>, 
	DTML <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, 
	"open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>, 
	LINUXWATCHDOG <linux-watchdog@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:31MN2EAVcihMzvp/T1D9t6raJtLfiMEaT9f/yNj9PnOC2vtUBww
 TmBHB7gX8rrfEE7hIhGVc7gNCCtb1teN9CCv3p/AlpAwd9M9ZQUxa30n/qB0r2s3zsgZcwu
 1xKcXPJL5BrnsuSdv3Mu2EY/9eaW1BD1zrh+cnBdgAm1axLroGGx4GgQJgSNjzsfZE7UC2k
 FeM98kUbbquxdZV9fST8w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dHP8JVcDVw8=:wCa6L//FPBQnq4IgKph3dN
 kJSy+isLB0vtKDBE1OWVKGIVMqwOeeYPhoqKKU6+VwK3TYUj/+UUM68rT8G2L1SIB1DKtvKQu
 UUHI1Pblk+mCyJTONwBrIfXtzT7HEeOU8U6uWPQYMivn6aO65ZQ4zDZSbflJ8y7GSA/d3wudU
 aV4fNR2V6Iq92TYQRiDNBE+UGKCKM2thgg6Wm0rzow50v8rdNHIRYvWqyYH5XQA2XDRfNBQBX
 xvSDivh8uzS+npz9Wv16Sw/WuvSdCM/6qhCWRFXlGejpZ5WkEW1/Bu777MtuidTHmTZ1MTBVI
 /hodNkB1UuQc6MRewnF6YB7V3pDK/JyIBey7niO1IxM9uCKZ3/qz3sfYlm6rYyx8v4vwGCKFq
 VgrjhMxW6HbVaLMfILoB2deL01uXHonOhViFIzsSTj2oGlu31GsWflkDnVJ5b9Hk1fwU/Dkxe
 KOj88DIKLmnJ5Ex6gWorUdX9zfunVnMvBwlv9SQRZdSN37jIjZdlsWKVt8yQ8Y9jg0qqQ50Zf
 GOkI6DyQaq5ukHHBYxZzBvyQfn/gicoV90HbqcxUgdQvwv44CyfXzuHyynY5wvLJIxTpinKiU
 kdX9y3HV2IBbMwM4BXnsbhsIycyvzKfdpq8zbEUKE6yV0uNYQPJt3a7ivdnCpjwVCFcn3sEW2
 700G+CEKfkAr35sRoJL6rnYBDtkDArqj1UkoDLxGXHuBd6Vh317WbaYYjnQcyyxozCi2Tu5DZ
 YDkOZbR+8b9qhwyCpSjiFGmGtMndULJzFgGfY4O9z34Aq9L6RP4LoKEkKzy5I+epy6P7N8Hwq
 Z7tGyKCsN7p57SBwooCVhMcfqIoG/FBf3rBv/+BspJ7zAyABhDzZ5VPPMcR9S8ASSUsA0XfCe
 qNXtYBiv82H6UadLxJIQ==

On Sun, May 22, 2022 at 5:50 PM Tomer Maimon <tmaimon77@gmail.com> wrote:
> +/ {
> +       model = "Nuvoton npcm845 Development Board (Device Tree)";
> +       compatible = "nuvoton,npcm845";
> +
> +       aliases {
> +               serial0 = &serial0;
> +               serial1 = &serial1;
> +               serial2 = &serial2;
> +               serial3 = &serial3;
> +       };

> +               apb {
> +                       serial0: serial@0 {
> +                               status = "okay";
> +                       };
> +
> +                       serial1: serial@1000 {
> +                               status = "disabled";
> +                       };
> +
> +                       serial2: serial@2000 {
> +                               status = "disabled";
> +                       };
> +
> +                       serial3: serial@3000 {
> +                               status = "disabled";
> +                       };

Please drop the aliases for disabled uarts. It probably also makes
sense to have the status="disabled" properties in the .dtsi file and
only override them when you explicitly want to enable a uart for a
board.

       Arnd
