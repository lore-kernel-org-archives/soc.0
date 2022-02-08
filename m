Return-Path: <SRS0=FMNg=SX=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17736C433EF
	for <soc@archiver.kernel.org>; Tue,  8 Feb 2022 10:07:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D5443C340ED; Tue,  8 Feb 2022 10:07:07 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2870DC004E1
	for <soc@kernel.org>; Tue,  8 Feb 2022 10:07:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2870DC004E1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wm1-f49.google.com ([209.85.128.49]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MkYLW-1o2JHC00FC-00m1i6 for <soc@kernel.org>; Tue, 08 Feb 2022 11:07:04
 +0100
Received: by mail-wm1-f49.google.com with SMTP id o1-20020a1c4d01000000b0034d95625e1fso969467wmh.4
        for <soc@kernel.org>; Tue, 08 Feb 2022 02:07:03 -0800 (PST)
X-Gm-Message-State: AOAM533d/Nwm1yEdl4OECzvD5bdAE1F8emd2sOHAScKxqVot55JHQMjc
	GfXCxZ0BQcXvG+NTllDv/jhJhFPUs8tWJmjJzG0=
X-Google-Smtp-Source: ABdhPJxnKZDoCmSics5WhTxIQGHvk1qoWix3FW67OgAp6n51iWA8LCFNI07jUyhVikyKX5nfFDde0MCz6dAABA4PWGw=
X-Received: by 2002:a1c:f004:: with SMTP id a4mr457366wmb.1.1644314823624;
 Tue, 08 Feb 2022 02:07:03 -0800 (PST)
MIME-Version: 1.0
References: <20220105172618.302522-1-p.zabel@pengutronix.de>
In-Reply-To: <20220105172618.302522-1-p.zabel@pengutronix.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 8 Feb 2022 11:06:47 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0C5Yy370KDQudiqhvU5MJ7oaj8VfCo-P4x54SVmT1HKQ@mail.gmail.com>
Message-ID: <CAK8P3a0C5Yy370KDQudiqhvU5MJ7oaj8VfCo-P4x54SVmT1HKQ@mail.gmail.com>
Subject: Re: [GIT PULL] Reset controller updates vor v5.17
To: Philipp Zabel <p.zabel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:dh3vQifcLeJ8VIxC7h2UuwfSbYVPlw/3hQu8J4L1lAEIH5IvMsJ
 /dloBTqmXz2Yc+3lojRO3tofhpSw/kj8oGdVHr9eT6MYJ4dEy8x6zdXDU/ksJtDA0Sm6LqX
 3OEoObSdDLr0Cc/FwfBRHarhdkOk54PyA7XKtQj/trnNFSg7o9b/aZFyAH7MlsDteSpT4Y/
 HR9IACUp2XBeR8P95MXng==
X-UI-Out-Filterresults: notjunk:1;V03:K0:PgXIN0G1QIs=:AyOPTaod2bBQTklISnPa47
 A6YP5RWDKFjM66NhmZRLOEF2NUhG7GmDlwbeuuQlIELkDzCgYZqKbkGy1v3cPURVrx3CeXpAh
 QmgTLO8CgAYuVIjpBI6kUOf+PCEvHb3mGQDWf2fAWJ/Mqjz+3EVfYY6BmSmfoYKVtOm0t6NsL
 a+U5jGCoShNvt3MTVD5Dx07WUAz4nEY4a2REueUyeszHPVSaLfjfUnEEZIbdjSzH+e1v5CM1T
 aJ5H4x37NIxiyx8Tzf0sQqLaLABx6A6lRbBAOoC77Pl7cCuyDb3ft1NDTeUkKbvMNCIWfkbr1
 JR3YFA61NeQfjmTpfBt9+UL1ZH35mdSFCjYO3Ru+CkFMWEXeUQoOAOC+nf9tXoTdcUdLSE3o4
 25ktyEap2cEGvzoYMeZO2GdvcxXIhx2V5HKDumvaKTNLVCirTHZI9DQQhVE0iI0IpHsqb9EwL
 FxcpRM5A651wW6lQo93z/vVFG2iPucZ+A8Mxy9iwV5IvrWwAediNYnJGD4G+T8Ly3zXDu7HZW
 HXW0s5lGJWsv0Ke045y/F7HuNWyLjFkdsvJdQHf5g+bXDMfxNdaR3ueXnJiqX+yEZEeyIQfYc
 q41Xi3VZ49l+OD1wOe1TpsyWrneHs13bs77Ukd+Xb2vK0hUk+B/BdEK8E410BT4yob4epJY62
 Juk1zBr03XbosVJ3XaZKQaVSoi8afOZWdiWRo7r/p6UuHWU6qK5iWWsspd7PdiQ5xSZA=

On Wed, Jan 5, 2022 at 6:26 PM Philipp Zabel <p.zabel@pengutronix.de> wrote:
>
> Dear arm-soc maintainers,
>
> The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:
>
>   Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)
>
> are available in the Git repository at:
>
>   git://git.pengutronix.de/pza/linux.git tags/reset-for-v5.17
>
> for you to fetch changes up to 89e7a6698fdd6d0cccf5bab11abc51f813944cd8:
>
>   reset: uniphier-glue: Use devm_add_action_or_reset() (2021-12-16 09:59:55 +0100)
>
> ----------------------------------------------------------------
> Reset controller updates vor v5.17
>
> Add an optional variant of of_reset_control_get_exclusive(), document
> a deprecated hi3660-reset device tree property, check whether reset
> deassertion worked in the reset-rzg2l-usbphy-ctrl driver, and simplify
> the uniphier-glue driver a bit.

Hi Philipp,

As you probably noticed, we made a mistake here and this branch
ended up not making it into v5.17-rc1, sorry about that.

As far as I can tell, there are three bugfixes that we probably want
in v5.17 after all, but the of_reset_control_get_optional_exclusive()
interface is probably v5.18 material, as this is not a bugfix.

If you like, I can cherry-pick the contents into the 5.17 fixes branch
and the 5.18 drivers branch, or you can send me updated pull
requests that incorporate more changes you have already queued.

Please let me know how you would like to proceed.

       Arnd
