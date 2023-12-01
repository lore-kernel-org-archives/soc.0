Return-Path: <SRS0=Z/cl=HM=linaro.org=semen.protsenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD57C4167B
	for <soc@archiver.kernel.org>; Fri,  1 Dec 2023 20:25:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5B4A8C433CB; Fri,  1 Dec 2023 20:25:27 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6EDD3C433C9
	for <soc@kernel.org>; Fri,  1 Dec 2023 20:25:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6EDD3C433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-5bcfc508d14so694583a12.3
        for <soc@kernel.org>; Fri, 01 Dec 2023 12:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701462325; x=1702067125; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=srxzfUuXBFkMVOn7OGaNdyaL+KSIWUVGXnTpFNQ9fis=;
        b=LB/bmVzXGIB2Mi5umlXCrDXCwRTKLKg6AprMRC0H1XqgKT3v4H6tgcSzH9zPXdBgz8
         fob/o0+RG9606eUSd5iPDeDktxSJJf/jBmGkCSZQLtqre60o2X7335Qwfl1Cg5Uj/K2n
         9m2iKmaJShqFaqMQUYkzhfN4LuXraMImMqGJ7eYGdBTIPzE+jCsorSwiV9D9xyewF1/h
         GHut1ZiYNdvPGjMRDSSVSJV03loS22xHb/IDEhiZH3sk3JjGRMCWHzrvPI0ZUyvlTFxf
         PlGm+fZwV4xfcvSE63Fjr5SpPULuc03MepHtmdu1DE77QWNc9QvAhbD/UuXxUztaGriu
         e81A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701462325; x=1702067125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=srxzfUuXBFkMVOn7OGaNdyaL+KSIWUVGXnTpFNQ9fis=;
        b=l3QMdkDbi/3ag1tSChK+AtpihwcvDJHxBYC6f7qdY6BwL18YGxZMXFSDDf2FTEp/eD
         tSpZqUVQievwUaS7Z2ibl7WGeflwA62kVtORz+zoDud9GkHpbn44ud7xcc/4uZeF3I7p
         Bpgpq9XvQv3PsMv/bLuCs7dEleVVkmH7uJjvUwFQOJHQtcWKV9lUKog2/FDebfaezfv9
         C2c4inEJiIJ5dzNBWVSnHnTNb5D6yF/k0px9Ct6Q5OsrEwHd4eXn/FuNacNC9oExXt1m
         2l2mBlryCZ6audgZEDLynPpgYXFNajv40LFv5TBTytAuSUmYtjhhCSMI1zjgiML+8wec
         h1nw==
X-Gm-Message-State: AOJu0YwoseJYLAq/nBLSPKsw/JMvk9DiN579hA9sc/6zqUEVqj4yxSJC
	gNEmQxBK3Ro+zGR7UCkvBIKPdOlAqwggSgvaj2igoA==
X-Google-Smtp-Source: AGHT+IGhcjjItpFP1S8xXsF49mbnFTtcjlU4G86zhv4yaAeBkLj2OCa5brrLkR7NmAsB4hi8jkTN6iLwfS0jbWLoyLw=
X-Received: by 2002:a17:90b:4a92:b0:285:adb0:de3e with SMTP id
 lp18-20020a17090b4a9200b00285adb0de3emr93998pjb.34.1701462324828; Fri, 01 Dec
 2023 12:25:24 -0800 (PST)
MIME-Version: 1.0
References: <20231201160925.3136868-1-peter.griffin@linaro.org> <20231201160925.3136868-8-peter.griffin@linaro.org>
In-Reply-To: <20231201160925.3136868-8-peter.griffin@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 1 Dec 2023 14:25:13 -0600
Message-ID: <CAPLW+4kMHhh2++F9pU3VSxBo9H-r+79XB8eSc9yi+DR48C=8vQ@mail.gmail.com>
Subject: Re: [PATCH v5 07/20] dt-bindings: pinctrl: samsung: add
 gs101-wakeup-eint compatible
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
> gs101 is similar to newer Exynos SoCs like Exynos850 and ExynosAutov9
> where more than one pin controller can do external wake-up interrupt.
> So add a dedicated compatible for it.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  .../bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml      | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wa=
keup-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pin=
ctrl-wakeup-interrupt.yaml
> index 2bafa867aea2..de2209f8ba00 100644
> --- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-in=
terrupt.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-in=
terrupt.yaml
> @@ -44,6 +44,7 @@ properties:
>            - const: samsung,exynos7-wakeup-eint
>        - items:
>            - enum:
> +              - google,gs101-wakeup-eint
>                - samsung,exynosautov9-wakeup-eint
>                - samsung,exynosautov920-wakeup-eint
>            - const: samsung,exynos850-wakeup-eint

(to myself): I wonder why exynos850 isn't in the enum above.

> @@ -111,6 +112,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - google,gs101-wakeup-eint
>                - samsung,exynos850-wakeup-eint
>      then:
>        properties:
> --
> 2.43.0.rc2.451.g8631bc7472-goog
>
