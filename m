Return-Path: <SRS0=+xyY=MD=gmail.com=andy.shevchenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FFD3C4345F
	for <soc@archiver.kernel.org>; Tue, 30 Apr 2024 12:54:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5EE86C4AF1A; Tue, 30 Apr 2024 12:54:31 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 38F39C2BBFC;
	Tue, 30 Apr 2024 12:54:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 38F39C2BBFC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-572229f196cso5881696a12.2;
        Tue, 30 Apr 2024 05:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714481668; x=1715086468; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XUKw3zCotkBrEJ53HxbMFGbGGHTqC2IglxBradvfgLg=;
        b=XnPTIVPuiQnHUh3ycBBbq0beTpC/mS42ejsFdMR7fEoaCATB1c1op3LCz56AXZ0kFo
         aORaWwCMi/RFJx3nhUVIQz4pD8OJSgOCwSvXJqxpWCXwcsJz/4fFxn703IjWlnRy5gzs
         jCJzkzORDt7aLvviS5Sya+ncm50Pn1jkZbg1hkIlNAxlStEj3y/PBwEKMVyLLQ70P4SQ
         Vw+GOTW6DKheMNLQQANwCiVsOOHC+8XCq42ySjiOxIqJ8LxaQvEMg+6ERtK/1loBlDuf
         uSJ4M6usBt/18qtjcxVZ1Tg86AywAj2V3eDl/ke6LIOsPK0vYdJN7Xjokhoai8fSC5bh
         70qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714481668; x=1715086468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XUKw3zCotkBrEJ53HxbMFGbGGHTqC2IglxBradvfgLg=;
        b=HresR8q+tQDjPGC17MTznZYcI64YO3QSZPzf4entQKM17MGnzOhLv1FMZHjVe4iuVJ
         74/K63VSDp3eDwpnvesq8X+QAjg3anabbAwDLLOTEZ/EgnMjlsaODvf+FdhtJYItWAWD
         tNIX6arfyWHUXX/Fe+jOi5ENSGJRf0/cNte5C1iyCNv19wO6x4DiPgWAhp35cBd/KG6Z
         PSr8pxeyxH737CYWj/GeAqBHLYmLzUbOSs59dVthxpcMMkuY4rM47JbX6ZOq0i9AKGFx
         kG+btYbyVi8V6FaSpf5xd7+y57EsdapI+CczRl8rT9j+9nV8+AyCFf8Gbt9vyOZ6/RFV
         0xoQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3dXr/IInxU6l3RvOUDhoOZX3H9cPGmRGX9nRDHOChdbXyKWvLE0MrKV/CAGPUQIG6TxsQzFpdduL8CT5jY0B7WRYZWbrbtHO8DDDFNLPCN9r+9wXqACC7+SVZruoQMQ==
X-Gm-Message-State: AOJu0Yx/GZNAkIvHLB91nwWUCg+ytG9QY86ctrvXfLI558MI0SkkdGb6
	4WYIVi41JdbxWvxsnH15aUlOuwomNoo2CsknZK04Wh/Tz9rvPFi8VUMWnpG/H1vw8Ro4WWqVHzQ
	G5BfvulAgrSiYtE6bNFM+5X6Qq2zljWnm1vM=
X-Google-Smtp-Source: AGHT+IHVJkSsDjsW6r6/7AKH8NcIEvtzbu9axtrLp0aBUfYr7aAPPHDLcl+8227ox+KdfBMIsCmZgVIT3XXnVZK0qLY=
X-Received: by 2002:a17:906:f288:b0:a58:872b:20e5 with SMTP id
 gu8-20020a170906f28800b00a58872b20e5mr9031758ejb.28.1714481667961; Tue, 30
 Apr 2024 05:54:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240430115111.3453-1-kabel@kernel.org> <20240430115111.3453-3-kabel@kernel.org>
In-Reply-To: <20240430115111.3453-3-kabel@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 30 Apr 2024 15:53:51 +0300
Message-ID: <CAHp75VcgfvyZ9rcNev9CpQEN3CkUVozEkv+ycaQggPbE4tx+1Q@mail.gmail.com>
Subject: Re: [PATCH v8 2/9] platform: cznic: Add preliminary support for
 Turris Omnia MCU
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, 
	arm@kernel.org, Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	linux-rtc@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 30, 2024 at 2:51=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.org>=
 wrote:
>
> Add the basic skeleton for a new platform driver for the microcontroller
> found on the Turris Omnia board.

...

> +What:          /sys/bus/i2c/devices/<mcu_device>/serial_number
> +Date:          July 2024
> +KernelVersion: 6.10
> +Contact:       Marek Beh=C3=BAn <kabel@kernel.org>
> +Description:   (RO) Contains the 64 bit long board serial number in hexa=
decimal

64 bit long --> 64-bit

> +               format.
> +
> +               Only available if board information is burned in the MCU =
(older
> +               revisions have board information burned in the ATSHA204-A=
 chip).
> +
> +               Format: %016X.

It's strange to use capitalized hexadecimal here and not in other
files, but maybe it's something special about "serial number"? Dunno.

...

> +menuconfig CZNIC_PLATFORMS
> +       bool "Platform support for CZ.NIC's Turris hardware"

> +       depends on MACH_ARMADA_38X || COMPILE_TEST

This...

> +       help
> +         Say Y here to be able to choose driver support for CZ.NIC's Tur=
ris
> +         devices. This option alone does not add any kernel code.
> +
> +if CZNIC_PLATFORMS
> +
> +config TURRIS_OMNIA_MCU
> +       tristate "Turris Omnia MCU driver"

