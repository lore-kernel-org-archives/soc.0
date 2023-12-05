Return-Path: <SRS0=qhPc=HQ=linaro.org=andre.draszik@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE8DC4167B
	for <soc@archiver.kernel.org>; Tue,  5 Dec 2023 08:09:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 33E93C433C7; Tue,  5 Dec 2023 08:09:35 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3A35BC433CC
	for <soc@kernel.org>; Tue,  5 Dec 2023 08:09:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3A35BC433CC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40c09ba723eso24750525e9.2
        for <soc@kernel.org>; Tue, 05 Dec 2023 00:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701763770; x=1702368570; darn=kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=llS7f6J05UN7P4lvcEDyZPRcCQQD6OrCb5vmd5KnD6k=;
        b=KyGCD9JSJz0d/93Ng3kGbz65nDUDDRI5JT4JRAZICm+1ubg8sF68FcSMywnra9wnJ4
         kPEebJTpfMz4EEDImCHuszg8vwBWTA8KpI1EMgcVQGboWWaAvHqxC/rv95IZLfk6E7Z8
         /caNRSoH4wkP7wX8jnciR+48fnfqShSx67ZQPQUEuKGsHFNQsO3rVohfbJG+CE6shPqW
         bMHdRIOQsScn2MgsCSprlVPDbR5RCClp2qQXRC01cPM87w3+ExZ9Y7s0BY3tYoU/QqWO
         50y+zboc6LGKc4HMszP5HSKSOI1Xcsg0Vp85FFcfx+ukjjDlykIQZ5ekEO9XP3oX4EhO
         Nsug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701763770; x=1702368570;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=llS7f6J05UN7P4lvcEDyZPRcCQQD6OrCb5vmd5KnD6k=;
        b=bm/hD7zz/2n02YGgik7plTEyoRXxSjRL2YHRH5eILXsvQxB8JEYza1kB2gxaVp7CLc
         LlhTAzhGR7JIo/ME/oATaTVcWq7ZjJA4d/BZjbuG5SYKE+VGRXUm61PH2YaMz4BWcrcy
         4MiMtjWb0Sk3GuKoNte5bF/spG1p6hdwL2kV3o2gOSNCMwpf1qts39zGirQrbQphtVaK
         vxLP9qr+HEVJDTgGIONRIU64NDYXSpHXkTi+PloJ8NkYeFo9+Y9klhZ2wk2vduTwN3g4
         xOKkslBs8We9jXq1gPtLcw2AyufTf4tdnp9KV1WUFcUVJoTh6lML9HvGEva98ej9pWcQ
         xKgQ==
X-Gm-Message-State: AOJu0YysRxyZKw8LgaxqWK1dD7csb+zjpmKWzA3zuFRK/edWWdPOeYwf
	fx4/u1MA2086c+ojPU+xpRdZnQ==
X-Google-Smtp-Source: AGHT+IE+8qnIaRvP5U4oIVPqun3EKI7fA5pnVF2X2zE0apGVGOOPaI86NDaJpz7xHPp+qNxo2AQwbw==
X-Received: by 2002:a05:600c:2146:b0:40b:63b0:e0b5 with SMTP id v6-20020a05600c214600b0040b63b0e0b5mr195357wml.224.1701763770352;
        Tue, 05 Dec 2023 00:09:30 -0800 (PST)
Received: from [10.1.1.118] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id s8-20020a05600c45c800b00405c7591b09sm17883711wmo.35.2023.12.05.00.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 00:09:29 -0800 (PST)
Message-ID: <860ca122a08bbce70b27d8880c621f0d12ddd2a5.camel@linaro.org>
Subject: Re: [PATCH v5 12/20] clk: samsung: clk-gs101: Add cmu_top, cmu_misc
 and cmu_apm support
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, Peter Griffin
	 <peter.griffin@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
 mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
 tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
 wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
 will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
  jirislaby@kernel.org, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
 tudor.ambarus@linaro.org, saravanak@google.com, willmcvicker@google.com, 
 soc@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org,  linux-gpio@vger.kernel.org,
 linux-watchdog@vger.kernel.org,  kernel-team@android.com,
 linux-serial@vger.kernel.org
Date: Tue, 05 Dec 2023 08:09:28 +0000
In-Reply-To: <CAPLW+4nAwWBHkAe2Wg2b+URsgN8ienPh14L=Fu8PUxf4gxq0ow@mail.gmail.com>
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
	 <20231201160925.3136868-13-peter.griffin@linaro.org>
	 <CAPLW+4nAwWBHkAe2Wg2b+URsgN8ienPh14L=Fu8PUxf4gxq0ow@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.49.2-3 
MIME-Version: 1.0

Hi Sam,

On Fri, 2023-12-01 at 16:40 -0600, Sam Protsenko wrote:
> On Fri, Dec 1, 2023 at 10:11=E2=80=AFAM Peter Griffin <peter.griffin@lina=
ro.org> wrote:
> >=20
> > [...]
> > +#define CLK_CON_GAT_GOUT_BLK_APM_UID_SSMT_G_DBGCORE_IPCLKPORT_ACLK=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x20b8
> > +#define CLK_CON_GAT_GOUT_BLK_APM_UID_SSMT_G_DBGCORE_IPCLKPORT_PCLK=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x20bc
> > +#define CLK_CON_GAT_GOUT_BLK_APM_UID_SS_DBGCORE_IPCLKPORT_SS_DBGCORE_I=
PCLKPORT_HCLK=C2=A0=C2=A0=C2=A0 0x20c0
>=20
> As I understand, all those parts like IPCLKPORT, BLK, UID (RSTNSYNC
> probably too) -- they don't really mean anything in the context of the
> driver, just noise. And if you remove those -- there won't be any
> conflicts with other names, because those bits are not the unique
> parts. Following the TRM letter for letter in this case just makes
> things extremely long without adding any value IMHO. For example, that
> name above might be:
>=20
> =C2=A0=C2=A0=C2=A0 CLK_CON_GAT_GOUT_APM_SS_DBGCORE_SS_DBGCORE_HCLK
>=20
> or even
>=20
> =C2=A0=C2=A0=C2=A0 CLK_CON_GAT_GOUT_APM_SS_DBGCORE_HCLK
>=20
> would be fine.
>=20
> In clk-exynos850 driver I removed all those parts, because they make
> it pretty much impossible to read both the driver and dts. And yeah,
> because those names consequenty lead to very long string names, dts
> will be hard to read too, which is even worse. But again, that's only
> my IMHO.

The advantage of keeping the same name as in the data sheet is that then it=
's easy to
correlate between driver and hardware and future / other hardware.
By arbitrarily diverging from the TRM you make life much harder for yoursel=
f when you
have to look at this again in 12 months time after you've forgotten your na=
me mangling
approach; you also make it harder for everybody to review the driver or to =
use the
driver as a reference in the future for other hardware, as nobody except yo=
u knows
what kind of name-mangling was applied and which register (or clock in this=
 case) is
really meant.


Cheers,
Andre'

