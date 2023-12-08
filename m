Return-Path: <SRS0=z6CE=HT=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA07EC4167B
	for <soc@archiver.kernel.org>; Fri,  8 Dec 2023 14:26:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7DA8EC433CA; Fri,  8 Dec 2023 14:26:08 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 653B1C433C9;
	Fri,  8 Dec 2023 14:26:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 653B1C433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E8D841BF205;
	Fri,  8 Dec 2023 14:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702045563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6Cul0TBbYEtzC30+f9W9k6p8Gg5s0PWpQ/0hISXTeEs=;
	b=Nf2hjyDv5jZZ0Z7zW3aVU0c2y4t8XlktF4v6Y65uVD71BrNWpW0bB0aPgM6uymaPLp4j7b
	TciIDpLhEPbhrv3bZHjcTiJ4c4QWuiUbTRqEG7Cf9+ECfkuJAARArDBtvO7oApB4TeIBdz
	T+shsHb19v0ZWfzhvT/19CIaZ6OWdMkgDegjnXrolcROEufTZ0qVJ2J+nslg7VtlVGamE/
	2BsjNj07kAevyoE7L5gSipBRm1Lsh4Tc8D7Tq+jTtfumm79QYpWL1p470I7Qt+2JOArmOj
	YN6LQ22mN0TDNcgaMUUQmMdVpzW9nWwl5JVLssfBbJsWXL7yGMdyKZSDK6Op6g==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Marek =?utf-8?Q?Beh=C3=BAn?= <kabel@kernel.org>, Arnd Bergmann
 <arnd@arndb.de>,
 soc@kernel.org, arm@kernel.org, Andy Shevchenko <andy@kernel.org>, Linus
 Walleij <linus.walleij@linaro.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v4 3/7] platform: cznic: turris-omnia-mcu: Add support
 for MCU connected GPIOs
In-Reply-To: <20231101123806.4d258ddb@dellmb>
References: <20231026161803.16750-1-kabel@kernel.org>
 <20231026161803.16750-4-kabel@kernel.org> <20231101123806.4d258ddb@dellmb>
Date: Fri, 08 Dec 2023 15:26:02 +0100
Message-ID: <87il58epol.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: gregory.clement@bootlin.com

Hello Marek,

> On Thu, 26 Oct 2023 18:17:59 +0200
> Marek Beh=C3=BAn <kabel@kernel.org> wrote:
>
>> +	mcu->gc.request =3D omnia_gpio_request;
>> +	mcu->gc.get_direction =3D omnia_gpio_get_direction;
>> +	mcu->gc.direction_input =3D omnia_gpio_direction_input;
>> +	mcu->gc.direction_output =3D omnia_gpio_direction_output;
>> +	mcu->gc.get =3D omnia_gpio_get;
>> +	mcu->gc.get_multiple =3D omnia_gpio_get_multiple;
>> +	mcu->gc.set =3D omnia_gpio_set;
>> +	mcu->gc.set_multiple =3D omnia_gpio_set_multiple;
>> +	mcu->gc.init_valid_mask =3D omnia_gpio_init_valid_mask;
>> +	mcu->gc.can_sleep =3D true;
>> +	mcu->gc.names =3D omnia_mcu_gpio_templates;
>> +	mcu->gc.base =3D -1;
>> +	mcu->gc.ngpio =3D ARRAY_SIZE(omnia_gpios);
>> +	mcu->gc.label =3D "Turris Omnia MCU GPIOs";
>> +	mcu->gc.parent =3D dev;
>> +	mcu->gc.owner =3D THIS_MODULE;
>
> Sigh. I will need to add a custom of_xlate here that accepts 3 cells
> instead of 2. The reason is that Pali prepared U-Boot code last year to
> patch reset-gpios into pcie nodes if MCU node is present in the
> devicetree, and back then we decided that the binding should be
> 3-celled:
>   reset-gpios =3D <&mcu BANK GPIO FLAGS>;
>
> So now the pcie controllers do not work because OF cannot give proper
> GPIOs.
>
> I will fix this in v5.

I was reviewing the seris in order to apply it, but I didn't find your
v5 in the mainling list. Did you send it ?

Regards,

Gregory

--=20
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
