Return-Path: <SRS0=EhE/=KN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 250D5C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 May 2021 10:15:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A00DA61185
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 May 2021 10:15:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A00DA61185
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aVfdlU9T+0R6QD8UbtNcI4bn8f70abTuvp9zlSJ2SIs=; b=X7AWriSJfgjm9D/LUdPDW1y8Z
	Qt358qRaRQWMffjrdDrB5njzV9sTDmk4QrME8U07Dw55KCW7rQAcI+q8bzJbT5I8oJ0hd+KJOuH4+
	TC3LC+0U/5Z0UvjUzrJlHVrPWDZ+yrVbovlZZldkghB7HOu59Ko5CT+XaHHbEa6Hw/cjd8eO7tukR
	DtMHobGXkhTeMRZ8SqIFC265dZyCJwQcqMjc0TFwKCRum2kRZ+NmDWdGPThta2w5rA10q/al8rA9c
	BdvuGy7OUSqJ999NMDcC/6eFjCOwFaFxPq5ZgKzMCzvqvOzDZQUDdMD/uEcsOdIPtKJxE9nHM3SkB
	0Rnl5TyIA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1liwij-000J1h-8a; Tue, 18 May 2021 10:13:01 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liwRO-000FMq-Rp
 for linux-arm-kernel@desiato.infradead.org; Tue, 18 May 2021 09:55:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=fginyF3h0uO7FrUs8ObqH5iIkZOGxEkZEk2Vd5hl+Xk=; b=rCNwGD0C1N2j/nYY2RKsKX3aUQ
 2Nz3eJ9u9k+duWXLcDx4wD78GKqGaw6SREbT6Y30FQp3ElTwWejQwZWwTG0cmGZ4UzlPckpMSmGfN
 gZQsuu5QzMG8GjqYa5JRHTbRmusQ/ADT9uJ0ENDkwt/6ztx4AKbZMEMO7HrRSRU4ZYbD0trN2TRD1
 U9wxissMXYcczFrsoKtch8UkeIob8/joMs6C/iR56qcjnxJVgmWQMSp77qrvFzlZuLj4m3f3tnS16
 SdYZlM7jBwAis7yfEBXBL1h/wXNDBEGgdLPOHhyR6RNxSFNOOIc+p6vRiGcUAJ7aAnGRZcq4Og6fO
 vERFU1kQ==;
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liwRL-00EX69-Cz
 for linux-arm-kernel@lists.infradead.org; Tue, 18 May 2021 09:55:05 +0000
Received: by mail-wm1-x32a.google.com with SMTP id
 f75-20020a1c1f4e0000b0290171001e7329so1119755wmf.1
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 18 May 2021 02:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=fginyF3h0uO7FrUs8ObqH5iIkZOGxEkZEk2Vd5hl+Xk=;
 b=Ia0JbupATcQIAZpnsgPyw/IxSOH5RZnB8RmQwq7l+YBDwL8AK1RjU7QgciKS4WEX1Q
 2P9apoj7sgKliK0A87i0x8huLkQzYQ0vFpt9K12LY0ksK7kcj0j9UbEIGHeJZD+XoQ7D
 oOBEk/6BBz9luYtN1SZt0MuXWtGkUPVMkMsCN3I938eK1TgUKy7XRN5vR3zqv7Bpc7ma
 +Qvzu/2WX1/R1VFNB1F+HyodIQS4C2X3n8rxapwRiiyENVNdR6JTVE0cKG/AsV/lW6Y0
 p561NTj8uWYm8ZV7Z5gRA42s8lQAJdBMhMUmckwY/ysUv0URwYM6L13n3swBZ/V0N6uL
 20mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=fginyF3h0uO7FrUs8ObqH5iIkZOGxEkZEk2Vd5hl+Xk=;
 b=MENcEGrHhogwSDqsrFmd5gpLjAzwwOtn9UuVi4L2qwXpJPCdXhxY2jRWanLNGpwVGP
 hyGuvf6c0mgNsats6sanIvuTXyLQvTpvXOkim2ZAN/xD5kgMvc5wpDQJE7c31wFoekur
 9fp1GSNhNf90fyQ5O4ST1lgG5bWfg+kih/d6zg5qPwd8W0fZMQwlRKyV4LeCkcGHulrY
 I/DmE9nxu8PNZ+B47+bdbncMoXVCsSpX8poCIaK/tw+9+10BGSU38RsK96jgDnyfhoKT
 Rbjc0fJyaaTij9Snf/kS6dMyJs+bgwKZPVCgdEGDPlXCHo9nDoWx5rVBRYtyosMtVQav
 ORQA==
