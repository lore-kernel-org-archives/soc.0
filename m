Return-Path: <SRS0=zac1=NT=gmail.com=andy.shevchenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7016DC27C79
	for <soc@archiver.kernel.org>; Mon, 17 Jun 2024 19:57:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3777AC4AF48; Mon, 17 Jun 2024 19:57:50 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5E6E8C2BD10;
	Mon, 17 Jun 2024 19:57:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5E6E8C2BD10
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a6f09eaf420so548779066b.3;
        Mon, 17 Jun 2024 12:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718654267; x=1719259067; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FRCxIGmtuHITSjXJ24xnW72xgk3zpATE5MzfmwzZwS8=;
        b=XqIOOakT2fb2yPQj3yTeQGHCouRueS4XjRB7iV4cRdYGdv8+N5oCYQupr0A3Fe5TN+
         FDsw5tA5vdLlymsm10UjiSq5eFkf52PKlJCpVGrxQzO2sSnNUOyGa5YRE9YvNCj6LvJR
         3ugf/29ONIgEPnT/rJXFQvL9OHtD5I7RwSTvuyRyBKUbGFaJxdzRAwrLxFGelwlgmyD4
         33I/G0p+f7hSt6t13TYg7PjeLsdpACxmQwPMAbFnD9fibTxlxxr9eoyw4DeKirRNR3EA
         ADAkVDoONkyHBnldgfHbE16M/zuNxszRsnC42+WpcX5lNF06ug21vfn9cd4ybn5lckOe
         ZSgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718654267; x=1719259067;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FRCxIGmtuHITSjXJ24xnW72xgk3zpATE5MzfmwzZwS8=;
        b=sswKSegvR0NW2b5TFPZLSBLOutCV2kOrQ1w6ywOZUw6D1hhAOBc8x5D3jxFgYBJmYF
         xYClwPaN+cql03n/7lcG6oqud75ua74XrvEGoGNbvuTLmzku00W/O5GKgWjjEY9nk+ot
         PJlIBq7XtIl/K3R7aIgzjPEuVf0Ba5RbXx90TxL7RGi9Y5mCxVG2HLGSG5dVgbUxsqjl
         FfAd+d2c/YGC3D/a7Ml7GivSf3xOLz+sqZEQSuBO73/Hwu7J7in6UNtBUdQe+iS3urmv
         vo2Hp4t4wXRiGcGnfGsoKRNSGiLDgVd2GiXRyuKWfpDhXr51L2l61g5Nb3rHGMna1fij
         NV7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUNXWj7OFGVw7CE4BmRNSZL62qgEYMCrtNO2pPdkjilKm5slYlRUBxEZb4ocHmL323Vmc99szGJY+zRGsHXz6cT2LKewgZYKZvolP9IeMGalLO5m0DkWdUQVh5SKeIiBQ==
X-Gm-Message-State: AOJu0YxhUPpSpugE1uVBTxoeT8jmZnXnpTmPST7XhUEkxVshzjXuEsOQ
	6jfLgpbmzWDnEzgL207Z0rWARCUAvePbfVbMEQAXwkifZJWNmHgOi5rOKAMjFaoSWsLAM4lI2Ce
	GOPEb9jByHmeAUOnODxFG3outwxbfe++l
X-Google-Smtp-Source: AGHT+IGI7EAENdlFDagqvh0G2E+m9va/oZNJIlNT8RN8KRq/CYMbaT3yPNmICTSrtGk1tSWwh7wiuplsgQcrqU8qNoA=
X-Received: by 2002:a17:906:5648:b0:a6f:ce5:2875 with SMTP id
 a640c23a62f3a-a6f60dc5169mr673977466b.50.1718654267038; Mon, 17 Jun 2024
 12:57:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240617144532.17385-1-kabel@kernel.org> <20240617144532.17385-9-kabel@kernel.org>
In-Reply-To: <20240617144532.17385-9-kabel@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 17 Jun 2024 21:57:10 +0200
Message-ID: <CAHp75VcHKhPNDpLSZvHFkyqBUFFgjG8o0sh+NN0LhzdZArZkBA@mail.gmail.com>
Subject: Re: [PATCH v3 08/17] firmware: turris-mox-rwtm: Don't create own
 kobject type
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, 
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org, 
	Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2024 at 4:45=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.org>=
 wrote:
>
> In order to create attribute files in /sys/firmware/turris-mox-rwtm,
> this driver creates it's own kobject type.
>
> Simplify this by dropping this own kobject creation, and instead
> creating standard device attribute files.
>
> For backwards compatibility with sysfs ABI, create a symlink
> /sys/firmware/turris-mox-rwtm, pointing to this device's sysfs
> directory.

...

>  #define MOX_ATTR_RO(name, format, cat)                         \
>  static ssize_t                                                 \
> -name##_show(struct kobject *kobj, struct kobj_attribute *a,    \
> +name##_show(struct device *dev, struct device_attribute *a,    \
>             char *buf)                                          \
>  {                                                              \
> -       struct mox_rwtm *rwtm =3D to_rwtm(kobj);  \
> +       struct mox_rwtm *rwtm =3D dev_get_drvdata(dev);           \
>         if (!rwtm->has_##cat)                                   \
>                 return -ENODATA;                                \
>         return sprintf(buf, format, rwtm->name);                \

At some point this should be replaced with sysfs_emit()

>  }                                                              \
> -static struct kobj_attribute mox_attr_##name =3D __ATTR_RO(name)
> +static DEVICE_ATTR_RO(name)

--=20
With Best Regards,
Andy Shevchenko
