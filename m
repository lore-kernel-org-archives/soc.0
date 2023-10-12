Return-Path: <SRS0=XK7G=F2=linaro.org=semen.protsenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 954A2CDB46E
	for <soc@archiver.kernel.org>; Thu, 12 Oct 2023 06:02:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4C70EC433CD; Thu, 12 Oct 2023 06:02:15 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 36B32C433C8
	for <soc@kernel.org>; Thu, 12 Oct 2023 06:02:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 36B32C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1c60778a3bfso5504915ad.1
        for <soc@kernel.org>; Wed, 11 Oct 2023 23:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697090533; x=1697695333; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+44WqOGvvnQF1tRBe3p68MStU8EWKoC7C3wElDjRa1k=;
        b=ZTXwuWdniZRs00v8wmjOzCIs7XpjkiaOFivVA+tWJeY0pSLsT/1burfluRNxmJOcEU
         j8+J9Yg1IrDUpNHYkzT7ElZQRBT8qD5ZgWoF9frM+O4Ora/GykKg+tKFpm7qEKH2VEmk
         N9amiPDT8nozeXnDpHYcJPF95vEt5oMPyp0/zvHi8kNV6/p2dRb/mHkCya4otGp9gZu0
         h4YLgZBM4XB3P01qHtmpIbHtDnggeqB5cDigmvxn/8nuwfVyZlXEgdESJJYeRgzubwVb
         kdpTWDfAYaf9EJSHIlDXMjm7/t05R5V+1rQcrZkLqINnWp523JGrNTjfROSmqEilPbP+
         bZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697090533; x=1697695333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+44WqOGvvnQF1tRBe3p68MStU8EWKoC7C3wElDjRa1k=;
        b=QT0ifDotSmE3JF4ACBxMO7MKKGqT/J+n5ynpMG9x7bnqesUY5zFvv4NUzS4Nlagz+d
         banVe11bX3Nw+2+JlK4yVqmZFo+695LW00fWX1HBYY8TffBtTVJBmUdrspHClgZb6mNK
         a1JmDQSjLatL7O34KgshHPM77jbw8Toav0REPa9/2brdcI3z5hqi9qbUx183CbGFq3ts
         Q1IYm3OWkFRAnfKYD6TFEzYlt8T/wF2xi8jCNkeV8y+HA1Ndp70fBeSU2mZ6OizpPgoc
         jykesuHViJB6SqaXv9euTI7YDwRvEAqT8xIBhEluH1GRJFLm2STzGOo0eeOV5XFBlkGq
         ipiA==
X-Gm-Message-State: AOJu0YxtrgPyhfiux2gB9wi9HU06/vDjGJi/xkho/ZxcSwk1c3OGboOh
	M0MNgcrz4PvPjgGtxg1qYZFAnq1Fl3ilSFafBulKSQ==
X-Google-Smtp-Source: AGHT+IFdFgVv/LOVxR9G3F6/MvkmcUviTbxuwDLT13rcSWpGFB1soPlPNHvMCUGDirrBkuMLzVO+GFyrHni85w0FE0g=
X-Received: by 2002:a17:90a:9106:b0:261:685:95b6 with SMTP id
 k6-20020a17090a910600b00261068595b6mr22023938pjo.13.1697090533614; Wed, 11
 Oct 2023 23:02:13 -0700 (PDT)
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org> <20231011184823.443959-21-peter.griffin@linaro.org>
In-Reply-To: <20231011184823.443959-21-peter.griffin@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Thu, 12 Oct 2023 01:02:02 -0500
Message-ID: <CAPLW+4n-n7POjbi0Fvtdp9kM8tiyuRb5vdmu6Z9Y4fNhtLL4Dg@mail.gmail.com>
Subject: Re: [PATCH v3 20/20] MAINTAINERS: add entry for Google Tensor SoC
To: Peter Griffin <peter.griffin@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
	cw00.choi@samsung.com, tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
	saravanak@google.com, willmcvicker@google.com, soc@kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	kernel-team@android.com, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 11, 2023 at 1:49=E2=80=AFPM Peter Griffin <peter.griffin@linaro=
.org> wrote:
>
> Add maintainers entry for the Google tensor SoC based
> platforms.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  MAINTAINERS | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 90f13281d297..149a0c364309 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8836,6 +8836,16 @@ S:       Maintained
>  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
>  F:     drivers/firmware/google/
>
> +GOOGLE TENSOR SoC SUPPORT
> +M:     Peter Griffin <peter.griffin@linaro.org>
> +L:     linux-arm-kernel@lists.infradead.org (moderated for non-subscribe=
rs)
> +L:     linux-samsung-soc@vger.kernel.org
> +S:     Maintained
> +F:     Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
> +F:     arch/arm64/boot/dts/google/
> +F:     drivers/clk/samsung/clk-gs101.c
> +F:     include/dt-bindings/clock/google,clk-gs101.h
> +
>  GPD POCKET FAN DRIVER
>  M:     Hans de Goede <hdegoede@redhat.com>
>  L:     platform-driver-x86@vger.kernel.org
> --
> 2.42.0.655.g421f12c284-goog
>
