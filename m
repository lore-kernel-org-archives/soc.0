Return-Path: <SRS0=ZyH1=HF=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A4AC61D97
	for <soc@archiver.kernel.org>; Fri, 24 Nov 2023 23:22:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 511C3C433C7; Fri, 24 Nov 2023 23:22:47 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 22B61C433CB
	for <soc@kernel.org>; Fri, 24 Nov 2023 23:22:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 22B61C433CB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-67a0836e635so10035596d6.2
        for <soc@kernel.org>; Fri, 24 Nov 2023 15:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700868164; x=1701472964; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E5nMDTtOQLcgHcYf3AhjJfRtmN2DqrR45HtW3cVWOzw=;
        b=kJ4+bxG9kRK5nQI1HsLueic3P9GVtxJMUP+dT1lTDLAQLN24IXjsgGaD7ZrHbu+6OB
         pM/QKGJIF8DtKmhCgjBGMPLfDBEgoFQaqhM5O0XFRxRdQppsBs0TH00lFyrhSg3En5fa
         /EK0bi/uKVZb87f9nAHNE2DGM9Sjl/h2byVjpq4xasa+1f9ZMEbATebJOnCDUVJ+ZjSe
         j+uY1i6MtxHAQGcJNHKrs3FVYr5w/eH8TZ/G0rVErdANLEFWx6CbheZzswI5Ngz5s1pc
         zQcGZboSIjLbJ3zE3AE/VkYSLg3Wbi/PDRdDr8S8BGRt7QcuSx2If2xOkxZsoegpEQdg
         sqsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700868164; x=1701472964;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E5nMDTtOQLcgHcYf3AhjJfRtmN2DqrR45HtW3cVWOzw=;
        b=wClkkKNNYqoG3zqsHD0L888NliKJlNtPa+/5utSeSwZAl+32lrA6tqZiPXR4ypZhjK
         WSusBXnqz59glXvlHUxIFERRdRpedx7yrwLZEgUqJ9rumCz/M/gvz1zMBdgUjCVmAyUA
         hMDt80v6Dkg5KWf+HeKqdciza5fY/QDNr7KiagFbl/PV1HUyhXFHeN4p0Sao61vihtED
         jydIf/cR5wNTnhVQRudmxbD7pImPkunw+aPJmHT9T7L40tmJm7JBEOtj/nmgU8KAFviA
         i7qBAVZ6vDkGLlAeDvrka33IvGEtW30owWhDTkWm2u8DsxVQArvUb0gbiC6YYibLPdF5
         GG3g==
X-Gm-Message-State: AOJu0Yz1D5yJQxj+g3nuK4la8BHuUATT8eCvbuvHvzjLfEKH1CPEl0U1
	NmrgPqXSPiP+2LxDUpF5X1jDAie1GkBUwUelxIVDyA==
X-Google-Smtp-Source: AGHT+IEjuQLNaGggFU8MosnNJZXuB+cB3Jfd3qXypDWwUEWP4Auhl766yikOfki9VYXPb7XM9tRstFp8E9Md9JPAQ/M=
X-Received: by 2002:a05:6214:2aa2:b0:67a:2554:28c6 with SMTP id
 js2-20020a0562142aa200b0067a255428c6mr839328qvb.26.1700868163786; Fri, 24 Nov
 2023 15:22:43 -0800 (PST)
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org>
 <20231011184823.443959-18-peter.griffin@linaro.org> <33fe3e2e-9d09-42ee-9472-25d3be09baf4@linaro.org>
In-Reply-To: <33fe3e2e-9d09-42ee-9472-25d3be09baf4@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 24 Nov 2023 23:22:32 +0000
Message-ID: <CADrjBPrh19YzB45hM4xaELn67uf3iBQo++T-8+2Uenq6-fDzKg@mail.gmail.com>
Subject: Re: [PATCH v3 17/20] arm64: dts: google: Add initial Google gs101 SoC support
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
	cw00.choi@samsung.com, tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
	semen.protsenko@linaro.org, saravanak@google.com, willmcvicker@google.com, 
	soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Thu, 12 Oct 2023 at 07:40, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 11/10/2023 20:48, Peter Griffin wrote:
