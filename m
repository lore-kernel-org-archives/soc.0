Return-Path: <SRS0=2pyZ=DG=gmail.com=festevam@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82CFBC001B0
	for <soc@archiver.kernel.org>; Thu, 20 Jul 2023 01:29:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4264EC433C9; Thu, 20 Jul 2023 01:29:41 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4B3F8C433C7;
	Thu, 20 Jul 2023 01:29:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4B3F8C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-25e847bb482so32308a91.1;
        Wed, 19 Jul 2023 18:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689816579; x=1692408579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AQW65J+CLOk0J4Yl6UCvOr98eBkR2w5hxC1HptI7xbE=;
        b=qmGJPJ2hg3UjaBb2W5TUZiFm/1W8FIFAWWRL4+vZWUNaQPe5by1PuvGsitfJCarMpQ
         k6/eoWphUTqt8uMPfkWrXFjRGC/HCV7cQYWTKfZ+lvU3Vt+4DItUnN1GdPwjlLp6UHTY
         7yykYedyCHO1CwXJ1zJJR7FCDDZfKu7njtu6sByv1C8CNVFZNwnWuWyUpBKf13brOIVY
         tSN8eCYh2djTB/KS4hlWkRVw9gZa2lnKFpwYPVj0UZwF6TBYjUxyl+67Ua0DMrsluyxW
         W76GGIY9SVpUy8xHEd1jpplkpSXkYQtsg67UnDQJtD2yO+R5BXlM3UTxb2/OJ9krH5FM
         C0MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689816579; x=1692408579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AQW65J+CLOk0J4Yl6UCvOr98eBkR2w5hxC1HptI7xbE=;
        b=VzUtoEp8QkN5xz+XC4+VLf6lHBaS5x283NhsbvZuskvVMsMg8hvyVlwrmPJ09XZLEP
         aerRZIk/u1jieq/4Bxy0ICKOKcVAL8ZOTl68otqaBy473fk4gCrhSDXXSAugJIxEiYwW
         Dp8dcAbPyRU75Akx3hXYUz25fk9/yE9iYPwPC07C7BdhoHP6jsONOTUaZjvMCtgAyuiw
         tDYPUoyq5NfeJyYBlVpYG6PL4NK9rp18M3PmqSknAXBPGIXc/vIDtwRoyfY318Zg9hUT
         At2HgGRU4s2cPy0SL9vOp6MB50OfFnF5bCmt6X3g27hg/OhJNpmzExEcrxOEIK16XG99
         femg==
X-Gm-Message-State: ABy/qLa6a7MNx2fd0rlJWNeqEk76Mgawfhj08n+dvPSKDWer1OiG/r4m
	3AL6otqiFne/s1aGGHu6cQj6Y+Uwmnj0VfsGOIc=
X-Google-Smtp-Source: APBJJlFv+Ur9HDVOEiYblOT9dwPa78OLAxG6dkjvRsIT7V81TNrbXhTP0WL6G7O/mCSDJQoOrQhBPasm0pmw7GlPTV4=
X-Received: by 2002:a17:90a:c9:b0:263:5c30:2cf8 with SMTP id
 v9-20020a17090a00c900b002635c302cf8mr927708pjd.0.1689816579453; Wed, 19 Jul
 2023 18:29:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230719160048.2737423-1-james.hilliard1@gmail.com>
 <20230719160048.2737423-2-james.hilliard1@gmail.com> <CAOMZO5C_BFm+P=9uizL0buSJ9a33PM6hNgG5OcZ3B4YxD=h_6w@mail.gmail.com>
 <CADvTj4piksWhua5W6CMr3ZpkRJcFvR=545hsQhW16KL4gQb4pw@mail.gmail.com>
In-Reply-To: <CADvTj4piksWhua5W6CMr3ZpkRJcFvR=545hsQhW16KL4gQb4pw@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 19 Jul 2023 22:29:27 -0300
Message-ID: <CAOMZO5Cpf1ejTZTzBWhnchMQOJU6hcLot2Ca+78c2h6LWJNTDg@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: imx6q: Add Variscite MX6 Custom board support
To: James Hilliard <james.hilliard1@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, soc@kernel.org, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 19, 2023 at 7:43=E2=80=AFPM James Hilliard
<james.hilliard1@gmail.com> wrote:

> How would I determine what the value of these should be?
>
> The vendor device trees are using 0x80000000 for these values from
> what I can tell.

0x80000000 means "do not touch the pinctrl, use the value from the bootload=
er".

It's preferable not to rely on the value that comes from the
bootloader and explicitly describe the value in the DT.

For the MX6QDL_PAD_DI0_PIN4__IPU1_DI0_PIN04 pin: look at its
IOMUXC_SW_PAD_CTL register in the i.MX6Q Reference Manual.

It is called IOMUXC_SW_PAD_CTL_PAD_DI0_PIN04 and its reset value is 0x1b0b0=
.

So this entry would become:

MX6QDL_PAD_DI0_PIN4__IPU1_DI0_PIN04             0x1b0b0
