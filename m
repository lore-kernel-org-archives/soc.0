Return-Path: <SRS0=Z/cl=HM=linaro.org=semen.protsenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E4DC4167B
	for <soc@archiver.kernel.org>; Fri,  1 Dec 2023 20:13:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 672F1C433CC; Fri,  1 Dec 2023 20:13:27 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 92151C433CA
	for <soc@kernel.org>; Fri,  1 Dec 2023 20:13:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 92151C433CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1cfcc9b3b5cso8490695ad.0
        for <soc@kernel.org>; Fri, 01 Dec 2023 12:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701461605; x=1702066405; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z3rjxz/DGxu24GsmHPsJcKIMXuhLYYUkDfFjYzr+Skg=;
        b=gX2dnaQs6oo/SNVr7BBH6dfiZFLVrcviNF+MEXSo0SN/DYiDUbLeMfcXeN+rApn+zw
         +unZhRZeIFD8ww45y4i9eqOhwomWaQcN/WpXxhirP+4TDI8exd1aWaeeVf4jT7hWL7wO
         eX+jJPY5t6bTIcgJcDaVujZ7nWfmlOI2/3zVLbZNNr9mHiuwP5+ygrTrzRbbGae0955x
         s9EanZPraekzw1yM6fjqOkjV8KKvPnFU/s+EeMyfkpFDcpywi/8axMpwzjDranA/IKTa
         43TTlPUlCgpzVCmgU4DTNdz1znjoAP8hl/+E18YbnxdREkqPoayYzFNTOy4U2iqoa7J2
         eb7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701461605; x=1702066405;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z3rjxz/DGxu24GsmHPsJcKIMXuhLYYUkDfFjYzr+Skg=;
        b=PKG9Ewin/eRfO1GRgb28HsR0Z4t5Q50CzvRdSn0LT/PO/QtegvVQTiCzsJPdqgxDMN
         Nk3IutQ4S2PnhhSObZp0xJ8RyQJDpKZ696W6qdYNJMz3zxtFjKt9El9sqoe68+bnUmoH
         arokvjmKJJLTfStVCUZj7wLVlD1G8QsfbuV2LrMrdVZ5VQFVQW9T1CJx74QtJnrLoXGG
         /+7Swp0oOqQnONUzMdqauH6YegGNfZWK3PC+YvHKG/mNwKTmzWqNPQPONVutFneiOjtI
         9HmiFn+M6XmOfCb9UfwTa0VlL/qci5x6BaJ8vs2k7jFvtpSoCKjTpYXyQ8chLwy1q3PJ
         +Omg==
X-Gm-Message-State: AOJu0Yx6gZx8W8w/5vYW2Qs3Q0leLtvQLPjCAVHxXxEbeqvDk4rRYAEe
	Rj0HtD+pJ9kLCrtKNM3MyJI/NLFp0hyxhU39/AmCkQ==
X-Google-Smtp-Source: AGHT+IHkEyBcFrICiGFLOM8wMi5B888ezZ7RSvNyP3OK3Rh9MsRoluODUxrTWHGQPO04o2OjahKipeMHCbUIGEDXEfY=
X-Received: by 2002:a17:902:efc1:b0:1cf:fc8f:3fb6 with SMTP id
 ja1-20020a170902efc100b001cffc8f3fb6mr76235plb.17.1701461604899; Fri, 01 Dec
 2023 12:13:24 -0800 (PST)
MIME-Version: 1.0
References: <20231201160925.3136868-1-peter.griffin@linaro.org> <20231201160925.3136868-5-peter.griffin@linaro.org>
In-Reply-To: <20231201160925.3136868-5-peter.griffin@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 1 Dec 2023 14:13:13 -0600
Message-ID: <CAPLW+4nNuRXB8a6M0dmWhFZYkSu62M_nAW3aBeV5wfedVLkraw@mail.gmail.com>
Subject: Re: [PATCH v5 04/20] dt-bindings: watchdog: Document Google gs101
 watchdog bindings
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

On Fri, Dec 1, 2023 at 10:10=E2=80=AFAM Peter Griffin <peter.griffin@linaro=
.org> wrote:
>
> Add the "google,gs101-wdt" compatible to the dt-schema documentation.
>
> gs101 SoC has two CPU clusters and each cluster has its own dedicated
> watchdog timer (similar to exynos850 and exynosautov9 SoCs).
>
> These WDT instances are controlled using different bits in PMU
> registers.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  .../devicetree/bindings/watchdog/samsung-wdt.yaml         | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml =
b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> index 8fb6656ba0c2..57468c2c5ece 100644
> --- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> @@ -17,6 +17,7 @@ description: |+
>  properties:
>    compatible:
>      enum:
> +      - google,gs101-wdt                      # for Google gs101
>        - samsung,s3c2410-wdt                   # for S3C2410
>        - samsung,s3c6410-wdt                   # for S3C6410, S5PV210 and=
 Exynos4
>        - samsung,exynos5250-wdt                # for Exynos5250
> @@ -42,13 +43,14 @@ properties:
>    samsung,cluster-index:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description:
> -      Index of CPU cluster on which watchdog is running (in case of Exyn=
os850)
> +      Index of CPU cluster on which watchdog is running (in case of Exyn=
os850
> +      or Google gs101).
>
>    samsung,syscon-phandle:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description:
>        Phandle to the PMU system controller node (in case of Exynos5250,
> -      Exynos5420, Exynos7 and Exynos850).
> +      Exynos5420, Exynos7, Exynos850 and gs101).
>
>  required:
>    - compatible
> @@ -64,6 +66,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - google,gs101-wdt
>                - samsung,exynos5250-wdt
>                - samsung,exynos5420-wdt
>                - samsung,exynos7-wdt
> @@ -77,6 +80,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - google,gs101-wdt
>                - samsung,exynos850-wdt
>                - samsung,exynosautov9-wdt
>      then:
> --
> 2.43.0.rc2.451.g8631bc7472-goog
>
