Return-Path: <chenhuacai@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1969C61DA4
	for <soc@archiver.kernel.org>; Mon,  6 Mar 2023 10:01:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 69E8CC4339E; Mon,  6 Mar 2023 10:01:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EECEC433EF
	for <soc@kernel.org>; Mon,  6 Mar 2023 10:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678096896;
	bh=MffwcC6int9JSMK1YiF0OPb3x4WeVt12Vxv4iGTYbWI=;
	h=References:In-Reply-To:From:Date:Subject:List-Id:To:Cc:From;
	b=MTYrwTcdnlV6MzHAwraKILQezBv4wTxGTITjTGdSxgVTJqaCnq8tH1LNtNtTm06VD
	 rafho/znxBOAuxRkpOERWTAG3TRBdddjBlRm11X056vmZZ9m9NcGlzFC63CPNJ9eFl
	 gw+Ada6e6aSVJCGSxYH3JRNE6SyHYCFzn+Igbx6xO+ca38uFihQtoabE6Bk4MzXDjI
	 I3S2R+WsenKPVbHMLk7APXVTO2boR+Him/WL/3FY3KBsTdykgosOvbJdk+0FHEcQB7
	 3EwAXERK7dGSPusW+sqawkfGhB+xgkkhrZYOvyy9DbKk/dNPDicyxwfxZYHyR2FwCh
	 SOAnMLiThFz+w==
Received: by mail-ed1-f42.google.com with SMTP id o12so36009130edb.9
        for <soc@kernel.org>; Mon, 06 Mar 2023 02:01:36 -0800 (PST)
X-Gm-Message-State: AO0yUKXjReXgMNwJrTk8sVdaY5haeoLugXTLADpVMLVXkvhHMAcH+F7w
	rMUgj5I7Q14zx24OS7AXvq21fiLd2UP4JOfIoiE=
X-Google-Smtp-Source: AK7set/A0Tbz32X15Ac3Ku9kHPYy93OKJY6xsIGZIPixma6k4WjDXtebdvGjuaum1GSwTQugxJrH+ZrxIkugk1LHk0c=
X-Received: by 2002:a17:906:a14:b0:8b2:d30:e728 with SMTP id
 w20-20020a1709060a1400b008b20d30e728mr4877908ejf.1.1678096894553; Mon, 06 Mar
 2023 02:01:34 -0800 (PST)
MIME-Version: 1.0
References: <20230306032854.254700-1-dzm91@hust.edu.cn> <73cd36b6-c6ee-5c55-e2e1-31cae2f712f7@loongson.cn>
In-Reply-To: <73cd36b6-c6ee-5c55-e2e1-31cae2f712f7@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 6 Mar 2023 18:01:24 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7Nt+OKAnN1GsYCZCb2SUa3r7zRFRsy3fjMX+TAp1_7Uw@mail.gmail.com>
Message-ID: <CAAhV-H7Nt+OKAnN1GsYCZCb2SUa3r7zRFRsy3fjMX+TAp1_7Uw@mail.gmail.com>
Subject: Re: [PATCH v3] drivers: loongson: fix memory leak in loongson2_guts_probe
List-Id: <soc.lore.kernel.org>
To: zhuyinbo <zhuyinbo@loongson.cn>, soc@kernel.org, Arnd Bergmann <arnd@arndb.de>
Cc: Dongliang Mu <dzm91@hust.edu.cn>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

CC + Arnd&SOC list

On Mon, Mar 6, 2023 at 11:48=E2=80=AFAM zhuyinbo <zhuyinbo@loongson.cn> wro=
te:
>
> Tested-by: Yinbo Zhu <zhuyinbo@loongson.cn>
>
> =E5=9C=A8 2023/3/6 =E4=B8=8A=E5=8D=8811:28, Dongliang Mu =E5=86=99=E9=81=
=93:
> > drivers/soc/loongson/loongson2_guts.c:150 loongson2_guts_probe()
> > warn: 'guts->regs' from ioremap() not released on lines: 131,135,139,14=
3.
> >
> > Fix this by modifying ioremap to devm_ioremap.
> >
> > Note that, this patch is not tested due to the loongson architecture.
> >
> > Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
> > ---
> > v2->v3: change res->end - res->start + 1 to resource_size(res)
> > v1->v2: instead of modifying error handling code, directly change
> > ioremap to devm_ioremap.
> > ---
> >   drivers/soc/loongson/loongson2_guts.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/soc/loongson/loongson2_guts.c b/drivers/soc/loongs=
on/loongson2_guts.c
> > index bace4bc8e03b..ffee5a55a985 100644
> > --- a/drivers/soc/loongson/loongson2_guts.c
> > +++ b/drivers/soc/loongson/loongson2_guts.c
> > @@ -107,7 +107,7 @@ static int loongson2_guts_probe(struct platform_dev=
ice *pdev)
> >       guts->little_endian =3D of_property_read_bool(np, "little-endian"=
);
> >
> >       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > -     guts->regs =3D ioremap(res->start, res->end - res->start + 1);
> > +     guts->regs =3D devm_ioremap(dev, res->start, resource_size(res));
> >       if (IS_ERR(guts->regs))
> >               return PTR_ERR(guts->regs);
> >
>
>
