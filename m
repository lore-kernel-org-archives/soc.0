Return-Path: <SRS0=/kUF=HW=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BDEAC4167B
	for <soc@archiver.kernel.org>; Mon, 11 Dec 2023 12:45:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 23E6CC433C7; Mon, 11 Dec 2023 12:45:31 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 75B8DC433CD
	for <soc@kernel.org>; Mon, 11 Dec 2023 12:45:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 75B8DC433CD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-77f347b0299so274426085a.3
        for <soc@kernel.org>; Mon, 11 Dec 2023 04:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702298728; x=1702903528; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ciTb8X7sSYaGOT4UWkd550gPDBthZN4x3zDDJKswrc0=;
        b=tP20qKajQ0I6BJ9JTiuLe9dUvL9uHmWDuRCLB9rWMQclD12jSb21VRXUx56oKJ9fp6
         Ix8PkT+HbD3Kjky45fmgsgMKMNcyWaXAWYRpcTUbCXLiqTFDYEE/7kNdN9tLAPDWphM4
         pDVoGgvltghz239gJtClvKqRDr2RUyWwKojvDmMfe1Vt0XyFJmxm40FbiG5Q/VKeB7eU
         28kyYq5fXNTX7mj1RwIsXd20HjuVTEPx4gXIDiWhkMK6IuHDP532AIdozKXLIpSCHUS6
         tGZXgcd1gUL3AkVC16jUnr2GD3+nmWaFUY9ePrUZnr9/A6EahO6qplSfDNezuLXJAM8m
         /ZOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702298728; x=1702903528;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ciTb8X7sSYaGOT4UWkd550gPDBthZN4x3zDDJKswrc0=;
        b=HSwnUzBpcUlKTp+CclfLnymrPqYzz5ZE8QZEZ+njefLIsu0hnVCciaUEl+d6OH65Nh
         3FFzes5sIxsySr0K5Eu2tF3fVY53R4r3sYBy/ys/jlQ6tMKssSuoZoiCopzPbG7E0wCg
         utgz352A4K80oilmof6RPZKEMfbKoyPqmpXvcbu5fVP+wMwWRXYxf4R4sD+m5XTGZpyC
         xCwXCIWXuRnmfq6JbH6jame8kDlOAGbo70YdlSPMNvqfWFiTyhtNNpga2H5S1we8ZbKh
         lsumMLdjNcNfjXLSzIipiF3xMhpS9rcj6UqHVgBPB/9ffThNWd0p/HZ9jafB9SNnippK
         a3Wg==
X-Gm-Message-State: AOJu0Yym/epdFh+P/JKAHgsVdglfSyMBihWnZm9Np6V/Tjf0tO4WI8m+
	JmsVzLFMZlqs0rHq8Q7a8BafT8QBpzy+HGk4buHRIA==
X-Google-Smtp-Source: AGHT+IEpuGvMmwJK7KEtP0GssM6BhrUf01e5r6sZWErKY3vlOr/IGzS7HSTqH7gTZbrJhzfyaEJCH937yl3bmQukKsg=
X-Received: by 2002:a0c:ef8a:0:b0:67a:8cf8:3fb with SMTP id
 w10-20020a0cef8a000000b0067a8cf803fbmr5908480qvr.61.1702298728335; Mon, 11
 Dec 2023 04:45:28 -0800 (PST)
MIME-Version: 1.0
References: <20231209233106.147416-1-peter.griffin@linaro.org>
 <20231209233106.147416-20-peter.griffin@linaro.org> <03603f37-ec3d-456c-95a4-e543d1df4801@linaro.org>
In-Reply-To: <03603f37-ec3d-456c-95a4-e543d1df4801@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 11 Dec 2023 12:45:16 +0000
Message-ID: <CADrjBPr7tqdec6z_NL0EEm+G3WTUkjj_dE2Lpm+f=4hdg5BA5Q@mail.gmail.com>
Subject: Re: [PATCH v6 19/20] arm64: dts: exynos: google: Add initial
 Oriole/pixel 6 board support
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
	semen.protsenko@linaro.org, saravanak@google.com, willmcvicker@google.com, 
	soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Sun, 10 Dec 2023 at 14:39, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 10/12/2023 00:31, Peter Griffin wrote:
> > Add initial board support for the Pixel 6 phone code named Oriole. This
> > has been tested with a minimal busybox initramfs and boots to a shell.
> >
> > Tested-by: Will McVicker <willmcvicker@google.com>
> > Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  arch/arm64/boot/dts/exynos/Makefile           |   2 +
>
> ...
>
> > +&serial_0 {
> > +     status = "okay";
>
> Keep status the last

Will fix

>
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&uart0_bus>;
> > +};
> > +
> > +&usi_uart {
> > +     status = "okay";
>
> Keep status the last

Will fix

regards,

Peter
