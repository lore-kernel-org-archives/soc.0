Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CE222DFE3
	for <soc@lists.linux.dev>; Thu, 29 May 2025 17:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748539273; cv=none; b=j5jfc8ys0hVgej7aL2TXJxFYBQ6kxUXG4bIknZz1dN6M12HPrN3n74OpL1fW2PwPjW57FalGgw6b4gGoF4/b7/qyAEvJ18cGijgPAsY7bbp2tv3rOTdE1p1bF6nrujHp87dsMy4b1URmPAZw5ljsyZXQxwIFhOyTmBXQvJZWDSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748539273; c=relaxed/simple;
	bh=14XvdjCWpYFMm6zM1TygU+AlStuIOYC9yEl0h75Jbxw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZtSBaoAQyv7kMMRm/bSdrQc3E4eB8fLsjwsEvYiuisSPAzEgACnwiLt3zRyIEfcxplb4JoIIZkYXK/sLNtjK/s9pt0Y7Za6VwvNFOmTNafYOTPDJ8vdcT2jtJG+LtahC2vD/Ms2xb3E3XF4Jwm1bCDFYD6Nwrj19mF+6b6XdJaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=zT7iVZ5T; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="zT7iVZ5T"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b26f01c638fso1089606a12.1
        for <soc@lists.linux.dev>; Thu, 29 May 2025 10:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1748539270; x=1749144070; darn=lists.linux.dev;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=rvmxQNNcyeqgh1bkCI5xLmsBtP3BhbXj24Pg3BrpjWc=;
        b=zT7iVZ5T3VNqrUG8LyVY3gaYWafA0EPm5demxJxxI+bnFw8W5YKfREc0vQELzL2AmG
         JmQp5rKScjxE2B/KlEokT7QiPe/uikXUryMARKJzz9/zYIoQmxoNoDFxowTd6B86y9Ov
         D8Ed44Zr68z71yFB9f6XKY6k61DlfWwZNpHuaN2Ee6aCeeXWf5JWDoH/ADlZbyWFXqJc
         mzQFoZM7+yfuE6c3Pw41HfGEfNA4AIP3EjcP8wUgCQFSKSCl3afX5d6yecrEdDXNeTd0
         vDzZ4IO7BfM49D/Wr/PteCR5Q+uY52gErQkqK7cH/jJFwiku41QWF6lzL9IHrwLI4TA7
         G+gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748539270; x=1749144070;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rvmxQNNcyeqgh1bkCI5xLmsBtP3BhbXj24Pg3BrpjWc=;
        b=VZ4Ab1pkynVeaICuryOBO6tQ5+NDE9eOUPdsrREVbOKkWHFZs/kVDSZt17f+uh2sG4
         QrOXecLLwmBy27aDSpzaZhD2HNKROcb92j5JJJGH3cW6PQ9KxCZfC1ZGx+MbiOBlwK5h
         x40IwQ7+CYFGyOGqIvy6qF05ZkoE6Zn11FdRFkN21AFN4XeJ4Mf8TLmJY9prZYRdRNfn
         2UwePP7gGCi9qmYxoJwf6+i78u5E5n4jSb0Tt1ec4FfFN8MIZa/cumpSb/BVeycFho+I
         q3YJXMSmtGrLdicOGw+CH96U0kfOc4gwNN8Nr65Yya43xwYTB4OizpkMlGdaHLKfLwt5
         wgzQ==
X-Gm-Message-State: AOJu0Yy6oWC2Ow6BYz1F4cPB1B96zRVPmV+KtG+gnOjMj2XYVbHjt7q9
	+FkC2hApQh7NI56w0ChHRDatN6Jb7NyK94rp0huoAl7Yi8gHlv7ZAfjBz5QHwB2zMkAimz0/DgE
	9R1h2o4F6iQ==
X-Gm-Gg: ASbGncuod1rV6D310C5+YXjgk7pIGxyBaDYt4xeRZku6Q1qrNWMC/+y2dbSmt11icbf
	5Eyvyzcl9SCVAJ7OsKLvFnGAp3M0wOKDSudH44R3MlqYKEo8IXjLASLJA2fgmWF/8ZoJBu9Hx+m
	ll93CT2z6Q4E2yX6bgcgzUym3wTsPBJJA69TS+B1GWdCc+iz022a/mvauthMfmW0LDv8VaEDdX0
	BG9rnjC1tm1xjaxt0N1BueGRTgBK9ousoq06IsHChf7EZOcKBm0OFMTEiXuXf+6cGXiP0nCsbgD
	VgDwrHVVHmGb9F/mWFUdbS247N0srPBlytEqCCp3P+81c6xrz0EIytB4hIyl
