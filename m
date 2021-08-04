Return-Path: <SRS0=XHAu=M3=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C67DC432BE
	for <soc@archiver.kernel.org>; Wed,  4 Aug 2021 13:55:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6D9A660FC4; Wed,  4 Aug 2021 13:55:28 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C32DC60EE9;
	Wed,  4 Aug 2021 13:55:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C32DC60EE9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wm1-f42.google.com ([209.85.128.42]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MwPfX-1n3NYR1G2H-00sL3n; Wed, 04 Aug 2021 15:55:26 +0200
Received: by mail-wm1-f42.google.com with SMTP id e25-20020a05600c4b99b0290253418ba0fbso1526109wmp.1;
        Wed, 04 Aug 2021 06:55:26 -0700 (PDT)
X-Gm-Message-State: AOAM533705WP+jYRBxNIqvHqRaAJoJnQzixHyyjPwe9qK0koMkh3cswX
	wQS0mjvTbAaXOPf2Kvf3DcPU/zPrwfxuIKVU8Pk=
X-Google-Smtp-Source: ABdhPJwDFsHBF22f8Wqozeaut6UIlHtczJbkX0G3MU6rJlQNmQa5Uqm62X/H+k4KrenEDbOxO68Jg/vZ6B5uO0dsHAk=
X-Received: by 2002:a1c:208e:: with SMTP id g136mr9939159wmg.142.1628085325875;
 Wed, 04 Aug 2021 06:55:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210804043439.11757-1-o.rempel@pengutronix.de>
In-Reply-To: <20210804043439.11757-1-o.rempel@pengutronix.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 4 Aug 2021 15:55:10 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0285V=N5HPS5grOTQ+q1HF8J6_PsxCLgLvYMsD0hVeUg@mail.gmail.com>
Message-ID: <CAK8P3a0285V=N5HPS5grOTQ+q1HF8J6_PsxCLgLvYMsD0hVeUg@mail.gmail.com>
Subject: Re: [PATCH v34 0/3] Mainline imx6 based SKOV boards
To: Oleksij Rempel <o.rempel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, 
	Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, SoC Team <soc@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, DTML <devicetree@vger.kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, dri-devel <dri-devel@lists.freedesktop.org>, 
	Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:+aKW5ES26M+dsSfgZC0bbgZ1bllGvhNzIvi1c92EUha+MKvfUBG
 N0bCZMmcSNXMGQrUTPMK2jKE4cexxTRpH6fhAwl9Wv/SaIU5L2CHAhUmKlLv8lc1LkSEHf2
 5vxBmHwkyJM37vuN6D3lEJLkUFgFptvRrWHMYhwWVaOdrY6boxwnsQCB2bfFn+dvnE/p/i+
 BEhvgEADnhjHov9kLHWqQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ih75nbPimJg=:BHfwiirgEtjEzPu+6thCog
 rI0Wak3PgKYznuoJKASU4n/6sH0g7bc0O/OrIPghDE+OmXWgTMuxanK2qaLJZPvM9qnoiIywG
 nnWXYnHFdKWLLcvdY+BZbV1Byrppud0SrLUVzz8gglKjk5dtf/83Opp1/5ABdwMF8MfSeo9fZ
 NIr44zILJhaVc8xXTtT7l7J4kfu8qdTH266nZaG/UVGj2NFozJv6JGWLDhnST+tanx4f4In9u
 ZuJfJKpKmSu5PcrSPCl9YssKq0kJG6wfDDhgGMeQ0GtyfP4Pj3fP3IR1hssjFuCQBdEtp/Ypt
 cazgPDXPGMa7DfzFP5AxXuz+RyXc+51c7oW9E+dtb5FQgNWUhiitdbXJRSWsHOkL3A7oFF21V
 0nC+Pv00TF/Y8BqD7OT7V4PaYqxCb8knAddClwDtJ+0K1RBfW2mdQCKqeuVTqG2Q+/BQGc4TC
 +NaS9xYjlYdu2p2bwsz7eaNUTSu1o7Q45mC7N9AYB27R7UHnK1XsAsT4YhKJTzjTAIC/M0hrx
 I7Dmq2IpnFXfUwzFxrPjVjs7cJE0YwivqywQr/6xk/pqplX+B5RsdjNoqH/f75GPNFH8mUDR8
 mkgsF74H3VZ6fqUgThB+LDLqt0TV3Xr2s3xDenfbZvhwUNzouYUBP8DQ0H5dNXOzwuTqbCXa6
 ccnoTqXC3qOMNEqQ+lQuFmxqRo4IfnE4ChQX6/6+7AoM+yCFMipEeIqc9PQokOuGaeB2atgVM
 ttp1rLiA7duLND7XazyiO7AY9w5fZyfeo00HmvWgCowFNId0XKIN2jyk84LAdDaxzHoUmv2Sk
 6d/3gV3AQDaVT2/2Ft+6HfuoUmGsSnhMSSsZO22hs7hismqMearAbxxwrYG52My+0XIIrRmmf
 1fH1mf+p120RVj0JDqqljHf/c8HuoPMe0qr/tzXSef1/SnWxB82M7I6bGhR1HDCqjK8mKPB0/
 TLXvmofm7gLcmkezG5zxAgne8i+NjVGWTN0D7fBtTM1c975fZEX+V

On Wed, Aug 4, 2021 at 6:36 AM Oleksij Rempel <o.rempel@pengutronix.de> wrote:
>
> changes v4:
> - add vref-supply to adc@0
> - split gpio assignment for the mdio node

Hi Oleksij,

I've dropped the series from the soc patchwork, since this looks like
something that
should go through the i.MX tree. Please make it clear from the cover
letter and from
the 'to' list what you want to happen with the patches, and who should take care
of them.

Any patches that are meant for platform maintainers should not get sent to
soc@kernel.org. If you think you need me to review the patches, you can
send them cc my personal address.

      Arnd
