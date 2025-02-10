Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184C9188596
	for <soc@lists.linux.dev>; Mon, 10 Feb 2025 05:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739165245; cv=none; b=fIfjLM7/pMDj7DDZKGLk8ao+f52dBLg0u1qeVHQSiNK43vC/gJTzoRmkTl+NVrxu5n2U9Nr1kEoPFRbEWTk8MMPIsW8eE5n/7ZEiCvXO5xbM4xDjbX28NNgfBEzJeHEZn+S1bsxW+/AvyJB3PTAiWY7CJHBoJ0StIU1NFX9rleA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739165245; c=relaxed/simple;
	bh=NCJo8h+GFEQWhyShGPxmjaeKhtE7tET+vq+FPuqdddc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tEJ6JJn1JptZtu+bz0rg5Pl/u9q9Yq1nkCHD6++qU4TeLWl6GjZrXdOmacqGiRlw4kMHRjskupzS9JFrv0aSmf4RRy4OMdiy6dEPA8Idz3K0qdjwVnrFxJ3RWjnMPm6019DIjS0qkJFqBnBJADYpzkRXXWX3fWQBYRGSP8/634c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I/aNoH6V; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I/aNoH6V"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6e41e17645dso37390026d6.2
        for <soc@lists.linux.dev>; Sun, 09 Feb 2025 21:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739165243; x=1739770043; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o5akprXzWeq2raV9J15rlbOJ4MBBYAkz6WZ7uy1VgM4=;
        b=I/aNoH6VYgx2OTZ7mNZATLQBtZPFzS06lr2/1gOLQVlOKJkyIj/if+50mcvzTwXfos
         E6Tkc5wGXS7QsAmQ2YO4P7/DYaQtd5J9L9LtXYHKzMsIqrP6Sz/StAC/qQF5aLUHSGOZ
         xC8IBG0hygYRKMyq7Y1haHc+pBTufBholDJu/Lzs+1O0pSb4rBkzRq7BPKliOHpK1FoI
         Z/Mx5poepwH1oWMtmQyQh44L4sIQO1LXpUZpB6cTyzsgMNLOkvbSDOOOfRW8BqsSEYk4
         rOSnXoR9Ap2V+5lYx4JcdcOUo3H+tFjSlWj2i8msnHI5bYzll4QuEZN2VQDZ9loNMrZO
         cTcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739165243; x=1739770043;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o5akprXzWeq2raV9J15rlbOJ4MBBYAkz6WZ7uy1VgM4=;
        b=l2O7cZM2NcQKqGZSoYpMBpmTnq7biXFoGdWrn7osfaS6ZfRztGAC25Gkt9JLKy99yQ
         e4KdtwBbB7gzmWKvA92ldrYZq9WcsULE8HLrYgw25SZgTXfY04r2L28LOqAqHH3TxUZG
         FbsVoZ0fZV1/8JOEmwartTpWrPMLv9OhlsBaSE6fC50x+wDYhdzZJMFzYHY6dte+UNEE
         YEIgF7hXGHXAzSl+YaqJFOzM5G3zIhAmSkesMBDllUkz+5oqjc3BO/ve3/ACjrRns+I7
         x41VnpEqCpialfvr0HHHtfhXqToMmywKWlo26L9w7+0B6EzIOiInD/hLo/S+0ZEzVJEG
         H6nA==
X-Forwarded-Encrypted: i=1; AJvYcCVETuHIF2/cgUgVmCz5UYmMEnKDi0TE1gvmFUmocSw/WnSsNO14s3vOxDs/VWJ2n4XfmaQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywe1qJmTg8GfAkn/6GXzdghMxl0Vw1YYeZiGXQc4tGqH6WW0bla
	kJOuDmumn5D2QkSRXrMmGlHHcfQpYzLUHRQ+pAhFk5ng1iE/mQlj
X-Gm-Gg: ASbGncsOUGefim7ZLxED/Ikp2XHPSizhUM9ltJUvqz6YqnKUrtSJ5gkh7y8l1cblzz4
	1v3rzxvsiLScsvNSlZWtOb32ReLJVpBeMphUEe9LaeiTuFFm2Eek1cgaI7g5I7/iyq4e90FfNpL
	F4vbYYLBLkDGeYZwMmcRaWC5BiOyFL4aEzuE3YUzisiF14CQYENKNIt07YHKHqq2HO6xAKTz7Gq
	8PP+R/1luR+ADh+vC7v9exBngXuGvc2e8eoAqEiReZ3knU/nSp+sECkAoZ6VlBKfCw=
