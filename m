Return-Path: <SRS0=57W1=HV=linaro.org=semen.protsenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D54C4167B
	for <soc@archiver.kernel.org>; Sun, 10 Dec 2023 23:34:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BC1D8C433C9; Sun, 10 Dec 2023 23:34:44 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1890BC433CB
	for <soc@kernel.org>; Sun, 10 Dec 2023 23:34:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1890BC433CB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6d9d209c9bbso3060147a34.0
        for <soc@kernel.org>; Sun, 10 Dec 2023 15:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702251282; x=1702856082; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S0Bc/AKWuuu7ZiMYkuthYcJC3W6VEymZYFDL+Rk6rHQ=;
        b=aUH7mAk/+IiMQ9i0DrsznwyKGX7Yy6IoJ8lR28PCa6hlD4Sgn+62JEXutcsArh18iy
         qwJfG/s157yND5FygKYazequsZS8LRxFkv3P/UYfLKLuxZwXwhQwVTwxujTtZ2AsGO9p
         xyVqPvNNl6edpd3bfWzEohp/nFRkt7QAr8xiL6wFM11kwW6YoLKR92xPPIOOY56X1GII
         R4pFkDU1U2+RtZlcBLCJSpCzX9TPWckWuDNPxk1YR4CkTJXJS4BM9/NlQvFYDlsiVfRO
         4+vsbzEzlOGFNPNnj0mcJLfbLHiGTRkPYPHwexmzsr+EZYhlv0w5ohukSqN20FGaBVjC
         b2NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702251282; x=1702856082;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S0Bc/AKWuuu7ZiMYkuthYcJC3W6VEymZYFDL+Rk6rHQ=;
        b=XWWvZcGNBKtYikkqcpXh/Yawr/rvYN6HNoqO8fn+4r7Iznw2FhZm1DtVra2f9uYJ0/
         YxNLNqONGR/bMg7eiovaXGmP0sQZm/oXVGnqCueJicfJrhuyui/P/dhrASS0/1SGxPwu
         ed2B+23OZjtWJPeDxnxDxmn27W/Hd3Md0OjL12KqFfM0l5Bz90qivDVw0SZogdDYEV4G
         nFKA5482njz4KpO4BUhW9a0S2rRDl1K22vCeeZ2LIHL9zTctdqu39s6pBXykQF6qONN2
         afCJaxuQGULeBPpIkVL2NF00kZwMU/EHh9c4s2+3z0qsTTHix5hKEcfsq0zV6XpnCGKO
         CtXg==
X-Gm-Message-State: AOJu0YxngGONgglwWG6TS9RqX8COpuVIPou3aL7M2pmQCtkr6iqhdDaO
	tZgVsavhj9tvrJtkRIM1CL54lhPpPZXB0Oi4BDGOlQ==
X-Google-Smtp-Source: AGHT+IFVEv8jsGoppfiwgaK84rdOj6Eg9outb/gheNsC4CMf28kQ6yJHHDFdVlnIE7iYe3uOxSjPxsRDEjpzjDbk8o0=
X-Received: by 2002:a9d:4d82:0:b0:6d9:f4c5:eed0 with SMTP id
 u2-20020a9d4d82000000b006d9f4c5eed0mr3726570otk.9.1702251282145; Sun, 10 Dec
 2023 15:34:42 -0800 (PST)
MIME-Version: 1.0
References: <20231209233106.147416-1-peter.griffin@linaro.org> <20231209233106.147416-11-peter.griffin@linaro.org>
In-Reply-To: <20231209233106.147416-11-peter.griffin@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Sun, 10 Dec 2023 17:34:31 -0600
Message-ID: <CAPLW+4k=k9-TTB4YOyT7NyzfNORNLDJMtHBwfLtdZV52CMgxXQ@mail.gmail.com>
Subject: Re: [PATCH v6 10/20] dt-bindings: soc: samsung: usi: add
 google,gs101-usi compatible
To: Peter Griffin <peter.griffin@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, saravanak@google.com, 
	willmcvicker@google.com, soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 9, 2023 at 5:31=E2=80=AFPM Peter Griffin <peter.griffin@linaro.=
org> wrote:
>
> From: Tudor Ambarus <tudor.ambarus@linaro.org>
>
> Add google,gs101-usi dedicated compatible for representing USI of Google
> GS101 SoC.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yam=
l b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
> index 61be1f2ddbe7..8b478d6cdc30 100644
> --- a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
> @@ -25,6 +25,7 @@ properties:
>      oneOf:
>        - items:
>            - enum:
> +              - google,gs101-usi
>                - samsung,exynosautov9-usi
>                - samsung,exynosautov920-usi
>            - const: samsung,exynos850-usi
> --
> 2.43.0.472.g3155946c3a-goog
>
