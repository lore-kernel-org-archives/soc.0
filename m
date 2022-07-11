Return-Path: <SRS0=VZIs=XQ=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D6B6C433EF
	for <soc@archiver.kernel.org>; Mon, 11 Jul 2022 18:54:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 42DA8C341CA; Mon, 11 Jul 2022 18:54:48 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 98E12C34115
	for <soc@kernel.org>; Mon, 11 Jul 2022 18:54:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 98E12C34115
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-yb1-f178.google.com ([209.85.219.178]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MY6TD-1o3RTl18E1-00YRb1 for <soc@kernel.org>; Mon, 11 Jul 2022 20:54:44
 +0200
Received: by mail-yb1-f178.google.com with SMTP id f73so10196472yba.10
        for <soc@kernel.org>; Mon, 11 Jul 2022 11:54:44 -0700 (PDT)
X-Gm-Message-State: AJIora8PBk9t/SDUBmuz7OupLFs60PMLEREyzk8Zh+hIb3A5Lm6zIX5v
	a21zWtqnifvFTdWFw3KmwM4+dnzVUWBY4nzGbFg=
X-Google-Smtp-Source: AGRyM1teQ9by6wwYpEa4TUiw+qV+gY/b/EQAj5dDeWf1gTsk/iOKJ37ZYiJsFa3tHVGbiKmMuKCKz+TO3trwL567zV4=
X-Received: by 2002:a25:7c41:0:b0:66d:766a:4815 with SMTP id
 x62-20020a257c41000000b0066d766a4815mr18584569ybc.480.1657565683096; Mon, 11
 Jul 2022 11:54:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220708194448.10700-1-Sergey.Semin@baikalelectronics.ru> <20220711155335.ltctlk66vylwcpcj@mobilestation>
In-Reply-To: <20220711155335.ltctlk66vylwcpcj@mobilestation>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 11 Jul 2022 20:54:26 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2H0+LDO18onn3F469t4ci=VbL+EZV83dct74Ce8tqfqg@mail.gmail.com>
Message-ID: <CAK8P3a2H0+LDO18onn3F469t4ci=VbL+EZV83dct74Ce8tqfqg@mail.gmail.com>
Subject: Re: [PATCH RESEND v4 1/2] bus: bt1-apb: Don't print error on -EPROBE_DEFER
To: Serge Semin <fancer.lancer@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Serge Semin <Sergey.Semin@baikalelectronics.ru>, 
	Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>, 
	Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>, SoC Team <soc@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:t/rN2L1J5yLf/V6TFsXDxa431m/c/vPDrQ9D78WJLNkTxbYF9qp
 K17mmQg79Bivdrf3Ps6XPkfRr48HbIUDCmhcnbirZ3QUYFnLTwbhMFQqoTAzvgLfn/aeJfz
 hCMPynTTqlxBhlDL4DPidgYRNh5UcxLmQJ5ZJZxMgNTUjqT4StjTIAelRFanrQ098VQpTlB
 FZUm009hQ9+6ffK67C0Fg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:zaMX+Y/ivMc=:QYiCGWIc5g3gr+3hj2pTmJ
 rsgel4WrvjlCD471boLGX48nZeX5Jpfysuu8vljgxPzWLLbk/O4I7CO+5Ipybzq+2RuilfYKq
 0gv4pGNTUjPC5KoiIN5JfCrQvzLQXlK8wTrsFawLzPQy+MHvcmOsJKuqotvUZUe626iEN1jjd
 OaHn+Yf89/j6Ryf2hnj7i9Tvdvv8E1KsRxGM1+iy4SzFKn0Uh6p8v8RxCPwCbfoZ6aZUC9v33
 gFCPZjoEWIZ1kY5alH45mxyojQ9BKYwu0K7pU1yx1lWHwTdX1LDwiw82rqKi6QIsB1XTnTlNA
 YS3e8FomR988KThryCwTL7GiQxpV4abc+RhGcg3GJeH57Nx24CmtFf3I0Ydf6NDMuWHEmUSUU
 7Rr1dqW1OStTyDVsZCmx16e1JCzLNDntxkTII7rPsiCzHGx52QxJ3bI/oD2ishGj0Z8pBNZNM
 sVg0F0TzO9yjnFudoPj3eQb1s69g0bDpkwtYI/DW+WyEgjr5lPT2lnBJchD7RZ1V0L6i7rZj+
 LlNsSQlANF++PGvNJtgmvbra0FCrh8nVUEePNFapqXsB4LSh5dlHJROLtDWGEUjfEhcNLD0Sk
 r3JzupkuSdpxgHj4Jdcs6XSUjinkge7/iI55tfzlm60RYQRIq95SWiZUH+VJWa2PKibZOnCzz
 NxnroD7AkQwjUj+pzbVKJ2oF2pMWkQRHGYHiEF3yFR3zZPhw3PmXfqtuRZJ9xRJHA7Twc8oE6
 qoSB+rG7c3uirX8BNScn8mdc+hfxm5/8NE0bvQ==

On Mon, Jul 11, 2022 at 5:53 PM Serge Semin <fancer.lancer@gmail.com> wrote:
>
> Hi Arnd, Philipp
>
> Since no comments have been posted for the patches lately and the @Philipp
> notes have been fixed way on v2, could you please consider merge the
> patchset in through any of your repos?


Hi Sergey,

I already merged these into the arm/drivers tree on June 10, I suppose
something went wrong with the notification email.

      Arnd
