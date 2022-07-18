Return-Path: <SRS0=6tPc=XX=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C230BC43334
	for <soc@archiver.kernel.org>; Mon, 18 Jul 2022 13:45:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8A5ACC341CB; Mon, 18 Jul 2022 13:45:48 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 361A4C341C0;
	Mon, 18 Jul 2022 13:45:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 361A4C341C0
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-yb1-f169.google.com ([209.85.219.169]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N1x6X-1nXPN20BVx-012Jby; Mon, 18 Jul 2022 15:45:45 +0200
Received: by mail-yb1-f169.google.com with SMTP id 75so20829062ybf.4;
        Mon, 18 Jul 2022 06:45:44 -0700 (PDT)
X-Gm-Message-State: AJIora980/VGCYYIQqhl0SKj+EJ0abpfOT0fN6TWqU+/h98qnVUIU/J0
	14mhndL67IVxXvKW6bfQFqvJhgiwzjavFech508=
X-Google-Smtp-Source: AGRyM1tlfrIWQ27LaIQl/6mu0rRs4G76HYr7k0PQYYpyx690oIm4QFJdUoMC9YrecCv4ZDO88YsTwA6PwQ+1hlp/zgg=
X-Received: by 2002:a5b:b47:0:b0:66e:3617:d262 with SMTP id
 b7-20020a5b0b47000000b0066e3617d262mr25157237ybr.106.1658144362159; Mon, 18
 Jul 2022 04:39:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220520074119.3574753-1-hasegawa-hitomi@fujitsu.com> <OSZPR01MB7050362B7F7B072AF5304A4DEBAC9@OSZPR01MB7050.jpnprd01.prod.outlook.com>
In-Reply-To: <OSZPR01MB7050362B7F7B072AF5304A4DEBAC9@OSZPR01MB7050.jpnprd01.prod.outlook.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 18 Jul 2022 13:39:04 +0200
X-Gmail-Original-Message-ID: <CAK8P3a14-j_EKpssvZaKar-vf2=BcLD-Dxzq8dhca9fqtobwgw@mail.gmail.com>
Message-ID: <CAK8P3a14-j_EKpssvZaKar-vf2=BcLD-Dxzq8dhca9fqtobwgw@mail.gmail.com>
Subject: Re: [PATCH v5 0/1] soc: fujitsu: Add A64FX diagnostic interrupt driver
To: "hasegawa-hitomi@fujitsu.com" <hasegawa-hitomi@fujitsu.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, "olof@lixom.net" <olof@lixom.net>, 
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>, 
	"sumit.garg@linaro.org" <sumit.garg@linaro.org>, 
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "jirislaby@kernel.org" <jirislaby@kernel.org>, 
	"daniel.thompson@linaro.org" <daniel.thompson@linaro.org>, 
	"dianders@chromium.org" <dianders@chromium.org>, "soc@kernel.org" <soc@kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:dZBPWnkehRXolwRrHY3NR02NrmC1a48OcsKrk0tCl5NT8vryPVt
 x+PXZi2q+oqFFpK9muknsNGU3Bzbcglw9I1Oo2v/1D+1Heod/XadtNI0vcjE0VkvCV12ZUY
 XyamK79Y3GzRPXCHPuJ8eSQgpHUGbbqmXVL5JAiTeedB9cjj16qseverA2f9yledr7Kmb+g
 fQf41rjgUbRD1NeX9AQ2w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5imcyCj9XIw=:bpy0JXKp4dqyaxA2ylrn+m
 Q7rlIfuyH42yJcfzOgCsDU6+XS4NkGeOe9XRoZxTzMQJOxaKZK8q08RFe18+wSiw5mh9bS+h1
 hTMay9zrafw1a+xttLDid4dvxeT90yun7D2HVyR5WNbJ9L1bW/J0bp+QvbRD77rhoyDQzHiAw
 P04oC4g6DdaCxvqlG5Uv8dj83Hy60UVNSZwqmAPc195B30EMq6nf5Zdanoo7sNMYpDZK9soPZ
 Mu7iM83q3FV6yOX1T7fN5oDAsUCD+7LF+XuBF/3DBDjB3Dg/053lSlyjJE1iudg3YDJM7GZAO
 0HGmfYxLwsUM4nDAHKL4tmM79gqbUoZow7ROYJKsfH76LmHdLJ4/v4f7WeYaRZjfc3cnHTA0k
 Z4zzu9XLYT7RgT15VuIesI6j8KYghKlQv+6VNgXwZjG6WGh9fbV0nBSIOhxc37kGj1R9rWlHp
 CK+jvTBWU+j6TzA9z9JcW2IE38QKa8ndtDEZppihpDnMbAiqMoVb0GzYszrMCBG+lxGqtBLiH
 93ORitZLGRuc+C7SPW+YHUHuYZs01hvQfekLrzZpI6T8y1o9TuRnTyPDTlIj1jUSFfud1+rk4
 5z1a0rtApdoAlGi+aKXv2t/cUU8baTzKB+ClGIXtyWcYolfiQQNkINpqUs+RtMMpDV57R8s27
 tvL6PvIjzHG1lMie46L2Kr9696cEjbTiJCXUKBDtXn7UsZsKSen8US3nNc9ZwmjYsWWvIFH+k
 mdtf/43TVJHiNd9fvzBwggtiT5zfxyqz2QRk5GIhqI7855eeWcnJ7Oa9VyoGyxSDHK8Br2iua
 XXhwloEV8movoeltwmv67F7Ijl07S6b4/UDlB/bqQ/iLKKUgO81o/ROGJr8ifp2F82R0C3zCd
 zAm1lz5DmJJlshcS2f2TBtF00RQoDh9zeRhR4wFw4=

On Thu, Jun 16, 2022 at 11:02 AM hasegawa-hitomi@fujitsu.com
<hasegawa-hitomi@fujitsu.com> wrote:
>
> Hi Arnd,
>
> There seems to be no comment in particular, but what should I do
> in order to be accepted?

Sorry for the delay, I was planning to apply it last month and it fell
through the cracks.
Found it again while going through my backlog and applied your patch to the
arm/drivers branch of the soc tree. It should be part of the linu-next tree from
tomorrow and my pull requests for the coming merge window.

        Arnd
