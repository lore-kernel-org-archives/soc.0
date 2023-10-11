Return-Path: <SRS0=2bQ/=FZ=google.com=willmcvicker@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32147CDB482
	for <soc@archiver.kernel.org>; Wed, 11 Oct 2023 21:55:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1769CC433CA; Wed, 11 Oct 2023 21:55:59 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EA8EEC433C9
	for <soc@kernel.org>; Wed, 11 Oct 2023 21:55:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EA8EEC433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1c9b70b9671so27685ad.1
        for <soc@kernel.org>; Wed, 11 Oct 2023 14:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697061356; x=1697666156; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G/VI1T6Gc+cmhbjX/uIBr6xwzKYJ41bXjCF3hoBcXSk=;
        b=A7XrvExNhM7srajzxWahb6YUfWD40Iy8rwNmsDbp4hEka9NrqBIZ9dRJ3TDkxK3+6M
         ALYxTYSI7nQzxeUKD6Z8oHLKx1lfeuOzuZI5/26RB1lw0gMsY18bQ+IbdNVJ9UGH0qlO
         PSU4oIXyOfO0NDOv0he8vtnFTgZKQuw3YFVBGNFfIE8NqtQEjUfI1UC6OkrxOmQrkkKm
         1x5g44DIDqeFHbTgKxI0Ldv9dGx7ye/T51x6P5RdDbOcwq/GLsHpM2zPHDRTEzaztkAn
         pdxt+I5mKff4itHW2mPO+UElKTf0f/SbC3eYEmMJJ2Gnl1jgQURv3v7Y5+LpOp19gJhK
         yUzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697061356; x=1697666156;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G/VI1T6Gc+cmhbjX/uIBr6xwzKYJ41bXjCF3hoBcXSk=;
        b=schjzAaPkPTyk3lFu29vNetYbGtx7JgOFmLVSYqOGnTDX4MYSm3JHsq4l9FCZJBAU9
         KCoqi53TXKGiRwItWbECmU2UfDnZGtkF/lRHO6tphoxk/pYbFBsw3YjFdMFpzNEs3uM9
         uaKpXXJ8DXTdCRd6gL797xgvcfhaNvwMSiG4FlL2chVO5FKVO8uTaiiaZMy+EyRNlRAl
         7Q1MJPDr4heiJGhMOfLAUzBt/Iw0P4clIsrelOoCysQIEje0zA6jFU0EuHmTCAIANPDp
         vyKzQ59h20ri2A2qsbR/9lAFzCOOW67vNtWyGEmy5MiD/AXJjyIJbYrBcfjO9B+Yv2uC
         M1zg==
X-Gm-Message-State: AOJu0Yx/ONvFh3MQ/qo5Uu4J+DjPXFn+qf6RLgt9JBlrfXc/jhXfEDWL
	wjMnE4hXciZc1eRoGouc+S6mfQ==
X-Google-Smtp-Source: AGHT+IH26ndrbRmlPXq3wQJVSDukvD+Vyc34hMIx/sm9X8JrygezPnauwA7sBJz/7ERG9RJTkTLm7g==
X-Received: by 2002:a17:903:18b:b0:1c6:ec8:4c82 with SMTP id z11-20020a170903018b00b001c60ec84c82mr303171plg.23.1697061356195;
        Wed, 11 Oct 2023 14:55:56 -0700 (PDT)
Received: from google.com (13.65.82.34.bc.googleusercontent.com. [34.82.65.13])
        by smtp.gmail.com with ESMTPSA id z125-20020a633383000000b0058a381de499sm327436pgz.77.2023.10.11.14.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 14:55:55 -0700 (PDT)
Date: Wed, 11 Oct 2023 14:55:52 -0700
From: William McVicker <willmcvicker@google.com>
To: Peter Griffin <peter.griffin@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
	tomasz.figa@gmail.com, s.nawrocki@samsung.com,
	linus.walleij@linaro.org, wim@linux-watchdog.org,
	linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
	arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
	cw00.choi@samsung.com, tudor.ambarus@linaro.org,
	andre.draszik@linaro.org, semen.protsenko@linaro.org,
	saravanak@google.com, soc@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
	kernel-team@android.com, linux-serial@vger.kernel.org
