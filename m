Return-Path: <SRS0=QKBD=PN=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E876C433EF
	for <soc@archiver.kernel.org>; Mon, 25 Oct 2021 12:54:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E58B860FE8; Mon, 25 Oct 2021 12:54:17 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADFA860F9B;
	Mon, 25 Oct 2021 12:54:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ADFA860F9B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f174.google.com with SMTP id y207so15358938oia.11;
        Mon, 25 Oct 2021 05:54:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=nOxpnvvs9keLKH1c5NIl1Op/Q3M/paHDZ/uEML4RAj8=;
        b=rUTJcLt05U4r+sbmzyglBxt5NaK+tVqSCilQI/AOAG8GjZtL02ivGW7m/myma1LCG5
         53lS3pfsbN5bJJ/jE6sXhZm9iwOsEmMfWXGmqtmN7C/KiepgGrCsmQ8dhERUjoQk+44H
         dbGAAMRhhPWSdgz/d5Cp8r3e0Le4VBjJGHt0be6jO4AamUzzddsuayl2hQR3GHqxkF/R
         JatruOOE/i8z0+VHid+ohstFUnl1wcka/eFBjCitgAzKgMeMg8y08qlswJG3oeM8x6OH
         qXjM7nAIoC+HCxxuzPhm0HXeN8veYcJAAk5JaystGJNjHvCEffi6gVYtBukTHTZAU2ct
         cbNQ==
X-Gm-Message-State: AOAM531xV2k7rLw/oHM1eOtOILhg4T0efnqN1PFL7uJLRbWzLBJW5YPX
	+0+pgKuGg69dwCYQNUU2XQ==
X-Google-Smtp-Source: ABdhPJwAYx33aOCRRNq15+hxM7oFC/tQ62gb8M3eAH/L5tagUglqpAPdaQRE7dl7XsJg+Z68tP1Q1w==
X-Received: by 2002:a05:6808:118a:: with SMTP id j10mr22403635oil.101.1635166456864;
        Mon, 25 Oct 2021 05:54:16 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id r14sm3806703oiw.44.2021.10.25.05.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 05:54:16 -0700 (PDT)
Received: (nullmailer pid 190973 invoked by uid 1000);
	Mon, 25 Oct 2021 12:54:14 -0000
From: Rob Herring <robh@kernel.org>
To: Jesse Taube <mr.bossman075@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: aisheng.dong@nxp.com, linux-gpio@vger.kernel.org, leonard.crestez@nxp.com, b20788@freescale.com, linux-arm-kernel@lists.infradead.org, sboyd@kernel.org, gregkh@linuxfoundation.org, giulio.benetti@benettiengineering.com, olof@lixom.net, linux-kernel@vger.kernel.org, arnd@arndb.de, Mr.Bossman075@gmail.com, abel.vesa@nxp.com, linus.walleij@linaro.org, mturquette@baylibre.com, linux-mmc@vger.kernel.org, jirislaby@kernel.org, devicetree@vger.kernel.org, ulf.hansson@linaro.org, stefan@agner.ch, festevam@gmail.com, nobuhiro1.iwamatsu@toshiba.co.jp, shawnguo@kernel.org, robh+dt@kernel.org, fugang.duan@nxp.com, linux-serial@vger.kernel.org, linux@armlinux.org.uk, soc@kernel.org, s.hauer@pengutronix.de, linux-imx@nxp.com, linux-clk@vger.kernel.org, kernel@pengutronix.de, adrian.hunter@intel.com
In-Reply-To: <20211024154027.1479261-3-Mr.Bossman075@gmail.com>
References: <20211024154027.1479261-1-Mr.Bossman075@gmail.com> <20211024154027.1479261-3-Mr.Bossman075@gmail.com>
Subject: Re: [PATCH 02/13] dt-bindings: pinctrl: add i.MXRT1050 pinctrl binding doc
Date: Mon, 25 Oct 2021 07:54:14 -0500
Message-Id: <1635166454.807053.190972.nullmailer@robh.at.kernel.org>

On Sun, 24 Oct 2021 11:40:16 -0400, Jesse Taube wrote:
> Add i.MXRT1050 pinctrl binding doc
> 
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
>  .../bindings/pinctrl/fsl,imxrt1050.yaml       | 85 +++++++++++++++++++
>  1 file changed, 85 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/pinctrl/fsl,imxrt1050.yaml#
Error: Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.example.dts:27.15-16 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:385: Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1441: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1545393

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

