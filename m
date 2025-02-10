Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC3A13FD86
	for <soc@lists.linux.dev>; Mon, 10 Feb 2025 05:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739165184; cv=none; b=GYDPj5mIJqZTnPMF/qHEx9+ZkNHOJfSAhn6VwD3zsUMK6cKdL7/0lKzHO85T8MhHwuMh7HgMtVsEGat2PBNLAc3Kz2si0n2S2+63mnFqHjeEzszdCs3E5LVjKyuaEE6jhodmA1KA2QFjd2c+33EniFPbJFs0mNOSeR5dPYnBuvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739165184; c=relaxed/simple;
	bh=LTE+PX/ZSOyMkfirYl9HsdnpbiVUPrNMAyoC6WmBsrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KyOIFgHWQCsvoDXNfkefI+sHL+rXHfjRgrCN5tHpdXDBVU/OvAxgZVkFWGMIWrBwVxoaiK5zVl9Umb/wAtlJQPzosvitTQYdg+ap82+yK0iMnRrqJ4KcWH/YZ/9PnnjdLC/qBiHSroJQJ93sDrStMZVX3sQINlJnbahkB/2RwMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bNeTZi2O; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bNeTZi2O"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7b6f7d7e128so523756085a.1
        for <soc@lists.linux.dev>; Sun, 09 Feb 2025 21:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739165182; x=1739769982; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AXYcUvZi8iP9/2G1vVDC0LktbbVfVEhz/5iLisBlzSA=;
        b=bNeTZi2O+Po7kR8ghzR/Cqd5NkyC4pQNSpd8F2DQTk7Eg2IxDeB2xhRy1dQWuzCfmy
         IEHSyAwkUp3whvudXneR5ddPDQpB2/2n0pMo8ROHiJQhS2+dxnMmJmJwb0jZjbb09FVJ
         zLzGDXRz7o9BJe79seruAXFEaQAOk8IbytxQR52cGwE9qC7I9l64ck/HXmfTJAtaWdn+
         s4TSohvFNh9v1rOq5CooXJKxSV26F5onwRmrR1YTcEFcLzAnbtgzD4uZhcUgidkKBiKU
         z1ckZVh/6ch0tF+0A5CnOqGAMBlSX/0fSjEgD69EsKmvGwSvO6Yvww2rtiH32LZNHSLv
         Zqig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739165182; x=1739769982;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AXYcUvZi8iP9/2G1vVDC0LktbbVfVEhz/5iLisBlzSA=;
        b=WbuA0OaXzDQ7YKEaNiLppgY5lVHPJgF+WWr8LuHNahSi1cgF+epJGdpuAFyRGzcHqu
         ALFBjQ3FkurVPgphD8xBnlKuAy/IzhKatcSau1ULau6Vn2x2je5L/hIT/w5z0s94oWRy
         x8RF9wqMuPN4uXNGtmgBmFpJIlr05HO6NyMAfGCpO8JVy46KaXIdk/KAriOTZjhPRRUz
         bCfe6v7R3husLUs8TM88XiObdOuZRZoOT1/zzzQf52v2iZtMUJFaJClZGW86Bz94DFjH
         RzPqCEPaTp3VvqYlT573D86EjEMslKwk+QIKbAnwqw3vwbpMjpJLSM4s5zCz+gjGBPr3
         n9+A==
X-Forwarded-Encrypted: i=1; AJvYcCWvutNPfbMcJ/aOKM9UfPiacKMaRJONMdKRIrgP+0VHVrB9nKzMatKFN7ki3B4oh0ZOLHw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzuqWVUrQyitRUbhNwzB8JROhq3FfegzfVj1ONdcehbXzJLcyoF
	x28TBjABWnCsHBqPPVRzw9MVAkhSnHPakEs3syooQQnAgKA9134+
X-Gm-Gg: ASbGncslwdrsSGHYZvbc/fsnRQwqjs28Cu8T8Stsx/Rc1f+MoZSStwfJeWxHGtYZUJk
	aNgspJss2oPSFW6GYedCldjwo4tA9RKDKPRsuQPAcbQ19ojFGvLmzXi+Vf2rANHK0Cf2+zSuhDQ
	aVhKE00jFucToh/JOBMFZLX4R0jlMNIfhPgzVOF8cp9/edaoEP4mw5a+WdnTCFrdAVcJtGBSkwc
	1sGvFbA2vkFxP/bFavw+Punot0AXTPJDHg9rAReaomrBBAVz8TqE09nOQcC+EbNIWU=
