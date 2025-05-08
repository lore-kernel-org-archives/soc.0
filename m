Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78828229B2C
	for <soc@lists.linux.dev>; Thu,  8 May 2025 13:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746710429; cv=none; b=a/M5vzvoZu1yhOyV8A3hR6s5kHxppnT1WOsNfUDwdqUX9M81m46mpneNuO3Z0HQv+fcg22c5SyL6L49QvtyR722WUg5USHBmy74eaXyoOPlB9pobJ9ubUc0yKMqimeJynje1mwJ8dVXpCmyMUr+rIvKv5ckRUQct60lLgpHpo2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746710429; c=relaxed/simple;
	bh=Ggq7sLTVtObPJWu9TR8xbrcUROsW0mIC4OEmuNAJ6Sk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tulU50RD7CE+iE/f3b3ZOmnpkq44zInkKUqGHdeUo7W/uoNp3A4NeHo0XnBI/9wDWXBEVsEyP9MMNi+LjtKI6tcWoZgGhzMVKiklogi6hsg2burs1RHSPtI7aAOZcNak55Bgq4wH1sflNxRs+yMA8jKhCU8a42ItWZdbSSzgAUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=0k61FJ1i; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="0k61FJ1i"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-74019695377so726105b3a.3
        for <soc@lists.linux.dev>; Thu, 08 May 2025 06:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746710426; x=1747315226; darn=lists.linux.dev;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jyuniMudFryF3hn/u/aLddug+sED3jw9d54qmOZEBFQ=;
        b=0k61FJ1iU9/PGyqAqDgh8gT7dPAjWNuIXfpIccEIkYq0PDsuxk2uh2ISafSGh1L/9T
         VB8cUPhaFiqZkvx4V+Dv8HuAc72xCMI1HI+jMCI72cP4uYZz6gBlAlfRx4o8j6XTvOVc
         vRtPvC7yjxTlQ4dNZCHRXXYPumgSgghlyLG1y1zTSS7BMNxl/vX9QUmPSDPeGyGKuwnw
         S8XH1av32VP6DomWUWENk3K92YWu9jxQl66dKjVlLLTk7riFoExy5djcS4Z56l6pgCRI
         IP6qS4UH8+815Utfixn2pqaj1jq7LZVHFL0i0Bql9mVI6wlwau5pZ+/GeJduAmzo3r9u
         pjDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746710426; x=1747315226;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jyuniMudFryF3hn/u/aLddug+sED3jw9d54qmOZEBFQ=;
        b=k2jz4hLwyLQL94SDWrqc7fZIiDyoT2tDn9UqyWfjKZyvGpfQXlXTT/9yjrDvpSU14q
         VesRtpQzZshJBNpImPggjCW01mdHC9PsGu001CRmo7fp5ZFDW150lpFHPECeTKR6xjr4
         FOIpDFbEc8ge/kGNFzTFFIlqJSQ186RQMMDJWNXIc5NXwuomAmlIR0c4mahdR94t5da+
         0zW92aMwPgrBsASj6MZScHdmzVYBhQ9wer5SQyvQQAYgm5rsUM9id9oKDtSWBI8CPQUU
         jFv2s8AS8niT+7dwocdlZxL4G4LDcSCZk9kdW829jgQrJmdwpkN6f0zec3J3zhtb0Gjx
         l+nw==
X-Forwarded-Encrypted: i=1; AJvYcCW3bvNbPHHA50BXw1MmZ004xP2r0/ITCW3nRLDy+U2I4e+Q2uWiywqe6NxluDKEKWo/OWA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzRpGjHIQrIVesKf1nj4EdHweQfef/UgbQNTP00NXNpqCgWL7NC
	E3gTfRr6s1ymvhQZI1SuXmi8lRPgYBU1DgpJkMwmqqT89+Ci2HdBISYvbWDBZak=
X-Gm-Gg: ASbGnctSnIkmSWZHVhVzZS3jKpE1lqSwEhrQa23PUhsSr+cUfuu+nCPpzvXEmeeew2o
	ZfRoGUREUa3/n2igVSGOA5qsElkWufti2fg6YvmrkNy2g9AVIBI9HyoNMou56joJOYrZwZn6mCA
	Ds/DKUHfU2SrhIzYHr7SDPjomLolDGmC1SLbdIZeqG4vf+1q19ET6FEEymbaJmAQmg+QiAiXMwF
	ZQ1NGV+FMLpcrGbY99EjV5b2FkfNFUDeQUHd3mUemgYRbvluE+ycFS7Apg5czp4iXz40w92prxE
	bSQJR1m7kn6OcFbKTCKVfYA1Fe0OJxI4QNKdWlg=
