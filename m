Return-Path: <SRS0=WZ3G=ON=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B665C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Sep 2021 10:55:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF67E610C9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Sep 2021 10:55:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CF67E610C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kemnade.info
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wJ3weSBN2YIocH4IAJlWIjprrSxK3k6U2msCYOFsEU0=; b=iOQRe5PAwelAen
	fpoU+V+CVUcyvlf8tl3a3fHT4fBoQZd/kUiVMZg1w/wjQTIoHpzpUTmzMrz1vz7Z1oOtVR0fk/sZU
	NP9ZfF3yvzakMwjrbcR2Xaw13zB9NByzM/+bxUj2MWso2mDEW6sw0mtYSX1Rr1mSfx7lGDuUocyMf
	fOE0tT5t9HMGTKYy+Ry+hEHi6pyV6wIyAlbrpGyTQA6QafiuAjd8svtMnCTdaAAz7JhY+fdB94ixM
	LRClnwN4VjlGkMURxfCmb9SGHhCpgfIaAEDAGuv5sFgyXQqiQ3jfmxlk76VaZTW4jWyGYaSQ17H+b
	xh8A0PrI4kkT4rm2lKRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTMMp-00B20i-RG; Thu, 23 Sep 2021 10:54:15 +0000
Received: from mail.andi.de1.cc ([2a01:238:4321:8900:456f:ecd6:43e:202c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTMMm-00B1zV-4P
 for linux-arm-kernel@lists.infradead.org; Thu, 23 Sep 2021 10:54:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mA5+4BDnTOddExtuUZSpetH01FEjK2I5iqrBG1DRuY4=; b=EomRy8M8ikbQVvqHHM31purJHv
 2QgzmAnILS9egknTlTlvl3HUdSEDyh2LH048iKg20y7KOG+KkDiDrwAuL3h//1PdlXp8ayhp46Tgm
 fI2J6o/MRhlexAfpTO5Ig9wbJPuA0btTMzc1RRKLduVKc+fOYIU338bxJEr2JzvAwq/I=;
Received: from p200300ccff12c8001a3da2fffebfd33a.dip0.t-ipconnect.de
 ([2003:cc:ff12:c800:1a3d:a2ff:febf:d33a] helo=aktux)
 by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <andreas@kemnade.info>)
 id 1mTMMf-0001ke-6C; Thu, 23 Sep 2021 12:54:05 +0200
Date: Thu, 23 Sep 2021 12:54:04 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, Arnd Bergmann <arnd@arndb.de>, Olof Johansson
 <olof@lixom.net>, soc@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, leoyang.li@nxp.com, devicetree@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/4] ARM: dts: imx: add devicetree for Kobo Libra H2O
Message-ID: <20210923125404.0b367fb2@aktux>
In-Reply-To: <CAJKOXPeRBCXBAgaFTtuEFZV=HfcATSFRhGtgJxoSBfFU=Y8g5Q@mail.gmail.com>
References: <20210918141627.2142457-1-andreas@kemnade.info>
 <20210918141627.2142457-4-andreas@kemnade.info>
 <CAJKOXPfQrfOm=LWh97tq6q16v6aGXazksYF+kYxj5ghd0x7LUg@mail.gmail.com>
 <20210922223847.5efe6471@aktux>
 <CAJKOXPeRBCXBAgaFTtuEFZV=HfcATSFRhGtgJxoSBfFU=Y8g5Q@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210923_035412_404915_146DAD96 
