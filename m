Return-Path: <SRS0=jJml=US=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A94CC433FE
	for <soc@archiver.kernel.org>; Fri,  8 Apr 2022 14:49:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 092B9C385A6; Fri,  8 Apr 2022 14:49:52 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 758BEC385A3;
	Fri,  8 Apr 2022 14:49:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 758BEC385A3
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wr1-f52.google.com ([209.85.221.52]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M1pk0-1nf1mu1U2S-002Gkr; Fri, 08 Apr 2022 16:49:48 +0200
Received: by mail-wr1-f52.google.com with SMTP id c7so13307904wrd.0;
        Fri, 08 Apr 2022 07:49:48 -0700 (PDT)
X-Gm-Message-State: AOAM532IOkcuMO+EjQi5WMijfxvKqzThc5BPmOjkunKNVA56kaebIlwS
	m5VA1CEQ4kYi+kJV9zfc8h3/krhBaJMejzdrqoo=
X-Google-Smtp-Source: ABdhPJwVNzAUvp4q5y9Xv8Pl9NcevPGw56Av/8fDlBAo0sYujt7tAUw/HOtRrfZixqKYu184m37g27gifqdWtdVR4Vc=
X-Received: by 2002:a05:6000:178c:b0:204:648:b4c4 with SMTP id
 e12-20020a056000178c00b002040648b4c4mr14628640wrg.219.1649429387994; Fri, 08
 Apr 2022 07:49:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220331092235.3000787-1-hasegawa-hitomi@fujitsu.com>
 <20220331092235.3000787-2-hasegawa-hitomi@fujitsu.com> <YkWVTEG5oFO82GPL@kroah.com>
 <CAK8P3a0jnzse4sG58taO5+Yd5vCgh1uddqbtAuim_z9r15Q3BA@mail.gmail.com>
 <20220408133246.fyw5554lgli4olvg@maple.lan> <CAK8P3a0u2xa9BFmakG+f4kyLsqNZQbE6KQ6jz2356Fyen=1EHw@mail.gmail.com>
 <YlBE6hZHmLo9/wrU@kroah.com>
In-Reply-To: <YlBE6hZHmLo9/wrU@kroah.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 8 Apr 2022 16:49:31 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3v4+AO5avGoxeZSyNTOWqk8YS95xQLWSBZ=yV_3DKggg@mail.gmail.com>
Message-ID: <CAK8P3a3v4+AO5avGoxeZSyNTOWqk8YS95xQLWSBZ=yV_3DKggg@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] soc: fujitsu: Add A64FX diagnostic interrupt driver
To: Greg KH <gregkh@linuxfoundation.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Daniel Thompson <daniel.thompson@linaro.org>, 
	Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>, 
	"open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>, Sumit Garg <sumit.garg@linaro.org>, 
	Olof Johansson <olof@lixom.net>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Jason Wessel <jason.wessel@windriver.com>, 
	Doug Anderson <dianders@chromium.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kgdb-bugreport@lists.sourceforge.net, 
	Peter Zijlstra <peterz@infradead.org>, Mike Travis <mike.travis@hpe.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:0S5YqkZ6xFH7OvfUvHDvHAXPGZxU9KLAK949CnhN1L814hOcH5W
 RHUYU0saB2C6kYGHuaUK0LnY3XupjyMeqVjfSvL5SZldLAQJhDOkuGEn5eq1raIEmng/b2l
 bBL5jnR55S8A8rd4M6yhDERMyESTOpp704wkXFAa5tAscd00R8RgN216s3UmFiMjRej9il0
 SL6z+ympJURT+1xtOK5/A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:n+uQPrgAaVw=:mpKLiSjEh92s/V66yPjQVV
 RVKs7T16yS85yJm3rgQcbPAVSn8g8pSG4QVa0dr818250AUO2SnYPL8Yi6ABhI8hOVd+696Ta
 bHrcNVaEyr4tzNh+3jLrcsH1CDGDw+6uZD2BtVxgEgseu+Nws9QsBtx5G/0Lq/jCDHyp+ozpD
 2F3sPVCx7iRfqiJXYZtXXA5yXnR7za/zNj1S6gu6+VmNzVBen2mbQpJrWnLpgG7B7RgPfIfed
 R/3I7vZHt5nVK3IIaYYfw2Ebf9dlcSKGV8XFLlTmy5kIpbgme3gaJ9TV0nAvlDmYdIYZS0kSX
 Yv9OSa0Ckl+PsKCf8jGhBheVufrTzLGnFm7XOWI2+33NyDZH57GBLfKp+XiO+0Cm5g4hUKB8u
 bSM2QM94HT06ybyyMbYh95i01dVVc2p3C5Axio9hnVA4cabeyKwZlHMtDlrSmZ4c17U+ZwHiN
 jW1HZBfQ0K5sU60K3dZoy9dwXWK5RwszdcuApldA8UExQo1oysilrvjSLeUE2QrmcKOrufb4E
 M4bGhAeTeJ4J9K3+xASQG9NH0pXZP16xCgjXDEMTLDzp9CfTPhd1jEw6C/6typKz4iy0s+mIf
 5z614n8I7r4bZ7+RAaFhSvr3mtgmxUZ8Uch/Tn9WJ2SQJ6dsUWT9gKbByEs6xMXt/cF0923ln
 +bL8rp+LC5HF6bvKyW2c39hxVz9YBWYraKOLnTrNg7fvl+3jYmcFz4G4k4iy51H276ZHUlcbr
 PsLcuq4lzP7P6kwCBxZi54cF9q/TxJhLO6X9Hd523nYATK8bxkf0lCwiwiGJ3KLxUWIshbFuK
 PNtxJzpCEci1kDmM76xp8ffpjVl5AlaEVpIeXXEoTUK587EYz4=

On Fri, Apr 8, 2022 at 4:21 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Fri, Apr 08, 2022 at 04:17:16PM +0200, Arnd Bergmann wrote:
> > On Fri, Apr 8, 2022 at 3:32 PM Daniel Thompson
> > <daniel.thompson@linaro.org> wrote:
> > > On Thu, Mar 31, 2022 at 05:44:55PM +0200, Arnd Bergmann wrote:
> > >
> > > There is some prior art for this sort of feature. AFAICT SGI UV has a
> > > similar mechanism that can send an NMI-with-no-side-channel to the
> > > kernel. The corresponding driver offers a range of actions using a
> > > module parameter:
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/x86/platform/uv/uv_nmi.c#n180
> > >
> > > I don't think a hardcoded 'c' makes any sense. With a hardcoded argument
> > > it is just obfuscation. However it is certainly seems attractive to be
> > > able to reuse handle_sysrq() to provide a more powerful set of actions.
> >
> > How about a module parameter that allows picking a sysrq character then?
>
> Module parameters are so 1990, as this is a platform device, why not get
> it from DT?

This machine doesn't use DT. I suppose the same could be done with an EFI
variable, but with a module parameter you get the added benefit of having both
a boot time kernel command line argument, and the option to override it at
run time.

         Arnd
