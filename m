Return-Path: <krzk@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC52BC433EF
	for <soc@archiver.kernel.org>; Thu, 23 Sep 2021 06:27:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9814361242; Thu, 23 Sep 2021 06:27:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 813206121F;
	Thu, 23 Sep 2021 06:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632378430;
	bh=CQswPRaEh1JpYm6ox4FM38eWs3GIuh71EFZBMII7DrU=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=IfQKK94zh34RgdA8b4ZtxrHPELANYEBfUCNVPniQ90Jebsc5ue3DTX1IO3E8HKUpp
	 DbaJ+Eh+2iruXHtjKfOzWUB8/IL612rUaB2jPtuoFMOtxaEadG7YS8KOUOENqXKGqd
	 144Dss1KUa378QdqbF5VA4GS+bk4+gkiclifTzvoXlOTd439c8sHeqMtis6PY0w1cY
	 e53f5QT77LnE62vV8IihzemMywQNgbWRk3eWOmz3bhz3GafFuK0AZkIBu89BjCgyh7
	 cy7IjDtVFzFKIM7A61kOT2aiJGaJlAHNJ2x8BbsUvH40WvmHdDEeomE+W6T6sPhXdB
	 k9GBOIjgKP/+A==
Received: by mail-pj1-f41.google.com with SMTP id v19so3755891pjh.2;
        Wed, 22 Sep 2021 23:27:10 -0700 (PDT)
X-Gm-Message-State: AOAM530C/HnOR3gTLF7YvEGZ6A8Z2TzGSc47h0kjs0eIx6xdsTXwGpJJ
	OqtTvyxLDa22G/4dZI/Yp+cXjr8DB1obzD0tzgs=
X-Google-Smtp-Source: ABdhPJxPjIY1IiltM2HJyXSdK2snIiro8qmUrafzSlpj8z8updmBLe6lGgxdwHepyDJ/12YGD5N+SzBXwVytCFPpiMs=
X-Received: by 2002:a17:90a:c982:: with SMTP id w2mr3508798pjt.30.1632378430081;
 Wed, 22 Sep 2021 23:27:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210918141627.2142457-1-andreas@kemnade.info>
 <20210918141627.2142457-4-andreas@kemnade.info> <CAJKOXPfQrfOm=LWh97tq6q16v6aGXazksYF+kYxj5ghd0x7LUg@mail.gmail.com>
 <20210922223847.5efe6471@aktux>
In-Reply-To: <20210922223847.5efe6471@aktux>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 23 Sep 2021 08:26:58 +0200
X-Gmail-Original-Message-ID: <CAJKOXPeRBCXBAgaFTtuEFZV=HfcATSFRhGtgJxoSBfFU=Y8g5Q@mail.gmail.com>
Message-ID: <CAJKOXPeRBCXBAgaFTtuEFZV=HfcATSFRhGtgJxoSBfFU=Y8g5Q@mail.gmail.com>
Subject: Re: [PATCH 3/4] ARM: dts: imx: add devicetree for Kobo Libra H2O
To: Andreas Kemnade <andreas@kemnade.info>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, soc@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-imx@nxp.com, leoyang.li@nxp.com, 
	devicetree@vger.kernel.org, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Sept 2021 at 22:38, Andreas Kemnade <andreas@kemnade.info> wrote:
>
> Hi,
>
> On Wed, 22 Sep 2021 09:41:39 +0200
> Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> [...]
> > > +       pinctrl_usdhc1_100mhz: usdhc1grp_100mhz {
> >
> > Thanks for the patch.
> >
> > This does not look like passing the schema validation. Please run
> > dtbs_check. The node names should use hyphens and end with "grp"
> > suffix. This remark applies to other cases below.
> >
> dtbs_check reports a lot of errors originating from imx6sll.dtsi and
> friends. But nothing added by me. But yes, node names should use
> hyphens, that is documented. I will fix that.
>
> But having -grp at the end for these things with a frequency in the
> name is uncommon.
> $ grep -R :.*100mhz arch/arm/boot/dts/imx6s*.dts
> arch/arm/boot/dts/imx6sl-evk.dts:               pinctrl_usdhc1_100mhz: usdhc1grp100mhz {
> arch/arm/boot/dts/imx6sl-evk.dts:               pinctrl_usdhc2_100mhz: usdhc2grp100mhz {
> arch/arm/boot/dts/imx6sl-evk.dts:               pinctrl_usdhc3_100mhz: usdhc3grp100mhz {
> arch/arm/boot/dts/imx6sll-evk.dts:      pinctrl_usdhc1_100mhz: usdhc1grp_100mhz {
> arch/arm/boot/dts/imx6sll-evk.dts:      pinctrl_usdhc3_100mhz: usdhc3grp_100mhz {
> arch/arm/boot/dts/imx6sll-kobo-clarahd.dts:     pinctrl_usdhc2_100mhz: usdhc2grp-100mhz {
> arch/arm/boot/dts/imx6sll-kobo-clarahd.dts:     pinctrl_usdhc3_100mhz: usdhc3grp-100mhz {
> arch/arm/boot/dts/imx6sll-kobo-librah2o.dts:    pinctrl_usdhc1_100mhz: usdhc1grp-100mhz {
> arch/arm/boot/dts/imx6sll-kobo-librah2o.dts:    pinctrl_usdhc3_100mhz: usdhc3grp_100mhz {
> arch/arm/boot/dts/imx6sl-tolino-shine2hd.dts:   pinctrl_usdhc2_100mhz: usdhc2grp-100mhz {
> arch/arm/boot/dts/imx6sl-tolino-shine2hd.dts:   pinctrl_usdhc3_100mhz: usdhc3grp-100mhz {
> arch/arm/boot/dts/imx6sl-tolino-shine3.dts:     pinctrl_usdhc2_100mhz: usdhc2grp-100mhz {
> arch/arm/boot/dts/imx6sl-tolino-shine3.dts:     pinctrl_usdhc3_100mhz: usdhc3grp-100mhz {
> arch/arm/boot/dts/imx6sl-tolino-vision5.dts:    pinctrl_usdhc1_100mhz: usdhc1grp-100mhz {
> arch/arm/boot/dts/imx6sl-tolino-vision5.dts:    pinctrl_usdhc3_100mhz: usdhc3grp-100mhz {
> arch/arm/boot/dts/imx6sl-warp.dts:              pinctrl_usdhc2_100mhz: usdhc2grp100mhz {
> arch/arm/boot/dts/imx6sl-warp.dts:              pinctrl_usdhc3_100mhz: usdhc3grp100mhz {
> arch/arm/boot/dts/imx6sx-nitrogen6sx.dts:       pinctrl_usdhc4_100mhz: usdhc4-100mhzgrp {
> arch/arm/boot/dts/imx6sx-sabreauto.dts: pinctrl_usdhc3_100mhz: usdhc3grp-100mhz {
> arch/arm/boot/dts/imx6sx-softing-vining-2000.dts:       pinctrl_usdhc2_100mhz: usdhc2grp-100mhz {
> arch/arm/boot/dts/imx6sx-softing-vining-2000.dts:       pinctrl_usdhc4_100mhz: usdhc4-100mhz {

I was fixing primarily arm64 boards and did not touch that many of armv7:
grep -R :.*100mhz.*grp arch/arm64/boot/dts/freescale/* | wc -l
46

Best regards,
Krzysztof
