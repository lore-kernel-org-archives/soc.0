Return-Path: <SRS0=Afdu=NP=gmail.com=andy.shevchenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA11C27C4F
	for <soc@archiver.kernel.org>; Thu, 13 Jun 2024 20:33:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BB0D7C4AF1A; Thu, 13 Jun 2024 20:33:08 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D911CC2BBFC;
	Thu, 13 Jun 2024 20:33:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D911CC2BBFC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-57c6011d75dso1714362a12.3;
        Thu, 13 Jun 2024 13:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718310786; x=1718915586; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cdXJAwIVuIr6CN0EByDicedzVryURaX0H1JP1SNj5lM=;
        b=SJktmIzS/+qlgSA2QhoKwjcfjohjRCt6u0nd0tniCVooudLSOVyfyIefUI989+/D8i
         /qGsaE3Nr0qbQ8xWdxPRJPiPYsz6aSxx5xv/LNkZFkMifbbWsdOfinNM4cKMGy4ridDs
         U8tQmp+k9mDNv+cGdwE/AfXob6ht+jAtj1EixBt+mj264botyqHqNSYPxOxCK/wg1Ng1
         raHdvp1ZZ7uw9wYmPbA9wh6VlvZmjKjUUgOxsCDJCAuVkwJwPr0dsPn4AkIf39EPAXow
         BlObpveLiTDdoLBBZRI9pxsZI+wGD6NlvTXXYE2gPINZWA+VOuRQMuzHD3Muq5nACiMq
         d2zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718310786; x=1718915586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cdXJAwIVuIr6CN0EByDicedzVryURaX0H1JP1SNj5lM=;
        b=P9udJ7I5c3M7B0PeIcJARA7HJ1/xgrTOH9RbidR/3lj/9UE/3yYBXkunxaLmnOAzvb
         298+qalJaPMvwcYq/YOAfU7t3LChscazgy1Y+BibTJV29jBrXL/YNgp0kLSwuefjSjsB
         Bas8Nrn/Hp5Pqf7KA7iM+9efwSb6i4Xcn5QxkjxRcvdIaY7NUQCL7llcPrNsbW4ziNzI
         S5FNNdP8D8Hg9crY/q2FfENaKHXxyk5tlHEUs+osQpOlUdkeriK9FBFqj+WfpYdpzchI
         F4W8h79c9D884MkRUln4IXtVR8LfOvOc7MZ6UYKQR/f481p/nS+yJU6ngxhF2gyhJmyr
         KupA==
X-Forwarded-Encrypted: i=1; AJvYcCXmIe/7LBMeN9HxD6PaETaecIjgVUGpOjyYEgDlFMrN8nppLsjb6ytEVnVOY1TtiwGl0Un2tjg/pMbktMrgicgyRrFO6LqzINYeR5SvrVMDy9dHfsRro+D0msDMwBdc6g==
X-Gm-Message-State: AOJu0Yw67Q/gHiaZK2GVO78qf3KHOyDDpGMrduqttkboipWtGhceDkJO
	Wk1xaj7Cnub7XJaseo/d05YW/dNNqif8o3VwETB0UcNtEnpn38h/8LrcPxCbcN7i+cLY4O9ShMr
	bzpYs06ALVk1BthYYF7DSB9RIXy9XSJRWGjxlhQ==
X-Google-Smtp-Source: AGHT+IEOkj+BZ9yuFOGpGXGm+drJ/BZJPnHAA+NSB5//DnCyGBv0TxpDRcsFvQAaw1cHz7hn8iOAzAdo9oy5ZaVOSxY=
X-Received: by 2002:a17:906:ae46:b0:a6e:f763:1c87 with SMTP id
 a640c23a62f3a-a6f60cefcccmr59121666b.13.1718310785408; Thu, 13 Jun 2024
 13:33:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240613161045.29606-1-kabel@kernel.org> <20240613161045.29606-9-kabel@kernel.org>
In-Reply-To: <20240613161045.29606-9-kabel@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 13 Jun 2024 22:32:28 +0200
Message-ID: <CAHp75VdYqsrOwxCS+knjgFPHRWL_A8rvkW9TkZJPKq9g+oAbrg@mail.gmail.com>
Subject: Re: [PATCH v2 08/17] firmware: turris-mox-rwtm: Don't create own
 kobject type
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, 
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org, 
	Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2024 at 6:11=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.org>=
 wrote:
>
> In order to create attribute files in /sys/firmware/turris-mox-rwtm,
> this driver creates it's own kobject type.

its

> Simplify this by dropping this own kobject creation, and instead
> creating standard device attribute files.
>
> For backwards compatibility with sysfs ABI, create a symlink
> /sys/firmware/turris-mox-rwtm, pointing to this device's sysfs
> directory.

...


> +static void rwtm_firmware_symlink_drop(void *)

Interesting, can we actually name the parameter, like "unused"?

> +{
> +       sysfs_remove_link(firmware_kobj, DRIVER_NAME);

But why not provide a fimware_kobj pointer as a parameter?

> +}

...

> +       /*
> +        * For sysfs ABI compatibility, create symlink
> +        * /sys/firmware/turris-mox-rwtm to this device's sysfs directory=
.
> +        */
> +       ret =3D sysfs_create_link(firmware_kobj, &dev->kobj, DRIVER_NAME)=
;
> +       if (!ret)
> +               devm_add_action_or_reset(dev, rwtm_firmware_symlink_drop,=
 NULL);

This means that it will remove the link in case devm_add_action()
fails. Is it okay?

--=20
With Best Regards,
Andy Shevchenko
