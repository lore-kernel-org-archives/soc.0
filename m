Return-Path: <SRS0=2MMP=MY=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ECEAC4338F
	for <soc@archiver.kernel.org>; Sun,  1 Aug 2021 09:41:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 41C5B60EE9; Sun,  1 Aug 2021 09:41:12 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76ED160E76;
	Sun,  1 Aug 2021 09:41:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 76ED160E76
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wm1-f45.google.com ([209.85.128.45]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mf0Nm-1mpWWd3Y4o-00gZzz; Sun, 01 Aug 2021 11:41:09 +0200
Received: by mail-wm1-f45.google.com with SMTP id e25-20020a05600c4b99b0290253418ba0fbso9188180wmp.1;
        Sun, 01 Aug 2021 02:41:09 -0700 (PDT)
X-Gm-Message-State: AOAM532BpPSBIygbqs6rr0slvRd8VZNuyyDPCAbSuC7Dsh8aC6S2G8YH
	cD1I6IHHNkbyfdhG/S2p3sByB1OVMPeiFab7Z+Q=
X-Google-Smtp-Source: ABdhPJy9Co8LhMruzZGyj4f3XArmEpslC++FxInWAY5kS6dN4F5T0Wp45K/4NLUe+uVYPfHG9aIG+H5EtkfDpdNsprE=
X-Received: by 2002:a7b:ce10:: with SMTP id m16mr11249018wmc.75.1627810869409;
 Sun, 01 Aug 2021 02:41:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210730134552.853350-1-bert@biot.com> <20210730134552.853350-4-bert@biot.com>
 <CACRpkdYvMtE8b-Xiy6=Aiz20jvY0M0Bz9XmcEQDHhqeS+LErEA@mail.gmail.com>
 <87y29n26po.wl-maz@kernel.org> <0fe113c6-4160-fd3c-488d-53d40b6043ee@biot.com>
In-Reply-To: <0fe113c6-4160-fd3c-488d-53d40b6043ee@biot.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sun, 1 Aug 2021 11:40:53 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3HrzAYtCnLuThO=9LuwyF8KduNjx-ZrJkXG=Y-i6RNbw@mail.gmail.com>
Message-ID: <CAK8P3a3HrzAYtCnLuThO=9LuwyF8KduNjx-ZrJkXG=Y-i6RNbw@mail.gmail.com>
Subject: Re: [PATCH 3/5] ARM: dts: Add basic support for EcoNet EN7523
To: Bert Vermeulen <bert@biot.com>
List-Id: <soc.lore.kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>, 
	Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:zKXVUetTnavUszi0SuMoMjqJXPVbZq+ZCxlHSDPPgSs/jGdtMy4
 +umfQPZJYY0HbCoAqFqF4UY0sAeXXFtKgDSx3ZhPfUX+JFE1NyDqjy9W65C9a0iNg+ulKFv
 7TKvCQGj7DnQaT3MExs9j2y4xTW4rin0up/BryICDFXHmQYhucF+MBD8ER76NeWee9gsN2a
 JaccM6NGPCVt1zsXpH6Pw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3bf9XdLMeDY=:6okVFMOuBkPzhbO//8tVmQ
 Pn+TyMDKOGEyvtYe1en/97FPtYUjzWdsWd5t80LWMAy3eCa2Y61INzJCZomzygV/2KXSuztUS
 vu1XIEBpllEauJ4RSuXKblsqyKqa+XGlJes4CqbX086bScK0so6D+eDKSMYuN+GNNXJBjOA5u
 81k2EZjmAVGPCbxyjJwuYhL+p2NvVBQoWzjYrkyMqddgMoctO6PXxh6SlLnvIUEeyh7LZoT7L
 eBC91Xxs36yALiSMMacDmx7aTSMuZY6PeiGWQSfHvsHBZKp33nTsjqVRlv6DBUkYejErwuvlA
 REXL3rqp34cwCkhVHKEDKdK4sTBmltieTu0CV05/mozfj9ZoFdVIozIcif+3uFURXZuNgShrD
 BuiNP2+muszFWtPJvCLJndqpmKP5hXGzo1RnvvtyR/5vlIYkdurLmwqUZp0cXoflKmHdYdULF
 z0ZYv4kY/8YAXogkD0m5Asib+eubKKvjj//Hgga5nPD/7W3FGszYLYLFcSz4YMCNbw3dh60QF
 +dn8/awlGPpLqGF8OxBvfqQOU2ZrqHdpVy7NaLzmzvyZy8dVJbh+d2VsdbxEVLU2bV/3hZW9/
 OFPXkJVzqYslrL3g8j0jQ6dXiWTv3QeGvwhRHc8hlCs1EUrYLnql0CMQNeQVCJn/074ciGttj
 6bkwvs6KU3aNdTIWNEoSwhJNOzQf/k5Ibp11xcC/9HMsBD1PurznqDvh4zwFXIOfWDtaazuld
 IeDICXaBprxVFXgLoeG8erdmuSpKY/kPmN/y5YospQwU5tvYa9txtuax/kJkRF3Ic7QCMKGVk
 W8aBiW9pnwkFumbBAbofLlTH4lsDAl/butKKkYH1Ri43/y0U+DybgwnnEOvgzR0DHQ7AOGizp
 HBs4UPqqb9e8X62Y/0LDzA7cu0E6qUYwGldf2FJSpjOnFfBBDcmnxnyt4g7LSZXV54gzeUjI7
 Xz2PT+6pULf8xBjSRl0KNQUEPZwTap5jRWitqurp6IvGWfGWyIzbf

On Sun, Aug 1, 2021 at 11:07 AM Bert Vermeulen <bert@biot.com> wrote:
> On 7/30/21 4:53 PM, Marc Zyngier wrote: On Fri, 30 Jul 2021 15:31:36 +0100,
> > Probably because that's not what it actually is. My bet is on A53 with
> > a crippled firmware.
>
> [    0.000000] Booting Linux on physical CPU 0x0
> [    0.000000] Linux version 5.14.0-rc3-00042-g3af70c6f8e95-dirty
> (bert@sumner) (arm-linux-gnueabi-gcc (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0,
> GNU ld (GNU Binutils for Ubuntu) 2.34) #392 SMP Sun Aug 1 10:28:13 CEST 2021
> [    0.000000] CPU: ARMv7 Processor [410fd034] revision 4 (ARMv7), cr=10c5383d
> [    0.000000] CPU: div instructions available: patching division code
> [    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache

Good guess! CPUID 410fd034 is a Cortex-53 (d03) indeed. I wish we
would just print
cleartext names for the CPUs that the kernel already knows about here, I think
the fact that we just print 'ARMv7 processor' (which is wrong) and
spell out the revision
but not implementer/part/variant numbers is rather silly.

Is there a way in the boot loader to boot up a 64-bit kernel?

       Arnd
