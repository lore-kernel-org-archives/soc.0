Return-Path: <SRS0=kMf3=TT=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2FC5C433F5
	for <soc@archiver.kernel.org>; Tue,  8 Mar 2022 01:07:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A32BDC340E9; Tue,  8 Mar 2022 01:07:51 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D41D5C340EF;
	Tue,  8 Mar 2022 01:07:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D41D5C340EF
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f175.google.com with SMTP id k2so17249063oia.2;
        Mon, 07 Mar 2022 17:07:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=4Vh0skU/TpnaqVycF2Gk7ec7Z9iE5PhyKRGG3sXCJBg=;
        b=7QRjDMtjkimCKGBYy4jP0KiKyrzHfSLArsxDlIohkPDfIh7aq1mP4PFtaSouX94/+l
         3IGvTslz1UzD0RgVTNSlOvFJ31G1z+BUPNgo8rWW/54T5wFmE8sHOJpEdSNuchNxH4cg
         YPtDg7wTkYR5fTEs/t2Jc+eSon5HCkc24GRgbW7zPJRcQXtD/T7tN60DfZTj7O2ZdDdl
         hdcfse8Hra5wRVSzieZ9hBuS9WF/S747KrG5ErO6/yZNZe++LyeJSnKpPNCteYZrhNzt
         MqvvmlwIkghffXibdbR/UNmT098kAl74VkafHdQTCZPCFMV+/WetDzFOvEmRY/g1w7cQ
         uB8w==
X-Gm-Message-State: AOAM533W3oYn22426Qxfvzy7wXpNH21lcu8gat7T6TtvRYrdGc/dHxui
	fEI+9ICRhLUUFo1qMBBRlw==
X-Google-Smtp-Source: ABdhPJxEXFX5X26D3/ir03omCumnoMENEbRGwsO3RleYVqWM2D929Ye1JbqjPzZIxCh8ZhbBCUC6lg==
X-Received: by 2002:a05:6808:1450:b0:2d9:dad1:a14e with SMTP id x16-20020a056808145000b002d9dad1a14emr1137355oiv.294.1646701669918;
        Mon, 07 Mar 2022 17:07:49 -0800 (PST)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id q16-20020a9d4b10000000b005b22b93d468sm3186416otf.74.2022.03.07.17.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 17:07:49 -0800 (PST)
Received: (nullmailer pid 3624787 invoked by uid 1000);
	Tue, 08 Mar 2022 01:07:40 -0000
From: Rob Herring <robh@kernel.org>
To: Jacky Huang <ychuang3@nuvoton.com>
List-Id: <soc.lore.kernel.org>
Cc: sboyd@kernel.org, robh+dt@kernel.org, mturquette@baylibre.com, linux-clk@vger.kernel.org, soc@kernel.org, linux-arm-kernel@lists.infradead.org, arnd@arndb.de, olof@lixom.net, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20220307091923.9909-3-ychuang3@nuvoton.com>
References: <20220307091923.9909-1-ychuang3@nuvoton.com> <20220307091923.9909-3-ychuang3@nuvoton.com>
Subject: Re: [PATCH 2/3] dt-bindings: clock: Document MA35D1 clock controller bindings
Date: Mon, 07 Mar 2022 19:07:40 -0600
Message-Id: <1646701660.895821.3624783.nullmailer@robh.at.kernel.org>

On Mon, 07 Mar 2022 17:19:22 +0800, Jacky Huang wrote:
> Add documentation to describe Nuvoton MA35D1 clock driver bindings.
> 
> Signed-off-by: Jacky Huang <ychuang3@nuvoton.com>
> ---
>  .../bindings/clock/nuvoton,ma35d1-clk.yaml    | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/nuvoton,ma35d1-clk.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/nuvoton,ma35d1-clk.yaml: properties: 'clocks' is a dependency of 'assigned-clocks'
	from schema $id: http://devicetree.org/meta-schemas/clocks.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/nuvoton,ma35d1-clk.yaml: ignoring, error in schema: properties
Error: Documentation/devicetree/bindings/clock/nuvoton,ma35d1-clk.example.dts:24.37-38 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:378: Documentation/devicetree/bindings/clock/nuvoton,ma35d1-clk.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1398: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1601972

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

