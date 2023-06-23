Return-Path: <SRS0=Bs3z=CL=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B1C5C04A6A
	for <soc@archiver.kernel.org>; Fri, 23 Jun 2023 23:43:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A3B0CC43397; Fri, 23 Jun 2023 23:43:22 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6BDFAC433C0;
	Fri, 23 Jun 2023 23:43:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6BDFAC433C0
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-34220bb6a80so4384005ab.0;
        Fri, 23 Jun 2023 16:43:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687563796; x=1690155796;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fTiyezCl+ncjMsIOOS0sUB9bYyrGCDjIJOvndxohyZs=;
        b=cQWYSCQTz6oNGZOqMHdL2ZhT8d04RcqPqEWkfSgQQCBdl5dgNiFgA+8dnCN9cGC2MC
         jrS5xDAomjCHlqkPqe1kIQGFtjSDrPwEGB3LVjB09OtNqw998ry/gPZKgLhezeHOOKby
         e0zmMlFe1yytp+/Ip5QXk9uRDc3DK/3uzoeWhOq/47jF/Eyd+I3JFalgBm1EqQogUd1N
         erhRuqlbWK47UJUvY9mc5R37wu5d7ancvjgbePBzqUINv0q8LWdc4jsCE/LydXwRgV6o
         T0MYMbSPbhv+JWvEkQk0bLEdA5ojHQSuli/UPgH0eCeb1V5pYPi56TjDkFo2JlZZebDn
         yC+g==
X-Gm-Message-State: AC+VfDwA5Vu31Rv1sSnzzydG95APjolfCsJD7hE2mu6U2rnScu+btQ9w
	OgiEQx9v9i6/8WuDXQBaTA==
X-Google-Smtp-Source: ACHHUZ704nUo/Qe+1L5BBq/vh9K03eeZluxsw6d51akGW3mbLVGxB1UGHdSEiXEdc5xMZV7l5fDOHg==
X-Received: by 2002:a5d:9483:0:b0:760:e308:107e with SMTP id v3-20020a5d9483000000b00760e308107emr15001057ioj.0.1687563796356;
        Fri, 23 Jun 2023 16:43:16 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id r27-20020a02c85b000000b0041407c67451sm72416jao.165.2023.06.23.16.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 16:43:15 -0700 (PDT)
Received: (nullmailer pid 1606691 invoked by uid 1000);
	Fri, 23 Jun 2023 23:43:09 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Varshini Rajendran <varshini.rajendran@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: ulf.hansson@linaro.org, krzysztof.kozlowski+dt@linaro.org, 
	edumazet@google.com, broonie@kernel.org, arnd@arndb.de, maz@kernel.org, 
	lgirdwood@gmail.com, alexandre.belloni@bootlin.com, alain.volmat@foss.st.com, 
	p.zabel@pengutronix.de, mihai.sain@microchip.com, soc@kernel.org, 
	linux-mtd@lists.infradead.org, cristian.birsan@microchip.com, 
	jerry.ray@microchip.com, tudor.ambarus@linaro.org, miquel.raynal@bootlin.com, 
	richard@nod.at, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	balamanikandan.gunasundar@microchip.com, lee@kernel.org, olivia@selenic.com, 
	sboyd@kernel.org, mturquette@baylibre.com, kuba@kernel.org, 
	Hari.PrasathGE@microchip.com, linux-kernel@vger.kernel.org, 
	balakrishnan.s@microchip.com, alsa-devel@alsa-project.org, 
	durai.manickamkr@microchip.com, sre@kernel.org, vkoul@kernel.org, 
	linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org, andrew@lunn.ch, 
	devicetree@vger.kernel.org, nayabbasha.sayed@microchip.com, 
	linux-gpio@vger.kernel.org, nicolas.ferre@microchip.com, davem@davemloft.net, 
	pabeni@redhat.com, linux-arm-kernel@lists.infradead.org, linux@roeck-us.net, 
	wim@linux-watchdog.org, tglx@linutronix.de, horatiu.vultur@microchip.com, 
	radu_nicolae.pirea@upb.ro, dharma.b@microchip.com, a.zummo@towertech.it, 
	linux-mmc@vger.kernel.org, richard.genoud@gmail.com, 
	claudiu.beznea@microchip.com, linus.walleij@linaro.org, conor+dt@kernel.org, 
	herbert@gondor.apana.org.au, eugen.hristev@collabora.com, 
	dmaengine@vger.kernel.org, netdev@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux@armlinux.org.uk, linux-watchdog@vger.kernel.org, 
	linux-pm@vger.kernel.org, robh+dt@kernel.org, linux-i2c@vger.kernel.org, 
	linux-crypto@vger.kernel.org, neil.armstrong@linaro.org, vigneshr@ti.com, 
	manikandan.m@microchip.com, linux-clk@vger.kernel.org, olof@lixom.net
In-Reply-To: <20230623203056.689705-32-varshini.rajendran@microchip.com>
References: <20230623203056.689705-1-varshini.rajendran@microchip.com>
 <20230623203056.689705-32-varshini.rajendran@microchip.com>
Message-Id: <168756378936.1606652.14221929175769628362.robh@kernel.org>
Subject: Re: [PATCH v2 31/45] dt-bindings: atmel-classd: add sam9x7
 compatible
Date: Fri, 23 Jun 2023 17:43:09 -0600


On Sat, 24 Jun 2023 02:00:42 +0530, Varshini Rajendran wrote:
> Add sam9x7 compatible to DT bindings documentation.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  .../devicetree/bindings/sound/atmel,sama5d2-classd.yaml      | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/atmel,sama5d2-classd.example.dtb: sound@fc048000: compatible: 'oneOf' conditional failed, one must be fixed:
	['atmel,sama5d2-classd'] is too short
	from schema $id: http://devicetree.org/schemas/sound/atmel,sama5d2-classd.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230623203056.689705-32-varshini.rajendran@microchip.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

