Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50B2BC433ED
	for <soc@archiver.kernel.org>; Thu,  8 Apr 2021 20:13:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 186D661006; Thu,  8 Apr 2021 20:13:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E5CEB61157;
	Thu,  8 Apr 2021 20:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617912838;
	bh=+rZGlvjpUumH6DiemEM946UKZ4XQvYHiu+csXYOh8xg=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=A44IuqukhS7qthk+Z3Zx4B6EkWPi3JLRUejZcOh1PQUvXqBYLhQPKuXAgKtBoCuK3
	 ee8rtQDvC04790d/hIBcYk6LDqi3Cb6HNmDyHcRkRB2OoB9JXJBefuyvTksd4F4DlN
	 82ULJpTuD254BJQxotFJNMu2KczGkRkKCa+CXgKtH/hE3lXQLt1JamaKu0djhVFshU
	 2+iZvYoGte99qPntbSQD2sRSXrCa9nucGcYo8mVJ764vz+9NBDeYn5a7zRtXLHWfE1
	 Gy5dnu7Uhr7BFwO0kka8SC00RXgCVV2TbiuRIzt6RrpgATzRL7PtGaZ4Ydqg7PZudH
	 GNeA7/ToaHwQQ==
Received: by mail-ot1-f47.google.com with SMTP id s11-20020a056830124bb029021bb3524ebeso3616420otp.0;
        Thu, 08 Apr 2021 13:13:57 -0700 (PDT)
X-Gm-Message-State: AOAM5309qEvqRpqp98EFnjClC7b4yLJ4Lq+DtPFDU/QKWf66BgFy26HB
	kRJJypSJ/lkhXeZVMRQoii3bbjG//14fLq03LG4=
X-Google-Smtp-Source: ABdhPJwNoEofBl0oeBw6msPAsg+S+5Hqxl+brsoR7yB23DLN7tI/hJgmNw5hUao7IJIkIsLlGEk5pX3EeLR5tRDyeXc=
X-Received: by 2002:a9d:758b:: with SMTP id s11mr9253563otk.305.1617912837245;
 Thu, 08 Apr 2021 13:13:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210405155336.smohb7uzkperqwuz@reflex> <161789493785.1630479.2066806618809349698.b4-ty@arndb.de>
 <20210408163439.x7pz7bitwmu7aenl@freckled>
