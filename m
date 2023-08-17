Return-Path: <SRS0=hbiz=EC=gmail.com=zhang.lyra@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC7BC27C7A
	for <soc@archiver.kernel.org>; Thu, 17 Aug 2023 08:26:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DE31BC433C8; Thu, 17 Aug 2023 08:26:53 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 108CFC433C7;
	Thu, 17 Aug 2023 08:26:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 108CFC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-52580a24128so2269953a12.2;
        Thu, 17 Aug 2023 01:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692260810; x=1692865610;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rlMF7ovViqq0ugED3FJJqRatkLdBYCCpmtAAJM1UKiU=;
        b=WbPo41i8cd8rXCJCH7lp5U8AZvrgq8oK6KGNF9B9RA3rxb4kM4wuYqU+7Y8chQBvE3
         HhTX0hcbfOSdgnbhITIebmMXMwbKq83qdIlYxf5U+cDVJm8HyWXP4Hm6jxfDXd6r4U0K
         Rnf+v+pEaOSGR4AtBcCgbDTo1frIB6bTL8Sg+0o4puPXlCGDqCRb+9ADLIQCxWHn+2qw
         DTpv0Iwb7qjjuHG881e10e48pKZTnEvkldQMqZ0aMMxAG4A26kMzOuBr02drvFaDn/ip
         JTfuMy77HEH2undGaGzUOW8kIFd87HE/7D24yThDXgGZPrvRgDBGktJzRv0e9dEUvPJ2
         0J0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692260810; x=1692865610;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rlMF7ovViqq0ugED3FJJqRatkLdBYCCpmtAAJM1UKiU=;
        b=OxqsoZS6Q7p3uVFJ8jtjI1DjMKMFURzN6GPjIuPVSRt6AF5w80SjpZ5p59mOgc2kAE
         V7t6RJ7v0ZZX1Y22CGVJ8wHvzH5c9PGGsiqBO5AOvBe/OXI3W1jxlU7X56xM/ARM+SXc
         bAuaI7ji4Aam6ZFGoGyf0gv/2reqFGmluYSdNAy59jJuqLGTg3DKs2pM+WZhVqOTlNE0
         dhMhO+TSjz+HMBT5qYpfmtRRiN4c3w2Mmqr8az1o0P0EsAUK1XHs5FEkbBqV+oc5Nico
         dGjhy8cqFv/TuNIqMdxZbLVc1VMUT0r+bQMrrTF9ufZYhdVttiKBvk/vaurw3xfDJRjP
         9Mdg==
X-Gm-Message-State: AOJu0Yxhl0PqdcHwGeHp3f1jcacXRaS0R4bH5GsChln90wzmVcFZeyZ5
	frot7e5OEjkbxCzyRCE+JyCUxfQF370PWdFEfjE=
X-Google-Smtp-Source: AGHT+IEwUb269mLv8B048N5rOpTXPkPv81uaXg2r0melQjmsUDZLA2j3D1qFboxx371HLTQyJKsI5SWjYOFvVdx14Fk=
X-Received: by 2002:aa7:cd13:0:b0:523:19f0:b113 with SMTP id
 b19-20020aa7cd13000000b0052319f0b113mr3840035edw.31.1692260809792; Thu, 17
 Aug 2023 01:26:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230711162346.5978-1-cixi.geng@linux.dev>
In-Reply-To: <20230711162346.5978-1-cixi.geng@linux.dev>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Thu, 17 Aug 2023 16:26:12 +0800
Message-ID: <CAAfSe-sorWk5zhzevAoxwbiyk2YoDU9d47FLXcT43q1ZwHdvdg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: sprd: fix the cpu node for UMS512
List-Id: <soc.lore.kernel.org>
To: Cixi Geng <cixi.geng@linux.dev>, SoC Team <soc@kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	orsonzhai@gmail.com, baolin.wang@linux.alibaba.com, arnd@arndb.de, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	cixi.geng1@unisoc.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 12 Jul 2023 at 00:24, Cixi Geng <cixi.geng@linux.dev> wrote:
>
> From: Cixi Geng <cixi.geng1@unisoc.com>
>
> The UMS512 Socs have 8 cores contains 6 a55 and 2 a75.
> modify the cpu nodes to correct information.
>
> Fixes: 2b4881839a39 ("arm64: dts: sprd: Add support for Unisoc's UMS512")
> Signed-off-by: Cixi Geng <cixi.geng1@unisoc.com>

Acked-by: Chunyan Zhang <zhang.lyra@gmail.com>

Thanks,
Chunyan




> ---
>  arch/arm64/boot/dts/sprd/ums512.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/sprd/ums512.dtsi b/arch/arm64/boot/dts/sprd/ums512.dtsi
> index 024be594c47d..97ac550af2f1 100644
> --- a/arch/arm64/boot/dts/sprd/ums512.dtsi
> +++ b/arch/arm64/boot/dts/sprd/ums512.dtsi
> @@ -96,7 +96,7 @@ CPU5: cpu@500 {
>
>                 CPU6: cpu@600 {
>                         device_type = "cpu";
> -                       compatible = "arm,cortex-a55";
> +                       compatible = "arm,cortex-a75";
>                         reg = <0x0 0x600>;
>                         enable-method = "psci";
>                         cpu-idle-states = <&CORE_PD>;
> @@ -104,7 +104,7 @@ CPU6: cpu@600 {
>
>                 CPU7: cpu@700 {
>                         device_type = "cpu";
> -                       compatible = "arm,cortex-a55";
> +                       compatible = "arm,cortex-a75";
>                         reg = <0x0 0x700>;
>                         enable-method = "psci";
>                         cpu-idle-states = <&CORE_PD>;
> --
> 2.34.1
>
