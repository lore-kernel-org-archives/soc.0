Return-Path: <SRS0=QQ92=X2=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A32EC43334
	for <soc@archiver.kernel.org>; Thu, 21 Jul 2022 12:55:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 27F03C385A2; Thu, 21 Jul 2022 12:55:29 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2C454C3411E;
	Thu, 21 Jul 2022 12:55:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2C454C3411E
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-yw1-f171.google.com ([209.85.128.171]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MV5KC-1o7KBE2mqU-00S6vc; Thu, 21 Jul 2022 14:55:18 +0200
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-31d85f82f0bso15982187b3.7;
        Thu, 21 Jul 2022 05:55:18 -0700 (PDT)
X-Gm-Message-State: AJIora+cUnhb0Lag26Kwb/TwWRELbCEYSZWybRjA0OfyJbIlScK7oR+0
	KiothYwPSCVjQM7oIiK2JXwtO+M6NMEBBv0Oh/s=
X-Google-Smtp-Source: AGRyM1viYGlLryja/5f/h+YZGqrEBl07fhm4RYssoWdw+dgSQElSnDMEgUoIgmmN+X2tZwirCrjFYbJdyF9Tq6ztqcQ=
X-Received: by 2002:a81:6742:0:b0:31e:7064:9205 with SMTP id
 b63-20020a816742000000b0031e70649205mr6722307ywc.249.1658408117110; Thu, 21
 Jul 2022 05:55:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220721072415.11424-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220721072415.11424-1-krzysztof.kozlowski@linaro.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 21 Jul 2022 14:55:00 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1j=WUq8=VZz9aY5zkPeEMaF11w4PJF7evmY_JTsFoFZQ@mail.gmail.com>
Message-ID: <CAK8P3a1j=WUq8=VZz9aY5zkPeEMaF11w4PJF7evmY_JTsFoFZQ@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: dt-bindings: aspeed for v5.20
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, arm-soc <arm@kernel.org>, 
	SoC Team <soc@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, 
	Rob Herring <robh@kernel.org>, DTML <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:uK7HFhQ5ubwH59WhXwlXNRqi9ySjY2nEeuCQqZetkrYcJlsacPy
 FBkOaMXNkiB65BLrlegiAN1Z2xE5LMr1doqNO1ODkFrHMzWXEDUFtfL81P30JTJcjTpC9yo
 EyvjE/rlg46a7+/PPAK4Z1FXByPHy2aHNn3+OFLt0DPlCqpy0rDqUrgXsYJq+sOTgcnp/kw
 OT4uVxj4lABzs6+c1AmAA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:UCVItXwVhZs=:AHcCSiQ8iqpp8YZmGYSUJl
 8f6ikzaN82yLrod4HvISUbxFFDT6r1t2gYFFuwRE+vkhdDRViW2dZpGed+pDsO5rcZkQVBGuM
 lmomgnA1zZ5mqpLs78Jq9PLmOkoBpg2SOrHoV+LRcIy5MCeK5b346yI+R3CuBthP95czXnlQj
 v7P8KOsK0PcDkROeN3YHGIogOyhqJdNx6rPsHLERVKmMFE1wyxywM42ymrGIRHqftosrZ1Sg5
 ln9NpYczssVaATv+BOKGOXJfhomY0B7jSmWfPejK/dDXJ7HOgKaW1Ot44YPZX0jin3nN+yP2m
 6eS8FgA1zQjQIJd8TUYpgMI+V44lVcWCM7gdGby45QiOJab/EVxn9x/ol13AUGyptgNOPOyIL
 rjV/KRnn9SZN+BWxCZCQAFhiWVzFC9MuHMu+cUXjWn31E5BJsmov42CbxLeC4xrMK3rICheoJ
 0QoDZv6RrKB2W/xMGan2k0SHM6yMJ16vIpl8zfNnxC0p9vxGQR00yUqI+SS/pAMzSrWvOym9R
 mRzee9EHhBdumDJauaTlJSbnVYxutrLArkG8/XR5B+bsin1aCWxPoh/QF3pNitm73iypOm7MU
 F06pUATMTszKy4/NGDWxE8PBXuxHDx4mC/roKWNzc2ggH38j1sYkA/5vxFdM/jLJRoTFBMlOl
 1147iTKIjNgsyOx1Ge43apSr8vigmykHao71CQLy0vmhSsQVcjj24QcfFXkENJ4I2apgu/rGa
 DXm9bGQTua8oWZyyJm+IATe/6WMpfMT7/qJWWQ==

On Thu, Jul 21, 2022 at 9:24 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Hi Arnd and Olof,
>
> My two patches documenting existing Aspeed board compatibles were waiting for
> some time, so a month ago I decided to pick them up and include in the
> linux-next, so other developers - like David - can base their work on these.
> Unfortunately the responsibility for the patches was not cleared as I was
> waiting for some replies Joel and Andrew, so I also did not push them out to
> you. And then rc7 appeared and it is quite late now. That's my mistake, I
> should sort it out earlier.
>
> But anyway these were for a month in linux-next and other work [1] will need it.
>
> Can you grab them last minute? If not, could you queue it for v5.21?

Merged into arm/dt for 5.20 now.

      Arnd