X-Google-Smtp-Source: AGHT+IH1834zzk2lUOPVUHGH3EeY98SO550LzAmtRD9p+dqmamQc9GnfdhVQPk+w3gTCeLfLx3OdJA==
X-Received: by 2002:a05:6a20:93a1:b0:1f5:9098:e448 with SMTP id adf61e73a8af0-21ad94f971amr763041637.5.1748539270578;
        Thu, 29 May 2025 10:21:10 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2eceb9711asm214068a12.57.2025.05.29.10.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 10:21:09 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>
Cc: Sukrut Bellary <sbellary@baylibre.com>, Aaro Koskinen
 <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, Roger
 Quadros <rogerq@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Santosh
 Shilimkar <ssantosh@kernel.org>, Bajjuri Praneeth <praneeth@ti.com>,
 Raghavendra Vignesh <vigneshr@ti.com>, Bin Liu <b-liu@ti.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, Sukrut Bellary <sbellary@baylibre.com>, Russell
 King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, Tony Lindgren
 <tony@atomide.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Nishanth
 Menon <nm@ti.com>, Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH 4/4] ARM: multi_v7_defconfig: Enable am335x PM configs
In-Reply-To: <7hbjs3tf1j.fsf@baylibre.com>
References: <20250318230042.3138542-1-sbellary@baylibre.com>
 <20250318230042.3138542-5-sbellary@baylibre.com>
 <7hbjs3tf1j.fsf@baylibre.com>
Date: Thu, 29 May 2025 10:21:09 -0700
Message-ID: <7hldqfnxiy.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Hi Arnd,

Kevin Hilman <khilman@baylibre.com> writes:

> Sukrut Bellary <sbellary@baylibre.com> writes:
>
>> Enable Power management related defconfigs for TI AM335x[1].
>>
>> [1] AM335x TRM - https://www.ti.com/lit/ug/spruh73q/spruh73q.pdf
>>
>> Signed-off-by: Sukrut Bellary <sbellary@baylibre.com>
>
> Reviewed-by: Kevin Hilman <khilman@baylibre.com>
>
> Arnd, can you take this via the SoC tree please?

Looks like this slipped through the cracks for v6.16.   Could you apply
this for v6.17 please?

Thanks,

Kevin


>> ---
>>  arch/arm/configs/multi_v7_defconfig | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
>> index 37e3baa33b67..1d2600b5f975 100644
>> --- a/arch/arm/configs/multi_v7_defconfig
>> +++ b/arch/arm/configs/multi_v7_defconfig
>> @@ -985,6 +985,7 @@ CONFIG_EDAC=y
>>  CONFIG_EDAC_LAYERSCAPE=y
>>  CONFIG_EDAC_HIGHBANK_MC=y
>>  CONFIG_EDAC_HIGHBANK_L2=y
>> +CONFIG_RTC_DRV_OMAP=y
>>  CONFIG_RTC_CLASS=y
>>  CONFIG_RTC_DRV_AC100=y
>>  CONFIG_RTC_DRV_AS3722=y
>> @@ -1095,6 +1096,7 @@ CONFIG_TEGRA_IOMMU_SMMU=y
>>  CONFIG_EXYNOS_IOMMU=y
>>  CONFIG_QCOM_IOMMU=y
>>  CONFIG_REMOTEPROC=y
>> +CONFIG_WKUP_M3_RPROC=m
>>  CONFIG_OMAP_REMOTEPROC=m
>>  CONFIG_OMAP_REMOTEPROC_WATCHDOG=y
>>  CONFIG_KEYSTONE_REMOTEPROC=m
>> @@ -1146,6 +1148,8 @@ CONFIG_ARCH_TEGRA_3x_SOC=y
>>  CONFIG_ARCH_TEGRA_114_SOC=y
>>  CONFIG_ARCH_TEGRA_124_SOC=y
>>  CONFIG_SOC_TI=y
>> +CONFIG_AMX3_PM=m
>> +CONFIG_WKUP_M3_IPC=m
>>  CONFIG_KEYSTONE_NAVIGATOR_QMSS=y
>>  CONFIG_KEYSTONE_NAVIGATOR_DMA=y
>>  CONFIG_RASPBERRYPI_POWER=y
>> @@ -1162,6 +1166,7 @@ CONFIG_EXTCON_MAX77693=m
>>  CONFIG_EXTCON_MAX8997=m
>>  CONFIG_EXTCON_USB_GPIO=y
>>  CONFIG_TI_AEMIF=y
>> +CONFIG_TI_EMIF_SRAM=m
>>  CONFIG_STM32_FMC2_EBI=y
>>  CONFIG_EXYNOS5422_DMC=m
>>  CONFIG_IIO=y
>> -- 
>> 2.34.1