> +       depends on MACH_ARMADA_38X || COMPILE_TEST

...or this dependency is redundant. I think one would expect that
these platforms will not be always based on the same platform, hence I
would drop the former and leave the latter. But you should know better
than me.

> +       depends on I2C
> +       help
> +         Say Y here to add support for the features implemented by the
> +         microcontroller on the CZ.NIC's Turris Omnia SOHO router.
> +         To compile this driver as a module, choose M here; the module w=
ill be
> +         called turris-omnia-mcu.

...

> +static int omnia_get_version_hash(struct omnia_mcu *mcu, bool bootloader=
,
> +                                 u8 version[static OMNIA_FW_VERSION_HEX_=
LEN])

Interesting format of the last parameter. Does it make any difference
to the compiler if you use u8 *version?

> +{
> +       u8 reply[OMNIA_FW_VERSION_LEN];
> +       int err;
> +
> +       err =3D omnia_cmd_read(mcu->client,
> +                            bootloader ? CMD_GET_FW_VERSION_BOOT
> +                                       : CMD_GET_FW_VERSION_APP,
> +                            reply, sizeof(reply));
> +       if (err)
> +               return err;

> +       version[OMNIA_FW_VERSION_HEX_LEN - 1] =3D '\0';
> +       bin2hex(version, reply, OMNIA_FW_VERSION_LEN);

Hmm... I would rather use returned value

char *p;

p =3D bin2hex(...);
*p =3D '\0';

return 0;

> +       return 0;
> +}

...

> +static umode_t omnia_mcu_base_attrs_visible(struct kobject *kobj,
> +                                           struct attribute *a, int n)
> +{
> +       struct device *dev =3D kobj_to_dev(kobj);
> +       struct omnia_mcu *mcu =3D dev_get_drvdata(dev);

> +       umode_t mode =3D a->mode;

Do you need this?

> +       if ((a =3D=3D &dev_attr_serial_number.attr ||
> +            a =3D=3D &dev_attr_first_mac_address.attr ||
> +            a =3D=3D &dev_attr_board_revision.attr) &&
> +           !(mcu->features & FEAT_BOARD_INFO))

> +               mode =3D 0;

return 0; ?

> +       return mode;

return a->mode; ?

> +}

...

> +static void omnia_mcu_print_version_hash(struct omnia_mcu *mcu, bool boo=
tloader)
> +{
> +       const char *type =3D bootloader ? "bootloader" : "application";
> +       struct device *dev =3D &mcu->client->dev;
> +       u8 version[OMNIA_FW_VERSION_HEX_LEN];
> +       int err;
> +
> +       err =3D omnia_get_version_hash(mcu, bootloader, version);
> +       if (err) {
> +               dev_err(dev, "Cannot read MCU %s firmware version: %d\n",=
 type,
> +                       err);

One  line?

> +               return;
> +       }
> +
> +       dev_info(dev, "MCU %s firmware version hash: %s\n", type, version=
);
> +}

...

> +static const char *omnia_status_to_mcu_type(uint16_t status)

Why out of a sudden uint16_t instead of u16?

> +{
> +       switch (status & STS_MCU_TYPE_MASK) {
> +       case STS_MCU_TYPE_STM32:
> +               return "STM32";
> +       case STS_MCU_TYPE_GD32:
> +               return "GD32";
> +       case STS_MCU_TYPE_MKL:
> +               return "MKL";
> +       default:
> +               return "unknown";
> +       }
> +}

...

> +       static const struct {
> +               uint16_t mask;

Ditto.

> +               const char *name;
> +       } features[] =3D {
> +               { FEAT_EXT_CMDS,           "extended control and status" =
},
> +               { FEAT_WDT_PING,           "watchdog pinging" },
> +               { FEAT_LED_STATE_EXT_MASK, "peripheral LED pins reading" =
},
> +               { FEAT_NEW_INT_API,        "new interrupt API" },
> +               { FEAT_POWEROFF_WAKEUP,    "poweroff and wakeup" },
> +               { FEAT_TRNG,               "true random number generator"=
 },
> +       };

...

> +               omnia_info_missing_feature(dev, "feature reading");

Tautology. Read the final message. I believe you wanted to pass just
"reading" here.

...

> +       memcpy(mcu->board_first_mac, &reply[9], ETH_ALEN);

There is an API ether_copy_addr() or so, don't remember by heart.
You also need an include for ETH_ALEN definition.

...

> +#include <linux/i2c.h>

No users of this, you may replace with

struct i2c_client;

Am I right?

...

> +       CMD_GET_FW_VERSION_BOOT         =3D 0x0E, /* 20B git hash number =
*/

Git

...

> +       /* available only at address 0x2b (led-controller) */

LED-controller

...

> +enum omnia_ctl_byte_e {
> +       CTL_LIGHT_RST           =3D BIT(0),
> +       CTL_HARD_RST            =3D BIT(1),
> +       /* BIT(2) is currently reserved */
> +       CTL_USB30_PWRON         =3D BIT(3),
> +       CTL_USB31_PWRON         =3D BIT(4),
> +       CTL_ENABLE_4V5          =3D BIT(5),
> +       CTL_BUTTON_MODE         =3D BIT(6),
> +       CTL_BOOTLOADER          =3D BIT(7)

Keep trailing comma as it might be extended (theoretically). And you
do the similar in other enums anyway.

> +};

--
With Best Regards,
Andy Shevchenko
