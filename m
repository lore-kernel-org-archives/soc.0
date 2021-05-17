Return-Path: <SRS0=iJAY=KM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 908EFC433ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 May 2021 23:48:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CA9C60FD7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 May 2021 23:48:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CA9C60FD7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9XHoW01R2+wvhGDXlNnAsiY2fJVpemzkyr0fkBfcW/o=; b=Ag2ZBssRACPw3Le0DSluuuTdO
	pgPtmGmb1Q7W+mmzFlRISiWlAYT+LkSC+PZXq25Zr9+fcHAXDT/7RfRZSI2ETvkB2duZfX8TAeQaB
	xYp0AFqdpW62wmyDSYy+a1A+4J4HUYWKvNjg0G4CJwgXRxq0xSz1sYTPZmC8Nk3SJVDFO5p5pl2Iy
	O8S1WpFb4wcmIh5h1HvRTi9trfF7useFRmVNWlB0uxb3WqmU8NQeUAyVVaYUZ66q0wnWBEtcKKhoI
	SZaC+sBTH8ZRIlv1ADG3jzjjifjVCPh9eo5iGYI4/VE2kFvO8fV6SH5kmypBBduqEBHpVOlqXXxUz
	q/zBzPN6w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1limwa-00GR4s-Qx; Mon, 17 May 2021 23:46:40 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1limwX-00GR4Z-0o
 for linux-arm-kernel@desiato.infradead.org; Mon, 17 May 2021 23:46:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=bVEEpIXI/Y5CtVnRyxBQ3wjVOQ3Vlf0v5827celIsKo=; b=gQwpbQgqYCw6UkBvj1A8InizUW
 A8bDR3+UyIFprQiSSyQt2LQzx7VhfMy04o2GqDMfXlvpetiTUlAI2SJpaE3pbwfbRG75ZkCSm403Z
 Ag1+ol/7mTNlKWBx1nYi3xe7oys9ZdS7RxttGWAfgo3crSaSfDzw1KwUUf85h53ZFaF/m/Aa80JNZ
 o2N1rGlF8mQhqqGs/aPDIE4pnJgzFBvvMiu8lHn3gUvUS/8eW9A1lb4r5bFXwJykQLfq7FdVyNHqi
 FSvb8BOhz9DqePaAHkdPKiz3m6ci+6DHF+zqBxGMIlfbm40GdKvgV81Q8EdMyS0grGiMIR94/5ZfM
 PFqjTthA==;
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1limwU-00EDNX-7W
 for linux-arm-kernel@lists.infradead.org; Mon, 17 May 2021 23:46:35 +0000
Received: by mail-lj1-x22a.google.com with SMTP id e11so9287553ljn.13
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 17 May 2021 16:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bVEEpIXI/Y5CtVnRyxBQ3wjVOQ3Vlf0v5827celIsKo=;
 b=nMBqhSpQSNGHZUcZtE4vR9rjwvtGJDraTV1gmLxW1M85AMzZj0UzVm74oTMMebnUXQ
 WUBsl1vtJj18d0zmOJ/Ho4JD+GGT/lxzvAgQM3kQLTTz7THuWCxwFpSINd+DoeUIATeE
 lDNarF+k4qT0/7akXNOMqzx4n8ZM0zvQcuV5vwpUPzIcTtX2PgJZpHhermsa/S5P/wH3
 GiM4XuG5hqEo/bN9easQvihiBQ4ax8Nxh1K6JcWyJ01fE8YTj1yW1GnYxAx7EeB4ogfa
 zgfKczId40OPPuzodgNZt66+dl1nVRCGQuj6m69KMDcKLhgejMwCl+gTOL9cWO4YBriN
 /emg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bVEEpIXI/Y5CtVnRyxBQ3wjVOQ3Vlf0v5827celIsKo=;
 b=Iu4Cu+1DM42GjIbYrmHl2qcQW2w3ZYHQHGMxGfqa3T2CXG01kIxEbEoXV67U63Rl30
 +x5HTFFYnijay7fVTA5W4aXK1D7QOLcXvVrw/BiCct9jBUk7Wo9WxOiD+zl1Ytf+swkT
 dS4og2eBP0SG6SLIGb+aeHVXrr1A4TsemrgpkCUE050R57C8WusBB3KVVjw3SmdwiX4g
 VMOZ39xGkziQBTLkgEnBgprUIyPSHrqx5D3NeOtbj5zo4p/Ml+x05L8B/vjZPFtPbGgO
 WRTIz36shXROUaZdYWzm1AZljDg9BRX4Bmn+1Te0A6hF1uNuV3RjO/UwERJpnoTb0rfW
 CHMg==
