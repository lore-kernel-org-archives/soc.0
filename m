Return-Path: <SRS0=YsK0=7X=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A067AC6FD18
	for <soc@archiver.kernel.org>; Fri, 31 Mar 2023 08:51:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8528EC433A1; Fri, 31 Mar 2023 08:51:34 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 14D22C4339B
	for <soc@kernel.org>; Fri, 31 Mar 2023 08:51:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 14D22C4339B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-5456249756bso402895547b3.5
        for <soc@kernel.org>; Fri, 31 Mar 2023 01:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680252691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cd/ibuQb3vn5g/cRqzfQk5lg+1/+bjO2UJjaxJoegBM=;
        b=LNzF1nUPzml+JIWoLM4lEKblSafQMhII427hBVE2fYE/IMt5PPojSCas5egWKg+KRc
         ygy0xOK7R4RMFkD7vxSF97RyeOmkq6giu97/zXrN5oKidigfgjHuuAX1t0IMgLo4oZBX
         edyYaG7ch29g3YuQziHv5Jft/d/9abqbc5SVvOGiFX9RiIq31R+jCgvgX/wevIDuGtDP
         lVYFMvg52OandlxR7J/XbiWCqOgv9i0qUzdZ50A6ItgiyqRbKtSt7NsOXjKBZco8abZe
         r8h5pQWUotUJdENoR3OCLdyJleXrOQqAExqWGqNIo/gAEedNYR8Bys3HYgJETvQ50stz
         vW4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680252691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cd/ibuQb3vn5g/cRqzfQk5lg+1/+bjO2UJjaxJoegBM=;
        b=IqhyYKp5GTnDLZjMrStLRj0PjO8TIPpJc95OinjCg4fveCNth0MTV+Zsd68F0CDLC3
         1Xftuvlw/q3ay0XN1cL39BSCLjrKHtr+NTNvOrrIKaob9txiTQNB+YEtFncIGsbNYPmR
         KNS7XEewyAZcDrXz9t2kGNzdine9efcEOfrm/iRYCHvkKJuYWzclIAie+dongwoxdGWD
         mlfWFG3+mUHbWa2/sC7Hmh2K4Jyefmig5qUL2ICyjr4q+5QrL1tjpKcXgwijc86Uw5Y5
         McDhhAZ61URfLJ/e5Lh/0xvFyrxbPSEHcelxZ9If/P5VmCtKhx4JT6yOSGFXzjuLoV3n
         86bw==
X-Gm-Message-State: AAQBX9e+E4RaJ6O9GEVWdz05S6UsuaxnahK51+NbcND5s+5bUKMOxWFx
	zBXOQxJT1CscKTkxQscWAcxdKCgpe5OKBVGV5c85uQ==
X-Google-Smtp-Source: AKy350a6johu/GITQvnR+QBZGVCy3Nh12i/zifBxULJFlWKoDA9ufP4RPovIeYwuYMYc7B3Q1GKWJeXUD/WzDxFgGl8=
X-Received: by 2002:a81:9993:0:b0:544:bbd2:74be with SMTP id
 q141-20020a819993000000b00544bbd274bemr5121733ywg.4.1680252691054; Fri, 31
 Mar 2023 01:51:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230331-topic-oxnas-upstream-remove-v1-0-5bd58fd1dd1f@linaro.org>
In-Reply-To: <20230331-topic-oxnas-upstream-remove-v1-0-5bd58fd1dd1f@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 31 Mar 2023 10:51:19 +0200
Message-ID: <CACRpkdY4GAzE5DbE4yOZ8sFspZoJWWZk+DYTHsKRmm1bpX7WGQ@mail.gmail.com>
Subject: Re: [PATCH RFC 00/20] ARM: oxnas support removal
To: Neil Armstrong <neil.armstrong@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, soc@kernel.org, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Sebastian Reichel <sre@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Marc Zyngier <maz@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-mtd@lists.infradead.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-gpio@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 31, 2023 at 10:34=E2=80=AFAM Neil Armstrong
<neil.armstrong@linaro.org> wrote:

> With [1] removing MPCore SMP support, this makes the OX820 barely usable,
> associated with a clear lack of maintainance, development and migration t=
o
> dt-schema it's clear that Linux support for OX810 and OX820 should be rem=
oved.
>
> In addition, the OX810 hasn't been booted for years and isn't even presen=
t
> in an ARM config file.
>
> For the OX820, lack of USB and SATA support makes the platform not usable
> in the current Linux support and relies on off-tree drivers hacked from t=
he
> vendor (defunct for years) sources.
>
> The last users are in the OpenWRT distribution, and today's removal means
> support will still be in stable 6.1 LTS kernel until end of 2026.
>
> If someone wants to take over the development even with lack of SMP, I'll
> be happy to hand off maintainance.
>
> The plan is to apply the first 4 patches first, then the drivers
> followed by bindings. Finally the MAINTAINANCE entry can be removed.
>
> I'm not sure about the process of bindings removal, but perhaps the bindi=
ngs
> should be marked as deprecated first then removed later on ?
>
> It has been a fun time adding support for this architecture, but it's tim=
e
> to get over!
>
> Patch 2 obviously depends on [1].
>
> [1] https://lore.kernel.org/all/20230327121317.4081816-1-arnd@kernel.org/
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
