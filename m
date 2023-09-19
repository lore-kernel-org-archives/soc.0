Return-Path: <SRS0=JJuR=FD=gmail.com=groeck7@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D4ACD5BBD
	for <soc@archiver.kernel.org>; Tue, 19 Sep 2023 13:50:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8FE47C43395; Tue, 19 Sep 2023 13:50:38 +0000 (UTC)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1474BC433C7;
	Tue, 19 Sep 2023 13:50:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1474BC433C7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-34fe2814b0dso6940375ab.3;
        Tue, 19 Sep 2023 06:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695131436; x=1695736236; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:subject:from:references:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EWrAdP1P9lnxNsL8ogUPqiMm7p8Gam7StrV+T1lY0oM=;
        b=aILjSwX5D3Cc0TnzS12P+Hr3TrNEcQf6wAYgWQoz7yRQ9TvQM3/aq5N38szywYUgSV
         nGSAMVba6m7U0L2nEbEOpFKWrQlOgQ4Z3rq7Mr91ZDn/qfnpWCpohoVjjHMVtdutjVv5
         nAsxwjcnaOETLz+ospuhTspHYA1SN6KdVS/ihTMic5++z8LXSnNihFnqcpHwyB1walEf
         6QdDmyYGyHscfv/dhwQcBLtZ7EdW2p0MQQJytIgDPoh8LVEn4vJJV/RR9zMBQyvnRKfA
         mkxnHWA11Z1lEGEKH4A3n+OnD8wBJYrICsoIBFOJwolV5V4Zpm4zaHNCoeqxu+IYolb0
         Hnhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695131436; x=1695736236;
        h=content-transfer-encoding:in-reply-to:subject:from:references:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EWrAdP1P9lnxNsL8ogUPqiMm7p8Gam7StrV+T1lY0oM=;
        b=fZkYzmiRyuuIf/qUzB+lqj9w5C4bR4nd3GPr6hbvnaMw31zNf/MgldVRKWsXIzQdk6
         OfsJnQDHRo6swdW2yCi4fPTV2OOilRh+ODdqhrJ5zVitKZ0mpHrxla96DU9xxZAinC6y
         17QjWklJKGgHS3rjkHnsTa6V/M6/DJcolmcVELOA3Y8BO7Uyu4gbAwQoP3W9t3CaVpT2
         /zn1Gvn+Zpglu4kLi69Gclo9TJyKXk5sg7uSTJFZYyXPMO+Oc4g4kx2JbqaiyINi9YhC
         3gawPR77MW/K9oXiP+cRgAWcfPlsTai9cvW+niFTCJzzGwrtR+Q+6ePcgRCQh8LI+VWb
         HRHg==
X-Gm-Message-State: AOJu0YzYHlh4kGHlmoS2dYmF4fgPXbhKQe1VpAs7kY/MWple5KAZDfBW
	XoulL8apbxRBwwecVTXLnRqC5i6yhLw=
X-Google-Smtp-Source: AGHT+IEyIOdkPKpp9si4IvPWBiU4+VwEk+dfo+vFFCpLQDlPa9Iq2v7+NTx/N+LgrCsUQ1vxuu3/wg==
X-Received: by 2002:a05:6e02:ef0:b0:350:f0bb:6a3b with SMTP id j16-20020a056e020ef000b00350f0bb6a3bmr752664ilk.17.1695131435684;
        Tue, 19 Sep 2023 06:50:35 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a6-20020a92ce46000000b003460b697bc0sm140982ilr.59.2023.09.19.06.50.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Sep 2023 06:50:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <5940424f-ebaf-a73b-4157-fc3fb7fa7d3c@roeck-us.net>
Date: Tue, 19 Sep 2023 06:50:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>,
 Gregory CLEMENT <gregory.clement@bootlin.com>, Arnd Bergmann
 <arnd@arndb.de>, soc@kernel.org, arm@kernel.org,
 Wim Van Sebroeck <wim@linux-watchdog.org>, linux-watchdog@vger.kernel.org
References: <20230919103815.16818-1-kabel@kernel.org>
 <20230919103815.16818-6-kabel@kernel.org>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 5/7] platform: cznic: turris-omnia-mcu: Add support for
 MCU watchdog
