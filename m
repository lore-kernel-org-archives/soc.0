Return-Path: <SRS0=3stN=KP=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E95FFC433B4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 May 2021 13:05:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 789E2610A8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 May 2021 13:05:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 789E2610A8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sbd5W2pgboJDtDmODr5zbxAAS305mGjvSJaIY1p3Vco=; b=AyM4m5jJxl1i570rALrT820cGd
	v/oTy/XvjmcZPmGwTdeaTlMGNSiCPnLElggrob+rWWfwsYicpMA8s32DIKR+QgEXfGeYIMyyCPfwh
	LNire8xnrKJdei4erEzRkH/3nUac8GroZ/JC6f3DmdXufhng20s/H3CTBNr3ndTyXl2c1EN0HtJQX
	uKEyoDiieqGH6GoDwSP3AIwUchI/59k7qOg0Q6ixX+RS3DhtsJmHwoz2u/7UgxJ3TCDn4oo8GPv9Q
	KSJ+3EMSIiM8AmnsBDeMomm0gfcQpcGbdiy1cHjs+Ki2VrKdl4SJzmuVa/lRkpLSgfc5lCw9IBJ4P
	96Ml5M+g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljiKa-00164C-HO; Thu, 20 May 2021 13:03:16 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljiKO-00160O-2Q
 for linux-arm-kernel@desiato.infradead.org; Thu, 20 May 2021 13:03:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=RujbwDaYHFW5IRTsBmUkuqcLlODQklcnrNzBpulfars=; b=gOlp43pF+jbKBs6vl3gudIlZJE
 Yb7OseQqgbqDfzYqoH5euhFVDI9+dOci4d3IIfIGM9CV7rUKfil7YHsgk5qDmzQ5RyhEwcU89YeQj
 nZ4skYnD/gPHfSDu4ekgZS/C9Oxe/nDdVWlHd+i3NV3zGvvzndnbij379ZXaluxV9T5Wodm6m7zvV
 UESC8JelvICjXrag6HilckscXi7cy7hclyJ09QsEPLXVIXitayPsCobj99cRBjToK22qSwkgJ9T0u
 Poxd/6rs0abUG2l28tSwN75Co+8EVzQcYk5ipOmJHR3TZkZjUMX+aTJMH4pM5qcYqsAK34mPJ/7lr
 KitwBuCQ==;
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljiKK-00GLuW-JW
 for linux-arm-kernel@lists.infradead.org; Thu, 20 May 2021 13:03:02 +0000
Received: by mail-wr1-x432.google.com with SMTP id q5so17590245wrs.4
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 20 May 2021 06:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=RujbwDaYHFW5IRTsBmUkuqcLlODQklcnrNzBpulfars=;
 b=Hez+1QvK3f6pRKDh5FTV2p7JSR2zoExN4Cl3/Dx2cllg9rc5e79U3aAIccTzfU8ZRu
 2c+QRasDl48g2C4Q2+oMxxYXmZOZ+RiBi0DqdUrpHYIXR3ZNaAszYihACj3KRGupUaAk
 /YgdpPOB8KeLk/rd9SqzBZtTgtVGXz7sI/k8Ucwoh0at5mSCzTp1gwYLYDj4vXkVzSp1
 rZoDsrHEB97HWq7fFGd/JZN1L3Vidu9aKKWsutkCux7LfQbcNw5UwUqo6G6yXwVvffMW
 zqzhkTFwuEvlsGPTPO5LJCAvl/qle/ZcsnPyuYYOY6UaGi+C7Hi9zdZMDRih2surH53f
 ypjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=RujbwDaYHFW5IRTsBmUkuqcLlODQklcnrNzBpulfars=;
 b=GPxLiuQMvv8f8jW/6UmOjGx/sXWlfB4zr5y3PVqZxZ+IDSuQ2HVRZ8aHx07vwTG6ek
 hUiTILJ6kzeWsYAP+5vnc7BIjXFW3L114FllxGnGosgJYC0o5YFKD9jrZ75Ghq0VXx8i
 rbeQkF1kcfdyfQ70MlGLmYnPmQVe7oUhAUbONx3hGpKTJH7tgtJBAvnrysrY32Z11FgQ
 yFGqp2k0SUPDhg4XZHEyfqwVSFUMt+JcVgrjOUP2m8Dcupm/qW5Mhhpm8EquYWB45Aqp
 q3G0UVsPZ3porbaSGt2Gbg0IK2U99GZ6EYaEuodAFNkixCVmk+4XL3TFLxGjGF5T7I2n
 Ngsg==