X-Gm-Message-State: AOAM533KbFhMjT4YGGWj4PlVS6Lu62BpSOHkyExuo40BpslgCA8n/GfE
 /+o78jign/7NObupY+N7E38CQQ==
X-Google-Smtp-Source: ABdhPJwctiP6iNlOp+0KFqNHTYlHVOzwDJqpjoyzt4CfSSa1ZARgEvW7Zuwr3HxKdXV9J88hqOzC9A==
X-Received: by 2002:a1c:28b:: with SMTP id 133mr4440939wmc.135.1621331701145; 
 Tue, 18 May 2021 02:55:01 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
 by smtp.googlemail.com with ESMTPSA id q3sm18355872wrr.43.2021.05.18.02.54.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 02:55:00 -0700 (PDT)
Date: Tue, 18 May 2021 11:54:57 +0200
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
Message-ID: <YKOO8UxdmZBjYbt4@Red>
References: <20210517193205.691147-1-clabbe@baylibre.com>
 <20210517193205.691147-5-clabbe@baylibre.com>
 <CACRpkdY3c4uvo1zbEgNW0meF-4P8be_nmoOEQAHP5V+GXgoG=A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdY3c4uvo1zbEgNW0meF-4P8be_nmoOEQAHP5V+GXgoG=A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_025503_466681_A88FDCEC 
X-CRM114-Status: GOOD (  18.16  )
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
Message-ID: <20210518095457.ALMJjNgjHiSxOHPyrS2vAkVoV2HfOeIMNfHjYOjx8jw@z>

Le Tue, May 18, 2021 at 01:46:20AM +0200, Linus Walleij a =E9crit :
> Hi Corentin,
> =

> this is looking nice! Just one thing:
> =

> On Mon, May 17, 2021 at 9:32 PM Corentin Labbe <clabbe@baylibre.com> wrot=
e:
> =

> > The edimax NS2502 is a NAS box running a SL3516 SoC.
> >
> > Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> =

> > +&flash {
> > +       status =3D "okay";
> > +       /* 8MB of flash */
> > +       reg =3D <0x30000000 0x00800000>;
> =

> No pin control setting? I guess it may work but this doesn't hurt
> (I think):
> =

>     pinctrl-names =3D "enabled", "disabled";
>     pinctrl-0 =3D <&pflash_default_pins>;
>     pinctrl-1 =3D <&pflash_disabled_pins>;
> =


I have added, without any change in behavour.

> > +       partitions {
> > +               compatible =3D "fixed-partitions";
> > +               #address-cells =3D <1>;
> > +               #size-cells =3D <1>;
> > +
> > +               partition@0 {
> > +                       label =3D "RedBoot";
> > +                       reg =3D <0x00000000 0x00020000>;
> > +                       read-only;
> > +               };
> > +               partition@20000 {
> > +                       label =3D "kernel";
> > +                       reg =3D <0x00020000 0x00700000>;
> > +               };
> > +               partition@720000 {
> > +                       label =3D "VCTL";
> > +                       reg =3D <0x00720000 0x00020000>;
> > +                       read-only;
> > +               };
> > +               partition@740000 {
> > +                       label =3D "CurConf";
> > +                       reg =3D <0x00740000 0x000a0000>;
> > +                       read-only;
> > +               };
> > +               partition@7e0000 {
> > +                       label =3D "FIS";
> > +                       reg =3D <0x007e0000 0x00010000>;
> > +                       read-only;
> > +               };
> > +       };
> > +};
> =

> Is the FIS broken since you hardcode the partitions?
> =

> Doesn't this work:
> =

> partitions {
>     compatible =3D "redboot-fis";
>     /* Eraseblock at 0x7e0000 */
>     fis-index-block =3D <0xfc>;
> };
> =

> (Needs CONFIG_MTD_REDBOOT_PARTS)

No it does not.

physmap-flash 30000000.flash: no enabled pin control state
physmap-flash 30000000.flash: no disabled pin control state
physmap-flash 30000000.flash: initialized Gemini-specific physmap control
physmap-flash 30000000.flash: physmap platform flash device: [mem 0x3000000=
0-0x331fffff]
30000000.flash: Found 1 x16 devices at 0x0 in 16-bit bank. Manufacturer ID =
0x000001 Chip ID 0x002201
number of CFI chips: 1
Searching for RedBoot partition table in 30000000.flash at offset 0x1fe0000
No RedBoot partition table detected in 30000000.flash
Searching for RedBoot partition table in 30000000.flash at offset 0x1fe0000
No RedBoot partition table detected in 30000000.flash


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
