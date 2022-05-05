Return-Path: <SRS0=U146=VN=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D785FC433EF
	for <soc@archiver.kernel.org>; Thu,  5 May 2022 14:48:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 91105C385A4; Thu,  5 May 2022 14:48:17 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A1869C385AF
	for <soc@kernel.org>; Thu,  5 May 2022 14:48:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A1869C385AF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-2f83983782fso51030097b3.6
        for <soc@kernel.org>; Thu, 05 May 2022 07:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x4fRFYc30vVTKimcmiwmc/0s2zAjApXTdSQH+fCjeZc=;
        b=RJ2dL8Z98GnnChZ/wAx/Tr3GNrlubI/Ewxr7kL1jUgW10fqmD8QWLcd4v0P0B7c2oF
         UOuPty7DvnIP1hXx+4fNrmF4PP3yczk9Hst/YhDTg+Zb9zDBVJS5bJvPDOlNBe26/Ym7
         5dhH9mU7w2xc3ncmzXxeiuBl/mKCd+TS6gP0El08mxQGz5pARUKOW7V4nrtGqq3CkMG+
         OA+QOwpugB3TZYh8/6FWTlx3/SgtKPqKpklqLYymNJo3BJ2iiUJ+nMr83YInf2rO1oGz
         uRPKDuwtDKnzLTbt4wK0x6Pjs4WAWVLTMlGV2DE7HYEVcryX9h6eT4VdvTPMfY1xLFTW
         +nAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x4fRFYc30vVTKimcmiwmc/0s2zAjApXTdSQH+fCjeZc=;
        b=UzT+jJ5fO0CFcWDvHsO6n4ssSsYW7mX7S2XlZVWS3XNYPu1yVNU1+1rDJWjQT4V/Gy
         2dKmrhqJsm9bCf5paKrj+7q1Vl4m9o0/dIna0Ar0jK8ytr8ARDs/yOqOvxvndQeRHj98
         ki9QduBNAWTXphwlfv3u5xHMIFpGFY1xUhLVjMu0eFpPRa+LSDDDSL2Xo6i69/DBa/QI
         A35Ixv6CvHvpD2ITeJK557v0LaVp+B3IZyr6Eu0AroAdHTMeImSn15r7lYICstpaiGMn
         sn0Toj0dtY87nomfSW69xAyn0zar+D+4WZGtNkWs7iOQgIp089ahw7cgfXs/Vj65kDa1
         9EvQ==
X-Gm-Message-State: AOAM531zqVrlFQtWeDm7ens3YW5wz7UiAaVj71vWg3YMNUlNI4BDho31
	K61Er6sgJG/cO8ZUPtNqJq5rpmM8+oyBHmPgwlP3Hg==
X-Google-Smtp-Source: ABdhPJwXNLddrQVGyZC3ybRhuNgnpP+SATbyxZTf2xneFJRsYXVCHMlzU26U6NzDh94jiPLqra4RbLz9ctv575Xjku0=
X-Received: by 2002:a81:1d48:0:b0:2f1:8ebf:25f3 with SMTP id
 d69-20020a811d48000000b002f18ebf25f3mr23701819ywd.118.1651762095701; Thu, 05
 May 2022 07:48:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220428214838.1040278-1-Mr.Bossman075@gmail.com>
 <20220428214838.1040278-13-Mr.Bossman075@gmail.com> <CACRpkdY2MNkAKhVOQ_Eyq0AwOtEW-seSrxgsJ2D8E78u636A8A@mail.gmail.com>
 <5b8a7e58-1b84-6a6b-cc9e-b4224392b5ef@gmail.com>
In-Reply-To: <5b8a7e58-1b84-6a6b-cc9e-b4224392b5ef@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 May 2022 16:48:04 +0200
Message-ID: <CACRpkdaK6q6mBTwdxq4sJGUwuzmz+xqCc+G0L9O+=Si_QAkMZQ@mail.gmail.com>
Subject: Re: [PATCH v2 12/15] pinctrl: freescale: Add i.MXRT1170 pinctrl
 driver support
To: Jesse Taube <mr.bossman075@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-imx@nxp.com, robh+dt@kernel.org, mturquette@baylibre.com, 
	sboyd@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, aisheng.dong@nxp.com, 
	stefan@agner.ch, daniel.lezcano@linaro.org, tglx@linutronix.de, arnd@arndb.de, 
	olof@lixom.net, soc@kernel.org, linux@armlinux.org.uk, abel.vesa@nxp.com, 
	dev@lynxeye.de, marcel.ziswiler@toradex.com, tharvey@gateworks.com, 
	leoyang.li@nxp.com, sebastian.reichel@collabora.com, 
	cniedermaier@dh-electronics.com, clin@suse.com, 
	giulio.benetti@benettiengineering.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, May 5, 2022 at 1:23 PM Jesse Taube <mr.bossman075@gmail.com> wrote:

> > If I get a review from a Freescale maintainer on this driver and the bindings
> > I can merge it separately, correct?

> That's fine with me.
> I cant speak for Abel or Freescale/NXP maintainers though.

I give them some time to review and if I lose my patience I
usually just merge the patches.

Yours,
Linus Walleij