X-Gm-Message-State: AOAM532T95PaLLLvjoFJ4k0hrb/cPKJaWKDxmTXovkm9t6m73aRzmgnk
 SnMZQ/ZMa8yydkO3gE4Pb98S3CdP/EEAMiriGfJXjw==
X-Google-Smtp-Source: ABdhPJzt0OHOWOBh2f/7ip9SW9OpdwvzwD16NBHIqmNMbaI9JWSwPO/iXIy/XDXuqsOkAcaOFtHYons8j7cCqxQgO1Y=
X-Received: by 2002:a2e:90c7:: with SMTP id o7mr1613773ljg.368.1621295192148; 
 Mon, 17 May 2021 16:46:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210517193205.691147-1-clabbe@baylibre.com>
 <20210517193205.691147-5-clabbe@baylibre.com>
In-Reply-To: <20210517193205.691147-5-clabbe@baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 May 2021 01:46:20 +0200
Message-ID: <CACRpkdY3c4uvo1zbEgNW0meF-4P8be_nmoOEQAHP5V+GXgoG=A@mail.gmail.com>
Subject: Re: [PATCH 4/5] ARM: gemini: add device tree for edimax NS2502
To: Corentin Labbe <clabbe@baylibre.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 Rob Herring <robh+dt@kernel.org>, 
 SoC Team <soc@kernel.org>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_164634_349984_61E58315 
X-CRM114-Status: GOOD (  13.08  )
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
Message-ID: <20210517234620.9ZuvYDIevWxvf9XuRsxed7UKGdzPBU8FtNUnXPBuKgs@z>

Hi Corentin,

this is looking nice! Just one thing:

On Mon, May 17, 2021 at 9:32 PM Corentin Labbe <clabbe@baylibre.com> wrote:

> The edimax NS2502 is a NAS box running a SL3516 SoC.
>
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>

> +&flash {
> +       status = "okay";
> +       /* 8MB of flash */
> +       reg = <0x30000000 0x00800000>;

No pin control setting? I guess it may work but this doesn't hurt
(I think):

    pinctrl-names = "enabled", "disabled";
    pinctrl-0 = <&pflash_default_pins>;
    pinctrl-1 = <&pflash_disabled_pins>;

> +       partitions {
> +               compatible = "fixed-partitions";
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +
> +               partition@0 {
> +                       label = "RedBoot";
> +                       reg = <0x00000000 0x00020000>;
> +                       read-only;
> +               };
> +               partition@20000 {
> +                       label = "kernel";
> +                       reg = <0x00020000 0x00700000>;
> +               };
> +               partition@720000 {
> +                       label = "VCTL";
> +                       reg = <0x00720000 0x00020000>;
> +                       read-only;
> +               };
> +               partition@740000 {
> +                       label = "CurConf";
> +                       reg = <0x00740000 0x000a0000>;
> +                       read-only;
> +               };
> +               partition@7e0000 {
> +                       label = "FIS";
> +                       reg = <0x007e0000 0x00010000>;
> +                       read-only;
> +               };
> +       };
> +};

Is the FIS broken since you hardcode the partitions?

Doesn't this work:

partitions {
    compatible = "redboot-fis";
    /* Eraseblock at 0x7e0000 */
    fis-index-block = <0xfc>;
};

(Needs CONFIG_MTD_REDBOOT_PARTS)

Yours,
Linus Walleij

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
