Return-Path: <SRS0=Gllt=PW=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47DE9C433EF
	for <soc@archiver.kernel.org>; Wed,  3 Nov 2021 01:20:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2AC8B61152; Wed,  3 Nov 2021 01:20:44 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6A5361053;
	Wed,  3 Nov 2021 01:20:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E6A5361053
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f45.google.com with SMTP id o10-20020a9d718a000000b00554a0fe7ba0so1323262otj.11;
        Tue, 02 Nov 2021 18:20:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=eg6tDiGhmQHR7M4AmqkelwPUQFNkN8vUJTDKmaxB1zA=;
        b=rnlSCENzkP0ToP0ivi8jyvrqvv+pWuysxgqH3Q47Srd6HMjeDHC/YBGIc4chOhB6TI
         8OLqMrpuGUpIYvE8TpTep3il4TAUrm+G4G6Yuvc3jIUVqUEyuhZs1bY8OvWxFizoTBKt
         DmSp6GboSU8Wx5P+L7zxCESvrGnS5GsLUQbGwcRySJt9vQ0cBpVC+kpHigHEkWpRO3kC
         Fgf+DDcO8b4ViQCaQaXxUdv1+yaVYODSdujL0r9USFtV4mZDx+RIGh3g3Kb9j313LsSi
         M1PtUnROH4/hkPYnDYalC/g1IJXbbPuF+AcuwA29TXi6kbJPfK6Il1pIIyG+lUWiN/bD
         +M7Q==
X-Gm-Message-State: AOAM5324W1cCk4YM1lUkEWHeU9dRopQ1EIEBS3Qclj88KrvSHc7C/BFX
	Z9BnjrO5Fv2qBlHh5GU7Qw==
X-Google-Smtp-Source: ABdhPJxI8TysvZeSMHo8n8LYydlYVwW/NQ65dvUrt2keSHitPnqMkxfUQNAAk5YzrbMonVWDUAFRtg==
X-Received: by 2002:a05:6830:1448:: with SMTP id w8mr24209350otp.345.1635902443178;
        Tue, 02 Nov 2021 18:20:43 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id p190sm179766ooa.1.2021.11.02.18.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 18:20:42 -0700 (PDT)
Received: (nullmailer pid 3880387 invoked by uid 1000);
	Wed, 03 Nov 2021 01:20:37 -0000
From: Rob Herring <robh@kernel.org>
To: Jesse Taube <mr.bossman075@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Mr.Bossman075@gmail.com, robh+dt@kernel.org, shawnguo@kernel.org, mturquette@baylibre.com, linux-gpio@vger.kernel.org, kernel@pengutronix.de, olof@lixom.net, linux-kernel@vger.kernel.org, adrian.hunter@intel.com, gregkh@linuxfoundation.org, ulf.hansson@linaro.org, linus.walleij@linaro.org, nobuhiro1.iwamatsu@toshiba.co.jp, jirislaby@kernel.org, linux-clk@vger.kernel.org, aisheng.dong@nxp.com, festevam@gmail.com, linux@armlinux.org.uk, soc@kernel.org, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com, devicetree@vger.kernel.org, abel.vesa@nxp.com, s.hauer@pengutronix.de, giulio.benetti@benettiengineering.com, linux-mmc@vger.kernel.org, linux-serial@vger.kernel.org, arnd@arndb.de, stefan@agner.ch, sboyd@kernel.org
In-Reply-To: <20211102225701.98944-6-Mr.Bossman075@gmail.com>
References: <20211102225701.98944-1-Mr.Bossman075@gmail.com> <20211102225701.98944-6-Mr.Bossman075@gmail.com>
Subject: Re: [PATCH v2 05/13] dt-bindings: clock: imx: Add documentation for i.MXRT clock
Date: Tue, 02 Nov 2021 20:20:37 -0500
Message-Id: <1635902437.638872.3880386.nullmailer@robh.at.kernel.org>

On Tue, 02 Nov 2021 18:56:53 -0400, Jesse Taube wrote:
> From: Jesse Taube <mr.bossman075@gmail.com>
> 
> Add DT binding documentation for i.MXRT clock driver.
> 
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
> V1->V2:
> * Replace macros with values
> ---
>  .../bindings/clock/imxrt-clock.yaml           | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/imxrt-clock.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/clock/imxrt-clock.example.dt.yaml:0:0: /example-0/anatop@400d8000: failed to match any schema with compatible: ['fsl,imxrt-anatop']
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/imxrt-clock.example.dt.yaml: ccm@400fc000: interrupts: [[95], [96]] is too long
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/imxrt-clock.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/imxrt-clock.example.dt.yaml: timer@401ec000: clocks: [[4294967295, 3]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/imxrt-clock.example.dt.yaml: timer@401ec000: clock-names:0: 'ipg' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/imxrt-clock.example.dt.yaml: timer@401ec000: clock-names: ['per'] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1549993

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

