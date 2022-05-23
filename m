Return-Path: <SRS0=4JMP=V7=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16645C433F5
	for <soc@archiver.kernel.org>; Mon, 23 May 2022 10:44:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EF6E5C36AE5; Mon, 23 May 2022 10:44:27 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7F955C385A9;
	Mon, 23 May 2022 10:44:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7F955C385A9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-yw1-f173.google.com ([209.85.128.173]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Movrq-1nVZB81cXm-00qT8j; Mon, 23 May 2022 12:44:24 +0200
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-2ef5380669cso142791797b3.9;
        Mon, 23 May 2022 03:44:23 -0700 (PDT)
X-Gm-Message-State: AOAM532VBz5pKO74qJvUCEawx7m5phEzfuRkafOAVmqIA5VHIkC1otkl
	RK9ggLtmbVwK6UTMAM3F9qZuDoGoZRqMxEwEp6g=
X-Google-Smtp-Source: ABdhPJzbbTU7bxyEy+V6QZ7ro2Wti/wri258NXrp2iXt1Owp7jIbpPdzCSwsk8vjZl8l7XWvxC1S+1Cf8oUw+fAt8d0=
X-Received: by 2002:a81:6283:0:b0:2ff:2443:6f3c with SMTP id
 w125-20020a816283000000b002ff24436f3cmr22577090ywb.135.1653302662526; Mon, 23
 May 2022 03:44:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220522155046.260146-1-tmaimon77@gmail.com> <20220522155046.260146-13-tmaimon77@gmail.com>
In-Reply-To: <20220522155046.260146-13-tmaimon77@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 23 May 2022 12:44:06 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0PKvqpTjNeKUm6EnxpmJAtmk1jv+b4YXxr+fXFpsWXtw@mail.gmail.com>
Message-ID: <CAK8P3a0PKvqpTjNeKUm6EnxpmJAtmk1jv+b4YXxr+fXFpsWXtw@mail.gmail.com>
Subject: Re: [PATCH v1 12/19] reset: npcm: Add NPCM8XX support
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
X-Provags-ID: V03:K1:B8FAco/A7ps+b1a1a7R/eWg+W4acTIFSeXpnApfp0YjnSoE2d3G
 vIz2gxWcmf5ikoiyYJrp/SrznMhYkaNXmjTENMZPfOyrskofiB4lk6D++ATgVIf2t9L0+aY
 67+wd6HTvmBtwigC94zmcOUlV6gVf4CyEEOzbdr3+ZSsHGVuHDwEU7uNGa6PRH2HrW5bJZj
 yzgxGj8K1p/tmHf/3SMnQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0LpHDMda9rY=:D7F00BxTJZiPV5RJdbShGX
 dJakkSeF6TDPx1NqDw5J6gKMQa/jVcQKVWgQszyfw7m7xX4uvVuc+Rwa0A3CMhBJ89Dv/PtHP
 ALX2fLcVvLuLieHOsOJU5GGyDDYhEqjTduHU/vzBjFe+aiX7uLDTqMc8hLkx8+VxtVOw6TO9i
 iTsjSyHoYdZi1s7iAD8Qj5nRSHLyQzu7gRAWyYHxxxBSkkVVu+jkYaA+zMQKGGVp3mfOymiUl
 CZl9avzZPVWbSsj5ruC3CB4yWNjKgpDcKi4wd6GteWv2ucmM/qqhQcHJ3Ioxz6WAITgilUre8
 SP0K/ntJiXzxDIKMHGdHdBtqqbGsWqxkfo99aXYAU2zVVwiij7CV5pPcWsGL7Kflt0zNkBgrO
 nUyw+vy/utID4ULqG+YdomYj3QTpuYPW//sfVYM0JcIXWwWey7yCrUn9vyBVAOGdCdlgr5TR0
 9NKFqB+m4f1/qIVrChgIfvneKBCXoGAymNcO6PtTVDIUw7cio/nzKUXUjh3kReQnlrtSvbPxg
 +K5ewqMJRgmAnSAAdVF1n1tTcdM58g9V/4KeXtcvtEZQPcTZJsM/lKkwHhOTdiCLFxttklF1m
 Hhljxhc+fhPHC0++Vc99yWNoy2ZZJFbQFtoQACSCc3NQnluByGF7ZBK+xlO0ls+jhLqlpnbSM
 ugifDvJf9REqKDF2kFEG3gRQLWhRpR+2G1ij4MT/n/SHFxXQu0f0Sq8BsieAEDKJPDDE9k4ni
 BlZ9QN5MYg0+48FnVfRkLkXEWJdf3UExApcuzlALIpV5zx/Pt36Pm6s3oY1ef4ZvAGuX2iWmP
 0ndpAmMe28D3Vu/N9uDyeQu5NE3aP1g2ZwJOf8VuUPOpw49LQ9aWe30sOR5rYWtwverGbNzZQ
 2yBINY944NQiCfW8w0xfWGIb++HvLEXDdoJyJuIOI=

On Sun, May 22, 2022 at 5:50 PM Tomer Maimon <tmaimon77@gmail.com> wrote:

>  static const struct of_device_id npcm_rc_match[] = {
>         { .compatible = "nuvoton,npcm750-reset"},
> +       { .compatible = "nuvoton,npcm845-reset"},
>         { }
>  };
> +/*
> + *  The following procedure should be observed in USB PHY, USB device and
> + *  USB host initialization at BMC boot
> + */
> +static int npcm_usb_reset(struct platform_device *pdev, struct npcm_rc_data *rc)
> +{
> +       struct device_node *np = pdev->dev.of_node;
> +       struct device *dev = &pdev->dev;
> +
> +       rc->gcr_regmap = syscon_regmap_lookup_by_phandle(dev->of_node, "syscon");
> +       if (IS_ERR(rc->gcr_regmap)) {
> +               dev_err(&pdev->dev, "Failed to find gcr syscon");
> +               return PTR_ERR(rc->gcr_regmap);
> +       }
> +
> +       if (of_device_is_compatible(np, "nuvoton,npcm750-reset"))
> +               npcm_usb_reset_npcm7xx(rc);
> +       else if (of_device_is_compatible(np, "nuvoton,npcm845-reset"))
> +               npcm_usb_reset_npcm8xx(rc);
> +       else
> +               return -ENODEV;
>

In place of the string comparison in of_device_is_compatible(), maybe just use
the .data field of the of_device_id structure to point to the actual
reset function.

Alternatively, register two separate platform_driver instances here and
use separate probe functions that do the soc specific bits and call into
shared functions for the bits that are the same.

       Arnd
