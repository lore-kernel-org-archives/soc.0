Return-Path: <SRS0=eFUs=LX=gmail.com=groeck7@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B62B6C4345F
	for <soc@archiver.kernel.org>; Thu, 18 Apr 2024 13:26:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8187EC4AF08; Thu, 18 Apr 2024 13:26:10 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 025BBC2BD11;
	Thu, 18 Apr 2024 13:26:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 025BBC2BD11
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1e455b630acso5667585ad.1;
        Thu, 18 Apr 2024 06:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713446768; x=1714051568; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wbfcJLPs1tIjhQYiHifp1/k0EY4Xy8z7a0Z2Q4KMkPg=;
        b=mbSLKq4Vl4h0Qsp9Befm/NLN6faeMpEkOgB6OMbaX8P3DDC5RywBslxWJT3wh8RtOK
         c+iqoa2fNjseXhDQSTBte9fP0qJ61+ruKe037B6gHqtDgdy3OA3mVRViTD5VyHZ3rzBP
         ydlolvT16k0lHx7ftH/sM/vySofNTKsNW3xZpi1sxfa+JChsEaJqEmpgvtg9p8TtolHI
         7OWcrsUK0SbXmt41gW9agS2w87b10jsaYyWzu/CjxLRZvGKSq8KFDX/tGTSTAOdOk3yI
         MMR3EnYBZCRsdJ76Mz5ro9z0a/jjkEXRkC9/4zt74Im4fuMtNBKvZNQsLhzmpQbbwX+7
         xaBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713446768; x=1714051568;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wbfcJLPs1tIjhQYiHifp1/k0EY4Xy8z7a0Z2Q4KMkPg=;
        b=vnPhxAAroWvsw43pkF6zU3YDnYCEOFzq+FoF4H9ZFpUVKHzuOGWSCCsIabkdepGNly
         KMJ8GixOANJvCqNlPsWZGum9RUc2BAbKMaZdmxjNhDrMYNy0ZovX/63F7SFHwM9lHx8f
         cEds+DFsU0tK03pvHJ1VSWBOM+Lrh3pmyZuLF/pGUE9ypULDao8r11tFN+0HDvlOYvyX
         RFMh190j5tClihi82Te0Q3qcXt0pRjmv/WM1sI+VtCQbD5+GFhoS4TQH+ah4KFhITDfM
         nLbSZDqNEJNuCTtMFtdk6X3x8xISZF/G6NgViUGsc8keH/nqARVIIwUhCVwbDTpcdIle
         Rx+g==
X-Forwarded-Encrypted: i=1; AJvYcCUEBg/aDwPV4+caPwmQCRCxGoulb0q4XfgfP867mmvA9wllOhuXmOKFZMW8Oz9lSeCbcyhpfOzP9ZWAF4k99KKjSA5pOkaG2FA+r/uyEu2M/5XuKViBBIYIWvt4esG6tA==
X-Gm-Message-State: AOJu0YzTQMz4AvYCPog+7it7KDMauI8+G1Oj9I1Xxux/i2QYE1QATG6J
	UX1McqqSemFhwZm8Ygk2DvWns5OUfzwOWSKfHrCi/Ct0QrGGDqGQSw+TUA==
X-Google-Smtp-Source: AGHT+IE0fCGdZTuomvXxsmv5ROR/h9KBJhJblUQlqeCHqyBuX4JiLH8shCRyDj6vwFIZAZZafzedIQ==
X-Received: by 2002:a17:902:a5cc:b0:1e0:b76b:cfb8 with SMTP id t12-20020a170902a5cc00b001e0b76bcfb8mr2726525plq.19.1713446767567;
        Thu, 18 Apr 2024 06:26:07 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h18-20020a170902f55200b001e268c9e38asm1487316plf.43.2024.04.18.06.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 06:26:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 18 Apr 2024 06:26:04 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-watchdog@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>, arm@kernel.org
Subject: Re: [PATCH v6 05/11] platform: cznic: turris-omnia-mcu: Add support
 for MCU watchdog
Message-ID: <b0cce881-f42b-469f-a4db-dcfcf89738f5@roeck-us.net>
References: <20240418121116.22184-1-kabel@kernel.org>
 <20240418121116.22184-6-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240418121116.22184-6-kabel@kernel.org>

On Thu, Apr 18, 2024 at 02:11:10PM +0200, Marek Behún wrote:
> Add support for the watchdog mechanism provided by the MCU.
> 
> Signed-off-by: Marek Behún <kabel@kernel.org>

This driver should reside in driver/watchdog and use a generic API
such as regmap to access chip registers.

Guenter

