Return-Path: <SRS0=yR+V=VZ=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D01BC433EF
	for <soc@archiver.kernel.org>; Tue, 17 May 2022 12:41:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6274EC3411A; Tue, 17 May 2022 12:41:05 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 666E5C385B8;
	Tue, 17 May 2022 12:41:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 666E5C385B8
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-f189b07f57so10492871fac.1;
        Tue, 17 May 2022 05:41:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=dmRe+wb3qB33LoKWee22zj7uRY4UjJW/ZlvarK0xJ4I=;
        b=i3d3XY2yluNO+W3NlO1qIqD+CUNKeotwNrpce6IGeENvFxejy4LFo4jMLNwu2RkUSb
         nVVYDIRCOhrvrToP3OGlmEE2yPVgjNm/Ze1XlQSm1FiA19nlrTzUGwpr/moIT5PPLrBx
         D6TZXo7uG9N2sHK9Ovd/RSt8JpIopOQUQ/myO8z0QYB0WdZcW0Zypp9xhcqYfWtphXVY
         1GrTg09H6bKE61GrFag3/dEiARGgEgzsJ/QZ8ugKHq97Fjz2VIGwfOei/q7kdlxAvG+y
         Cz4VtGcsr2+1RCQv0hQnZZtjpgZobcVrjl7mUNmOJRKvtXvW99AyfAjUl+EH3p0ffTd+
         6nRQ==
X-Gm-Message-State: AOAM531bhvPJ0yAmbU/HBB3GWwKdKlL6edSrzUscOA+KaueoigIAvsST
	NrPXsSLKPqxmOD0IbG+cug==
X-Google-Smtp-Source: ABdhPJwnnXeDtNIrD9oMGMg+yVK7oZSnR6U4Y5GhHjmScQw8t3Gp/MJckdluI0FDFeWymxO+NodkOw==
X-Received: by 2002:a05:6870:b61d:b0:f1:9674:f095 with SMTP id cm29-20020a056870b61d00b000f19674f095mr5886409oab.187.1652791263511;
        Tue, 17 May 2022 05:41:03 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id d6-20020a056870d28600b000f1ca01a7besm265451oae.24.2022.05.17.05.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 05:41:02 -0700 (PDT)
Received: (nullmailer pid 785396 invoked by uid 1000);
	Tue, 17 May 2022 12:40:59 -0000
From: Rob Herring <robh@kernel.org>
To: Jesse Taube <mr.bossman075@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: daniel.lezcano@linaro.org, clin@suse.com, linux-kernel@vger.kernel.org, giulio.benetti@benettiengineering.com, linux-imx@nxp.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, cniedermaier@dh-electronics.com, dev@lynxeye.de, mturquette@baylibre.com, arnd@arndb.de, s.hauer@pengutronix.de, Mr.Bossman075@gmail.com, festevam@gmail.com, olof@lixom.net, robh+dt@kernel.org, linus.walleij@linaro.org, marcel.ziswiler@toradex.com, aisheng.dong@nxp.com, tglx@linutronix.de, kernel@pengutronix.de, linux@armlinux.org.uk, stefan@agner.ch, abel.vesa@nxp.com, sebastian.reichel@collabora.com, soc@kernel.org, shawnguo@kernel.org, leoyang.li@nxp.com, sboyd@kernel.org, linux-gpio@vger.kernel.org, tharvey@gateworks.com
In-Reply-To: <20220517032802.451743-6-Mr.Bossman075@gmail.com>
References: <20220517032802.451743-1-Mr.Bossman075@gmail.com> <20220517032802.451743-6-Mr.Bossman075@gmail.com>
Subject: Re: [PATCH v3 07/15] dt-bindings: clock: imx: Add documentation for i.MXRT1170 clock
Date: Tue, 17 May 2022 07:40:59 -0500
Message-Id: <1652791259.484121.785395.nullmailer@robh.at.kernel.org>

On Mon, 16 May 2022 23:27:54 -0400, Jesse Taube wrote:
> Add DT binding documentation for i.MXRT1170 clock driver.
> 
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
> V1 -> V2:
>  - Change title to Clock Controller
>  - Rename to add fsl
> V2 -> V3:
>  - Remove unused include causing error
> ---
>  .../bindings/clock/fsl,imxrt1170-clock.yaml   | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/fsl,imxrt1170-clock.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/clock/fsl,imxrt1170-clock.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/clock/fsl,imxrt1170-clock.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