X-Gm-Message-State: AOAM532ajS86VCaldK/JbN5aTwVM/4J1s8WbSstblts+phr0OfbCJruM
 KQw24GF8ILlt8lxtd6wfcTBqIg==
X-Google-Smtp-Source: ABdhPJzX3bmOQ9LWAQDKQedPbmuDcmKqA23EagI44Yp+34fGVp8IMK0lCgDStoMI83fJxNiQ6DdA1A==
X-Received: by 2002:adf:f10c:: with SMTP id r12mr4281511wro.26.1621515778718; 
 Thu, 20 May 2021 06:02:58 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
 by smtp.googlemail.com with ESMTPSA id o21sm2949976wrf.91.2021.05.20.06.02.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 06:02:57 -0700 (PDT)
Date: Thu, 20 May 2021 15:02:55 +0200
From: LABBE Corentin <clabbe@baylibre.com>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 Rob Herring <robh+dt@kernel.org>, SoC Team <soc@kernel.org>,
 Hans Ulli Kroll <ulli.kroll@googlemail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/5] ARM: gemini: add device tree for edimax NS2502
Message-ID: <YKZd/+zHlKwag2bs@Red>
References: <20210517193205.691147-1-clabbe@baylibre.com>
 <20210517193205.691147-5-clabbe@baylibre.com>
 <CACRpkdY3c4uvo1zbEgNW0meF-4P8be_nmoOEQAHP5V+GXgoG=A@mail.gmail.com>
 <YKOO8UxdmZBjYbt4@Red>
 <CACRpkdYqaoggyBO9=fdi2iUh9O0Y_jT5jnc7+qbE9HzEWK57Sg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdYqaoggyBO9=fdi2iUh9O0Y_jT5jnc7+qbE9HzEWK57Sg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_060300_667463_B70317E8 
X-CRM114-Status: GOOD (  19.28  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210520130255.oBoLYHPp7j_kWclsBvRBZ3XatHTJ5_tSViW_L_qCO8Q@z>

Le Wed, May 19, 2021 at 01:17:59AM +0200, Linus Walleij a =E9crit :
> On Tue, May 18, 2021 at 11:55 AM LABBE Corentin <clabbe@baylibre.com> wro=
te:
> > Le Tue, May 18, 2021 at 01:46:20AM +0200, Linus Walleij a =E9crit :
> =

> > > Is the FIS broken since you hardcode the partitions?
> > >
> > > Doesn't this work:
> > >
> > > partitions {
> > >     compatible =3D "redboot-fis";
> > >     /* Eraseblock at 0x7e0000 */
> > >     fis-index-block =3D <0xfc>;
> > > };
> > >
> > > (Needs CONFIG_MTD_REDBOOT_PARTS)
> >
> > No it does not.
> >
> > physmap-flash 30000000.flash: no enabled pin control state
> > physmap-flash 30000000.flash: no disabled pin control state
> > physmap-flash 30000000.flash: initialized Gemini-specific physmap contr=
ol
> > physmap-flash 30000000.flash: physmap platform flash device: [mem 0x300=
00000-0x331fffff]
> > 30000000.flash: Found 1 x16 devices at 0x0 in 16-bit bank. Manufacturer=
 ID 0x000001 Chip ID 0x002201
> > number of CFI chips: 1
> > Searching for RedBoot partition table in 30000000.flash at offset 0x1fe=
0000
> > No RedBoot partition table detected in 30000000.flash
> > Searching for RedBoot partition table in 30000000.flash at offset 0x1fe=
0000
> > No RedBoot partition table detected in 30000000.flash
> =

> Hm since it searches at 0x1fe0000 that's where it thinks the last
> eraseblock is so the erase blocks are 0x20000 (128KB).
> =

> FIS at 0x7e0000 should be erase block
> 0x7e0000/0x20000 =3D 0x3f
> =

> Can you test fis-index-block =3D <0x3f> and see what happens?
> =


With 0x7F it works.

When testing, I found that fis-index-block was ignored. I just sent a patch=
 fixing this.

Regards

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