> ---
>  drivers/platform/cznic/Kconfig                |   2 +
>  drivers/platform/cznic/Makefile               |   1 +
>  .../platform/cznic/turris-omnia-mcu-base.c    |   4 +
>  .../cznic/turris-omnia-mcu-watchdog.c         | 123 ++++++++++++++++++
>  drivers/platform/cznic/turris-omnia-mcu.h     |  24 ++++
>  5 files changed, 154 insertions(+)
>  create mode 100644 drivers/platform/cznic/turris-omnia-mcu-watchdog.c
> 
> diff --git a/drivers/platform/cznic/Kconfig b/drivers/platform/cznic/Kconfig
> index 0a752aa654fa..e2649cdecc38 100644
> --- a/drivers/platform/cznic/Kconfig
> +++ b/drivers/platform/cznic/Kconfig
> @@ -20,6 +20,7 @@ config TURRIS_OMNIA_MCU
>  	select GPIOLIB
>  	select GPIOLIB_IRQCHIP
>  	select RTC_CLASS
> +	select WATCHDOG_CORE
>  	help
>  	  Say Y here to add support for the features implemented by the
>  	  microcontroller on the CZ.NIC's Turris Omnia SOHO router.
> @@ -27,6 +28,7 @@ config TURRIS_OMNIA_MCU
>  	  - board poweroff into true low power mode (with voltage regulators
>  	    disabled) and the ability to configure wake up from this mode (via
>  	    rtcwake)
> +	  - MCU watchdog
>  	  - GPIO pins
>  	    - to get front button press events (the front button can be
>  	      configured either to generate press events to the CPU or to change
> diff --git a/drivers/platform/cznic/Makefile b/drivers/platform/cznic/Makefile
> index a185ef882e44..687f7718c0a1 100644
> --- a/drivers/platform/cznic/Makefile
> +++ b/drivers/platform/cznic/Makefile
> @@ -4,3 +4,4 @@ obj-$(CONFIG_TURRIS_OMNIA_MCU)	+= turris-omnia-mcu.o
>  turris-omnia-mcu-y		:= turris-omnia-mcu-base.o
>  turris-omnia-mcu-y		+= turris-omnia-mcu-gpio.o
>  turris-omnia-mcu-y		+= turris-omnia-mcu-sys-off-wakeup.o
> +turris-omnia-mcu-y		+= turris-omnia-mcu-watchdog.o
> diff --git a/drivers/platform/cznic/turris-omnia-mcu-base.c b/drivers/platform/cznic/turris-omnia-mcu-base.c
> index 697ace090bda..5f88119d825c 100644
> --- a/drivers/platform/cznic/turris-omnia-mcu-base.c
> +++ b/drivers/platform/cznic/turris-omnia-mcu-base.c
> @@ -365,6 +365,10 @@ static int omnia_mcu_probe(struct i2c_client *client)
>  	if (err)
>  		return err;
>  
> +	err = omnia_mcu_register_watchdog(mcu);
> +	if (err)
> +		return err;
> +
>  	return omnia_mcu_register_gpiochip(mcu);
>  }
>  
> diff --git a/drivers/platform/cznic/turris-omnia-mcu-watchdog.c b/drivers/platform/cznic/turris-omnia-mcu-watchdog.c
> new file mode 100644
> index 000000000000..b0de9585da84
> --- /dev/null
> +++ b/drivers/platform/cznic/turris-omnia-mcu-watchdog.c
> @@ -0,0 +1,123 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * CZ.NIC's Turris Omnia MCU watchdog driver
> + *
> + * 2024 by Marek Behún <kabel@kernel.org>
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/moduleparam.h>
> +#include <linux/turris-omnia-mcu-interface.h>
> +#include <linux/types.h>
> +#include <linux/watchdog.h>
> +
> +#include "turris-omnia-mcu.h"
> +
> +#define WATCHDOG_TIMEOUT		120
> +
> +static unsigned int timeout;
> +module_param(timeout, int, 0);
> +MODULE_PARM_DESC(timeout, "Watchdog timeout in seconds");
> +
> +static bool nowayout = WATCHDOG_NOWAYOUT;
> +module_param(nowayout, bool, 0);
> +MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
> +			   __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> +
> +static int omnia_wdt_start(struct watchdog_device *wdt)
> +{
> +	struct omnia_mcu *mcu = watchdog_get_drvdata(wdt);
> +
> +	return omnia_cmd_write_u8(mcu->client, CMD_SET_WATCHDOG_STATE, 1);
> +}
> +
> +static int omnia_wdt_stop(struct watchdog_device *wdt)
> +{
> +	struct omnia_mcu *mcu = watchdog_get_drvdata(wdt);
> +
> +	return omnia_cmd_write_u8(mcu->client, CMD_SET_WATCHDOG_STATE, 0);
> +}
> +
> +static int omnia_wdt_ping(struct watchdog_device *wdt)
> +{
> +	struct omnia_mcu *mcu = watchdog_get_drvdata(wdt);
> +
> +	return omnia_cmd_write_u8(mcu->client, CMD_SET_WATCHDOG_STATE, 1);
> +}
> +
> +static int omnia_wdt_set_timeout(struct watchdog_device *wdt,
> +				 unsigned int timeout)
> +{
> +	struct omnia_mcu *mcu = watchdog_get_drvdata(wdt);
> +
> +	return omnia_cmd_write_u16(mcu->client, CMD_SET_WDT_TIMEOUT,
> +				   timeout * 10);
> +}
> +
> +static unsigned int omnia_wdt_get_timeleft(struct watchdog_device *wdt)
> +{
> +	struct omnia_mcu *mcu = watchdog_get_drvdata(wdt);
> +	int ret;
> +
> +	ret = omnia_cmd_read_u16(mcu->client, CMD_GET_WDT_TIMELEFT);
> +	if (ret < 0) {
> +		dev_err(&mcu->client->dev, "Cannot get watchdog timeleft: %d\n",
> +			ret);
> +		return 0;
> +	}
> +
> +	return ret / 10;
> +}
> +
> +static const struct watchdog_info omnia_wdt_info = {
> +	.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE,
> +	.identity = "Turris Omnia MCU Watchdog",
> +};
> +
> +static const struct watchdog_ops omnia_wdt_ops = {
> +	.owner		= THIS_MODULE,
> +	.start		= omnia_wdt_start,
> +	.stop		= omnia_wdt_stop,
> +	.ping		= omnia_wdt_ping,
> +	.set_timeout	= omnia_wdt_set_timeout,
> +	.get_timeleft	= omnia_wdt_get_timeleft,
> +};
> +
> +int omnia_mcu_register_watchdog(struct omnia_mcu *mcu)
> +{
> +	struct device *dev = &mcu->client->dev;
> +	int ret;
> +
> +	if (!(mcu->features & FEAT_WDT_PING))
> +		return 0;
> +
> +	mcu->wdt.info = &omnia_wdt_info;
> +	mcu->wdt.ops = &omnia_wdt_ops;
> +	mcu->wdt.parent = dev;
> +	mcu->wdt.min_timeout = 1;
> +	mcu->wdt.max_timeout = 6553; /* 65535 deciseconds */
> +
> +	mcu->wdt.timeout = WATCHDOG_TIMEOUT;
> +	watchdog_init_timeout(&mcu->wdt, timeout, dev);
> +
> +	watchdog_set_drvdata(&mcu->wdt, mcu);
> +
> +	omnia_wdt_set_timeout(&mcu->wdt, mcu->wdt.timeout);
> +
> +	ret = omnia_cmd_read_u8(mcu->client, CMD_GET_WATCHDOG_STATE);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret,
> +				     "Cannot get MCU watchdog state\n");
> +
> +	if (ret)
> +		set_bit(WDOG_HW_RUNNING, &mcu->wdt.status);
> +
> +	watchdog_set_nowayout(&mcu->wdt, nowayout);
> +	watchdog_stop_on_reboot(&mcu->wdt);
> +	ret = devm_watchdog_register_device(dev, &mcu->wdt);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Cannot register MCU watchdog\n");
> +
> +	return 0;
> +}
> diff --git a/drivers/platform/cznic/turris-omnia-mcu.h b/drivers/platform/cznic/turris-omnia-mcu.h
> index 6179a4f2069e..1838cb3d636e 100644
> --- a/drivers/platform/cznic/turris-omnia-mcu.h
> +++ b/drivers/platform/cznic/turris-omnia-mcu.h
> @@ -14,6 +14,7 @@
>  #include <linux/mutex.h>
>  #include <linux/rtc.h>
>  #include <linux/types.h>
> +#include <linux/watchdog.h>
>  #include <linux/workqueue.h>
>  #include <asm/byteorder.h>
>  #include <asm/unaligned.h>
> @@ -41,6 +42,9 @@ struct omnia_mcu {
>  	struct rtc_device *rtcdev;
>  	u32 rtc_alarm;
>  	bool front_button_poweron;
> +
> +	/* MCU watchdog */
> +	struct watchdog_device wdt;
>  };
>  
>  int omnia_cmd_write_read(const struct i2c_client *client,
> @@ -53,6 +57,25 @@ static inline int omnia_cmd_write(const struct i2c_client *client, void *cmd,
>  	return omnia_cmd_write_read(client, cmd, len, NULL, 0);
>  }
>  
> +static inline int omnia_cmd_write_u8(const struct i2c_client *client, u8 cmd,
> +				     u8 val)
> +{
> +	u8 buf[2] = { cmd, val };
> +
> +	return omnia_cmd_write(client, buf, sizeof(buf));
> +}
> +
> +static inline int omnia_cmd_write_u16(const struct i2c_client *client, u8 cmd,
> +				      u16 val)
> +{
> +	u8 buf[3];
> +
> +	buf[0] = cmd;
> +	put_unaligned_le16(val, &buf[1]);
> +
> +	return omnia_cmd_write(client, buf, sizeof(buf));
> +}
> +
>  static inline int omnia_cmd_write_u32(const struct i2c_client *client, u8 cmd,
>  				      u32 val)
>  {
> @@ -129,5 +152,6 @@ extern const struct attribute_group omnia_mcu_poweroff_group;
>  
>  int omnia_mcu_register_gpiochip(struct omnia_mcu *mcu);
>  int omnia_mcu_register_sys_off_and_wakeup(struct omnia_mcu *mcu);
> +int omnia_mcu_register_watchdog(struct omnia_mcu *mcu);
>  
>  #endif /* __TURRIS_OMNIA_MCU_H */
> -- 
> 2.43.2
> 
> 
