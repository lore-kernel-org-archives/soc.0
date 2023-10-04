Return-Path: <SRS0=3HAM=FS=linaro.org=viresh.kumar@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F65E8FDCA
	for <soc@archiver.kernel.org>; Wed,  4 Oct 2023 06:01:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EA84FC433C7; Wed,  4 Oct 2023 06:01:46 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EF526C433C8
	for <soc@kernel.org>; Wed,  4 Oct 2023 06:01:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EF526C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1bf55a81eeaso13328225ad.0
        for <soc@kernel.org>; Tue, 03 Oct 2023 23:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696399304; x=1697004104; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2AsdbIyv3XcAYC3suv1NhcQN7xXYxXg8ts9w0KLbx0U=;
        b=vb90H7dzm+tLcEBc/1LPyr8kvzfeZfDFacJiX9zWSa0RRbUo3XdwXP/Yb8yNRDT6d3
         bzyU+QtCHp/NEZ0w93Alm3onMSwJiv9I8//GnZhVun3+zY7Lq+C0I+hiikDQLCUNo+IJ
         ktaoHZrMt7vwzKgdf3cM2ETFNEcWL2YKuz6tjA3rdN0pJg1zqstu2Sqcv9qwd94xHaIZ
         5BAWzxi3Sj0UYMFaCr34wCTLjEvKN4Vpq2Ydf2B5Vk1uOJc1MW6xSQ4QV55xOFmp+7Cv
         CB1p7kwI+7Kp6KPXdM3PQgnSAoUB/tJ8Bn7u1cFw9O4HEPBmts9RFUyVDi5hW2zRsHHG
         rddA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696399304; x=1697004104;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2AsdbIyv3XcAYC3suv1NhcQN7xXYxXg8ts9w0KLbx0U=;
        b=NhgKi+wj8ViyVSSHAqzpq1qvnna9tRay3PmqvpTKWs0ehfBvbCuVNNP+V8/G1JyLf5
         GKofu6j2lSI69QYOquxB42b0tzKs+0qV6QOtJAcFgepEEHlsgVyd0RJfe1xlEYQ2Sc4F
         W9uRROD6weZdcbEebHSYiTPrMdGaN2K7Z7U9QyfGMVAD2SKydkO/LeUAGfkFDHKrr0AZ
         egzRJyJUXze2jvpvVt5XtMu+kwBZcT/Jxd4ZBMOjzfPC4DYxn97XH9EYaL7+pnoirN07
         Ke4zgJFSrCUMG4mjpTreV/4+cLkhivmqG/j6mnW0JGAOs8khhvNnl8TDpRmHnC1qgs4k
         p3MQ==
X-Gm-Message-State: AOJu0Yyl0QBHr3btxiAupoX6UfH0i/iv9CtHOKVpyTlVmivahsNK4/CK
	udQ1awqi8Ky43LF4KWQZDuJC7A==
X-Google-Smtp-Source: AGHT+IGCj5ut6r5kBF2Dhj8lVGxq0KhDKOo/FWs618LaeYnXFGYjKIhGppdpnZOvRt2vIMJ/oCWYMw==
X-Received: by 2002:a17:902:d485:b0:1c8:791c:d782 with SMTP id c5-20020a170902d48500b001c8791cd782mr502820plg.29.1696399304145;
        Tue, 03 Oct 2023 23:01:44 -0700 (PDT)
Received: from localhost ([122.172.81.92])
        by smtp.gmail.com with ESMTPSA id w9-20020a1709026f0900b001c73f52dbb6sm2752530plk.17.2023.10.03.23.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 23:01:43 -0700 (PDT)
Date: Wed, 4 Oct 2023 11:31:40 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: <soc.lore.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org
Subject: Re: [PATCH 17/36] pinctrl: spear: use new pinctrl GPIO helpers
Message-ID: <20231004060140.ivkvtabblqesleow@vireshk-i7>
References: <20231003145114.21637-1-brgl@bgdev.pl>
 <20231003145114.21637-18-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231003145114.21637-18-brgl@bgdev.pl>

On 03-10-23, 16:50, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Replace the pinctrl helpers taking the global GPIO number as argument
> with the improved variants that instead take a pointer to the GPIO chip
> and the controller-relative offset.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/pinctrl/spear/pinctrl-plgpio.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pinctrl/spear/pinctrl-plgpio.c b/drivers/pinctrl/spear/pinctrl-plgpio.c
> index 722681e0b89b..7488f6394318 100644
> --- a/drivers/pinctrl/spear/pinctrl-plgpio.c
> +++ b/drivers/pinctrl/spear/pinctrl-plgpio.c
> @@ -204,14 +204,13 @@ static void plgpio_set_value(struct gpio_chip *chip, unsigned offset, int value)
>  static int plgpio_request(struct gpio_chip *chip, unsigned offset)
>  {
>  	struct plgpio *plgpio = gpiochip_get_data(chip);
> -	int gpio = chip->base + offset;
>  	unsigned long flags;
>  	int ret = 0;
>  
>  	if (offset >= chip->ngpio)
>  		return -EINVAL;
>  
> -	ret = pinctrl_gpio_request(gpio);
> +	ret = pinctrl_gpio_request_new(chip, offset);
>  	if (ret)
>  		return ret;
>  
> @@ -249,14 +248,13 @@ static int plgpio_request(struct gpio_chip *chip, unsigned offset)
>  	if (!IS_ERR(plgpio->clk))
>  		clk_disable(plgpio->clk);
>  err0:
> -	pinctrl_gpio_free(gpio);
> +	pinctrl_gpio_free_new(chip, offset);
>  	return ret;
>  }
>  
>  static void plgpio_free(struct gpio_chip *chip, unsigned offset)
>  {
>  	struct plgpio *plgpio = gpiochip_get_data(chip);
> -	int gpio = chip->base + offset;
>  	unsigned long flags;
>  
>  	if (offset >= chip->ngpio)
> @@ -280,7 +278,7 @@ static void plgpio_free(struct gpio_chip *chip, unsigned offset)
>  	if (!IS_ERR(plgpio->clk))
>  		clk_disable(plgpio->clk);
>  
> -	pinctrl_gpio_free(gpio);
> +	pinctrl_gpio_free_new(chip, offset);
>  }

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
