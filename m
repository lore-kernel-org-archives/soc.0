Return-Path: <SRS0=Dw/n=GM=gmail.com=festevam@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7217BC433E6
	for <soc@archiver.kernel.org>; Sat,  9 Jan 2021 19:53:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4620C23A82; Sat,  9 Jan 2021 19:53:19 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE92B23A7F;
	Sat,  9 Jan 2021 19:53:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE92B23A7F
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=festevam@gmail.com
Received: by mail-lf1-f49.google.com with SMTP id o10so20395122lfl.13;
        Sat, 09 Jan 2021 11:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Cl+kCq9RgNjHFtJ0jMkOqkZFX0EZ3i6SD4sOc9QasOE=;
        b=A2vHOYTcitTVq1idzX6qJHQ0ZeGNGVZ01Fhfv7n4B8YNp8436zDaEefui8g3Bh8DcA
         bG2+5Jk+vWvS6MopTUqfgIjt0kij4kE/8SGjPXdPXlI6AIK9VJfm+aPd0cGs0AFdICxd
         eygbNr4OL2Hkp+v+YsVgpBsrny30pd7j0UZ5hPAt1etVHYoSeVSjKbqWOIe7VzW5fT46
         q0l85ZTiE1x8S7PnX2ujkqykHCt+g7zN6YFz1xBFjf9TiIF/xC2gLzR+xys+X0ni6MRk
         H2arIS7UJehZLSPhyatw1QkZml1kex9+2DQql9RGpuP3iKJNN3OdKtmsgyP98BdFCnNC
         +VKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Cl+kCq9RgNjHFtJ0jMkOqkZFX0EZ3i6SD4sOc9QasOE=;
        b=FiyS7dl0QfDEN3OFo10iinLznL5ky6K72d40X1UVIjw3aOZLPLoe0LVOcziNkEV7vB
         YjvAUhZVDp1DFQQ1ZVhL7ZhU31VxT7iLi5klks4EO0NFeuPffRvq41Zmgsd5HKBEBss0
         AdmWAIINUVaVOMrc/LrMAbVcuFY5CJwLtaQTOyfIZnLwSQheub0qFDGkiXQcuAS+joNY
         oCuEddysEPyy6FUJh9BSOUR+P1dKzogAo12dzTnv6cOMEnd3jTkKUtoRWVCpLVbcRvW0
         7iYTgNlv4+jG5YGODQOsYkrojWsoODhq7QAwX3wRY/9mh8TjtoBzWabpfr/zmpTe4Mq4
         nMHA==
X-Gm-Message-State: AOAM531KL8TGADTHMiSw39KiZnVnMM/+DJs6nkxB6480GrhKCOgJ8Kze
	YBV9pRDzNetK+PoCt2TQc4/RCS7S0l1MQxwFH+Q=
X-Google-Smtp-Source: ABdhPJzU1r2eTx3+DSxC1CZupRwItg9PZXkK2YTXlGkB10rcIe0vN6ZbKdYWFs0pXmzFjK5gqvhzT0eUA5VBrbbEbe4=
X-Received: by 2002:a19:e20a:: with SMTP id z10mr4568621lfg.295.1610221996906;
 Sat, 09 Jan 2021 11:53:16 -0800 (PST)
MIME-Version: 1.0
References: <1610144511-19018-1-git-send-email-oliver.graute@gmail.com> <1610144511-19018-3-git-send-email-oliver.graute@gmail.com>
In-Reply-To: <1610144511-19018-3-git-send-email-oliver.graute@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 9 Jan 2021 16:53:05 -0300
Message-ID: <CAOMZO5AGro=rGTPV0CAWPh_=Q9KqCYWO199FWn57xBc=eUWdog@mail.gmail.com>
Subject: Re: [PATCH v8 2/3] ARM: dts: Add support for i.MX6 UltraLite DART
 Variscite Customboard
To: Oliver Graute <oliver.graute@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>, Marco Felsch <m.felsch@pengutronix.de>, 
	Neil Armstrong <narmstrong@baylibre.com>, parthitce@gmail.com, 
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, soc@kernel.org, 
	Rob Herring <robh+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 8, 2021 at 7:23 PM Oliver Graute <oliver.graute@gmail.com> wrote:

> +       panel1: panel-lcd {
> +               compatible = "sgd,gktw70sdad1sd";
> +
> +               backlight = <&backlight_lcd>;
> +               power-supply = <&reg_touch_3v3>;
> +               label = "gktw70sdad1sd";
> +
> +               display-timing {

If you pass the compatible, then you don't need to add the
display-timing in the device tree.
