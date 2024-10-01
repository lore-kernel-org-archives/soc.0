Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06231C2DCF
	for <soc@lists.linux.dev>; Tue,  1 Oct 2024 12:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727786695; cv=none; b=DazyWTYJjD2hfl2ipPgih87IaBMBbkgIkhkZ+iNKrt+GESVIQi6ZShSVy4hznzlMV5ptiicpJiH5CvnkgD5+WTdro1/hkRIBc/SnN34t36en99cEBluomqOxDUvIe23yVYuJJpYhOrG2ubMVH1shaIf3XajsSFHzXyc3taKndNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727786695; c=relaxed/simple;
	bh=rMWaD774gg0hu/gWCIVWwnbAb1bXuoiTiGBgOQS7Zec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B4yZzOYkifddNA/TamX2CzN06M/wWWnLC8cVvDW7iqX0LZTHrZAUKvEvpa9sOXm7UK6aHWKtRdYXW98yIa/nDBmGOPsAG2Lk7LOgISNyXoSCgtmC7ckYrCMou0Vwr2qclYGnZIALgucRSO1HrwV4iKereOidzBvh5T4nJOdRERg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MSWnLdfI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MSWnLdfI"
Received: by smtp.kernel.org (Postfix)
	id 9A70FC4CED5; Tue,  1 Oct 2024 12:44:54 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D53C9C4CED1
	for <soc@kernel.org>; Tue,  1 Oct 2024 12:44:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D53C9C4CED1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5398e58ceebso2561288e87.0
        for <soc@kernel.org>; Tue, 01 Oct 2024 05:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727786690; x=1728391490; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qJdk49FPom1vhJW6KLrc9xb2N9g+9cOy2pAI61oaoAo=;
        b=MSWnLdfIwXlHPh/y2Jg3RlfroQRz3bttZWdRKREo/w1K4I2nFRiSFp62Zut5gGPjsu
         OkX+RLiwr25js6Y8ig/e9KaJCZIWG965Fgd8ZBoFAYFnF6ImvcW6JrNWq/hifTAI2Q0G
         yv5wnj+hlu4y7IISnI5uReWJ9/G8QrcOtGSI+QIkjggcYtRxicZ917oCW3Q3aDW5cPQq
         mC70icpRNQIiVQWTmVp23amXkiSHgskEI8P+HDIPn5AkgqJ3umoJa1zFkSdNAtU5WqJp
         2iGwMALkKQaskihKLv5EJIfv2RcQmxEn2bmVF6NZOVlLUc1Wwzf07lm8M0dw9zJszwrf
         vIug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727786690; x=1728391490;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qJdk49FPom1vhJW6KLrc9xb2N9g+9cOy2pAI61oaoAo=;
        b=aw0M36tnabhdLhzZc/SJYwMwuxL5MpDitixXoLC2gDkNrrZSdlP5S5+rIlhfwcPn2D
         qT06cwvI4F9TD2grlgnqU0ubbET1Ima0+nXgF96gu/Oc4JMvA94pBvN9i2MAVTfBTNNu
         P2UWVbr0kXlTVjP8Rb/aKCAXbp0DXq/ebL0kpgB5ug1C9wdBWOfoqVkUM97QlNzruHR/
         yVZOOVoNvO3AwYsbCnhI8LzybjU6QAUqBc8Oj1uAOSKUfEdrD1BxdGheNvUeYmTyJPGD
         6PuBMVk7S3YfMG1zse9e5UcH0iUvLecJiNMuYcW/oDZbg7IirtjmXaKoyIsOXp/FAk4R
         z20g==
X-Forwarded-Encrypted: i=1; AJvYcCXoeZ83ma4F1OjNmo2gZVOKoO3K6899iq39qyKk/wWmK5iJQVBveoK21ygLfWVcDavav54=@kernel.org
X-Gm-Message-State: AOJu0Yx3evTHAwTjHLbRnPC0zlBMBSVkIiktaEcbPp25BNBCgSyATe5F
	NFTb2RGPINfk3BPGf58VprqjDl4Az1eNApBCpdye6Z5m1HaB2EhUsz47POcyLYnBhY6B9bi1fr3
	MhcszIHaM8l7yJafT0QoIKjhoWbqr4C0Vywptvg==
X-Google-Smtp-Source: AGHT+IFpLEVSrtSEfceUFr1y/mkuGvz43bOehtQ1kSTprLlq+kFdHRQGWxpV7X7Wx0HYBHJpzMV+133mIhupsz3X9bs=
X-Received: by 2002:a05:6512:6c6:b0:52f:30d:526c with SMTP id
 2adb3069b0e04-5399a23f44cmr1103973e87.5.1727786689856; Tue, 01 Oct 2024
 05:44:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240912-test-v1-0-458fa57c8ccf@analog.com> <20240912-test-v1-9-458fa57c8ccf@analog.com>
In-Reply-To: <20240912-test-v1-9-458fa57c8ccf@analog.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 1 Oct 2024 14:44:39 +0200
Message-ID: <CACRpkdZb6AhxB7XEtOsxV5_oa=c1h2+ZApLFsTS_MQs-cjLmsg@mail.gmail.com>
Subject: Re: [PATCH 09/21] gpio: add driver for ADI ADSP-SC5xx platform
To: arturs.artamonovs@analog.com
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Greg Malysa <greg.malysa@timesys.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Utsav Agarwal <Utsav.Agarwal@analog.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>, 
	Andi Shyti <andi.shyti@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, soc@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-serial@vger.kernel.org, adsp-linux@analog.com, 
	Nathan Barrett-Morrison <nathan.morrison@timesys.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arturs,

