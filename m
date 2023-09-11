Return-Path: <SRS0=oj/G=E3=gmail.com=geert.uytterhoeven@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3476CEE57DF
	for <soc@archiver.kernel.org>; Mon, 11 Sep 2023 11:48:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F2BA8C433C9; Mon, 11 Sep 2023 11:48:46 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5F7ACC433C8;
	Mon, 11 Sep 2023 11:48:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5F7ACC433C8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-59b90c199f5so6169197b3.2;
        Mon, 11 Sep 2023 04:48:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694432923; x=1695037723;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vNxtitsDplq82bteZ8FNeLtI0Rd6/5SNO9LLtNUX32A=;
        b=Kxy+qY0dBW1+v+J8tTB+PE5wHDzTe7my8uNcIXullfpILPCdaIB6fI31sfaffGpt4o
         4FsnGmG07nnpCvj2PemXt/vRMavJ4A7h6fxqYT+ZUfdaheAgZGyrMPolIfDKcGvJp+Lj
         HOl6lr8+ilkfyrdPQuG28uBGhLd8RXq9qkF0cfltKxJ8Egap32kYueVxfCdpEVIoHYXm
         RHN8lw3KjxQQnEk2sj2uZI6aN/hDlAGespT4EWCvq7xRYn1FEO6TdxwrbBL1S6cZWEUi
         llj63dBxVF2dVwCvPynJP3HAkGb7dHmtFZUy+xBCEhdg/kVLV4pp3ybQrLz3eWlJZ9UT
         sKaQ==
X-Gm-Message-State: AOJu0YzmR5lXo6oTYZxWf+pa80MDDHbVrPtYJ4BcT0BddfrOG3i0dOSf
	puau861g94ZV6jFYJHVHZv20GXU1mdenLw==
X-Google-Smtp-Source: AGHT+IFhw14mOH+JiKbJY8NMgNViQ1lpWaXQbocj5LYHT9/5gI0xDCY4tFAN79jq2vUyrcM+xdnpDw==
X-Received: by 2002:a0d:ea91:0:b0:589:f41c:bc63 with SMTP id t139-20020a0dea91000000b00589f41cbc63mr9735809ywe.39.1694432923085;
        Mon, 11 Sep 2023 04:48:43 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id r204-20020a815dd5000000b0058e37788bf7sm1925976ywb.72.2023.09.11.04.48.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 04:48:42 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-59b90c199f5so6168817b3.2;
        Mon, 11 Sep 2023 04:48:42 -0700 (PDT)
X-Received: by 2002:a25:d8cb:0:b0:c4b:ada8:8b86 with SMTP id
 p194-20020a25d8cb000000b00c4bada88b86mr8596493ybg.64.1694432921809; Mon, 11
 Sep 2023 04:48:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230829213441.310655-1-ulf.hansson@linaro.org>
 <CAHk-=wg0gc4Cc90OL29Vr5gDtd4mnsKD+TxtoNtQbAryaWHkZQ@mail.gmail.com>
 <CAHk-=wjLO=Jsdk2prq0piznMMCk+V0_fRaFRHEPuaALpF8J=hw@mail.gmail.com>
 <96bb0de0-06d9-46f8-b02f-dc924afff13c@app.fastmail.com> <CAHk-=wi5Lh-NG_rvcx3Zyqd2Uhj76G4V73tWCFULhVzOU6e1xg@mail.gmail.com>
 <CAPDyKFrJH-1uaPCwnWZDPi4MRtOm=N2CHSRyvjXRDbQ1y-oOrw@mail.gmail.com>
 <CAJZ5v0hqWYnkNXVju3U3n-9i8eqtjs197tLLNWv8Qa_N9T=KEw@mail.gmail.com>
 <CAPDyKFpXLj_2HAgyV_VJf+GPQVmxb_iiDe77Q2MY17MDNqy9fA@mail.gmail.com>
 <CAMuHMdVxLkxN0bmSRXW74R_dGNDSRDB4Z=zE0DoiXDOuweSM0A@mail.gmail.com> <CAPDyKFpUUJeGD77GTYCk59cvW=SdGTkOEXH4dap1JQWekAa0Eg@mail.gmail.com>
