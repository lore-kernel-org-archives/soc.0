Return-Path: <SRS0=oj/G=E3=gmail.com=geert.uytterhoeven@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28085EE7FF4
	for <soc@archiver.kernel.org>; Mon, 11 Sep 2023 13:06:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0D51DC433C7; Mon, 11 Sep 2023 13:06:21 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 69731C433C8;
	Mon, 11 Sep 2023 13:06:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 69731C433C8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-5922380064bso43659217b3.2;
        Mon, 11 Sep 2023 06:06:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694437578; x=1695042378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HhpTTHreFmEV46vxzmjPh3/YPnd2/MRMLAVFHb+GE1k=;
        b=kxrm/ZjCPF8DYDh/W0kXlh3PnGNByBASMFFiSEzKSfvcyO6UXFSSAECAjNnRTp86gO
         7CCwUjdLSlZ3hfIbdZTwsmB7xKwBbaleXIOe/mw/iTKeX/GfwA5RDO0ezdk5w1R31WWN
         uzd/pPvlOqsj8JxUJwebsQwNIDnZ6NKDioc2WMA/S+zcRZ4Fyf/Th9GF3NUuCQZc6p8Y
         9wHkLDASN8BARIe1U9ll3FkLzpOJOL0EZE3qZ4TYiVH7f6SumdQZep1SvhpoPWlnw6Hv
         q2QqIL3UNF7L/JQV5A03rfSwjly3lbw/j5NQOwwoYE/paIPgYjIL8p3boYkTvoctHQd1
         PkgQ==
X-Gm-Message-State: AOJu0Yy/M9pSlHABFevYLrh/fiy7XfqCizE8ud5KIX5yGJ9DL55EyDP7
	jhDIA/ZzeF1tpvEkHWS0JRdenlv7Ux5y0A==
X-Google-Smtp-Source: AGHT+IEMqyyXQ2BxbjPLANGd+iqvqT198ppqwA3Zad0Ppu9WxGfYJrlvHEjbbmHl1XZfJa49qnbK4A==
X-Received: by 2002:a81:a202:0:b0:576:98e0:32a6 with SMTP id w2-20020a81a202000000b0057698e032a6mr10872791ywg.14.1694437578123;
        Mon, 11 Sep 2023 06:06:18 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id fj3-20020a05690c330300b0059b50f126fbsm1929357ywb.114.2023.09.11.06.06.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 06:06:16 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-58fc4d319d2so43749867b3.1;
        Mon, 11 Sep 2023 06:06:16 -0700 (PDT)
X-Received: by 2002:a25:c542:0:b0:d7f:cdc8:e17f with SMTP id
 v63-20020a25c542000000b00d7fcdc8e17fmr8030315ybe.36.1694437576407; Mon, 11
 Sep 2023 06:06:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230829213441.310655-1-ulf.hansson@linaro.org>
 <CAHk-=wg0gc4Cc90OL29Vr5gDtd4mnsKD+TxtoNtQbAryaWHkZQ@mail.gmail.com>
 <CAHk-=wjLO=Jsdk2prq0piznMMCk+V0_fRaFRHEPuaALpF8J=hw@mail.gmail.com>
 <96bb0de0-06d9-46f8-b02f-dc924afff13c@app.fastmail.com> <CAHk-=wi5Lh-NG_rvcx3Zyqd2Uhj76G4V73tWCFULhVzOU6e1xg@mail.gmail.com>
 <CAPDyKFrJH-1uaPCwnWZDPi4MRtOm=N2CHSRyvjXRDbQ1y-oOrw@mail.gmail.com>
 <CAJZ5v0hqWYnkNXVju3U3n-9i8eqtjs197tLLNWv8Qa_N9T=KEw@mail.gmail.com>
 <CAPDyKFpXLj_2HAgyV_VJf+GPQVmxb_iiDe77Q2MY17MDNqy9fA@mail.gmail.com>
 <CAMuHMdVxLkxN0bmSRXW74R_dGNDSRDB4Z=zE0DoiXDOuweSM0A@mail.gmail.com>
 <CAPDyKFpUUJeGD77GTYCk59cvW=SdGTkOEXH4dap1JQWekAa0Eg@mail.gmail.com>
 <CAMuHMdUZcrtHZz7daKjL7Oz2MEmCrjJ_ovO3ttTnZ7xuRWgiRA@mail.gmail.com> <CAPDyKFpctt6AQBpu+vBQ0ymW3PQGB8dt8-QEhgbz0Uo5T-1Wxw@mail.gmail.com>
