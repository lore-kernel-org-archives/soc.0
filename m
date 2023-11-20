Return-Path: <SRS0=pvBr=HB=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B9BC197A0
	for <soc@archiver.kernel.org>; Mon, 20 Nov 2023 23:15:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7D5F8C433CC; Mon, 20 Nov 2023 23:15:37 +0000 (UTC)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3FA7AC433C8;
	Mon, 20 Nov 2023 23:15:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3FA7AC433C8
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-357ccaf982eso16258255ab.0;
        Mon, 20 Nov 2023 15:15:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700522135; x=1701126935;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oY5J7Q7Bh87QLqEtzkkFLokxl1xQuST2xeMLw4gISwQ=;
        b=W3viHGOxjehB75M6dDxGrJiIpj/DHIB5ZD7AggPPf79YhDurySqdvP57vEVc63T5zG
         ksJItsiX5WqwFwLIM05rJa+aGLPutE/kIAd1DUr7UQh36jhIUw+mVmtkyDgasqwOt5fo
         MUZxyE9cQkNKwsWx1g2vCTs1InuPlzDPemEpo50mq1Gtuqse9rL1XGiK42Zj4PNYm776
         ExKuKBgvwQkth3GR6dPNs1TUcS7Tc0z3+MgPLM9HE/b9/+SCVag1kXshxK/QTekal3GV
         8wS754FIRL9/p2BIm/fZVLl8Equf+laNJkiqsoHlrymOTx7WsOuvRmcjkEf+fWgsxPgf
         u1VQ==
X-Gm-Message-State: AOJu0YwXLFYGl07uhsHpm74ffYtG2U8lUJ1qiPNXkGuXoqDNUSQKk524
	sNFk/WZMEcHT9PQZdxTvTQ==
X-Google-Smtp-Source: AGHT+IH9hx2Lz/XIxkLFIUxOIoP+9llZ0Q3H76wLRJe9Z357B1Pd7dlTGI55NnHwh5CKRiPgYoqlFw==
X-Received: by 2002:a05:6e02:16ce:b0:35a:fc1c:1ac7 with SMTP id 14-20020a056e0216ce00b0035afc1c1ac7mr9596630ilx.30.1700522135248;
        Mon, 20 Nov 2023 15:15:35 -0800 (PST)
Received: from herring.priv ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id v8-20020a056e020f8800b0035905b40621sm2763008ilo.66.2023.11.20.15.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 15:15:34 -0800 (PST)
Received: (nullmailer pid 3706371 invoked by uid 1000);
	Mon, 20 Nov 2023 23:15:31 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: linux-serial@vger.kernel.org, olof@lixom.net, cw00.choi@samsung.com, andre.draszik@linaro.org, saravanak@google.com, jirislaby@kernel.org, arnd@arndb.de, krzysztof.kozlowski+dt@linaro.org, alim.akhtar@samsung.com, linux-gpio@vger.kernel.org, willmcvicker@google.com, tudor.ambarus@linaro.org, linux-samsung-soc@vger.kernel.org, mturquette@baylibre.com, soc@kernel.org, linux@roeck-us.net, linux-watchdog@vger.kernel.org, semen.protsenko@linaro.org, sboyd@kernel.org, robh+dt@kernel.org, conor+dt@kernel.org, wim@linux-watchdog.org, gregkh@linuxfoundation.org, will@kernel.org, linux-arm-kernel@lists.infradead.org, tomasz.figa@gmail.com, linus.walleij@linaro.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, s.nawrocki@samsung.com, kernel-team@android.com, catalin.marinas@arm.com
In-Reply-To: <20231120212037.911774-10-peter.griffin@linaro.org>
References: <20231120212037.911774-1-peter.griffin@linaro.org>
 <20231120212037.911774-10-peter.griffin@linaro.org>
Message-Id: <170052213161.3706337.15818635228108481923.robh@kernel.org>
Subject: Re: [PATCH v4 09/19] dt-bindings: serial: samsung: Make
 samsung,uart-fifosize required property
Date: Mon, 20 Nov 2023 16:15:31 -0700


On Mon, 20 Nov 2023 21:20:27 +0000, Peter Griffin wrote:
> Specifying samsung,uart-fifosize in both DT and driver static data is error
> prone and relies on driver probe order and dt aliases to be correct.
> 
> Additionally on many Exynos platforms these are (USI) universal serial
> interfaces which can be uart, spi or i2c, so it can change per board.
> 
> For google,gs101-uart and exynosautov9-uart make samsung,uart-fifosize a
> required property. For these platforms fifosize now *only* comes from DT.
> 
> It is hoped other Exynos platforms will also switch over time.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  .../bindings/serial/samsung_uart.yaml           | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/serial/samsung_uart.yaml:141:8: [warning] wrong indentation: expected 8 but found 7 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231120212037.911774-10-peter.griffin@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