thanks for your patch!

On Thu, Sep 12, 2024 at 8:20=E2=80=AFPM Arturs Artamonovs via B4 Relay
<devnull+arturs.artamonovs.analog.com@kernel.org> wrote:

> From: Arturs Artamonovs <arturs.artamonovs@analog.com>
>
> Add ADSP-SC5xx GPIO driver.
> - Support all GPIO ports
> - Each gpio support seperate PINT interrupt controller
>
> Signed-off-by: Arturs Artamonovs <Arturs.Artamonovs@analog.com>
> Co-developed-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
> Signed-off-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
> Co-developed-by: Greg Malysa <greg.malysa@timesys.com>
> Signed-off-by: Greg Malysa <greg.malysa@timesys.com>

(...)

> +config GPIO_ADI_ADSP_PORT
> +       bool "ADI ADSP PORT GPIO driver"
> +       depends on OF_GPIO
> +       select GPIO_GENERIC

If you select this then you need to use it in the idiomatic way.

+#include <linux/soc/adi/adsp-gpio-port.h>

Drop this, just bring the contents into this file all register defines
etc.

+#include "gpiolib.h"

No way, do this:
#include <linux/gpio/driver.h>

> +static int adsp_gpio_direction_input(struct gpio_chip *chip, unsigned in=
t offset)
> +{
> +       struct adsp_gpio_port *port =3D to_adsp_gpio_port(chip);
> +
> +       __adsp_gpio_writew(port, BIT(offset), ADSP_PORT_REG_DIR_CLEAR);

Ah these __adsp_gpio_writew/readw things are too idiomatic. Just
use the base and common writew() please.

> +       __adsp_gpio_writew(port, BIT(offset), ADSP_PORT_REG_INEN_SET);

Interrupt enable in the direction function? No thanks, poke the
interrupt registers in your irqchip if you make one (you currently
do not) in this case I'd say just disable all interrupts in probe()
using something like writew(base + ADSP_PORT_REG_INEN_SET, 0xffff)
and be done with it.

> +static int adsp_gpio_get_value(struct gpio_chip *chip, unsigned int offs=
et)
> +{
> +       struct adsp_gpio_port *port =3D to_adsp_gpio_port(chip);
> +
> +       return !!(__adsp_gpio_readw(port, ADSP_PORT_REG_DATA) & BIT(offse=
t));
> +}

This becomes a reimplemenation of generic GPIO.

> +static int adsp_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
> +{
> +       struct adsp_gpio_port *port =3D to_adsp_gpio_port(chip);
> +       irq_hw_number_t irq =3D offset + port->irq_offset;
> +       int map =3D irq_find_mapping(port->irq_domain, irq);
> +
> +       if (map)
> +               return map;
> +
> +       return irq_create_mapping(port->irq_domain, irq);
> +}

This irqdomain in the "port" looks weird.

Implement the irqchip in the GPIO driver instead.

If the domain *has* to be external to the GPIO driver then
you need to use hierarchical irqdomains.

> +static int adsp_gpio_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct adsp_gpio_port *gpio;
> +       int ret;
> +
> +       gpio =3D devm_kzalloc(dev, sizeof(*gpio), GFP_KERNEL);
> +       if (!gpio)
> +               return -ENOMEM;
> +
> +       gpio->regs =3D devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(gpio->regs))
> +               return PTR_ERR(gpio->regs);

So you have gpio->regs which is the base.

> +       gpio->dev =3D dev;
> +
> +       ret =3D adsp_attach_pint_to_gpio(gpio);
> +       if  (ret)
> +               dev_err_probe(gpio->dev, ret, "error attaching interupt t=
o gpio pin\n");
> +
> +       spin_lock_init(&gpio->lock);
> +
> +       gpio->gpio.label =3D "adsp-gpio";
> +       gpio->gpio.direction_input =3D adsp_gpio_direction_input;
> +       gpio->gpio.direction_output =3D adsp_gpio_direction_output;
> +       gpio->gpio.get =3D adsp_gpio_get_value;
> +       gpio->gpio.set =3D adsp_gpio_set_value;
> +       gpio->gpio.to_irq =3D adsp_gpio_to_irq;
> +       gpio->gpio.request =3D gpiochip_generic_request;
> +       gpio->gpio.free =3D gpiochip_generic_free;
> +       gpio->gpio.ngpio =3D ADSP_PORT_NGPIO;
> +       gpio->gpio.parent =3D dev;
> +       gpio->gpio.base =3D -1;
> +       return devm_gpiochip_add_data(dev, &gpio->gpio, gpio);

Look in e.g. drivers/gpio/gpio-ftgpio010.c for an example of
how to use generic GPIO (with an irqchip!). It will be something like:

        ret =3D bgpio_init(&g->gc, dev, 2,
                         gpio->regs + ADSP_PORT_REG_DATA,
                         gpio->regs + ADSP_PORT_REG_DATA_SET,
                         gpio->regs + ADSP_PORT_REG_DATA_CLEAR,
                         gpio->regs + ADSP_PORT_REG_DIR_SET,
                         gpio->regs + ADSP_PORT_REG_DIR_CLEAR,
                         0);
        if (ret) {
                dev_err(dev, "unable to init generic GPIO\n");
                goto dis_clk;
        }
        g->gc.label =3D dev_name(dev);
        g->gc.base =3D -1;
        g->gc.parent =3D dev;
        g->gc.owner =3D THIS_MODULE;
        /* ngpio is set by bgpio_init() */

You can augment the generic driver instance with an extra config function
to set the special open drain bits.

Yours,
Linus Walleij
