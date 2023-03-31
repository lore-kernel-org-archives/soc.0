Return-Path: <SRS0=zA1q=7X=bgdev.pl=brgl@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE42C761A6
	for <soc@archiver.kernel.org>; Fri, 31 Mar 2023 14:11:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 18947C433A0; Fri, 31 Mar 2023 14:11:32 +0000 (UTC)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A40C4C4339B
	for <soc@kernel.org>; Fri, 31 Mar 2023 14:11:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A40C4C4339B
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vs1-f42.google.com with SMTP id h15so19302753vsh.0
        for <soc@kernel.org>; Fri, 31 Mar 2023 07:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1680271889;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lG/WYsq29l19IPVJ1k1HveeXpXEw8n6whXP0RBXQsVE=;
        b=EvtZrKsNbHzwyuTtRqHQROrrofpQ/sG01uOiuhmiI8aPts7n7Ee5Ir4NvfrBMC9uI+
         rP59rZDcNbSrbcJgAHZuzWOVqM440qSkPSsXQam8gLhm6JrqARMEWp7hP37azlVW4org
         fBACV9jHeMc/fcIgXarc7w17iylr7tNHGmieksiQNlIzpXJ80+yWU+CJGHU8lpI3k2C8
         ICYW0V27W/2DBLWul+Ja7q7aEtfylH/JCpUFcy+E+zrhYwff5tk/+w+43pgclTvoUdaY
         JKB3eTBzT085pwnm7cEdG1xRDF3HVWkUIWkzjjSc40AzCnbk/tZvpSB9Tq3T3RIS9CKy
         06FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680271889;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lG/WYsq29l19IPVJ1k1HveeXpXEw8n6whXP0RBXQsVE=;
        b=ee6WAVkFu1yXTXktRFy4EQboNXNMvjhTSZpbrbzPfetdkdiS4JZzKFtAbBskZV6raV
         U+peFc0WwlQdFsOOI4Cw+Dkr9QfLeCJTMR2i2oCsRr0pNBaYc8y5mF1sRgcAsCkLQASN
         Bo+p8wXeV8Dvw37rJ6i5PQCdQXcb6UU+6Ol3g8/wYe59rSnphUtfdZnflCSLHDKdbhf/
         0X3tdeM1ss+rTMBbspfGkfWQ/x4GALCjfwAO+UKfnf+McuIlK+LAuw7vfu0XW/Qgnjlk
         X9bUcVxBVKi04On6kPio+2SoqNJGHecWL+aMeeSQVM+DNKQct2eM6ITI/c3KZIkfMcMf
         0tCA==
X-Gm-Message-State: AAQBX9fDCX2oRsCG0D/Auzz4KBlg2qjXloaA4mjjCb1i7AD8GMrPApFe
	S5ab1HJa42EOaD1bSAh+skM6pdYCA233xI7JN3EBVdY1IpkAwJTD
X-Google-Smtp-Source: AKy350Ya9O0j2IJ/iXVAszn5aY9fHDH1jV5pYhAfg5ER4OEHtZmmlP21NIaPy6SQjGvX406cL1yK9LBdk5p7JcyHINc=
X-Received: by 2002:a67:e095:0:b0:426:b051:1c4 with SMTP id
 f21-20020a67e095000000b00426b05101c4mr9141092vsl.0.1680271889495; Fri, 31 Mar
 2023 07:11:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230331-topic-oxnas-upstream-remove-v1-0-5bd58fd1dd1f@linaro.org>
 <20230331-topic-oxnas-upstream-remove-v1-15-5bd58fd1dd1f@linaro.org>
In-Reply-To: <20230331-topic-oxnas-upstream-remove-v1-15-5bd58fd1dd1f@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 31 Mar 2023 16:11:18 +0200
Message-ID: <CAMRc=Mdp48+DitzSV5gq3arPL75TJXQLoBxTujsWSH4UVpd2ww@mail.gmail.com>
Subject: Re: [PATCH RFC 15/20] dt-bindings: gpio: gpio_oxnas: remove obsolete bindings
To: Neil Armstrong <neil.armstrong@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, soc@kernel.org, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Sebastian Reichel <sre@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Marc Zyngier <maz@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-mtd@lists.infradead.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-gpio@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 31, 2023 at 10:35=E2=80=AFAM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> Due to lack of maintainance and stall of development for a few years now,
> and since no new features will ever be added upstream, remove the
> OX810 and OX820 gpio bindings.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../devicetree/bindings/gpio/gpio_oxnas.txt        | 47 ----------------=
------
>  1 file changed, 47 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio_oxnas.txt b/Docu=
mentation/devicetree/bindings/gpio/gpio_oxnas.txt
> deleted file mode 100644
> index 966514744df4..000000000000
> --- a/Documentation/devicetree/bindings/gpio/gpio_oxnas.txt
> +++ /dev/null
> @@ -1,47 +0,0 @@
> -* Oxford Semiconductor OXNAS SoC GPIO Controller
> -
> -Please refer to gpio.txt for generic information regarding GPIO bindings=
.
> -
> -Required properties:
> - - compatible: "oxsemi,ox810se-gpio" or "oxsemi,ox820-gpio"
> - - reg: Base address and length for the device.
> - - interrupts: The port interrupt shared by all pins.
> - - gpio-controller: Marks the port as GPIO controller.
> - - #gpio-cells: Two. The first cell is the pin number and
> -   the second cell is used to specify the gpio polarity as defined in
> -   defined in <dt-bindings/gpio/gpio.h>:
> -      0 =3D GPIO_ACTIVE_HIGH
> -      1 =3D GPIO_ACTIVE_LOW
> - - interrupt-controller: Marks the device node as an interrupt controlle=
r.
> - - #interrupt-cells: Two. The first cell is the GPIO number and second c=
ell
> -   is used to specify the trigger type as defined in
> -   <dt-bindings/interrupt-controller/irq.h>:
> -      IRQ_TYPE_EDGE_RISING
> -      IRQ_TYPE_EDGE_FALLING
> -      IRQ_TYPE_EDGE_BOTH
> - - gpio-ranges: Interaction with the PINCTRL subsystem, it also specifie=
s the
> -   gpio base and count, should be in the format of numeric-gpio-range as
> -   specified in the gpio.txt file.
> -
> -Example:
> -
> -gpio0: gpio@0 {
> -       compatible =3D "oxsemi,ox810se-gpio";
> -       reg =3D <0x000000 0x100000>;
> -       interrupts =3D <21>;
> -       #gpio-cells =3D <2>;
> -       gpio-controller;
> -       interrupt-controller;
> -       #interrupt-cells =3D <2>;
> -       gpio-ranges =3D <&pinctrl 0 0 32>;
> -};
> -
> -keys {
> -       ...
> -
> -       button-esc {
> -               label =3D "ESC";
> -               linux,code =3D <1>;
> -               gpios =3D <&gpio0 12 0>;
> -       };
> -};
>
> --
> 2.34.1
>

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
