Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C396EC4332F
	for <soc@archiver.kernel.org>; Wed,  1 Nov 2023 11:38:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 86DA4C433CB; Wed,  1 Nov 2023 11:38:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3FC7C433C9;
	Wed,  1 Nov 2023 11:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698838691;
	bh=K/4K96ZozjhpixHB7pw6Llv/+6TJ6feL7hQcYMYuDrU=;
	h=Date:From:List-Id:To:Subject:In-Reply-To:References:From;
	b=gCBFG+5USWpeoZq397Bpb3xr4lvUeU0W/C85AEiS0VRyIt6Bw2cy7RBQqSFOj4DO4
	 65JyMn/k5EjU+q2ZRIzMlK+s87Vx14ba2bzGMBYpEvnmgoMNYrrFQcv2fzlFkuOA+X
	 48j1KjGSRIZLV0Ld7DFcSyqaWJ/r57jEjhgGXoA9F1ou1zjqWgVAtQfOlNw32OaK+W
	 vkdvF+7iIfVmwN2ucBdLs34OWU4xRECmz3nxDnb16qXrZnuA12yumC4Ug21srCz2a/
	 slPx55PVY5OY0ovbgguL9iB8YJSX7od2LhpPx55j94IAfip+Qt3VoEQbxYKcm7HJng
	 Jhp0BJ0AZjdxg==
Date: Wed, 1 Nov 2023 12:38:06 +0100
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>, Arnd Bergmann
 <arnd@arndb.de>, soc@kernel.org, arm@kernel.org, Andy Shevchenko
 <andy@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v4 3/7] platform: cznic: turris-omnia-mcu: Add support
 for MCU connected GPIOs
Message-ID: <20231101123806.4d258ddb@dellmb>
In-Reply-To: <20231026161803.16750-4-kabel@kernel.org>
References: <20231026161803.16750-1-kabel@kernel.org>
	<20231026161803.16750-4-kabel@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 26 Oct 2023 18:17:59 +0200
Marek Beh=C3=BAn <kabel@kernel.org> wrote:

> +	mcu->gc.request =3D omnia_gpio_request;
> +	mcu->gc.get_direction =3D omnia_gpio_get_direction;
> +	mcu->gc.direction_input =3D omnia_gpio_direction_input;
> +	mcu->gc.direction_output =3D omnia_gpio_direction_output;
> +	mcu->gc.get =3D omnia_gpio_get;
> +	mcu->gc.get_multiple =3D omnia_gpio_get_multiple;
> +	mcu->gc.set =3D omnia_gpio_set;
> +	mcu->gc.set_multiple =3D omnia_gpio_set_multiple;
> +	mcu->gc.init_valid_mask =3D omnia_gpio_init_valid_mask;
> +	mcu->gc.can_sleep =3D true;
> +	mcu->gc.names =3D omnia_mcu_gpio_templates;
> +	mcu->gc.base =3D -1;
> +	mcu->gc.ngpio =3D ARRAY_SIZE(omnia_gpios);
> +	mcu->gc.label =3D "Turris Omnia MCU GPIOs";
> +	mcu->gc.parent =3D dev;
> +	mcu->gc.owner =3D THIS_MODULE;

Sigh. I will need to add a custom of_xlate here that accepts 3 cells
instead of 2. The reason is that Pali prepared U-Boot code last year to
patch reset-gpios into pcie nodes if MCU node is present in the
devicetree, and back then we decided that the binding should be
3-celled:
  reset-gpios =3D <&mcu BANK GPIO FLAGS>;

So now the pcie controllers do not work because OF cannot give proper
GPIOs.

I will fix this in v5.

Marek