In-Reply-To: <CAPDyKFpctt6AQBpu+vBQ0ymW3PQGB8dt8-QEhgbz0Uo5T-1Wxw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 Sep 2023 15:06:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWK0Y7CAGMVyr-_RyZ31WiKMaJHL5XaZjOrFkO8od7Nfw@mail.gmail.com>
Message-ID: <CAMuHMdWK0Y7CAGMVyr-_RyZ31WiKMaJHL5XaZjOrFkO8od7Nfw@mail.gmail.com>
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

On Mon, Sep 11, 2023 at 2:07=E2=80=AFPM Ulf Hansson <ulf.hansson@linaro.org=
> wrote:
> On Mon, 11 Sept 2023 at 13:48, Geert Uytterhoeven <geert@linux-m68k.org> =
wrote:
> > On Mon, Sep 11, 2023 at 1:28=E2=80=AFPM Ulf Hansson <ulf.hansson@linaro=
.org> wrote:
> > > On Mon, 11 Sept 2023 at 09:52, Geert Uytterhoeven <geert@linux-m68k.o=
rg> wrote:
> > > > On Thu, Aug 31, 2023 at 1:39=E2=80=AFPM Ulf Hansson <ulf.hansson@li=
naro.org> wrote:
> > > > > On Thu, 31 Aug 2023 at 11:33, Rafael J. Wysocki <rafael@kernel.or=
g> wrote:
> > > > > > If I may suggest something, I would call this "pmdomain" instea=
d of
> > > > > > "genpd".  I don't think that /drivers/power/ is a particularly
> > > > > > suitable location for it, because it doesn't really have much t=
o do
> > > > > > with power supplies and more to do with device PM.
> > > > >
> > > > > "pmdomain" is probably giving a reasonable good hint of what goes=
 on
> > > > > in this subsystem. This works fine for me, thanks!
> > > >
> > > > > > Also, I would move drivers/base/power/domain.c to drivers/pmdom=
ain/
> > > > > > (and rename it to something like core.c), because it would be a=
 better
> > > > > > location for that fiile IMO.
> > > > >
> > > > > We could certainly do that, let's discuss it a bit more.
> > > > >
> > > > > Although, at this point I want to focus on the genpd providers, a=
s to
> > > > > release some of the burden from arm-soc maintainers.
> > > > >
> > > > > > I can also handle future pull requests for this if that's fine =
with everyone.
> > > > >
> > > > > Thanks a lot for your offer! However, if a re-route is preferred =
(I
> > > > > think not?), this is probably better suited via arm-soc, as most
> > > > > changes are going to be arm platform specific.
> > > >
> > > > Which brings me to the final question: what is the upstream path
> > > > for changes to drivers/genpd/*/ (or whatever it's gonna be called)?
> > > > Before, we sent PRs to (arm-)soc.  Do you expect us to send them to
> > > > you? There's usually quite some interaction between drivers/soc/ren=
eas/
> > > > and drivers/genpd/renesas (and there are DT binding definitions),
> > > > but not more than with e.g. drivers/clk/renesas/.
> > >
> > > I would be happy to pick this up and funnel this via my new genpd
> > > tree. As long as it's coupled with changes affecting "genpd
> > > providers", of course.
> > >
> > > I can certainly also collect patches directly from the
> > > mailing-list/patch-tracker too. Whatever works for you the best. Of
> > > course, in that case I need your acks before I pick up the relevant
> > > patches.
> > >
> > > If we need "immutable" branches, let's discuss that on a case by case=
 basis.
> >
> > At least for Renesas SoCs, every new SoC comes with a DT binding
> > definitions file under include/dt-bindings/power/, to be shared by genp=
d
> > driver and DTS (the same is true for clocks).  So PRs will work best.
>
> Good point! And Neil pointed out this too [1].
>
> I am going to host an immutable branch for the dt bindings that you
> can pull in. Would that be a better option for you?

Yes, that would work for me, too.
Can I conclude you prefer to take patches over PRs?

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
