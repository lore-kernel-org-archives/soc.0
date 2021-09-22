Return-Path: <SRS0=I0Tm=OM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A7D0C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Sep 2021 20:41:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6422E60F12
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Sep 2021 20:41:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6422E60F12
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kemnade.info
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Srh1wGbWdER1/gJNVNz+3rxYF6ro25N0ZvxQCfuzOvY=; b=mUAtpwIJ2aQFF9
	2Pq5Js9UIC9CEiGDeB9nPQ8iJOFcrkzVcaiYQjDm7B3uY11rI2el0kYqSeRFdLBrprtWGb0pvOQPw
	TIXotFqGMs+gmZcT7hHsGu2WLhwb5GanHyo1Ennobjx16SK1KWEUptj24OKDKGHGhTwCPyzYNkmJ5
	LZbVTOEB7sFK5pXZk/aLzKU64+Ykz6BznAiXANSGGmecNlup1uSFgEWjTDFVhR4MYv2Hl1alQl8AR
	VgX46xSR5ql9cu1FvPuI5d0y8hb7ix8suisXXSBE4uZlVwOK1SJRN81eHrzf7JpZshO79XIj1fqax
	vZg0aMFIVJY6aJP6PZ0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mT91E-009c2j-GB; Wed, 22 Sep 2021 20:39:04 +0000
Received: from mail.andi.de1.cc ([2a01:238:4321:8900:456f:ecd6:43e:202c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mT91A-009c1d-9d
 for linux-arm-kernel@lists.infradead.org; Wed, 22 Sep 2021 20:39:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UQKAs/9Wxgf8laYkEBMV0uzzzqr3J/31XrLtdGMgrN8=; b=ht3ibw9/CW8Odjx16lI2hnT2m+
 KmCjntMm65yhqJnP9wrMRpPBJcRTbUQUM0VGm+WxCXGVX44ERdoffFzkWd12yeb2TDKGgibo0QGaS
 j20nV14JkKvPbHAUQ8KHLxkHeUaHcBK5khhr7FRGh/kctohYT6qB6o+Xy0zOG+6hrrms=;
Received: from p200300ccff0c98001a3da2fffebfd33a.dip0.t-ipconnect.de
 ([2003:cc:ff0c:9800:1a3d:a2ff:febf:d33a] helo=aktux)
 by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <andreas@kemnade.info>)
 id 1mT90y-0007Yz-Af; Wed, 22 Sep 2021 22:38:48 +0200
Date: Wed, 22 Sep 2021 22:38:47 +0200
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
Message-ID: <20210922223847.5efe6471@aktux>
In-Reply-To: <CAJKOXPfQrfOm=LWh97tq6q16v6aGXazksYF+kYxj5ghd0x7LUg@mail.gmail.com>
References: <20210918141627.2142457-1-andreas@kemnade.info>
 <20210918141627.2142457-4-andreas@kemnade.info>
 <CAJKOXPfQrfOm=LWh97tq6q16v6aGXazksYF+kYxj5ghd0x7LUg@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210922_133900_550764_B33AD30E 
X-CRM114-Status: GOOD (  12.21  )
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
Message-ID: <20210922203847.egQB4TpPrFT_qwfFNvQPB_UZbbM43GHjvVSjwh96xg4@z>

Hi,

On Wed, 22 Sep 2021 09:41:39 +0200
Krzysztof Kozlowski <krzk@kernel.org> wrote:

[...]
> > +       pinctrl_usdhc1_100mhz: usdhc1grp_100mhz {  
> 
> Thanks for the patch.
> 
> This does not look like passing the schema validation. Please run
> dtbs_check. The node names should use hyphens and end with "grp"
> suffix. This remark applies to other cases below.
> 
dtbs_check reports a lot of errors originating from imx6sll.dtsi and
friends. But nothing added by me. But yes, node names should use
hyphens, that is documented. I will fix that.

But having -grp at the end for these things with a frequency in the
name is uncommon.
$ grep -R :.*100mhz arch/arm/boot/dts/imx6s*.dts
arch/arm/boot/dts/imx6sl-evk.dts:		pinctrl_usdhc1_100mhz: usdhc1grp100mhz {
arch/arm/boot/dts/imx6sl-evk.dts:		pinctrl_usdhc2_100mhz: usdhc2grp100mhz {
arch/arm/boot/dts/imx6sl-evk.dts:		pinctrl_usdhc3_100mhz: usdhc3grp100mhz {
arch/arm/boot/dts/imx6sll-evk.dts:	pinctrl_usdhc1_100mhz: usdhc1grp_100mhz {
arch/arm/boot/dts/imx6sll-evk.dts:	pinctrl_usdhc3_100mhz: usdhc3grp_100mhz {
arch/arm/boot/dts/imx6sll-kobo-clarahd.dts:	pinctrl_usdhc2_100mhz: usdhc2grp-100mhz {
arch/arm/boot/dts/imx6sll-kobo-clarahd.dts:	pinctrl_usdhc3_100mhz: usdhc3grp-100mhz {
arch/arm/boot/dts/imx6sll-kobo-librah2o.dts:	pinctrl_usdhc1_100mhz: usdhc1grp-100mhz {
arch/arm/boot/dts/imx6sll-kobo-librah2o.dts:	pinctrl_usdhc3_100mhz: usdhc3grp_100mhz {
arch/arm/boot/dts/imx6sl-tolino-shine2hd.dts:	pinctrl_usdhc2_100mhz: usdhc2grp-100mhz {
arch/arm/boot/dts/imx6sl-tolino-shine2hd.dts:	pinctrl_usdhc3_100mhz: usdhc3grp-100mhz {
arch/arm/boot/dts/imx6sl-tolino-shine3.dts:	pinctrl_usdhc2_100mhz: usdhc2grp-100mhz {
arch/arm/boot/dts/imx6sl-tolino-shine3.dts:	pinctrl_usdhc3_100mhz: usdhc3grp-100mhz {
arch/arm/boot/dts/imx6sl-tolino-vision5.dts:	pinctrl_usdhc1_100mhz: usdhc1grp-100mhz {
arch/arm/boot/dts/imx6sl-tolino-vision5.dts:	pinctrl_usdhc3_100mhz: usdhc3grp-100mhz {
arch/arm/boot/dts/imx6sl-warp.dts:		pinctrl_usdhc2_100mhz: usdhc2grp100mhz {
arch/arm/boot/dts/imx6sl-warp.dts:		pinctrl_usdhc3_100mhz: usdhc3grp100mhz {
arch/arm/boot/dts/imx6sx-nitrogen6sx.dts:	pinctrl_usdhc4_100mhz: usdhc4-100mhzgrp {
arch/arm/boot/dts/imx6sx-sabreauto.dts:	pinctrl_usdhc3_100mhz: usdhc3grp-100mhz {
arch/arm/boot/dts/imx6sx-softing-vining-2000.dts:	pinctrl_usdhc2_100mhz: usdhc2grp-100mhz {
arch/arm/boot/dts/imx6sx-softing-vining-2000.dts:	pinctrl_usdhc4_100mhz: usdhc4-100mhz {

Regards,
Andreas


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
