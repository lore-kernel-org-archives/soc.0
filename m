Return-Path: <SRS0=QKBD=PN=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13024C433FE
	for <soc@archiver.kernel.org>; Mon, 25 Oct 2021 12:54:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DED5861073; Mon, 25 Oct 2021 12:54:21 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9963C60FDA;
	Mon, 25 Oct 2021 12:54:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9963C60FDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f50.google.com with SMTP id l24-20020a9d1c98000000b00552a5c6b23cso14773253ota.9;
        Mon, 25 Oct 2021 05:54:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=xfPmPgNFQgIKrWKVU27Szuu0QsSCtm+5R24aa/F4BSg=;
        b=CHoBcMHxKOoQWc8niYfhK1lL0dMC6+RTYpHKaO4OBWvXZ/eaSg+zSmpOTh1J6K88iy
         Gn7jYz3XDd4BZ1Ox8licqjA4rR3C+wT5VsZnO4FrjvJXcJHCUTzqVt7x58/R3KHyYx9u
         qufvBjNGFCCm7MkKUoolbmR/JEIKllPRJkr7tV3aHG2vyr7vgIO/PaYv+6vyKRXWu3KE
         edhZ4C3xeE7KzWuSSdYxXy+bOdRmsrhhIEjcv/9nkL3+3WdUGjjUcS13Z4IBFU1QL0ZU
         jRfkrnaLP/NAefCqgrVWdDT6wdzoRkG7y2t+OLLgMyBE3b9oltlryj+T6+eS63g+lab6
         q0vg==
X-Gm-Message-State: AOAM533zPgLXSdRYvVzub5U4lnNnz6W3BmwthEyzo63ttrzWBkJiQyWT
	mZDizKxosorRZ4Jbw8DeYw==
X-Google-Smtp-Source: ABdhPJxSzDa6Aw86E7HU9PcZR3V6hQx/apZrKRCDa2ilOHhh7Q1/dkrii+HwuqomKgo/nUzIa6Dt1Q==
X-Received: by 2002:a05:6830:1e08:: with SMTP id s8mr13970909otr.305.1635166460875;
        Mon, 25 Oct 2021 05:54:20 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id bf3sm3946646oib.34.2021.10.25.05.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 05:54:20 -0700 (PDT)
Received: (nullmailer pid 190976 invoked by uid 1000);
	Mon, 25 Oct 2021 12:54:14 -0000
From: Rob Herring <robh@kernel.org>
To: Jesse Taube <mr.bossman075@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: arnd@arndb.de, mturquette@baylibre.com, olof@lixom.net, aisheng.dong@nxp.com, sboyd@kernel.org, Mr.Bossman075@gmail.com, fugang.duan@nxp.com, nobuhiro1.iwamatsu@toshiba.co.jp, adrian.hunter@intel.com, linux-arm-kernel@lists.infradead.org, b20788@freescale.com, linux-serial@vger.kernel.org, gregkh@linuxfoundation.org, linus.walleij@linaro.org, ulf.hansson@linaro.org, linux-kernel@vger.kernel.org, kernel@pengutronix.de, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, s.hauer@pengutronix.de, abel.vesa@nxp.com, leonard.crestez@nxp.com, linux@armlinux.org.uk, shawnguo@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org, jirislaby@kernel.org, linux-imx@nxp.com, linux-mmc@vger.kernel.org, festevam@gmail.com, stefan@agner.ch, giulio.benetti@benettiengineering.com, soc@kernel.org
In-Reply-To: <20211024154027.1479261-6-Mr.Bossman075@gmail.com>
References: <20211024154027.1479261-1-Mr.Bossman075@gmail.com> <20211024154027.1479261-6-Mr.Bossman075@gmail.com>
Subject: Re: [PATCH 05/13] dt-bindings: clock: imx: Add documentation for i.MXRT clock
Date: Mon, 25 Oct 2021 07:54:14 -0500
Message-Id: <1635166454.818167.190975.nullmailer@robh.at.kernel.org>

On Sun, 24 Oct 2021 11:40:19 -0400, Jesse Taube wrote:
> Add DT binding documentation for i.MXRT clock driver.
> 
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
>  .../bindings/clock/imxrt-clock.yaml           | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/imxrt-clock.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/clock/imxrt-clock.example.dts:32.27-28 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:385: Documentation/devicetree/bindings/clock/imxrt-clock.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1441: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1545398

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

