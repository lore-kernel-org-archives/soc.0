Return-Path: <SRS0=mRHI=GN=gmail.com=ngompa13@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81392C4332F
	for <soc@archiver.kernel.org>; Tue, 31 Oct 2023 00:00:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 44997C433CA; Tue, 31 Oct 2023 00:00:58 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 257D6C433C8;
	Tue, 31 Oct 2023 00:00:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 257D6C433C8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-53ed4688b9fso7801059a12.0;
        Mon, 30 Oct 2023 17:00:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698710455; x=1699315255;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ZVJKfi+PzDUAtiv1q8ocAV1+Plo8zxDJySpo+IH4+c=;
        b=RBE6PVvmiGavsnnK+wAPpBIi38QFVyWoscrL4Xa8q/wIc3dTYROfrYAnsklt8NsJHh
         cvExrFZpH1+ZKekC7nowNICtOQfYf2Rb9SoqFhpf1Tn9An07YRWE64NxcQCgbdJYMJck
         2q/qOeqsG/x3SOFBIqPIDjYeqVQt7iQzefwN6z0WrzPzZ3jiQFsJYtx7nK/Iknzzcx6q
         U8eqZIWRRMTth5+hywtbZFeUv3BxmsFPt654Y3ClW2LLT9wsvtd5PsT1lNK4cbFMBmSM
         YXW3FWhDKZXJ9RxHshNgK1+fb4bIcVO501ePJhHRF4mAB6p7ZawP0pmTIWrkRrTmHQ5A
         G4og==
X-Gm-Message-State: AOJu0YxtzvERwUD489vCMnM1sjATnFLdQ+g/pFGzUuhGI0o3kPSUwGli
	XXPZGPpB0vGab2HFk7HoaTRU9Q/AfkaH8Dan
X-Google-Smtp-Source: AGHT+IFRFyZASB8oxZGzA2tNpcN5Vx+AQSQlQlqinAkLoBFCfno/BSOlODnJcCsIPTDne1V7elhckQ==
X-Received: by 2002:a05:6402:2926:b0:53e:782f:cfa6 with SMTP id ee38-20020a056402292600b0053e782fcfa6mr9507387edb.37.1698710454833;
        Mon, 30 Oct 2023 17:00:54 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id l25-20020a50c119000000b005407ac82f4csm165413edf.97.2023.10.30.17.00.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Oct 2023 17:00:54 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-9d2d8343dc4so309783366b.0;
        Mon, 30 Oct 2023 17:00:53 -0700 (PDT)
X-Received: by 2002:a17:907:8f0d:b0:9bf:5771:a8cf with SMTP id
 wg13-20020a1709078f0d00b009bf5771a8cfmr6271380ejc.70.1698710453646; Mon, 30
 Oct 2023 17:00:53 -0700 (PDT)
MIME-Version: 1.0
References: <20231030142620.818663-2-robh@kernel.org>
In-Reply-To: <20231030142620.818663-2-robh@kernel.org>
From: Neal Gompa <neal@gompa.dev>
Date: Mon, 30 Oct 2023 20:00:16 -0400
X-Gmail-Original-Message-ID: <CAEg-Je9CsN2-GYL9hnwwYhX=B8P-M1tZfmdrQNrWtGOMTWiChA@mail.gmail.com>
Message-ID: <CAEg-Je9CsN2-GYL9hnwwYhX=B8P-M1tZfmdrQNrWtGOMTWiChA@mail.gmail.com>
Subject: Re: [RESEND PATCH] soc: apple: mailbox: Add explicit include of platform_device.h
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 30, 2023 at 10:27=E2=80=AFAM Rob Herring <robh@kernel.org> wrot=
e:
>
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other and pull in various other headers. In
> preparation to fix this, adjust the includes for what is actually needed.
>
> platform_device.h is implicitly included by of_platform.h, but that's goi=
ng
> to be removed.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Note this was added in the merge window and missed the last round.
>
> Arnd, Can you apply this directly.
>
> ---
>  drivers/soc/apple/mailbox.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/soc/apple/mailbox.c b/drivers/soc/apple/mailbox.c
> index 0cbd172f435e..780199bf351e 100644
> --- a/drivers/soc/apple/mailbox.c
> +++ b/drivers/soc/apple/mailbox.c
> @@ -26,6 +26,7 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_platform.h>
> +#include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/spinlock.h>
>  #include <linux/types.h>
> --
> 2.42.0
>
>

Pretty obvious patch.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
