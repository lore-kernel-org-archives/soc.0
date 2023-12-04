Return-Path: <SRS0=yYpf=HP=linaro.org=andre.draszik@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F35C4167B
	for <soc@archiver.kernel.org>; Mon,  4 Dec 2023 17:51:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ED4DEC433CC; Mon,  4 Dec 2023 17:51:48 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CAF6DC433C8
	for <soc@kernel.org>; Mon,  4 Dec 2023 17:51:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CAF6DC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40bd5eaa66eso28025025e9.3
        for <soc@kernel.org>; Mon, 04 Dec 2023 09:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701712306; x=1702317106; darn=kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0xgC+ecJ/aYtY2CvVGurydBuFpa6kzX9Y0C6MFp5IkI=;
        b=NTN6KG04BfUeD/g1Qltz1+iJKrTEYJlFW4XJskWN6CgAXy2mwFoAOh4CWiEEANHiAW
         NBlWsfhyP+wqAMJarxhmgEgHrO99HGgcfgHAIPHYGyhP3z4PbjEGF4H9QfoIb0AVPtLv
         jXbKRVOsMp09VZz8Fa8MJYnLK8XlN0iS/iASMgwkUaYgLdgkhTHQOWJE1xhiHEoFu9U5
         C42tM3AwAHkhzVHvSqAqIrmhdjtj9+tYssizzFQGAhhUzn/ZeJi9QKVgDF7cQs177NhI
         Bn1ot3pYg9cHNkhPvMhlPS6RlYkIuUCwzyerWb2eqBBVW5V4Ctn5d7XnNZmh0MKhO5wG
         ERWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701712306; x=1702317106;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0xgC+ecJ/aYtY2CvVGurydBuFpa6kzX9Y0C6MFp5IkI=;
        b=HiG5yn3BZWc2Y5quosGLOYnwkBU5mav6Sd0hKpg/iBUuvEho2Wc9p5SpF41lqI/WjZ
         8vF0ObjljG+MB0s5bzRZkm2jnw/fe5wc5L5AVgW+C6HfiQS5Eayp1b0iiu4/bVxnTp2g
         SvyQP5bJPbY9G+9rC2Dsw4BCn9ljFXJK24faXkqDzJWujgQe3i1ldqqj9QeiFGPqZ+1h
         caiuO6SgFzmDbMrpAR9A4cIDaMcR8FFhC5+hcs7NpzEN1EGx0c378rENSi+QYZF1GD0l
         GhGyN8mSdQZZCHm4Xps6PzXZmmaj75M/zP9UWVzRhkhQ25jVcBh7I0IYfVqWXHEmBufS
         MxMQ==
X-Gm-Message-State: AOJu0YyfLml0m5Uqn1r/pv3D6n34EWo1Mtd9NCZTGFyYDZkVjmeU4vRu
	n9DhtWvEYyi4LXuZeqVvXoXkoA==
X-Google-Smtp-Source: AGHT+IHg/7kveHuWDixjU8ouQ7zKYnDBAtnudtwu6W88VoQ8XBhhZ2T41NB6zJGoDZ53CE5QrdWRqQ==
X-Received: by 2002:a7b:cd07:0:b0:40b:5e59:ea0b with SMTP id f7-20020a7bcd07000000b0040b5e59ea0bmr2920644wmj.170.1701712306207;
        Mon, 04 Dec 2023 09:51:46 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id f18-20020a05600c155200b004094d4292aesm15918570wmg.18.2023.12.04.09.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 09:51:45 -0800 (PST)
Message-ID: <20bf05b9d9ccc5c11ef17500ac7a97c46dd46a9a.camel@linaro.org>
Subject: Re: [PATCH v5 12/20] clk: samsung: clk-gs101: Add cmu_top, cmu_misc
 and cmu_apm support
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
 conor+dt@kernel.org,  sboyd@kernel.org, tomasz.figa@gmail.com,
 s.nawrocki@samsung.com,  linus.walleij@linaro.org, wim@linux-watchdog.org,
 linux@roeck-us.net,  catalin.marinas@arm.com, will@kernel.org,
 arnd@arndb.de, olof@lixom.net,  gregkh@linuxfoundation.org,
 jirislaby@kernel.org, cw00.choi@samsung.com,  alim.akhtar@samsung.com