In-Reply-To: <20210408163439.x7pz7bitwmu7aenl@freckled>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 8 Apr 2021 22:13:41 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0r3knGP5XxSz_K4zj4=iMNg_UysJLS8jdgqAZunLfLLw@mail.gmail.com>
Message-ID: <CAK8P3a0r3knGP5XxSz_K4zj4=iMNg_UysJLS8jdgqAZunLfLLw@mail.gmail.com>
Subject: Re: [GIT PULL] arm64: dts: TI K3 updates for v5.13
To: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Olof Johansson <olof@lixom.net>, arm-soc <arm@kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Tero Kristo <kristo@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 8, 2021 at 6:34 PM Nishanth Menon <nm@ti.com> wrote:
> On 17:24-20210408, Arnd Bergmann wrote:
> >
> > ti/k3-am64-main.dtsi:376.40-385.4: Warning (simple_bus_reg): /bus@f4000=
/interrupt-controller0: missing or empty reg/ranges property
> > ti/k3-am64-main.dtsi:45.13-135.4: Warning (simple_bus_reg): /bus@f4000/=
dmss: missing or empty reg/ranges property
> > ti/k3-am64-mcu.dtsi:77.39-86.4: Warning (simple_bus_reg): /bus@f4000/bu=
s@4000000/interrupt-controller1: missing or empty reg/ranges property
> >
> > ti/k3-am642-evm.dt.yaml: bus@4000000: interrupt-controller1: {'type': '=
object'} is not allowed for {'compatible': ['ti,sci-intr'], 'ti,intr-trigge=
r-type': [[1]], 'interrupt-controller': True, 'interrupt-parent': [[1]], '#=
interrupt-cells': [[1]], 'ti,sci': [[4]], 'ti,sci-dev-id': [[5]], 'ti,inter=
rupt-ranges': [[0, 104, 4]], 'phandle': [[5]]}
> > ti/k3-am642-evm.dt.yaml: bus@f4000: dmss: {'type': 'object'} is not all=
owed for {'compatible': ['simple-mfd'], '#address-cells': [[2]], '#size-cel=
ls': [[2]], 'dma-ranges': True, 'ranges':  'phandle': [[7]]}}
> > ti/k3-am642-evm.dt.yaml: bus@f4000: interrupt-controller0: {'type': 'ob=
ject'} is not allowed for {'compatible': ['ti,sci-intr'], 'ti,intr-trigger-=
type': [[1]], 'interrupt-controller': True, 'interrupt-parent': [[1]], '#in=
terrupt-cells': [[1]], 'ti,sci': [[4]], 'ti,sci-dev-id': [[3]], 'ti,interru=
pt-ranges': [[0, 32, 16]], 'phandle': [[15]]}
> > ti/k3-am642-evm.dt.yaml: flash@0: 'cdns,read-delay', 'cdns,tchsh-ns', '=
cdns,tsd2d-ns', 'cdns,tshsl-ns', 'cdns,tslch-ns' do not match any of the re=
gexes: '^partition@', 'pinctrl-[0-9]+'
> > ti/k3-am642-sk.dt.yaml: bus@4000000: interrupt-controller1: {'type': 'o=
bject'} is not allowed for {'compatible': ['ti,sci-intr'], 'ti,intr-trigger=
-type': [[1]], ...
> > ti/k3-am642-sk.dt.yaml: bus@f4000: dmss: {'type': 'object'} is not allo=
wed for {'compatible': ['simple-mfd'], ...
> > ti/k3-am642-sk.dt.yaml: bus@f4000: interrupt-controller0: {'type': 'obj=
ect'} is not allowed for {'compatible': ['ti,sci-intr'], 'ti,intr-trigger-t=
ype': [[1]], 'interrupt-controller': True, 'interrupt-parent': [[1]], '#int=
errupt-cells': [[1]], 'ti,sci': [[4]], 'ti,sci-dev-id': [[3]], 'ti,interrup=
t-ranges': [[0, 32, 16]], 'phandle': [[11]]}
> > ti/k3-am642-sk.dt.yaml: flash@0: 'cdns,read-delay', 'cdns,tchsh-ns', 'c=
dns,tsd2d-ns', 'cdns,tshsl-ns', 'cdns,tslch-ns' do not match any of the reg=
exes: '^partition@', 'pinctrl-[0-9]+'
> > ti/k3-j7200-common-proc-board.dt.yaml: flash@0: 'cdns,read-delay', 'cdn=
s,tchsh-ns', 'cdns,tsd2d-ns', 'cdns,tshsl-ns', 'cdns,tslch-ns' do not match=
 any of the regexes: '^partition@', 'pinctrl-[0-9]+'
> >
> >
> > merge commit: 4b8cf90637f295ff1cb1f4bdfde134dab1196296
>
>
> We have a bunch of problems with interrupt controller definitions -
> attempts in [1] [2] did'nt seem to come to any form of conclusion yet.
>
> Cdns is a convert from txt to yaml and is queued on Marks' tree[3]

Ok, thanks for taking a look

> These issues pre-existed in existing definitions and/or convertion
> from txt and we are already working to make sure we try and reach a
> conclusion soon[4]. I am guessing from your note that it is high time we
> put our foot down on txt bindings and clean yamls, I will ensure we
> follow up on that.

I'm still trying to figure out how to best script it, my intention was to
only list issues that got introduced in the latest patches rather than
the existing problems.

On the other hand, it would indeed help to address any issues that
are going to come up in every newly added board first, and then
eventually get to all the remaining warnings for issues with the
yaml bindings.

       Arnd
