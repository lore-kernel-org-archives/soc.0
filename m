Return-Path: <SRS0=WZ3G=ON=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ED5FC433EF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Sep 2021 06:29:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 407E861107
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Sep 2021 06:29:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 407E861107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+r2aPI52ZenkfTcQToMnhVOZjpeOrwdyT6vZ+h59Gqg=; b=D8sCAzlRhAl2j8
	ixkIejTUKpKpQHl8dpSKwD5XXdnV47xLKI5yQFzel9biXvXHdfxmHWujOqlKya1fkIeJvKK4f2qxy
	l2jDBHAhwzCcPEw9wS3gWK+Trn3IdkB2ID17B+tc7asMtgMDDWPtIhZH+SYp9xA7IDknPDLaSO8w5
	Zvy86fEK/QYxpwT8/elWIniJtLex3j7GCuNH67wwx1mBkkNVMNrr5hdOXQta6MFRoJf1wFVAOU1LZ
	W7qOX1rdjB9aMuZS/KwLoYstNHJxV+D2CI7kGBgWOLxyFgBtWg6Vy/qUVc+UudDb+YIbn//pXsmLy
	ouF3lF60WYDC6P0asGbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTICP-00AN03-VE; Thu, 23 Sep 2021 06:27:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTICM-00AMzf-Nt
 for linux-arm-kernel@lists.infradead.org; Thu, 23 Sep 2021 06:27:12 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 693EA611B0
 for <linux-arm-kernel@lists.infradead.org>;
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
Received: by mail-pj1-f52.google.com with SMTP id me1so3733957pjb.4
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 22 Sep 2021 23:27:10 -0700 (PDT)
X-Gm-Message-State: AOAM532lM+wbybF2VpCx/Kh7T7nwr9t8MkrArtNVe4MLmc04fHOyE0kB
 F8cNeJkOd48p7VM7GM6El6zUXrOAIt57lV7xp8g=
X-Google-Smtp-Source: ABdhPJxPjIY1IiltM2HJyXSdK2snIiro8qmUrafzSlpj8z8updmBLe6lGgxdwHepyDJ/12YGD5N+SzBXwVytCFPpiMs=
X-Received: by 2002:a17:90a:c982:: with SMTP id
 w2mr3508798pjt.30.1632378430081; 
 Wed, 22 Sep 2021 23:27:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210918141627.2142457-1-andreas@kemnade.info>
 <20210918141627.2142457-4-andreas@kemnade.info>
 <CAJKOXPfQrfOm=LWh97tq6q16v6aGXazksYF+kYxj5ghd0x7LUg@mail.gmail.com>
 <20210922223847.5efe6471@aktux>
In-Reply-To: <20210922223847.5efe6471@aktux>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 23 Sep 2021 08:26:58 +0200
X-Gmail-Original-Message-ID: <CAJKOXPeRBCXBAgaFTtuEFZV=HfcATSFRhGtgJxoSBfFU=Y8g5Q@mail.gmail.com>
Message-ID: <CAJKOXPeRBCXBAgaFTtuEFZV=HfcATSFRhGtgJxoSBfFU=Y8g5Q@mail.gmail.com>
Subject: Re: [PATCH 3/4] ARM: dts: imx: add devicetree for Kobo Libra H2O
To: Andreas Kemnade <andreas@kemnade.info>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, linux-imx@nxp.com, leoyang.li@nxp.com, 
 devicetree@vger.kernel.org, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210922_232710_852407_2371C7D4 
X-CRM114-Status: GOOD (  17.77  )
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
Message-ID: <20210923062658.SlEo2V-N9RqlAgB93t2KNDbmoeJT21FcVuPBei2da34@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
