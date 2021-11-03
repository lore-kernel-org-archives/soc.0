Return-Path: <SRS0=Gllt=PW=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E3EDC433F5
	for <soc@archiver.kernel.org>; Wed,  3 Nov 2021 01:20:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 20C51610C8; Wed,  3 Nov 2021 01:20:46 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E580061051;
	Wed,  3 Nov 2021 01:20:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E580061051
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f41.google.com with SMTP id n13-20020a9d710d000000b005558709b70fso1339503otj.10;
        Tue, 02 Nov 2021 18:20:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=HT3Al7yEHGSK6UDiiYAJrJ+g635E3g2QC/oWZ2X7eXk=;
        b=W1j2vEyVj9Z7PCuSXYuNFT6hT7tSe45ESk6hVLgLHyG6ebG3851v4Fym3BoU/JZWIV
         QWaoXEzhCK30hY77yDz6IPQLYUvZ1+5wZ7e8x795lQ7MybCIyYo5NIaAScnwZUWufCrE
         3FX+I3jiemv1IqBKVtOgxzrAtWP03EXReRaGicQs3YYcCSlVNdpwCu7VNSpf5bBXgEYK
         Ew8HfjP+UjapiMkk549CpvHbBs/e/SpMaPd3ER0SxqjDXOdT5U14PxX/ioGi3+JyoSCr
         R5bq8nydQtXz0EVz3ax6gMek2xR3xYc3TZjDvNfrSEGrqiG7+WvF2XrsJfuvSEpIF7a3
         LTSA==
X-Gm-Message-State: AOAM532qNQoYuNI5ChzQC8T98r0tcdozuD69Elo3mN2QJCUbHL2yRdwY
	kW/cMmjDStpA0S3dssAkXA==
X-Google-Smtp-Source: ABdhPJxhVbGuEfatKMxasFBTo+fCT+0b/sjoW6AfDHk20XhnyuWHqQdGzyx+ihb2pZY1CE+wyKCCoQ==
X-Received: by 2002:a9d:6f8e:: with SMTP id h14mr1526386otq.50.1635902445227;
        Tue, 02 Nov 2021 18:20:45 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id 70sm158943otn.74.2021.11.02.18.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 18:20:44 -0700 (PDT)
Received: (nullmailer pid 3880385 invoked by uid 1000);
	Wed, 03 Nov 2021 01:20:37 -0000
From: Rob Herring <robh@kernel.org>
To: Jesse Taube <mr.bossman075@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: mturquette@baylibre.com, aisheng.dong@nxp.com, linux@armlinux.org.uk, s.hauer@pengutronix.de, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, adrian.hunter@intel.com, linux-mmc@vger.kernel.org, kernel@pengutronix.de, shawnguo@kernel.org, linus.walleij@linaro.org, linux-serial@vger.kernel.org, jirislaby@kernel.org, robh+dt@kernel.org, abel.vesa@nxp.com, festevam@gmail.com, ulf.hansson@linaro.org, linux-kernel@vger.kernel.org, stefan@agner.ch, olof@lixom.net, sboyd@kernel.org, Mr.Bossman075@gmail.com, nobuhiro1.iwamatsu@toshiba.co.jp, linux-clk@vger.kernel.org, arnd@arndb.de, devicetree@vger.kernel.org, linux-imx@nxp.com, soc@kernel.org, gregkh@linuxfoundation.org, giulio.benetti@benettiengineering.com
In-Reply-To: <20211102225701.98944-3-Mr.Bossman075@gmail.com>
References: <20211102225701.98944-1-Mr.Bossman075@gmail.com> <20211102225701.98944-3-Mr.Bossman075@gmail.com>
Subject: Re: [PATCH v2 02/13] dt-bindings: pinctrl: add i.MXRT1050 pinctrl binding doc
Date: Tue, 02 Nov 2021 20:20:37 -0500
Message-Id: <1635902437.626178.3880384.nullmailer@robh.at.kernel.org>

On Tue, 02 Nov 2021 18:56:50 -0400, Jesse Taube wrote:
> From: Jesse Taube <mr.bossman075@gmail.com>
> 
> Add i.MXRT1050 pinctrl binding doc
> 
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
> V1->V2:
> * Replace macros with values
> * Add tab for last pinctrl value
> ---
>  .../bindings/pinctrl/fsl,imxrt1050.yaml       | 83 +++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/pinctrl/fsl,imxrt1050.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.example.dt.yaml: iomuxc@401f8000: 'fsl,mux_mask', 'imxrt1050-evk' do not match any of the regexes: 'grp$', 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.example.dt.yaml: iomuxc@401f8000: 'pinctrl-0' is a dependency of 'pinctrl-names'
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/pinctrl/pinctrl-consumer.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1549987

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

