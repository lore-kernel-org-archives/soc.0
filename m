Return-Path: <SRS0=Afdu=NP=gmail.com=andy.shevchenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA16CC27C4F
	for <soc@archiver.kernel.org>; Thu, 13 Jun 2024 20:40:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 94EC1C4AF1C; Thu, 13 Jun 2024 20:40:12 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AF028C2BBFC;
	Thu, 13 Jun 2024 20:40:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AF028C2BBFC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a6f0e153eddso204487066b.0;
        Thu, 13 Jun 2024 13:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718311210; x=1718916010; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0zjT7A78c+5SLDSE+Zke2b52qP9NLBoOQrOgdpqBbU8=;
        b=l89X0OBK5Wh58Uf72RAiVgzxQEkf11z8EnUAH/ntVSnPhdlObuZ5FNz7ymlL7089DT
         5tIPpZzv+yRw73dXSckcrR7q+AaxhawqwQShZV/Q0IQZGPAg50YKbT+rWZ9SuuW8Bs0F
         H38Mu2P89k+WMTJnTiQU9to+Y2MnY1sxIU+0mxiizd+fq94pD3DEOlDggZYtx5N1WXAw
         mdFTDjrgWAvXbSit8qfdGUo570/qYinCVwu/9UQJgmVbgk8Ivr0cM12SbWFg4E00H52b
         XRkP62/aoloma+8EqNrkhu2RpQDbjL8Y2N5WbLG5AtacjTEXBp6WbdR8aRLS6XbljP7+
         vdxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718311210; x=1718916010;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0zjT7A78c+5SLDSE+Zke2b52qP9NLBoOQrOgdpqBbU8=;
        b=Y7SkvGOu0C/c23pAKPfcsqe37HifCFz+AYJJhisChJ7VSph1zouxoa3638GRhFMG1q
         k+5RA9HfhTQCC5rbgin2JxLmsu8z45aRsp1dfOjL+u3XLzlRN6M2qisZRKUSfer1oroF
         S7MqbTqVbN63ser2QKbKI3um8NAkjBEWI4TVY356VasPrZqnbrZ06kGs/vG8Nr4va7Ev
         S5JDcMBFepCtiT09o8mnYzCKOmKwk6lQhRZujnURYhnb6dcy2N1JQ1yul0WkedRSyBwB
         0Hb/SNiOea8/EWozdiOP/mHGpl2EItz0D6ESnA5fhPoEPxGkws/K5cz7Yn9q87287x/3
         FHZw==
X-Forwarded-Encrypted: i=1; AJvYcCXbCcRtRUXJI1e2pcxBE7VpnYe14+CkdjkVOzGIe6WmGk6SxNw7mq/PUQKGNKHbHc0qJD7EAwAwHsltUxCG6W5/ybHRIzmPmip1i7yEP4gD/k52q6rKj9CObR2dD4o5bA==
X-Gm-Message-State: AOJu0YxuHm+vawwsDV9qV9sTQEMHzQZ/cS8egOSo//MPdhN3Rll8S15W
	oXoKUhQ3d2GRQ3ctdPF0BcFklGPwOhXc75CR/sW2PtOETAjtu8w1G0TzeMATBrFxNwjf72DBKLI
	AFEE+wcW17X4hwvuvHhg4RAXtc4KJ8Sf+O8u93g==
X-Google-Smtp-Source: AGHT+IESJaLkGj2FuC973qViTuO7QvnJCwj0fWsNzz3SDWC+oAOcEb5ZZFkPSnQnl7Lke5vZV4hUaoaBHA03h9gZkT8=
X-Received: by 2002:a17:906:365b:b0:a6e:f869:d722 with SMTP id
 a640c23a62f3a-a6f60de256amr53495466b.64.1718311209633; Thu, 13 Jun 2024
 13:40:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240613161045.29606-1-kabel@kernel.org> <20240613161045.29606-11-kabel@kernel.org>
In-Reply-To: <20240613161045.29606-11-kabel@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 13 Jun 2024 22:39:33 +0200
Message-ID: <CAHp75VcCjo9MTdsV7qgGk+zDgGp-QXM3tfUfMXYyVM3Ye5ig9g@mail.gmail.com>
Subject: Re: [PATCH v2 10/17] firmware: turris-mox-rwtm: Convert rest to
 devm_* and get rid of driver .remove()
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
> Use devm resource management for driver's mailbox. This allows us to get
> rid of driver's .remove() method and gotos in .probe().

of the driver's

...

> +       ret =3D devm_add_action_or_reset(dev, rwtm_devm_mbox_release, rwt=
m->mbox);
> +       if (ret < 0)

Can it return positive codes? If not, why ' < 0'?

> +               return ret;


--=20
With Best Regards,
Andy Shevchenko