X-Google-Smtp-Source: AGHT+IET79Nq5FMlY1YATt34uIy9W6bQc0RASasVjOkYJxKwtGwvC9A4L+o3Stc03w0qdqPEQha4oQ==
X-Received: by 2002:a05:6a20:3d92:b0:1f5:8072:d7f3 with SMTP id adf61e73a8af0-2159b04ebd7mr5425027637.30.1746710425718;
        Thu, 08 May 2025 06:20:25 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740b0d154b5sm1350253b3a.56.2025.05.08.06.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 06:20:24 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Sukrut Bellary <sbellary@baylibre.com>, Russell King
 <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, Tony Lindgren
 <tony@atomide.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Nishanth
 Menon <nm@ti.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 soc@lists.linux.dev
Cc: Sukrut Bellary <sbellary@baylibre.com>, Aaro Koskinen
 <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, Roger
 Quadros <rogerq@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Santosh
 Shilimkar <ssantosh@kernel.org>, Bajjuri Praneeth <praneeth@ti.com>,
 Raghavendra Vignesh <vigneshr@ti.com>, Bin Liu <b-liu@ti.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org
Subject: Re: [PATCH 4/4] ARM: multi_v7_defconfig: Enable am335x PM configs
In-Reply-To: <20250318230042.3138542-5-sbellary@baylibre.com>
References: <20250318230042.3138542-1-sbellary@baylibre.com>
 <20250318230042.3138542-5-sbellary@baylibre.com>
Date: Thu, 08 May 2025 06:20:24 -0700
Message-ID: <7hbjs3tf1j.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Sukrut Bellary <sbellary@baylibre.com> writes:

> Enable Power management related defconfigs for TI AM335x[1].
>
> [1] AM335x TRM - https://www.ti.com/lit/ug/spruh73q/spruh73q.pdf
>
> Signed-off-by: Sukrut Bellary <sbellary@baylibre.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

Arnd, can you take this via the SoC tree please?

Kevin


> ---
>  arch/arm/configs/multi_v7_defconfig | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
> index 37e3baa33b67..1d2600b5f975 100644
> --- a/arch/arm/configs/multi_v7_defconfig
> +++ b/arch/arm/configs/multi_v7_defconfig
> @@ -985,6 +985,7 @@ CONFIG_EDAC=y
>  CONFIG_EDAC_LAYERSCAPE=y
>  CONFIG_EDAC_HIGHBANK_MC=y
>  CONFIG_EDAC_HIGHBANK_L2=y
> +CONFIG_RTC_DRV_OMAP=y
>  CONFIG_RTC_CLASS=y
>  CONFIG_RTC_DRV_AC100=y
>  CONFIG_RTC_DRV_AS3722=y
> @@ -1095,6 +1096,7 @@ CONFIG_TEGRA_IOMMU_SMMU=y
>  CONFIG_EXYNOS_IOMMU=y
>  CONFIG_QCOM_IOMMU=y
>  CONFIG_REMOTEPROC=y
> +CONFIG_WKUP_M3_RPROC=m
>  CONFIG_OMAP_REMOTEPROC=m
>  CONFIG_OMAP_REMOTEPROC_WATCHDOG=y
>  CONFIG_KEYSTONE_REMOTEPROC=m
> @@ -1146,6 +1148,8 @@ CONFIG_ARCH_TEGRA_3x_SOC=y
>  CONFIG_ARCH_TEGRA_114_SOC=y
>  CONFIG_ARCH_TEGRA_124_SOC=y
>  CONFIG_SOC_TI=y
> +CONFIG_AMX3_PM=m
> +CONFIG_WKUP_M3_IPC=m
>  CONFIG_KEYSTONE_NAVIGATOR_QMSS=y
>  CONFIG_KEYSTONE_NAVIGATOR_DMA=y
>  CONFIG_RASPBERRYPI_POWER=y
> @@ -1162,6 +1166,7 @@ CONFIG_EXTCON_MAX77693=m
>  CONFIG_EXTCON_MAX8997=m
>  CONFIG_EXTCON_USB_GPIO=y
>  CONFIG_TI_AEMIF=y
> +CONFIG_TI_EMIF_SRAM=m
>  CONFIG_STM32_FMC2_EBI=y
>  CONFIG_EXYNOS5422_DMC=m
>  CONFIG_IIO=y
> -- 
> 2.34.1
