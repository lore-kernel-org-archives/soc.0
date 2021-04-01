Return-Path: <SRS0=RmDt=I6=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7AEFC433B4
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 11:04:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7C623610CE; Thu,  1 Apr 2021 11:04:03 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B665B610CA;
	Thu,  1 Apr 2021 11:04:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B665B610CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=arnd@arndb.de
Received: from mail-ot1-f46.google.com ([209.85.210.46]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M8hIl-1lW3zF45fl-004mUH; Thu, 01 Apr 2021 13:04:01 +0200
Received: by mail-ot1-f46.google.com with SMTP id m21-20020a9d7ad50000b02901b83efc84a0so1720362otn.10;
        Thu, 01 Apr 2021 04:04:00 -0700 (PDT)
X-Gm-Message-State: AOAM531NLvEG8+N9odhDPzvmfFhKaaT+gfXFD9xpkG5PX6qnkEZlR+1j
	b/kO6VZXgnzBy/AqMiny1Ak3pXHoQJRvn5Zf6sg=
X-Google-Smtp-Source: ABdhPJzv7NfJJM5P4rtmBV6imKoE6SXOGcuNPsyG7xm5vTrhAebddjzZDciuJMsX9IJPq79khP0o2GXRH+qVT+juje4=
X-Received: by 2002:a05:6830:148c:: with SMTP id s12mr6614473otq.251.1617275039517;
 Thu, 01 Apr 2021 04:03:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210223061830.1913700-1-daniel@0x0f.com> <20210223061830.1913700-2-daniel@0x0f.com>
 <1614108850.540354.4116103.nullmailer@robh.at.kernel.org> <CAFr9PX=h2JPdAwjYS2849ufH=wnxSti2Dj60fbq4bg8b8=xy_g@mail.gmail.com>
In-Reply-To: <CAFr9PX=h2JPdAwjYS2849ufH=wnxSti2Dj60fbq4bg8b8=xy_g@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 1 Apr 2021 13:03:42 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1L62YT1WUxmmfLNmvERo7DbeVwfCHCxuKvxs7Uap+iXg@mail.gmail.com>
Message-ID: <CAK8P3a1L62YT1WUxmmfLNmvERo7DbeVwfCHCxuKvxs7Uap+iXg@mail.gmail.com>
Subject: Re: [PATCH 1/8] dt-bindings: clk: mstar msc313 cpupll binding description
To: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh@kernel.org>, SoC Team <soc@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Willy Tarreau <w@1wt.eu>, 
	linux-clk <linux-clk@vger.kernel.org>, DTML <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:U8UMaHDSJv2Oin+0Opq5Nt6n+Sx64kepCEH6+KbmU3oOuaPpKJI
 ygD3Te8VASSaFkECGUFRiu63WqlIxWN6ysaM6JKzmp+05Pymo4GClldWqloCYUhDS83+yXp
 rq+mS9V8KG6uuJ+NM4C7G1ZD+dIkjrmxF9oAd719s1l8gQZXTdLKn0Q5G5E8jA5xzvPKXQb
 N5qdMVACjQjse93JzE60g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ECbxRiSTXuk=:3ZBSsUFMBv0rHg7X9oqpDs
 UcvCg2dqo9n99LgmiRRWm2izjCifRU11uxX4OB0gcPwf6K1FhgOWRMf9EQupOLuqKg3BhT5mK
 GI9J4BeTNCBYk7wFFeXLhBefbcZLPpH153SfpTrTvBW5J9mP3tk0zr+QCKjiKbJF0DUZL5PR4
 ocOMV6uJxzGlcRU3KBHWL33J2Or/n8pawIQg0yV7rGMeRs+ROc/N1k9ua9w783EMT+eFOshPo
 8+qCSRm9BtIaw+9oveihMDk0Z5ngfK6W6lk74/QGAmO9NomkFsCRtnCKzDNnxOGPiAqockvj6
 yAbVR4eWf7tDmTboMCixq2Ufdxy6hvBilkd+DpbSSatEic3GT5PqwgBstp/+67kxkt/8f834T
 C4lpln917N2JJSSWRlOTDdKDnWuU9yXhxUK4sqUmqbopT0Z8yn/5uIWMNunVtksAPx7ALWHYg
 uCDYUyttZ6AWwUig9acyaPVG5gu6LeY=

On Fri, Feb 26, 2021 at 12:31 PM Daniel Palmer <daniel@0x0f.com> wrote:
>
> Hi Rob's bot
>
> On Wed, 24 Feb 2021 at 04:34, Rob Herring <robh@kernel.org> wrote:
> > dtschema/dtc warnings/errors:
> > Documentation/devicetree/bindings/clock/mstar,msc313-cpupll.example.dts:19:18: fatal error: dt-bindings/clock/mstar-msc313-mpll.h: No such file or directory
> >    19 |         #include <dt-bindings/clock/mstar-msc313-mpll.h>
> >       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > compilation terminated.
> > make[1]: *** [scripts/Makefile.lib:344: Documentation/devicetree/bindings/clock/mstar,msc313-cpupll.example.dt.yaml] Error 1
> > make[1]: *** Waiting for unfinished jobs....
> > make: *** [Makefile:1370: dt_binding_check] Error 2
>
> Looks like I sent this too early. I will try again later.

I found this is still in patchwork as not merged, and I have not
seen a replacement. Marking all eight patches as 'changes requested' now,
please resend.

         Arnd
