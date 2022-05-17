Return-Path: <SRS0=Sn8v=VZ=gmail.com=geert.uytterhoeven@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C45D9C433EF
	for <soc@archiver.kernel.org>; Tue, 17 May 2022 09:20:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 86AB8C34118; Tue, 17 May 2022 09:20:01 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4DCD4C385B8;
	Tue, 17 May 2022 09:20:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4DCD4C385B8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f175.google.com with SMTP id k8so14101324qki.8;
        Tue, 17 May 2022 02:20:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0Cj6phUb1dq1rPNMVBa9CpWp1pNYYkNb3ArN0qD91+8=;
        b=gGdDsVDzgmGGM7vbx0Awfg3E4hok9GOVzXQPaposK/fnjxQzj2/XH4JHiunf+39GVL
         xrS1J7ZC3SJV2yfHvD1SaL+j3BdolCB8D6x+bvRCzuCz49rEciUUwy3lor+7EKOt7AWW
         A/pgMC8f+2S+VUO1ErL3OT636+MGn4FNxPrsKgyfUKXQto4dTmYyX95HIP/Gxreoz/zF
         hsO9Q33j742pi1Czi7bjc5dKkxF8ixPqUJMiC5D54T9kkLEu3bzoWJ6iRXD2DO8jQuL2
         fhVdsIvjt9EQbUtwyGqR5ZO1QsIAbNdjX1t2mF31iPxJ3W9EJoqgjjEJwnOSVS40lWpn
         0pYg==
X-Gm-Message-State: AOAM5326LyCkIkf7o+kqz4zRm65H+KxaYjqWsP4qB4VOcRFlRFVYNmYB
	TNxeqnWr/JDfu2v7ak31d9GwF2O6YWht+A==
X-Google-Smtp-Source: ABdhPJxalfC/+NMSn/T0MAzAP1LS/2HUJ0XiMtKVIsbb8VtpuE7rbuHIEkZWzXrCaoa5PuwTqeKQ5A==
X-Received: by 2002:a05:620a:2092:b0:6a1:aa7:907b with SMTP id e18-20020a05620a209200b006a10aa7907bmr13979485qka.45.1652779199022;
        Tue, 17 May 2022 02:19:59 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id c28-20020a05620a201c00b0069fcf7678besm7203981qka.105.2022.05.17.02.19.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 May 2022 02:19:58 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id f16so7368014ybk.2;
        Tue, 17 May 2022 02:19:58 -0700 (PDT)
X-Received: by 2002:a25:4150:0:b0:64d:7747:9d93 with SMTP id
 o77-20020a254150000000b0064d77479d93mr13270137yba.36.1652779198364; Tue, 17
 May 2022 02:19:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220504131923.214367-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220504131923.214367-1-krzysztof.kozlowski@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 May 2022 11:19:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVc3kShpp8wieX1SSA8-37m8PbxpqKRs5+gxz8Dm6QwsA@mail.gmail.com>
Message-ID: <CAMuHMdVc3kShpp8wieX1SSA8-37m8PbxpqKRs5+gxz8Dm6QwsA@mail.gmail.com>
Subject: Re: [PATCH 00/13] dt-bindings/arm64: dts: qcom: minor cleanups with
 DT schema
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Manu Gautam <mgautam@codeaurora.org>, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>, 
	arm-soc <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 4, 2022 at 5:13 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> The patches are independent, so they can be picked up as is (or everything
> through Qualcomm SoC tree).
>
> Best regards,
> Krzysztof
>
> Krzysztof Kozlowski (13):
>   dt-bindings: soc: qcom: aoss: document qcom,sm8450-aoss-qmp
>   dt-bindings: soc: qcom: qcom,smd-rpm: add power-controller
>   dt-bindings: usb: qcom,dwc3: add IPQ8074, MSM8994, QCS404 and SM6125
>   dt-bindings: usb: qcom,dwc3: fix clock matching
>   arm64: dts: qcom: add missing AOSS QMP compatible fallback
>   arm64: dts: qcom: correct DWC3 node names and unit addresses
>   arm64: dts: qcom: ipq8074: add dedicated qcom,ipq8074-dwc3 compatible
>   arm64: dts: qcom: msm8994: add dedicated qcom,msm8994-dwc3 compatible
>   arm64: dts: qcom: sm6125: add dedicated qcom,sm6125-dwc3 compatible
>   arm64: dts: qcom: qcs404: add dedicated qcom,qcs404-dwc3 compatible
>   arm64: dts: qcom: msm8996: add clock-names to DWC3 USB node
>   arm64: dts: qcom: align DWC3 USB clocks with DT schema
>   arm64: dts: qcom: align DWC3 USB interrupts with DT schema

Looks like all but the first two were applied to usb-next by Greg,
causing conflicts with the soc/for-next tree.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
