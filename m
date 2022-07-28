Return-Path: <SRS0=Sq5O=YB=bgdev.pl=brgl@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A90C04A68
	for <soc@archiver.kernel.org>; Thu, 28 Jul 2022 13:50:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 58046C433D6; Thu, 28 Jul 2022 13:50:33 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 17CFFC433D7
	for <soc@kernel.org>; Thu, 28 Jul 2022 13:50:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 17CFFC433D7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ej1-f44.google.com with SMTP id l23so3271952ejr.5
        for <soc@kernel.org>; Thu, 28 Jul 2022 06:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vxq8TONSE00HXKwla5aOrD7/8grrZxrUZOEScjMYlXo=;
        b=I6w8bTdjtiWIAiiIyaZ8AqDCot6M72QWjJBec1p0ARnt8AHMFhDNL//ZXHs6Aj4TcJ
         /igAyJV2zhTPOL5+D4ckDgbeeKGK3pDFJZ+uLHafanehs6HrIAZgeCEw8EHOns5jIFk+
         kyjl9Ue4ngXTZEorTt7u464GVRsyPj5c8vMftb95KYLL3gFvZNpyv6A5Zo94ZzGwndM3
         7+JncdsyRgSX7u3FMswQZT3L7jNW+jf0yxlZ6ZPCMyQTccQP9r8yzYtBQR4prpLllOTd
         4gUdCmFwmc7lUNriFAqKS368bnIz7FImfmejvwn+pqMKb/5uwMK0Lacm33F2cCXgb+o5
         MBUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vxq8TONSE00HXKwla5aOrD7/8grrZxrUZOEScjMYlXo=;
        b=JS4sMYCCbjgkVhQXM9QfC+M7pgHVse5VMbR2yT9K5gNCP73UD1sn5mdXpZUdITi8Eb
         VWSpZQXCYqpd9vNUqJntDFly/5xKle3+NirNwFKsO27qvTV2AMxhHOzouNpzW+3/fayu
         98jCd/Ysjj9otT0fr4WLJvRnB+Bw2Z50JrHDqRi39T1pdoRQ9kvTHbSVh5+fCuANr02f
         AxFYQ1uhOjFLQat4FaoL8hIJcyU2fnyqD+o5dZGPvNS2XG2G1JT4xdeT7q8YOxypr/20
         0rnlKr4TyT4aYAQBJwKONxkUnQVbhfnJrPjL8u5pdCoR7lb4/BY4Zg4y001TUCFvTGRF
         Bfgg==
X-Gm-Message-State: AJIora8p1QYPapKilyiK/5nIDxQwpA8FAlQZSKDS8guQ7rVJw4DzYXKT
	NX4CD5KKDJ0tGTe3eCVWFOiQtOdwpVvdK+gB0F9AlA==
X-Google-Smtp-Source: AGRyM1vd13k6pgor+DlHJHQfDA7PQXuMPPW6KeHGTUbH0ZXwLGn62yE4jjI826yPI+uPcZiWt3sa3ZGDqeczrsLkYNM=
X-Received: by 2002:a17:907:9482:b0:72b:8c16:dac0 with SMTP id
 dm2-20020a170907948200b0072b8c16dac0mr18135736ejc.286.1659016230136; Thu, 28
 Jul 2022 06:50:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220723160513.271692-1-Mr.Bossman075@gmail.com>
 <20220723160513.271692-4-Mr.Bossman075@gmail.com> <CACRpkdZMFdYDssk9B7R-MH7xG8Ukp+ZQpXCRVtPRCS=SFh34mA@mail.gmail.com>
In-Reply-To: <CACRpkdZMFdYDssk9B7R-MH7xG8Ukp+ZQpXCRVtPRCS=SFh34mA@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 28 Jul 2022 15:50:19 +0200
Message-ID: <CAMRc=Mf02_L1Msf3Wynqu1EROq+nsizhdEWEBJR0DpTybQ=KWA@mail.gmail.com>
Subject: Re: [PATCH v5 03/12] dt-bindings: gpio: fsl-imx-gpio: Add i.MXRT compatibles
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Jesse Taube <mr.bossman075@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Aisheng Dong <aisheng.dong@nxp.com>, stefan@agner.ch, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Arnd Bergmann <arnd@arndb.de>, olof@lixom.net, soc@kernel.org, 
	Russell King <linux@armlinux.org.uk>, abel.vesa@nxp.com, dev@lynxeye.de, 
	Marcel Ziswiler <marcel.ziswiler@toradex.com>, Tim Harvey <tharvey@gateworks.com>, 
	Leo Li <leoyang.li@nxp.com>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	cniedermaier@dh-electronics.com, clin@suse.com, 
	giulio.benetti@benettiengineering.com, 
	devicetree <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 26, 2022 at 10:04 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Sat, Jul 23, 2022 at 6:05 PM Jesse Taube <mr.bossman075@gmail.com> wrote:
>
> > Both the i.MXRT1170 and 1050 have the same gpio controller as
> > "fsl,imx35-gpio". Add i.MXRT to the compatible list.
> >
> > Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> > Acked-by: Rob Herring <robh@kernel.org>
>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Bartosz needs to apply this to the GPIO tree, I think it can just be applied
> directly without regard for the rest of the patches.
>
> Yours,
> Linus Waleij

Applied, thanks!

Bart
