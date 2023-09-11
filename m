Return-Path: <SRS0=oj/G=E3=gmail.com=geert.uytterhoeven@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF1F6EE7FF4
	for <soc@archiver.kernel.org>; Mon, 11 Sep 2023 07:52:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 89FD5C433C9; Mon, 11 Sep 2023 07:52:46 +0000 (UTC)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0A977C433C7;
	Mon, 11 Sep 2023 07:52:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0A977C433C7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-7a5170c78e6so1329384241.2;
        Mon, 11 Sep 2023 00:52:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694418763; x=1695023563;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2PXs1GyVYmXtrD+FjszOVfgr8/0imMmquv9X/owM18E=;
        b=Njtrf8ngtEwlTfDbGHhK4lx5JwIjTLKTCHSQ+3hVgkGh9YuDtSG538zbwLydUTy0wx
         dK6zMqWpSDfHeXnCx+EBEUsAMhrlhDgQmitOypdzY11Coo4DPSz+fsfei902vTCKJMet
         P5abUw94HyA0daKiUTMXLwIi5AI+8JWkc+vWQj7n3H159BgCpEPYrwC/pnyVdaAFWJSc
         FNYPBChaxdpASbus6Y+FFMmhZLojNuUdbHj2baQWlaZWHHVFFOg6uiOu0EtjxHMq+pXi
         JkzcGo71+QvJ+Ay8aN+6gPkos6NbLQcZJ+5cG+v5CV5oWrO9TOfbI2E4HGPml6sUB1vH
         7+Cw==
X-Gm-Message-State: AOJu0Ywuz80ux849dwynwRT9z3UDhg5GZmr9a/EO8/Ot2Zz07eGwqC85
	AXsfJizxXDiJg3wsgxd5IM+aPGpIAoTMPQ==
X-Google-Smtp-Source: AGHT+IHStLLgt7c5aJ2Ct66dwNo8bct+YWUJ2ekpiauEEDOk1ywLIqzBte9yyHy24wVQ4NIIj0DMmw==
X-Received: by 2002:a67:f810:0:b0:44d:41bc:705f with SMTP id l16-20020a67f810000000b0044d41bc705fmr6102765vso.16.1694418763645;
        Mon, 11 Sep 2023 00:52:43 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id r17-20020a67c311000000b0044e97414232sm1252889vsj.33.2023.09.11.00.52.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 00:52:42 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-7a803afa8c5so383370241.0;
        Mon, 11 Sep 2023 00:52:42 -0700 (PDT)
X-Received: by 2002:a67:fdd9:0:b0:44d:40b1:926e with SMTP id
 l25-20020a67fdd9000000b0044d40b1926emr7493009vsq.18.1694418762613; Mon, 11
 Sep 2023 00:52:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230829213441.310655-1-ulf.hansson@linaro.org>
 <CAHk-=wg0gc4Cc90OL29Vr5gDtd4mnsKD+TxtoNtQbAryaWHkZQ@mail.gmail.com>
 <CAHk-=wjLO=Jsdk2prq0piznMMCk+V0_fRaFRHEPuaALpF8J=hw@mail.gmail.com>
 <96bb0de0-06d9-46f8-b02f-dc924afff13c@app.fastmail.com> <CAHk-=wi5Lh-NG_rvcx3Zyqd2Uhj76G4V73tWCFULhVzOU6e1xg@mail.gmail.com>
 <CAPDyKFrJH-1uaPCwnWZDPi4MRtOm=N2CHSRyvjXRDbQ1y-oOrw@mail.gmail.com>
 <CAJZ5v0hqWYnkNXVju3U3n-9i8eqtjs197tLLNWv8Qa_N9T=KEw@mail.gmail.com> <CAPDyKFpXLj_2HAgyV_VJf+GPQVmxb_iiDe77Q2MY17MDNqy9fA@mail.gmail.com>
In-Reply-To: <CAPDyKFpXLj_2HAgyV_VJf+GPQVmxb_iiDe77Q2MY17MDNqy9fA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 Sep 2023 09:52:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVxLkxN0bmSRXW74R_dGNDSRDB4Z=zE0DoiXDOuweSM0A@mail.gmail.com>
Message-ID: <CAMuHMdVxLkxN0bmSRXW74R_dGNDSRDB4Z=zE0DoiXDOuweSM0A@mail.gmail.com>
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

On Thu, Aug 31, 2023 at 1:39=E2=80=AFPM Ulf Hansson <ulf.hansson@linaro.org=
> wrote:
> On Thu, 31 Aug 2023 at 11:33, Rafael J. Wysocki <rafael@kernel.org> wrote=
:
> > If I may suggest something, I would call this "pmdomain" instead of
> > "genpd".  I don't think that /drivers/power/ is a particularly
> > suitable location for it, because it doesn't really have much to do
> > with power supplies and more to do with device PM.
>
> "pmdomain" is probably giving a reasonable good hint of what goes on
> in this subsystem. This works fine for me, thanks!

Sounds nice!
All of this lives in <linux/pm_domain.h> (with underscore?) anyway,
and "PM Domains" is the usual naming, as it covers both Power and
Clock Domains.

However, although I am quite familiar with genpd, I am still wondering
what is the meaning of the "generic" part in the name? And what is a
non-generic PM Domain?

> > Also, I would move drivers/base/power/domain.c to drivers/pmdomain/
> > (and rename it to something like core.c), because it would be a better
> > location for that fiile IMO.
>
> We could certainly do that, let's discuss it a bit more.
>
> Although, at this point I want to focus on the genpd providers, as to
> release some of the burden from arm-soc maintainers.
>
> > I can also handle future pull requests for this if that's fine with eve=
ryone.
>
> Thanks a lot for your offer! However, if a re-route is preferred (I
> think not?), this is probably better suited via arm-soc, as most
> changes are going to be arm platform specific.

Which brings me to the final question: what is the upstream path
for changes to drivers/genpd/*/ (or whatever it's gonna be called)?
Before, we sent PRs to (arm-)soc.  Do you expect us to send them to
you? There's usually quite some interaction between drivers/soc/reneas/
and drivers/genpd/renesas (and there are DT binding definitions),
but not more than with e.g. drivers/clk/renesas/.

And I just realized you moved the code and Makefiles to drivers/genpd/,
but not the Kconfig symbols and logic, which still lives under
drivers/soc/.  So resolving that (and the name) is something that
should be resolved sooner rather than later...

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
