Return-Path: <SRS0=qJwL=ER=gmail.com=zhoubb.aaron@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC74CA0FE2
	for <soc@archiver.kernel.org>; Fri,  1 Sep 2023 03:05:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 580E0C433CC; Fri,  1 Sep 2023 03:05:26 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3F59EC433C7;
	Fri,  1 Sep 2023 03:05:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3F59EC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-58cd9d9dbf5so20274047b3.0;
        Thu, 31 Aug 2023 20:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693537524; x=1694142324; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CzzhdRRz+84nDeWWLMEXfVPuhXA1oo9sQKDIU2jXLKE=;
        b=i78FWybyNZCQkMRxeQhjC2eyyX+YFKZMpn1SVILwaJaWB2ihM2d4PA3PN1CaI+Npsx
         hMidVScE4JuznQChprNDLN7lZ5R++xqvXLKvJWc+W9p8T4By+G7rsZJ7nVyQAA/o5oOV
         e8xKoU7aOPFjcG70BwgWSgTtKXKYOeRUK80rssVHx4sF5dsOfnbhHmmtbqrwcumZrgVu
         4sSlXR2yDvZRTRO4K35BeQA1RxNs3uZv1QK+28B7Mn4gkvGal0seQLblpzpLePAvxzUP
         7cYLxoEFfO1cHo/UHYAXxki6R+2zrhFmjs52EMI6Fi1gqh8Ag5QzUMs3PoHEu+jwbBIU
         9tEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693537524; x=1694142324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CzzhdRRz+84nDeWWLMEXfVPuhXA1oo9sQKDIU2jXLKE=;
        b=c+2TQW9n10Oapu1jcI7K4QaIEkAOeJIjtDtjfuWAcpsgQquJptsHCLpMIv7FuT0Znk
         buiOFc85Cp+5dwZIl0qp//Hl9KCpCbrCW9A/mV9zVHWOWj1ig2YZq9sMyo1rOXmbj+lv
         kD4ql26WryBJankQ3fD0bPorXVgiUbpemEgw/YChBREKsoKZC1EGAqgkD2BZKR59NkZX
         6/DwDFkyw9dZWHJ6mkQPZAgHim00eONp6wbU/O/WYekhQpeSTnB+p3CoPRzCrTy7RhGl
         qjMrJT9xEYrw4Jy0R6xDwnTQK5XKmCQCwT2nviqNmuzY0fsaf5U6aM18XDt8gSeLxY1w
         kUKA==
X-Gm-Message-State: AOJu0YyIh+VOR5ZkgL0past2kNAEZCyWPyZIi5VzyUMTA57P4RzOkZBZ
	ObX3xN4e506BK5IFWKNFJdTCfvQ18dy2x6uP5CxT46pIPlZkzrSbTIE=
X-Google-Smtp-Source: AGHT+IEJQ/UnswWklefCzgEHvWHAJOerPe/H2CzyND+TNL/LPrnmDHwD+//eG8lI6MC/fhA9o6DMv8wR+lP5bYqvsro=
X-Received: by 2002:a0d:d605:0:b0:56c:f0c7:7d72 with SMTP id
 y5-20020a0dd605000000b0056cf0c77d72mr2225622ywd.4.1693537523953; Thu, 31 Aug
 2023 20:05:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1693474728.git.zhoubinbin@loongson.cn> <bf09b11ec6a0102f85dc2b3289d003271304e24d.1693474728.git.zhoubinbin@loongson.cn>
 <20230831-ambition-refusing-08e63b345573@spud>
In-Reply-To: <20230831-ambition-refusing-08e63b345573@spud>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Fri, 1 Sep 2023 11:05:12 +0800
Message-ID: <CAMpQs4JbUx9N4MmfM6vRsdQBHyUcU9UHGX23UewL5Matt6iXnQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] soc: loongson: loongson_pm2: Drop useless
 of_device_id compatible
To: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, loongson-kernel@lists.loongnix.cn, soc@kernel.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Conor:

Thanks for your reply.

On Thu, Aug 31, 2023 at 11:15=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Thu, Aug 31, 2023 at 07:43:13PM +0800, Binbin Zhou wrote:
> > Now, "loongson,ls2k0500-pmc" is used as fallback compatible, so the
> > ls2k1000 compatible in the driver can be dropped directly.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  drivers/soc/loongson/loongson2_pm.c | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/drivers/soc/loongson/loongson2_pm.c b/drivers/soc/loongson=
/loongson2_pm.c
> > index 796add6e8b63..5ffb77afd9eb 100644
> > --- a/drivers/soc/loongson/loongson2_pm.c
> > +++ b/drivers/soc/loongson/loongson2_pm.c
> > @@ -197,7 +197,6 @@ static int loongson2_pm_probe(struct platform_devic=
e *pdev)
> >
> >  static const struct of_device_id loongson2_pm_match[] =3D {
> >       { .compatible =3D "loongson,ls2k0500-pmc", },
> > -     { .compatible =3D "loongson,ls2k1000-pmc", },
>
> What about older devicetrees that do not have the fallback? Aren't you
> going to remove support for those?

This driver was just merged in during the v6.6 window, and no release
will use it until now.

commit 67694c076bd7 soc: loongson2_pm: add power management support
commit 6054a676e969 soc: dt-bindings: add loongson-2 pm

Of course, it was our mistake not to make better use of fallback
compatible when submitting the driver, and we hope to fix this mistake
soon.
Also, this driver will only be used by the LoongArch architecture, no
need to worry about other architectures.

Thanks.
Binbin
>
> >       {},
> >  };
> >
> > --
> > 2.39.3
> >