List-Id: <soc.lore.kernel.org>
Cc: tudor.ambarus@linaro.org, semen.protsenko@linaro.org,
 saravanak@google.com,  willmcvicker@google.com, soc@kernel.org,
 devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org,  linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org,  linux-watchdog@vger.kernel.org,
 kernel-team@android.com,  linux-serial@vger.kernel.org
Date: Mon, 04 Dec 2023 17:51:43 +0000
In-Reply-To: <20231201160925.3136868-13-peter.griffin@linaro.org>
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
	 <20231201160925.3136868-13-peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.49.2-3 
MIME-Version: 1.0

On Fri, 2023-12-01 at 16:09 +0000, Peter Griffin wrote:
> cmu_top is the top level clock management unit which contains PLLs, muxes=
,
> dividers and gates that feed the other clock management units.
>=20
> cmu_misc clocks IPs such as Watchdog and cmu_apm clocks ips part of the
> APM module.
>=20
> Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
> Tested-by: Will McVicker <willmcvicker@google.com>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> =C2=A0drivers/clk/samsung/Makefile=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 =
1 +
> =C2=A0drivers/clk/samsung/clk-gs101.c | 2495 ++++++++++++++++++++++++++++=
+++
> =C2=A02 files changed, 2496 insertions(+)
> =C2=A0create mode 100644 drivers/clk/samsung/clk-gs101.c
>=20
> diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefile
> index ebbeacabe88f..3056944a5a54 100644
> --- a/drivers/clk/samsung/Makefile
> +++ b/drivers/clk/samsung/Makefile
> @@ -21,6 +21,7 @@ obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+=3D clk-exynos7.=
o
> =C2=A0obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+=3D clk-exynos7885.o
> =C2=A0obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+=3D clk-exynos850.o
> =C2=A0obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+=3D clk-exynosautov9.o
> +obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+=3D clk-gs101.o
> =C2=A0obj-$(CONFIG_S3C64XX_COMMON_CLK)	+=3D clk-s3c64xx.o
> =C2=A0obj-$(CONFIG_S5PV210_COMMON_CLK)	+=3D clk-s5pv210.o clk-s5pv210-aud=
ss.o
> =C2=A0obj-$(CONFIG_TESLA_FSD_COMMON_CLK)	+=3D clk-fsd.o
> diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs=
101.c
> new file mode 100644
> index 000000000000..6bd233a7ab63
> --- /dev/null
> +++ b/drivers/clk/samsung/clk-gs101.c
> @@ -0,0 +1,2495 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2023 Linaro Ltd.
> + * Author: Peter Griffin <peter.griffin@linaro.org>
> + *
> + * Common Clock Framework support for GS101.
> + */
> [...]
> +
> +/* List of parent clocks for Muxes in CMU_TOP: for CMU_HSI0 */
> +PNAME(mout_cmu_hsi0_usb31drd_p)	=3D { "oscclk", "dout_shared2_div2" };
> +
> +PNAME(mout_cmu_hsi0_bus_p)	=3D { "dout_shared0_div4", "dout_shared1_div4=
",
> +				=C2=A0=C2=A0=C2=A0 "dout_shared2_div2", "dout_shared3_div2",
> +				=C2=A0=C2=A0=C2=A0 "fout_spare_pll" };

This should also be updated....
=20
> [...]
> +	MUX(CLK_MOUT_HSI0_BUS, "mout_cmu_hsi0_bus", mout_cmu_hsi0_bus_p,
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_MUX_MUX_CLKCMU_HSI0_BUS, 0, 3),

...because we have 8 possibilities now.

(I didn't check the other parents, but you mentioned you updated field widt=
hs
in other registers, too, so maybe need to double check the parent strings a=
s well)


Cheers,
Andre'