X-Google-Smtp-Source: AGHT+IE+4sZLu/ZxMSYESF6iMKxthKb6gyHQ9A7BzIRccL53896Gfbs6sUnMwwUwzuOES/UrXfTjtg==
X-Received: by 2002:a05:6214:1bcc:b0:6e4:4164:8bb2 with SMTP id 6a1803df08f44-6e4456d242bmr180675586d6.29.1739165243086;
        Sun, 09 Feb 2025 21:27:23 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e4437ddc85sm36220296d6.87.2025.02.09.21.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 21:27:22 -0800 (PST)
Date: Mon, 10 Feb 2025 13:27:17 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, soc@lists.linux.dev
Cc: Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@outlook.com>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	Haylen Chu <heylenay@outlook.com>, linux-arm-kernel@lists.infradead.org, 
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>
Subject: Re: [PATCH 04/10] arm64: dts: sophgo: Add Duo Module 01
Message-ID: <pwf6xgylo5fd7j5akkuau2v6p7r4print4fxekkwmxqtumjifk@hoqbsiwedwhz>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
 <20250209220646.1090868-5-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209220646.1090868-5-alexander.sverdlin@gmail.com>

On Sun, Feb 09, 2025 at 11:06:29PM +0100, Alexander Sverdlin wrote:
> The Duo Module 01 is a compact module with integrated SG2000,
> WI-FI6/BTDM5.4, and eMMC.
> Add only support for UART and SDHCI.
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---
>  .../sophgo/sg2000_milkv_duo_module_01.dtsi    | 84 +++++++++++++++++++
>  1 file changed, 84 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/sophgo/sg2000_milkv_duo_module_01.dtsi
> 
> diff --git a/arch/arm64/boot/dts/sophgo/sg2000_milkv_duo_module_01.dtsi b/arch/arm64/boot/dts/sophgo/sg2000_milkv_duo_module_01.dtsi
> new file mode 100644
> index 000000000000..7edcc4d03cc4
> --- /dev/null
> +++ b/arch/arm64/boot/dts/sophgo/sg2000_milkv_duo_module_01.dtsi
> @@ -0,0 +1,84 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +
> +#include <dt-bindings/pinctrl/pinctrl-sg2000.h>
> +#include "sg2000.dtsi"
> +
> +/ {
> +	model = "Milk-V Duo Module 01";
> +
> +	aliases {
> +		serial0 = &uart0;
> +		serial1 = &uart1;
> +		serial2 = &uart2;
> +		serial3 = &uart3;
> +		serial4 = &uart4;
> +	};
> +};
> +
> +&osc {
> +	clock-frequency = <25000000>;
> +};
> +
> +&emmc {

> +	/delete-property/ status;

Override it with status = "okay";
This suggestion applies to all you dts patch.

> +	bus-width = <4>;
> +	no-1-8-v;
> +	cap-mmc-hw-reset;
> +	no-sd;
> +	no-sdio;
> +	non-removable;
> +};
> +
> +/* Wi-Fi */
> +&sdhci1 {
> +	bus-width = <4>;
> +	cap-sdio-irq;
> +	no-mmc;
> +	no-sd;
> +	non-removable;
> +};
> +
> +&pinctrl {
> +	uart0_cfg: uart0-cfg {
> +		uart0-pins {
> +			pinmux = <PINMUX(PIN_UART0_TX, 0)>,
> +				 <PINMUX(PIN_UART0_RX, 0)>;
> +			bias-pull-up;
> +			drive-strength-microamp = <10800>;
> +			power-source = <3300>;
> +		};
> +	};
> +
> +	sdhci0_cfg: sdhci0-cfg {
> +		sdhci0-clk-pins {
> +			pinmux = <PINMUX(PIN_SD0_CLK, 0)>;
> +			bias-pull-up;
> +			drive-strength-microamp = <16100>;
> +			power-source = <3300>;
> +		};
> +
> +		sdhci0-cmd-pins {
> +			pinmux = <PINMUX(PIN_SD0_CMD, 0)>;
> +			bias-pull-up;
> +			drive-strength-microamp = <10800>;
> +			power-source = <3300>;
> +		};
> +
> +		sdhci0-data-pins {
> +			pinmux = <PINMUX(PIN_SD0_D0, 0)>,
> +				 <PINMUX(PIN_SD0_D1, 0)>,
> +				 <PINMUX(PIN_SD0_D2, 0)>,
> +				 <PINMUX(PIN_SD0_D3, 0)>;
> +			bias-pull-up;
> +			drive-strength-microamp = <10800>;
> +			power-source = <3300>;
> +		};
> +
> +		sdhci0-cd-pins {
> +			pinmux = <PINMUX(PIN_SD0_CD, 0)>;
> +			bias-pull-up;
> +			drive-strength-microamp = <10800>;
> +			power-source = <3300>;
> +		};
> +	};
> +};
> -- 
> 2.48.1
> 
