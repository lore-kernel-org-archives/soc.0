Return-Path: <jic23@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 050D8C6FD1C
	for <soc@archiver.kernel.org>; Sat, 11 Mar 2023 18:08:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C0B76C433D2; Sat, 11 Mar 2023 18:08:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8673AC4339B;
	Sat, 11 Mar 2023 18:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678558126;
	bh=Hxwcyty0Eai6b4gI+GWKz8jsfgHY5+szBl5RoUwvZBg=;
	h=Date:From:To:List-Id:Cc:Subject:In-Reply-To:References:From;
	b=mn01IHeTgKouFJx2YZJ3r60NByaSimffuGy7a0j4HdNJDzsZNK9QECzYSY6Zpbv+F
	 EOx7N0WA493Iyb8M+FpyvV8V4SYR9XuNBOizPJeYxBkZ6vS0t9Oe+OOn7I5gzjskbJ
	 IKsj0tIRbXUcuEmL2vlQxxut/0THYHmfQ9XCbNHvg80l5qZ8sfvuOIpM1Ukg6DcVCq
	 w72IXolYh3WKliqMJxtdYvKjLnqHdUFBAnccQ9X+TJbeg/YJOPbYhgRcQKh4atFWOk
	 alD9NWjAEfZOWYJhsbvM0dw19Nc5eXiwX8sF/C1OJB5ItSmXpf+OyFyv6C/eoVUJDf
	 sUs0+Nc/tCkJQ==
Date: Sat, 11 Mar 2023 18:08:49 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Stefan Wahren <stefan.wahren@i2se.com>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Evgeniy
 Polyakov <zbr@ioremap.net>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 linux-imx@nxp.com, Li Yang <leoyang.li@nxp.com>, Denis Ciocca
 <denis.ciocca@st.com>, soc@kernel.org, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Stefan
 Wahren <stefan.wahren@chargebyte.com>
Subject: Re: [PATCH 5/8] iio: accel: add support for IIS328DQ variant
Message-ID: <20230311180849.0a8f58a3@jic23-huawei>
In-Reply-To: <20230306172249.74003-6-stefan.wahren@i2se.com>
References: <20230306172249.74003-1-stefan.wahren@i2se.com>
	<20230306172249.74003-6-stefan.wahren@i2se.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon,  6 Mar 2023 18:22:46 +0100
Stefan Wahren <stefan.wahren@i2se.com> wrote:

> From: Stefan Wahren <stefan.wahren@chargebyte.com>
> 
> Add support for ST IIS328DQ accelerometer to the st_accel framework.
> The chip is compatible to the LIS331DL.
> 
> Link: https://www.st.com/resource/en/datasheet/iis328dq.pdf
> Signed-off-by: Stefan Wahren <stefan.wahren@chargebyte.com>
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>

LGTM. I'll pick up when the binding discussion concludes.
(assuming no other issues raised!)

Jonathan

> ---
>  drivers/iio/accel/st_accel.h      | 1 +
>  drivers/iio/accel/st_accel_core.c | 1 +
>  drivers/iio/accel/st_accel_i2c.c  | 5 +++++
>  drivers/iio/accel/st_accel_spi.c  | 5 +++++
>  4 files changed, 12 insertions(+)
> 
> diff --git a/drivers/iio/accel/st_accel.h b/drivers/iio/accel/st_accel.h
> index 56ed0c776d4a..e7525615712b 100644
> --- a/drivers/iio/accel/st_accel.h
> +++ b/drivers/iio/accel/st_accel.h
> @@ -39,6 +39,7 @@
>  #define LIS302DL_ACCEL_DEV_NAME		"lis302dl"
>  #define LSM303C_ACCEL_DEV_NAME		"lsm303c_accel"
>  #define SC7A20_ACCEL_DEV_NAME		"sc7a20"
> +#define IIS328DQ_ACCEL_DEV_NAME		"iis328dq"
>  
>  
>  #ifdef CONFIG_IIO_BUFFER
> diff --git a/drivers/iio/accel/st_accel_core.c b/drivers/iio/accel/st_accel_core.c
> index 6b8562f684d5..5f7d81b44b1d 100644
> --- a/drivers/iio/accel/st_accel_core.c
> +++ b/drivers/iio/accel/st_accel_core.c
> @@ -517,6 +517,7 @@ static const struct st_sensor_settings st_accel_sensors_settings[] = {
>  		.wai_addr = ST_SENSORS_DEFAULT_WAI_ADDRESS,
>  		.sensors_supported = {
>  			[0] = H3LIS331DL_ACCEL_DEV_NAME,
> +			[1] = IIS328DQ_ACCEL_DEV_NAME,
>  		},
>  		.ch = (struct iio_chan_spec *)st_accel_12bit_channels,
>  		.odr = {
> diff --git a/drivers/iio/accel/st_accel_i2c.c b/drivers/iio/accel/st_accel_i2c.c
> index 3f02fd5d5946..fb9e2d6f4210 100644
> --- a/drivers/iio/accel/st_accel_i2c.c
> +++ b/drivers/iio/accel/st_accel_i2c.c
> @@ -119,6 +119,10 @@ static const struct of_device_id st_accel_of_match[] = {
>  		.compatible = "silan,sc7a20",
>  		.data = SC7A20_ACCEL_DEV_NAME,
>  	},
> +	{
> +		.compatible = "st,iis328dq",
> +		.data = IIS328DQ_ACCEL_DEV_NAME,
> +	},
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, st_accel_of_match);
> @@ -157,6 +161,7 @@ static const struct i2c_device_id st_accel_id_table[] = {
>  	{ LIS302DL_ACCEL_DEV_NAME },
>  	{ LSM303C_ACCEL_DEV_NAME },
>  	{ SC7A20_ACCEL_DEV_NAME },
> +	{ IIS328DQ_ACCEL_DEV_NAME },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(i2c, st_accel_id_table);
> diff --git a/drivers/iio/accel/st_accel_spi.c b/drivers/iio/accel/st_accel_spi.c
> index 5740dc1820bd..f72a24f45322 100644
> --- a/drivers/iio/accel/st_accel_spi.c
> +++ b/drivers/iio/accel/st_accel_spi.c
> @@ -100,6 +100,10 @@ static const struct of_device_id st_accel_of_match[] = {
>  		.compatible = "st,lsm303c-accel",
>  		.data = LSM303C_ACCEL_DEV_NAME,
>  	},
> +	{
> +		.compatible = "st,iis328dq",
> +		.data = IIS328DQ_ACCEL_DEV_NAME,
> +	},
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, st_accel_of_match);
> @@ -157,6 +161,7 @@ static const struct spi_device_id st_accel_id_table[] = {
>  	{ LIS3DE_ACCEL_DEV_NAME },
>  	{ LIS302DL_ACCEL_DEV_NAME },
>  	{ LSM303C_ACCEL_DEV_NAME },
> +	{ IIS328DQ_ACCEL_DEV_NAME },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(spi, st_accel_id_table);