Subject: Re: [PATCH v3 18/20] arm64: dts: google: Add initial Oriole/pixel 6
 board support
Message-ID: <ZScZ6Khov9fM4SZb@google.com>
References: <20231011184823.443959-1-peter.griffin@linaro.org>
 <20231011184823.443959-19-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231011184823.443959-19-peter.griffin@linaro.org>

On 10/11/2023, Peter Griffin wrote:
> Add initial board support for the Pixel 6 phone code named Oriole. This
> has been tested with a minimal busybox initramfs and boots to a shell.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Tested-by: Will McVicker <willmcvicker@google.com>

Thanks,
Will

> ---
>  arch/arm64/boot/dts/google/Makefile         |  4 ++
>  arch/arm64/boot/dts/google/gs101-oriole.dts | 79 +++++++++++++++++++++
>  2 files changed, 83 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/google/Makefile
>  create mode 100644 arch/arm64/boot/dts/google/gs101-oriole.dts
> 
> diff --git a/arch/arm64/boot/dts/google/Makefile b/arch/arm64/boot/dts/google/Makefile
> new file mode 100644
> index 000000000000..5cea8ff27141
> --- /dev/null
> +++ b/arch/arm64/boot/dts/google/Makefile
> @@ -0,0 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +dtb-$(CONFIG_ARCH_GOOGLE_TENSOR) += \
> +	gs101-oriole.dtb \
> diff --git a/arch/arm64/boot/dts/google/gs101-oriole.dts b/arch/arm64/boot/dts/google/gs101-oriole.dts
> new file mode 100644
> index 000000000000..3bebca989d34
> --- /dev/null
> +++ b/arch/arm64/boot/dts/google/gs101-oriole.dts
> @@ -0,0 +1,79 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Oriole Device Tree
> + *
> + * Copyright 2021-2023 Google,LLC
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include "gs101-pinctrl.h"
> +#include "gs101.dtsi"
> +
> +/ {
> +	model = "Oriole";
> +	compatible = "google,gs101-oriole", "google,gs101";
> +
> +	chosen {
> +		bootargs = "earlycon=exynos4210,mmio32,0x10A00000 console=ttySAC0";
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&key_voldown &key_volup &key_power>;
> +
> +		button-vol-down {
> +			label = "KEY_VOLUMEDOWN";
> +			linux,code = <KEY_VOLUMEDOWN>;
> +			gpios = <&gpa7 3 GPIO_ACTIVE_LOW>;
> +			wakeup-source;
> +		};
> +
> +		button-vol-up {
> +			label = "KEY_VOLUMEUP";
> +			linux,code = <KEY_VOLUMEUP>;
> +			gpios = <&gpa8 1 GPIO_ACTIVE_LOW>;
> +			wakeup-source;
> +		};
> +
> +		button-power {
> +			label = "KEY_POWER";
> +			linux,code = <KEY_POWER>;
> +			gpios = <&gpa10 1 GPIO_ACTIVE_LOW>;
> +			wakeup-source;
> +		};
> +	};
> +};
> +
> +&pinctrl_1 {
> +	key_voldown: key-voldown-pins {
> +		samsung,pins = "gpa7-3";
> +		samsung,pin-function = <0xf>;
> +		samsung,pin-pud = <0>;
> +		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +	};
> +
> +	key_volup: key-volup-pins {
> +		samsung,pins = "gpa8-1";
> +		samsung,pin-function = <0xf>;
> +		samsung,pin-pud = <0>;
> +		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +	};
> +};
> +
> +&pinctrl_0 {
> +	key_power: key-power-pins {
> +		samsung,pins = "gpa10-1";
> +		samsung,pin-function = <0xf>;
> +		samsung,pin-pud = <0>;
> +		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +	};
> +};
> +
> +&watchdog_cl0 {
> +	timeout-sec = <30>;
> +};
> -- 
> 2.42.0.655.g421f12c284-goog
> 