X-CRM114-Status: GOOD (  21.56  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210923105404.VUxa54fxTplnyFs04Np41wWjcI-0QUVR9VbwLpBz-h0@z>

Hi,

On Thu, 23 Sep 2021 08:26:58 +0200
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On Wed, 22 Sept 2021 at 22:38, Andreas Kemnade <andreas@kemnade.info> wrote:
> >
> > Hi,
> >
> > On Wed, 22 Sep 2021 09:41:39 +0200
> > Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > [...]  
> > > > +       pinctrl_usdhc1_100mhz: usdhc1grp_100mhz {  
> > >
> > > Thanks for the patch.
> > >
> > > This does not look like passing the schema validation. Please run
> > > dtbs_check. The node names should use hyphens and end with "grp"
> > > suffix. This remark applies to other cases below.
> > >  
> > dtbs_check reports a lot of errors originating from imx6sll.dtsi and
> > friends. But nothing added by me. But yes, node names should use
> > hyphens, that is documented. I will fix that.
> >
> > But having -grp at the end for these things with a frequency in the
> > name is uncommon.
> > $ grep -R :.*100mhz arch/arm/boot/dts/imx6s*.dts
> > arch/arm/boot/dts/imx6sl-evk.dts:               pinctrl_usdhc1_100mhz: usdhc1grp100mhz {
> > arch/arm/boot/dts/imx6sl-evk.dts:               pinctrl_usdhc2_100mhz: usdhc2grp100mhz {
> > arch/arm/boot/dts/imx6sl-evk.dts:               pinctrl_usdhc3_100mhz: usdhc3grp100mhz {
> > arch/arm/boot/dts/imx6sll-evk.dts:      pinctrl_usdhc1_100mhz: usdhc1grp_100mhz {
> > arch/arm/boot/dts/imx6sll-evk.dts:      pinctrl_usdhc3_100mhz: usdhc3grp_100mhz {
> > arch/arm/boot/dts/imx6sll-kobo-clarahd.dts:     pinctrl_usdhc2_100mhz: usdhc2grp-100mhz {
> > arch/arm/boot/dts/imx6sll-kobo-clarahd.dts:     pinctrl_usdhc3_100mhz: usdhc3grp-100mhz {
> > arch/arm/boot/dts/imx6sll-kobo-librah2o.dts:    pinctrl_usdhc1_100mhz: usdhc1grp-100mhz {
> > arch/arm/boot/dts/imx6sll-kobo-librah2o.dts:    pinctrl_usdhc3_100mhz: usdhc3grp_100mhz {
> > arch/arm/boot/dts/imx6sl-tolino-shine2hd.dts:   pinctrl_usdhc2_100mhz: usdhc2grp-100mhz {
> > arch/arm/boot/dts/imx6sl-tolino-shine2hd.dts:   pinctrl_usdhc3_100mhz: usdhc3grp-100mhz {
> > arch/arm/boot/dts/imx6sl-tolino-shine3.dts:     pinctrl_usdhc2_100mhz: usdhc2grp-100mhz {
> > arch/arm/boot/dts/imx6sl-tolino-shine3.dts:     pinctrl_usdhc3_100mhz: usdhc3grp-100mhz {
> > arch/arm/boot/dts/imx6sl-tolino-vision5.dts:    pinctrl_usdhc1_100mhz: usdhc1grp-100mhz {
> > arch/arm/boot/dts/imx6sl-tolino-vision5.dts:    pinctrl_usdhc3_100mhz: usdhc3grp-100mhz {
> > arch/arm/boot/dts/imx6sl-warp.dts:              pinctrl_usdhc2_100mhz: usdhc2grp100mhz {
> > arch/arm/boot/dts/imx6sl-warp.dts:              pinctrl_usdhc3_100mhz: usdhc3grp100mhz {
> > arch/arm/boot/dts/imx6sx-nitrogen6sx.dts:       pinctrl_usdhc4_100mhz: usdhc4-100mhzgrp {
> > arch/arm/boot/dts/imx6sx-sabreauto.dts: pinctrl_usdhc3_100mhz: usdhc3grp-100mhz {
> > arch/arm/boot/dts/imx6sx-softing-vining-2000.dts:       pinctrl_usdhc2_100mhz: usdhc2grp-100mhz {
> > arch/arm/boot/dts/imx6sx-softing-vining-2000.dts:       pinctrl_usdhc4_100mhz: usdhc4-100mhz {  
> 
> I was fixing primarily arm64 boards and did not touch that many of armv7:
> grep -R :.*100mhz.*grp arch/arm64/boot/dts/freescale/* | wc -l
> 46
>
I will send a v2 with the 100mhz style used there. I will not clean up
dtbs_check issues originating from imx6sl[l].dtsi in this series. That
would be an issue for a separate series. 

Regards,
Andreas


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
