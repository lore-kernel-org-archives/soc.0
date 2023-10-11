Return-Path: <SRS0=ubZ2=FZ=linaro.org=semen.protsenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADCEFCDB465
	for <soc@archiver.kernel.org>; Wed, 11 Oct 2023 22:56:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 90AF1C433C7; Wed, 11 Oct 2023 22:56:49 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7D743C433CA
	for <soc@kernel.org>; Wed, 11 Oct 2023 22:56:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7D743C433CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-690f7bf73ddso272962b3a.2
        for <soc@kernel.org>; Wed, 11 Oct 2023 15:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697065008; x=1697669808; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i+Wd5EIBxy7tg1IcC5pX8wjJFGApZ86qa6K6AgCJp6k=;
        b=WfHXUajIQvub1RojB+dlrMCGn247wHgBEB3KMZBRensiRh35UU4yBDHm5EOl4bXNHI
         MlVWqeGiUjBMvIYacoW0VyVu3kNtNtsh2/uAKGwGiOJzryxkNxC6sFmSZbOdg9u8oq9i
         mHBPLxCMl4tHf72tjY3gwSuHYvMRyN3thC2EjSl7s1nrK9i7v3WVoWVGHt78pztiEyjE
         0Gbo+wlshRaz8GXnQBH2JEleh1COZQixp3JKdLycraSIUj5MmuHZvVpUOOtxWUg85SlF
         tDPXcGUjVQxZwACuFSV6Ili0vUuWpE458t7uEAJE3v9lcSq9DNRAu7CN0jFjUkCKrxk/
         48VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697065008; x=1697669808;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i+Wd5EIBxy7tg1IcC5pX8wjJFGApZ86qa6K6AgCJp6k=;
        b=OX8m4nxvdrEPF5f/Hphg4BbwoDc2MJmxb7jvIFpcoISIWVAR18vV35Mrm8loSGoIl1
         26VtLIDXuFYoE483VEavxeT+mcTSGN9lAqhFxSVUYNVBzf5gbCWMncUv4Ocy2eHRq4nL
         11J3xyoZaXErn2270XgHYfSVWAcrAlN+Takt6gZDUa7b2QZjDWVy68MxQNUQ8Ux38+kg
         xqjvHlRpHOjfS18e05LUrbBx2U4VFI7G2iiHgKwpra9LXnRGZP0yy0/Rn2i54oUXoTs1
         1SrRevri8C/vIDpNCOhyst9p6Pxkhz4ZJFVbse47T5j3Dj9lu/lcngJNzm9ElVQ68iUk
         qWBA==
X-Gm-Message-State: AOJu0YzuYToMmNrWqOLOhrMPJZHqCKhRg5PnX9EY0+rbaqlWFdyrIzr9
	VIDw2FmkAcqhARnVichBjt0YCaRSKOyZXmsGhigi7g==
X-Google-Smtp-Source: AGHT+IHWOczWu7WQV1EKAk6a/KcbReCPfGwJhoqvpNTDXWx/1qiK3Ag9j63GW3w5nl3ySyA5aOL457sQ0LvlcBwTEtw=
X-Received: by 2002:a05:6a20:a11b:b0:16b:7fcb:4257 with SMTP id
 q27-20020a056a20a11b00b0016b7fcb4257mr16749547pzk.4.1697065007917; Wed, 11
 Oct 2023 15:56:47 -0700 (PDT)
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org> <20231011184823.443959-4-peter.griffin@linaro.org>
In-Reply-To: <20231011184823.443959-4-peter.griffin@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Wed, 11 Oct 2023 17:56:37 -0500
Message-ID: <CAPLW+4koMf3gcdyBC5vuBDxCyu_2MJT91zuC4diGHFY6FNyMyA@mail.gmail.com>
Subject: Re: [PATCH v3 03/20] dt-bindings: soc: google: exynos-sysreg: add
 dedicated SYSREG compatibles to GS101
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
> GS101 has three different SYSREG controllers, add dedicated
> compatibles for them to the documentation.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  .../bindings/soc/samsung/samsung,exynos-sysreg.yaml         | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos=
-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos=
-sysreg.yaml
> index 163e912e9cad..dbd12a97faad 100644
> --- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg=
.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg=
.yaml
> @@ -30,6 +30,12 @@ properties:
>                - samsung,exynos5433-fsys-sysreg
>            - const: samsung,exynos5433-sysreg
>            - const: syscon
> +      - items:
> +          - enum:
> +              - google,gs101-peric0-sysreg
> +              - google,gs101-peric1-sysreg
> +              - google,gs101-apm-sysreg
> +          - const: syscon
>        - items:
>            - enum:
>                - samsung,exynos5433-sysreg
> --
> 2.42.0.655.g421f12c284-goog
>