In-Reply-To: <20230919103815.16818-6-kabel@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/19/23 03:38, Marek Behún wrote:
> Add support for the watchdog mechanism provided by the MCU.
> 
> Signed-off-by: Marek Behún <kabel@kernel.org>
> ---
>   drivers/platform/cznic/Kconfig                |   2 +
>   drivers/platform/cznic/Makefile               |   1 +
>   .../platform/cznic/turris-omnia-mcu-base.c    |   4 +
>   .../cznic/turris-omnia-mcu-watchdog.c         | 126 ++++++++++++++++++
>   drivers/platform/cznic/turris-omnia-mcu.h     |  24 ++++
>   5 files changed, 157 insertions(+)
>   create mode 100644 drivers/platform/cznic/turris-omnia-mcu-watchdog.c
> 
> diff --git a/drivers/platform/cznic/Kconfig b/drivers/platform/cznic/Kconfig
> index 0a752aa654fa..e2649cdecc38 100644
> --- a/drivers/platform/cznic/Kconfig
> +++ b/drivers/platform/cznic/Kconfig
> @@ -20,6 +20,7 @@ config TURRIS_OMNIA_MCU
>   	select GPIOLIB
>   	select GPIOLIB_IRQCHIP
>   	select RTC_CLASS
> +	select WATCHDOG_CORE
>   	help
>   	  Say Y here to add support for the features implemented by the
>   	  microcontroller on the CZ.NIC's Turris Omnia SOHO router.
> @@ -27,6 +28,7 @@ config TURRIS_OMNIA_MCU
>   	  - board poweroff into true low power mode (with voltage regulators
>   	    disabled) and the ability to configure wake up from this mode (via
>   	    rtcwake)
> +	  - MCU watchdog
>   	  - GPIO pins
>   	    - to get front button press events (the front button can be
>   	      configured either to generate press events to the CPU or to change
> diff --git a/drivers/platform/cznic/Makefile b/drivers/platform/cznic/Makefile
> index 6f1470d1f673..a43997a12d74 100644
> --- a/drivers/platform/cznic/Makefile
> +++ b/drivers/platform/cznic/Makefile
> @@ -4,3 +4,4 @@ obj-$(CONFIG_TURRIS_OMNIA_MCU)	+= turris-omnia-mcu.o
>   turris-omnia-mcu-objs		:= turris-omnia-mcu-base.o
>   turris-omnia-mcu-objs		+= turris-omnia-mcu-gpio.o
>   turris-omnia-mcu-objs		+= turris-omnia-mcu-sys-off-wakeup.o
> +turris-omnia-mcu-objs		+= turris-omnia-mcu-watchdog.o
> diff --git a/drivers/platform/cznic/turris-omnia-mcu-base.c b/drivers/platform/cznic/turris-omnia-mcu-base.c
> index b507f81ebe0a..708265203cc1 100644
> --- a/drivers/platform/cznic/turris-omnia-mcu-base.c
> +++ b/drivers/platform/cznic/turris-omnia-mcu-base.c
> @@ -230,6 +230,10 @@ static int omnia_mcu_probe(struct i2c_client *client)
>   	if (ret)
>   		return ret;
>   
> +	ret = omnia_mcu_register_watchdog(mcu);
> +	if (ret)
> +		return ret;
> +
>   	return 0;
>   }
>   
> diff --git a/drivers/platform/cznic/turris-omnia-mcu-watchdog.c b/drivers/platform/cznic/turris-omnia-mcu-watchdog.c
> new file mode 100644
> index 000000000000..2238b2167c45
> --- /dev/null
> +++ b/drivers/platform/cznic/turris-omnia-mcu-watchdog.c
> @@ -0,0 +1,126 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * CZ.NIC's Turris Omnia MCU watchdog driver
> + *
> + * 2023 by Marek Behún <kabel@kernel.org>
> + */
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
> +	/*
> +	 * The MCU also implements LED controller, and the LED driver may in
> +	 * some cases require more I2C bandwidth. In order to prevent stealing
> +	 * that bandwidth from the LED driver, configure minimum time between
> +	 * pings to 10% of the configured timeout (for 120 second timeout we
> +	 * will be pinging at most every 12 seconds).
> +	 */
> +	mcu->wdt.min_hw_heartbeat_ms = 100 * mcu->wdt.timeout;

This is not what min_hw_heartbeat_ms is supposed to be used for, and it is
an abuse of the API which is not guaranteed to work. The value is exopected
to be set at registration time, and it is not supposed to change dynamically.
It is also competely unnecessary since no sane watchdog daemon will ping
at such a high rate. Please drop.

Guenter

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
> +	if (ret < 0) {
> +		dev_err(dev, "Cannot get MCU watchdog state: %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (ret)
> +		set_bit(WDOG_HW_RUNNING, &mcu->wdt.status);
> +
> +	watchdog_set_nowayout(&mcu->wdt, nowayout);
> +	watchdog_stop_on_reboot(&mcu->wdt);
> +	ret = devm_watchdog_register_device(dev, &mcu->wdt);
> +	if (ret)
> +		dev_err(dev, "Cannot register MCU watchdog: %d\n", ret);
> +
> +	return ret;
> +}
> diff --git a/drivers/platform/cznic/turris-omnia-mcu.h b/drivers/platform/cznic/turris-omnia-mcu.h
> index c40ac07be5f5..89fe39f4255f 100644
> --- a/drivers/platform/cznic/turris-omnia-mcu.h
> +++ b/drivers/platform/cznic/turris-omnia-mcu.h
> @@ -16,6 +16,7 @@
>   #include <linux/mutex.h>
>   #include <linux/rtc.h>
>   #include <linux/turris-omnia-mcu-interface.h>
> +#include <linux/watchdog.h>
>   #include <linux/workqueue.h>
>   
>   struct omnia_mcu {
> @@ -36,6 +37,9 @@ struct omnia_mcu {
>   	struct rtc_device *rtcdev;
>   	u32 rtc_alarm;
>   	bool front_button_poweron;
> +
> +	/* MCU watchdog */
> +	struct watchdog_device wdt;
>   };
>   
>   static inline int omnia_cmd_write(const struct i2c_client *client, void *cmd,
> @@ -46,6 +50,25 @@ static inline int omnia_cmd_write(const struct i2c_client *client, void *cmd,
>   	return ret < 0 ? ret : 0;
>   }
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
>   static inline int omnia_cmd_write_u32(const struct i2c_client *client, u8 cmd,
>   				      u32 val)
>   {
> @@ -136,5 +159,6 @@ static inline int omnia_cmd_read_u8(const struct i2c_client *client, u8 cmd)
>   int omnia_mcu_register_gpiochip(struct omnia_mcu *mcu);
>   void omnia_mcu_unregister_gpiochip(struct omnia_mcu *mcu);
>   int omnia_mcu_register_sys_off_and_wakeup(struct omnia_mcu *mcu);
> +int omnia_mcu_register_watchdog(struct omnia_mcu *mcu);
>   
>   #endif /* __DRIVERS_PLATFORM_CZNIC_TURRIS_OMNIA_MCU_H */