In-Reply-To: <CAPDyKFpUUJeGD77GTYCk59cvW=SdGTkOEXH4dap1JQWekAa0Eg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 Sep 2023 13:48:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUZcrtHZz7daKjL7Oz2MEmCrjJ_ovO3ttTnZ7xuRWgiRA@mail.gmail.com>
Message-ID: <CAMuHMdUZcrtHZz7daKjL7Oz2MEmCrjJ_ovO3ttTnZ7xuRWgiRA@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: SoC/genpd driver updates for v6.6
To: Ulf Hansson <ulf.hansson@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Olof Johansson <olof@lixom.net>, soc@kernel.org, linux-arm-kernel@lists.infradead.org, 
	Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ulf,

On Mon, Sep 11, 2023 at 1:28=E2=80=AFPM Ulf Hansson <ulf.hansson@linaro.org=
> wrote:
> On Mon, 11 Sept 2023 at 09:52, Geert Uytterhoeven <geert@linux-m68k.org> =
wrote:
> > On Thu, Aug 31, 2023 at 1:39=E2=80=AFPM Ulf Hansson <ulf.hansson@linaro=
.org> wrote:
> > > On Thu, 31 Aug 2023 at 11:33, Rafael J. Wysocki <rafael@kernel.org> w=
rote:
> > > > If I may suggest something, I would call this "pmdomain" instead of
> > > > "genpd".  I don't think that /drivers/power/ is a particularly
> > > > suitable location for it, because it doesn't really have much to do
> > > > with power supplies and more to do with device PM.
> > >
> > > "pmdomain" is probably giving a reasonable good hint of what goes on
> > > in this subsystem. This works fine for me, thanks!
> >
> > > > Also, I would move drivers/base/power/domain.c to drivers/pmdomain/
> > > > (and rename it to something like core.c), because it would be a bet=
ter
> > > > location for that fiile IMO.
> > >
> > > We could certainly do that, let's discuss it a bit more.
> > >
> > > Although, at this point I want to focus on the genpd providers, as to
> > > release some of the burden from arm-soc maintainers.
> > >
> > > > I can also handle future pull requests for this if that's fine with=
 everyone.
> > >
> > > Thanks a lot for your offer! However, if a re-route is preferred (I
> > > think not?), this is probably better suited via arm-soc, as most
> > > changes are going to be arm platform specific.
> >
> > Which brings me to the final question: what is the upstream path
> > for changes to drivers/genpd/*/ (or whatever it's gonna be called)?
> > Before, we sent PRs to (arm-)soc.  Do you expect us to send them to
> > you? There's usually quite some interaction between drivers/soc/reneas/
> > and drivers/genpd/renesas (and there are DT binding definitions),
> > but not more than with e.g. drivers/clk/renesas/.
>
> I would be happy to pick this up and funnel this via my new genpd
> tree. As long as it's coupled with changes affecting "genpd
> providers", of course.
>
> I can certainly also collect patches directly from the
> mailing-list/patch-tracker too. Whatever works for you the best. Of
> course, in that case I need your acks before I pick up the relevant
> patches.
>
> If we need "immutable" branches, let's discuss that on a case by case bas=
is.

At least for Renesas SoCs, every new SoC comes with a DT binding
definitions file under include/dt-bindings/power/, to be shared by genpd
driver and DTS (the same is true for clocks).  So PRs will work best.

> > And I just realized you moved the code and Makefiles to drivers/genpd/,
> > but not the Kconfig symbols and logic, which still lives under
> > drivers/soc/.  So resolving that (and the name) is something that
> > should be resolved sooner rather than later...
>
> In regards to the name, I am relying on input from Linus to make a
> final decision before I send a patch. In regards to this, I have also
> started working on a documentation patch for genpd. It needs some more
> polishing before I can send it though.
>
> When it comes to the Kconfig move, I will send out a series for it, this =
week.

OK.
Thanks!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