X-Google-Smtp-Source: AGHT+IFAwtxGg0YS49lIs6yVOg3N0/ziSObLsA90REDBDAU+q9pSQjI9Jz7uKB4OPYLwvX/ixw2jPQ==
X-Received: by 2002:a05:620a:404c:b0:7b1:ab32:b71e with SMTP id af79cd13be357-7c047e2d53cmr1763316285a.0.1739165182125;
        Sun, 09 Feb 2025 21:26:22 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c041dec2e9sm487596785a.20.2025.02.09.21.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 21:26:21 -0800 (PST)
Date: Mon, 10 Feb 2025 13:26:15 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, soc@lists.linux.dev
Cc: Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@outlook.com>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	Haylen Chu <heylenay@outlook.com>, linux-arm-kernel@lists.infradead.org, 
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>
Subject: Re: [PATCH 03/10] arm64: dts: sophgo: Add initial SG2000 SoC device
 tree
Message-ID: <4pyb47jbypkdx2x2gozx6iz7ecepff2c7k5zkenwhsbssghtgo@n3lyr7h2hu4p>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
 <20250209220646.1090868-4-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209220646.1090868-4-alexander.sverdlin@gmail.com>

On Sun, Feb 09, 2025 at 11:06:28PM +0100, Alexander Sverdlin wrote:
> Add initial device tree for the SG2000 SoC by SOPHGO (from ARM64 PoV).
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---
>  arch/arm64/boot/dts/sophgo/sg2000.dtsi | 79 ++++++++++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/sophgo/sg2000.dtsi
> 
> diff --git a/arch/arm64/boot/dts/sophgo/sg2000.dtsi b/arch/arm64/boot/dts/sophgo/sg2000.dtsi
> new file mode 100644
> index 000000000000..4e520486cbe5
> --- /dev/null
> +++ b/arch/arm64/boot/dts/sophgo/sg2000.dtsi
> @@ -0,0 +1,79 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +
> +#define SOC_PERIPHERAL_IRQ(nr)		GIC_SPI (nr)
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <riscv/sophgo/cv18xx-periph.dtsi>
> +#include <riscv/sophgo/cv181x.dtsi>
> +
> +/ {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +	compatible = "sophgo,sg2000";
> +	interrupt-parent = <&gic>;
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x80000000 0x20000000>;	/* 512MiB */
> +	};
> +

> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu@0 {
> +			compatible = "arm,cortex-a53";
> +			device_type = "cpu";
> +			reg = <0>;
> +			i-cache-size = <32768>;
> +			d-cache-size = <32768>;
> +			next-level-cache = <&l2>;
> +		};
> +
> +		l2: l2-cache {
> +			compatible = "cache";
> +			cache-level= <2>;
> +			cache-size = <0x20000>;
> +		};
> +	};
> +
> +	pmu {
> +		compatible = "arm,cortex-a53-pmu";
> +		interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
> +		always-on;
> +		clock-frequency = <25000000>;
> +	};
> +
> +	gic: interrupt-controller@1f01000 {
> +		compatible = "arm,cortex-a15-gic";
> +		interrupt-controller;
> +		#interrupt-cells = <3>;
> +		reg = <0x01f01000 0x1000>,
> +		      <0x01f02000 0x2000>;
> +	};
> +

Separate these into a separate CPU file so SG2002 can reuse it.

> +	soc {
> +		ranges;
> +
> +		pinctrl: pinctrl@3001000 {
> +			compatible = "sophgo,sg2000-pinctrl";
> +			reg = <0x03001000 0x1000>,
> +			      <0x05027000 0x1000>;
> +			reg-names = "sys", "rtc";
> +		};
> +	};
> +};
> +
> +
> +&clk {
> +	compatible = "sophgo,sg2000-clk";
> +};
> -- 
> 2.48.1
> 
