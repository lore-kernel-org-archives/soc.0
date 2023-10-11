Return-Path: <SRS0=ubZ2=FZ=linaro.org=semen.protsenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8666CCDB465
	for <soc@archiver.kernel.org>; Wed, 11 Oct 2023 23:13:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6B376C433CC; Wed, 11 Oct 2023 23:13:40 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AA58FC433C7
	for <soc@kernel.org>; Wed, 11 Oct 2023 23:13:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AA58FC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-27cfb84432aso251712a91.2
        for <soc@kernel.org>; Wed, 11 Oct 2023 16:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697066018; x=1697670818; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X5saBzwBoX5B14fYIIgg/6gXpURSg7LZ6ZY/6+XktEg=;
        b=fkxCPQcvMMwiolL7PClngss0d85NytOFmdltwwWh8qhiQZJlKlwzzj+AZfKy4mxD2M
         Q9uoAJ0JXiDxFXxBwiwSA9K7tyHg4J4MkuPdY+V9J7MwvIFLjezrv57Vxoz0aovUHmll
         bzQzUtMQiv9FvCZJQRNPEpz/SVaQLC1YpJ+7zsjsElZrLWH3fjRNZ0ZZhNvmzsVC365h
         +dM98b0bAhsp0lkt8vTACvj1WuCINGvHvGWZ1DL6kDKc6uVipdRJUa6+Kd4SoE912TX4
         vMcv2qCEfDJ+JxfZcibBtCihoRj5Fc4Fl96+48dMlE4ZQmt3rMTNWzQUYMImKKKWOay6
         /MNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697066018; x=1697670818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X5saBzwBoX5B14fYIIgg/6gXpURSg7LZ6ZY/6+XktEg=;
        b=HodYdVbeL/A2cDOkXGzTkKYzqfOHAabGwIt+XTAxrS+LHAJBRan1ZsZLYvMu9/BcSS
         dOmgf4JMAYkRxNdSyrmZyyV5G2nWD1QMAJkwSu0uglDt4l01FBXDs1IJODAX3lO4V1cv
         iFC88GXBFuvE8YAm7nRB02Unmj0wkN2iKd45ydf0NEpBbQac10XQtD7qv6KMZXdGie2S
         u5ZFBWvR7CCi0yqyi7IZ7xMfy7Vf4i9ZEepdhz94bgdSWfTYTjR4Oa2Q/iLmaqbycFRb
         huyhsNSluATZRK95lN4MwRPF3sFiyWlp6XsxYwCcYYKj4fXSnmGOc7MRY9zB9+QLZCS0
         i7FA==
X-Gm-Message-State: AOJu0Yxj3TZDfj4IlfnNGefGKPxUQsDGjkxyS/PGMYFO4Sq8mJ+ykBYa
	+ikcD5fkuOWeU+sjfYRTD6WNEujq3TpvPEsGcTZ3fw==
X-Google-Smtp-Source: AGHT+IEld7S7h6gZ3fWO8KAIshEdLEI80q2ynQn1SW+nlZmhOV1fXDdbKEzZtX6rH7IBM+FnyFZOxN8YxMRhPqYZWog=
X-Received: by 2002:a17:90b:3891:b0:274:862f:3439 with SMTP id
 mu17-20020a17090b389100b00274862f3439mr19558004pjb.13.1697066018140; Wed, 11
 Oct 2023 16:13:38 -0700 (PDT)
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org> <20231011184823.443959-9-peter.griffin@linaro.org>
In-Reply-To: <20231011184823.443959-9-peter.griffin@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Wed, 11 Oct 2023 18:13:27 -0500
Message-ID: <CAPLW+4nMKtgdGrjijWpXOCxaYWN5sBVVw9boYk9UMmHLnV3pAA@mail.gmail.com>
Subject: Re: [PATCH v3 08/20] dt-bindings: serial: samsung: Add
 google-gs101-uart compatible
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
> Add dedicated google-gs101-uart compatible to the dt-schema for
> representing uart of the Google Tensor gs101 SoC.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  Documentation/devicetree/bindings/serial/samsung_uart.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b=
/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> index 8bd88d5cbb11..6e807b1b4d8c 100644
> --- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> +++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> @@ -24,6 +24,7 @@ properties:
>        - enum:
>            - apple,s5l-uart
>            - axis,artpec8-uart
> +          - google,gs101-uart
>            - samsung,s3c2410-uart
>            - samsung,s3c2412-uart
>            - samsung,s3c2440-uart
> --
> 2.42.0.655.g421f12c284-goog
>