>
> ...
>
> > diff --git a/arch/arm64/boot/dts/google/gs101.dtsi b/arch/arm64/boot/dts/google/gs101.dtsi
> > new file mode 100644
> > index 000000000000..37fb0a4dc8d3
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/google/gs101.dtsi
> > @@ -0,0 +1,504 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * GS101 SoC
> > + *
> > + * Copyright 2019-2023 Google LLC
> > + *
> > + */
> > +
> > +#include <dt-bindings/clock/google,gs101.h>
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +/ {
> > +     compatible = "google,gs101";
> > +     #address-cells = <2>;
> > +     #size-cells = <1>;
> > +
> > +     interrupt-parent = <&gic>;
> > +
> > +     aliases {
> > +             pinctrl0 = &pinctrl_0;
> > +             pinctrl1 = &pinctrl_1;
> > +             pinctrl2 = &pinctrl_2;
> > +             pinctrl3 = &pinctrl_3;
> > +             pinctrl4 = &pinctrl_4;
> > +             pinctrl5 = &pinctrl_5;
> > +             pinctrl6 = &pinctrl_6;
> > +             pinctrl7 = &pinctrl_7;
> > +             serial0 = &serial_0;
> > +     };
> > +
> > +     arm-pmu {
>
> pmu-0

will fix
>
> > +             compatible = "arm,armv8-pmuv3";
> > +             interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
> > +     };
> > +
> > +     dsu-pmu-0 {
>
> pmu-1

will fix

>
>
> > +             compatible = "arm,dsu-pmu";
> > +             interrupts = <GIC_SPI 257 IRQ_TYPE_LEVEL_HIGH>;
> > +             cpus = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>,
> > +                    <&cpu4>, <&cpu5>, <&cpu6>, <&cpu7>;
> > +     };
> > +
> > +     /* TODO replace with CCF clock */
> > +     dummy_clk: oscillator {
> > +             compatible = "fixed-clock";
> > +             #clock-cells = <0>;
> > +             clock-frequency = <12345>;
> > +             clock-output-names = "pclk";
> > +     };
> > +
> > +     cpus {
> > +             #address-cells = <2>;
> > +             #size-cells = <0>;
> > +
> > +             cpu-map {
> > +                     cluster0 {
> > +                             core0 {
> > +                                     cpu = <&cpu0>;
> > +                             };
> > +                             core1 {
> > +                                     cpu = <&cpu1>;
> > +                             };
> > +                             core2 {
> > +                                     cpu = <&cpu2>;
> > +                             };
> > +                             core3 {
> > +                                     cpu = <&cpu3>;
> > +                             };
> > +                     };
> > +
> > +                     cluster1 {
> > +                             core0 {
> > +                                     cpu = <&cpu4>;
> > +                             };
> > +                             core1 {
> > +                                     cpu = <&cpu5>;
> > +                             };
> > +                     };
> > +
> > +                     cluster2 {
> > +                             core0 {
> > +                                     cpu = <&cpu6>;
> > +                             };
> > +                             core1 {
> > +                                     cpu = <&cpu7>;
> > +                             };
> > +                     };
> > +             };
> > +
> > +             cpu0: cpu@0 {
> > +                     device_type = "cpu";
> > +                     compatible = "arm,armv8";
> > +                     reg = <0x0 0x0000>;
> > +                     enable-method = "psci";
> > +                     cpu-idle-states =  <&ANANKE_CPU_SLEEP>;
> > +                     capacity-dmips-mhz = <250>;
> > +                     dynamic-power-coefficient = <70>;
> > +             };
> > +
> > +             cpu1: cpu@100 {
> > +                     device_type = "cpu";
> > +                     compatible = "arm,armv8";
> > +                     reg = <0x0 0x0100>;
> > +                     enable-method = "psci";
> > +                     cpu-idle-states =  <&ANANKE_CPU_SLEEP>;
> > +                     capacity-dmips-mhz = <250>;
> > +                     dynamic-power-coefficient = <70>;
> > +             };
> > +
> > +             cpu2: cpu@200 {
> > +                     device_type = "cpu";
> > +                     compatible = "arm,armv8";
> > +                     reg = <0x0 0x0200>;
> > +                     enable-method = "psci";
> > +                     cpu-idle-states =  <&ANANKE_CPU_SLEEP>;
> > +                     capacity-dmips-mhz = <250>;
> > +                     dynamic-power-coefficient = <70>;
> > +             };
> > +
> > +             cpu3: cpu@300 {
> > +                     device_type = "cpu";
> > +                     compatible = "arm,armv8";
> > +                     reg = <0x0 0x0300>;
> > +                     enable-method = "psci";
> > +                     cpu-idle-states =  <&ANANKE_CPU_SLEEP>;
> > +                     capacity-dmips-mhz = <250>;
> > +                     dynamic-power-coefficient = <70>;
> > +             };
> > +
> > +             cpu4: cpu@400 {
> > +                     device_type = "cpu";
> > +                     compatible = "arm,armv8";
> > +                     reg = <0x0 0x0400>;
> > +                     enable-method = "psci";
> > +                     cpu-idle-states =  <&ENYO_CPU_SLEEP>;
> > +                     capacity-dmips-mhz = <620>;
> > +                     dynamic-power-coefficient = <284>;
> > +             };
> > +
> > +             cpu5: cpu@500 {
> > +                     device_type = "cpu";
> > +                     compatible = "arm,armv8";
> > +                     reg = <0x0 0x0500>;
> > +                     enable-method = "psci";
> > +                     cpu-idle-states =  <&ENYO_CPU_SLEEP>;
> > +                     capacity-dmips-mhz = <620>;
> > +                     dynamic-power-coefficient = <284>;
> > +             };
> > +
> > +             cpu6: cpu@600 {
> > +                     device_type = "cpu";
> > +                     compatible = "arm,armv8";
> > +                     reg = <0x0 0x0600>;
> > +                     enable-method = "psci";
> > +                     cpu-idle-states =  <&HERA_CPU_SLEEP>;
> > +                     capacity-dmips-mhz = <1024>;
> > +                     dynamic-power-coefficient = <650>;
> > +             };
> > +
> > +             cpu7: cpu@700 {
> > +                     device_type = "cpu";
> > +                     compatible = "arm,armv8";
> > +                     reg = <0x0 0x0700>;
> > +                     enable-method = "psci";
> > +                     cpu-idle-states =  <&HERA_CPU_SLEEP>;
> > +                     capacity-dmips-mhz = <1024>;
> > +                     dynamic-power-coefficient = <650>;
> > +             };
> > +
> > +             idle-states {
> > +                     entry-method = "psci";
> > +
> > +                     ANANKE_CPU_SLEEP: cpu-ananke-sleep {
> > +                             idle-state-name = "c2";
> > +                             compatible = "arm,idle-state";
> > +                             arm,psci-suspend-param = <0x0010000>;
> > +                             entry-latency-us = <70>;
> > +                             exit-latency-us = <160>;
> > +                             min-residency-us = <2000>;
> > +                     };
> > +
> > +                     ENYO_CPU_SLEEP: cpu-enyo-sleep {
> > +                             idle-state-name = "c2";
> > +                             compatible = "arm,idle-state";
> > +                             arm,psci-suspend-param = <0x0010000>;
> > +                             entry-latency-us = <150>;
> > +                             exit-latency-us = <190>;
> > +                             min-residency-us = <2500>;
> > +                     };
> > +
> > +                     HERA_CPU_SLEEP: cpu-hera-sleep {
> > +                             idle-state-name = "c2";
> > +                             compatible = "arm,idle-state";
> > +                             arm,psci-suspend-param = <0x0010000>;
> > +                             entry-latency-us = <235>;
> > +                             exit-latency-us = <220>;
> > +                             min-residency-us = <3500>;
> > +                     };
> > +             };
> > +     };
> > +
> > +     /* bootloader requires ect node */
> > +     ect {
>
> This needs bindings.

I experimented a bit more and the minimum I need is an empty dt node
called ect, otherwise the bootloader will boot loop and we can't boot
the kernel
[   2.977870] [E] [BOOT] fdt /ect path not found -1

Apart from a comment indicating that the bootloader requires this
empty ect dt node, what other bindings documentation would you like to
see? Something in google.yaml?

>
> > +             parameter_address = <0x90000000>;
>
> No underscores in property names. Use hyphen.
>
> > +             parameter_size = <0x53000>;
>
> No underscores.

Fortunately I can remove parameter_address and parameter_size and
still boot, so I will remove these in the next version.

Thanks,

Peter.
