Return-Path: <SRS0=Twdr=IM=gmail.com=wens213@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A36C46CD2
	for <soc@archiver.kernel.org>; Tue,  2 Jan 2024 15:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 455CAC433C8; Tue,  2 Jan 2024 15:00:16 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 66D5EC433C9;
	Tue,  2 Jan 2024 15:00:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 66D5EC433C9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6d9af1f12e8so2146784b3a.1;
        Tue, 02 Jan 2024 07:00:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704207615; x=1704812415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qITYVoXybW9kflLeOHzjPWVcZKsOtFNbi43GeVISOKA=;
        b=D6nPKN0PdGLkI95dStFugHZQr+fVMEb4Ykd0rJIR6DlERyHjk4caduAU1/sI+cNVdf
         vbra7FKoxqMwoUIxdiXtxAGKy4v8NUc84SO5JedG/avtc/KCJjbl/XmV4J7keBlvk8lY
         E+9YdfHrnA96ovVLkHimKXGWRmjTT956OiFGzNP+E+pMReRtv6U6ljKbkUQY3/8oZ4to
         om/89d6yqaz1JsTbC4WoqjEL4IioLBiiJ2st5PpZfLXc4sUESU/med+0jF4pFPEeQHg1
         /+FFfVRpUja4dNp5r9t5lgyCjmAXO0fYaEEBkbEMUAE8k/Ids5CEmbRk19N/oz/mHDME
         ibSw==
X-Gm-Message-State: AOJu0YxOoEmoO7MOnFB1+tSSBBmuzAjuPleVAiocs2n1cK4q+UOtRBgi
	w4/ZcfgWAP9nHzXDt2u+uhuV2iCRjFPyEQ==
X-Google-Smtp-Source: AGHT+IEOVe5si9yROukG1jHlKzpEWijQSLSN52+p+UxLPdDp9xHm3dfjuKitYTgYamd0WXoJ+tvPpw==
X-Received: by 2002:a05:6a20:da:b0:194:dbd6:9c35 with SMTP id 26-20020a056a2000da00b00194dbd69c35mr6461559pzh.24.1704207612854;
        Tue, 02 Jan 2024 07:00:12 -0800 (PST)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com. [209.85.216.49])
        by smtp.gmail.com with ESMTPSA id sh18-20020a17090b525200b0028ae9cb6ce0sm27413759pjb.6.2024.01.02.07.00.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jan 2024 07:00:12 -0800 (PST)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-28c7c9b19f1so2245278a91.1;
        Tue, 02 Jan 2024 07:00:12 -0800 (PST)
X-Received: by 2002:a17:90a:4546:b0:28c:ad4f:2b4f with SMTP id
 r6-20020a17090a454600b0028cad4f2b4fmr1823827pjm.96.1704207611979; Tue, 02 Jan
 2024 07:00:11 -0800 (PST)
MIME-Version: 1.0
References: <20231228193903.9078-1-wahrenst@gmx.net> <20231228193903.9078-2-wahrenst@gmx.net>
In-Reply-To: <20231228193903.9078-2-wahrenst@gmx.net>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 2 Jan 2024 22:59:59 +0800
X-Gmail-Original-Message-ID: <CAGb2v66dvTZdRZF+yrdiAsjHVLAQkusyAx=Z5f=UxMNYBAY80A@mail.gmail.com>
Message-ID: <CAGb2v66dvTZdRZF+yrdiAsjHVLAQkusyAx=Z5f=UxMNYBAY80A@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] ARM: sun9i: smp: fix return code check of of_property_match_string
To: Stefan Wahren <wahrenst@gmx.net>, Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, =?UTF-8?Q?Myl=C3=A8ne_Josserand?= <mylene.josserand@bootlin.com>, 
	linux-sunxi@lists.linux.dev, soc@kernel.org, 
	Florian Fainelli <f.fainelli@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 29, 2023 at 3:39=E2=80=AFAM Stefan Wahren <wahrenst@gmx.net> wr=
ote:
>
> of_property_match_string returns an int; either an index from 0 or
> greater if successful or negative on failure. Even it's very
> unlikely that the DT CPU node contains multiple enable-methods
> these checks should be fixed.
>
> This patch was inspired by the work of Nick Desaulniers.
>
> Link: https://lore.kernel.org/lkml/20230516-sunxi-v1-1-ac4b9651a8c1@googl=
e.com/T/
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

Arnd, would it be possible to apply the two fixes directly to the soc tree?

Thanks.

> ---
>  arch/arm/mach-sunxi/mc_smp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/mach-sunxi/mc_smp.c b/arch/arm/mach-sunxi/mc_smp.c
> index 6ec3445f3c72..277f6aa8e6c2 100644
> --- a/arch/arm/mach-sunxi/mc_smp.c
> +++ b/arch/arm/mach-sunxi/mc_smp.c
> @@ -803,12 +803,12 @@ static int __init sunxi_mc_smp_init(void)
>         for (i =3D 0; i < ARRAY_SIZE(sunxi_mc_smp_data); i++) {
>                 ret =3D of_property_match_string(node, "enable-method",
>                                                sunxi_mc_smp_data[i].enabl=
e_method);
> -               if (!ret)
> +               if (ret >=3D 0)
>                         break;
>         }
>
>         of_node_put(node);
> -       if (ret)
> +       if (ret < 0)
>                 return -ENODEV;
>
>         is_a83t =3D sunxi_mc_smp_data[i].is_a83t;
> --
> 2.34.1
>
