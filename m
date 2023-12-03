Return-Path: <SRS0=l1VT=HO=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57392C4167B
	for <soc@archiver.kernel.org>; Sun,  3 Dec 2023 21:31:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 27839C433D9; Sun,  3 Dec 2023 21:31:56 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5AF49C433CC
	for <soc@kernel.org>; Sun,  3 Dec 2023 21:31:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5AF49C433CC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-67a91751ba8so18255656d6.3
        for <soc@kernel.org>; Sun, 03 Dec 2023 13:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701639113; x=1702243913; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G02u0sdxnFAEWbNN9nRUil1ZtXJaIE05IGNFhr9iJSA=;
        b=ispkqaR5H/BS9DDnUHHUL016yda8LbfKZjVL/iblua+5Ps2bWLsyLZWoaM7QCWr/WS
         mJjpVD81MLRIndxGL1SyzhZl1oTOzTRaHXuilv/8TguoEENxMENIMjV/fAeJDjEC3qxp
         jnYwCFmCWxSplIdGONIhqXKDjgYyDLEZd+4mrLDic1RJDL6fn9LGzpreNi0zaCD31pmP
         zEHoYE2GEsWOqifS5G4djaOsqrqFGJPgMmcI5AjH6K73pIN13FV2wDXvebFQRAGDL6FQ
         mGIc2S08Eehscz4NDYjO7R3E2bcdZaJg/ViS/jyEMam96dU8uFdYig3teGCPgOxRwfJn
         FKTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701639113; x=1702243913;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G02u0sdxnFAEWbNN9nRUil1ZtXJaIE05IGNFhr9iJSA=;
        b=Mcf1wy+yaVxA+khHXCw0N7pKdj9Ys9WHIyrmT0V45vNaK5GDZVWWK6PQFI3bTfNwa4
         Q78DWEv9YH9ch1XCObGmriOeP1042W8bsI36KvNKpnKkIrPvBeeyzZvFBx634mKhlWWq
         HrDZMkuFkxWXOM6sedLuIGDGhF/bwPH7naCCR8Mj47D3Ueo+Q1XUvc8hhWF8jfBLDP/5
         ChPbtVwypLgpejMhmh5rh5ELrNCgN9DmiLzfIjM0L+di2WX6wiDT26Q7o8cIm0Hsjr9M
         3mw8H8AfaSOU6856X2DyTzSBtrfwOOhk9w18Jz26i84qfZL4KxkkdFDHDgumTbHH5RE2
         Mm/A==
X-Gm-Message-State: AOJu0YwKDnka5EAQ/voNIwVinuJjW/2ImAeYap7HE12/87Rr7xcnZXcZ
	i9/DFObNBkQCHRvMTEr/qqNwgZs44cNVQLLUKmSgDg==
X-Google-Smtp-Source: AGHT+IGNohdhuUx6qw41RjMk55NiBYO1sgpsNCtd4DXi5RmzCel7FKuFM65wkoSHPpohcTc4yi+ZokTYRVrg0YEEWT8=
X-Received: by 2002:a0c:f7d0:0:b0:67a:bb7f:ebd7 with SMTP id
 f16-20020a0cf7d0000000b0067abb7febd7mr1547835qvo.61.1701639113122; Sun, 03
 Dec 2023 13:31:53 -0800 (PST)
MIME-Version: 1.0
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
 <20231201160925.3136868-10-peter.griffin@linaro.org> <59b949a0-5aeb-4f01-8789-cb305513b626@app.fastmail.com>
In-Reply-To: <59b949a0-5aeb-4f01-8789-cb305513b626@app.fastmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Sun, 3 Dec 2023 21:31:41 +0000
Message-ID: <CADrjBPoeLLcoDuLdkVhO4C_8qFAvFSu2igNPP09RXagiJpPsig@mail.gmail.com>
Subject: Re: [PATCH v5 09/20] dt-bindings: serial: samsung: Make
 samsung,uart-fifosize required property
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, krzysztof.kozlowski+dt@linaro.org, 
	Michael Turquette <mturquette@baylibre.com>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Olof Johansson <olof@lixom.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Sam Protsenko <semen.protsenko@linaro.org>, saravanak@google.com, 
	William McVicker <willmcvicker@google.com>, soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-watchdog@vger.kernel.org, 
	kernel-team@android.com, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Arnd,

On Fri, 1 Dec 2023 at 16:39, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Fri, Dec 1, 2023, at 17:09, Peter Griffin wrote:
> >
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - google,gs101-uart
> > +    then:
> > +      required:
> > +        - samsung,uart-fifosize
> > +
>
> Is there a way to reverse the list and make the property
> required for anything that is not explicitly enumerated?

I'm not aware of a way to do that, but I'm by no means an expert with
json schema. Krzysztof or Rob may know of a way.

I presume your rationale is any newly added platform would get a DTC
warning if they didn't add the samsung,uart-fifosize property?

Krzysztof and Rob also had concerns in the previous series about ABI
breakage on existing platforms, which is why this was only made
required for google,gs101-uart.

regards,

Peter
