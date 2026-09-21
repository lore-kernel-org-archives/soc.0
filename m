Received: from mail-pj2-f26.google.com (mail-pj2-f26.google.com [74.125.227.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A492F486400
	for <soc@lists.linux.dev>; Mon, 21 Sep 2026 11:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789988821; cv=none; b=lqMARvZYQjKCeXAXlX2Z05ykLEbAGsTwtxLzyPYKkKvpGDWp6We+Wuqz4difQtTLqkoPtGcpg7zzA8yZkJ51Y0li/YZoEOmQcScN37YdE6W4rykrRRFXaoCdmz0zj7GAOFjuNFJtBS+AX5+9O9glHC0w0AKCT0vtxAdtN3yc8b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789988821; c=relaxed/simple;
	bh=UUOINDD93jJS+LUcebWPI3js4hVCQibaR3IC0U7k49c=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=G06fqySCQymC0tDuFx1wuH1TFIXgaS0URYwvw9Fvb2vyYYV85him9/85PEvkc/Vr0jmlsLyvyVsBqBHmpQc0Ad8gmmpiMBGdErkNNq9iLGxWCRMzrN+0WQvggETi4nxMPv1AJuqJXj0Tw2Qt5nEDnXIlTg7IA+kY0RTHVqWM2zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EM4VAF1s; arc=none smtp.client-ip=74.125.227.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EM4VAF1s"
Received: by mail-pj2-f26.google.com with SMTP id d9443c01a7336-2d8fb334e72so25251235ad.1
        for <soc@lists.linux.dev>; Mon, 21 Sep 2026 04:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789988815; x=1790593615; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ycnprV0l+QiM05HZAYzXXqeG9wnBaUsBNe37TTIlwsM=;
        b=EM4VAF1skfHaqpw7gjenE0gKSECkKjG+R1EGpGpanuh74iRekWGwnRkz58h5XZzv34
         AQqMr6mky8+mfBBuzzWVYhkPFaRFrg+fedOEOLduxgm6E56FJ6wnZaT5HJmMvjMs7oMP
         Vdx95Ebze8oeZHDuajBtwfGRoNTlofnesJoCOAsnXe5xoztEuMLP1LMmNyWqSP2ualCH
         +O7zVogSWZXnyC1J8HezwzDZ/jFOoAxUEjRm5XFOJthIuhT84gwp7g7xqt+VmCvK6pVi
         XBUZrCwAUf+UdaWP7vfCEFpeyH1AB8mB7qoJbVA+Id6PLLjwpsQ8pEcglNDZKRpxsi37
         7k+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789988815; x=1790593615;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ycnprV0l+QiM05HZAYzXXqeG9wnBaUsBNe37TTIlwsM=;
        b=ZEP5xWRKIG1KRgEO7OwaLR7v0+7UkX2dwqBvim8e5euK5/xLzxzyX6JI29ZFQNKLyg
         yVlw9xHlbXNo/vt9aeUpLJJwsXJ6VwanDE4X5mpTvM9bVIASSpXEPltg4lblZ51oc9Ez
         aj1nFlYeZmdknHRsUUMoSmoB4vIB737Po399Y+B9UiTpwhqozJ+MONAcCdf0/FFaf7G7
         7z27TXiseKAQJFHUj2lthxontTB1pYQ4N4OUJXZ240MoLkCN7CvMyf5pbJasHPzyhme4
         hJst6lCvQdnyDfckyTh4Va/TfPKSnb4M12PeMVpLYZNNX9wJ8Z0U1yizXXxbMSzbwbXz
         p0FA==
X-Forwarded-Encrypted: i=1; AKwUvByeFag+gzCCOIhj5NyZYmoB5MEvnA8D/oS+411pkcBgXVrbS/Zve8Sl/VcGh9swCw7kUhI=@lists.linux.dev
X-Gm-Message-State: AFuF++lUfZjg1KOr/4kpvoSbpBOj3FF7/IhLYaz3eVtDh3ViK/e7jWqJ
	3nhAvaHzyFN25d9bpTfF50Hm38q4ou3Ex1GZ/+rKnwy3WrZBS/XuiOHd
X-Gm-Gg: AYBFou3sWSDFei9fG0Rw8kna/3fvLj6jNlqqkceulUVK4vVNCIIMzBAWM4iyhGpUkIC
	wF1UPE48nIqpK8gtKzdmsZ9dbmWVVrTQPcNLkB7W+kwXPOk2p1/Nk/nxtgUo04AQLJ3QDU7csEf
	hS8lIofgLewyrEH+ZkRtCgcFnLAtLT5mBQ8RQW+DTsqWOUWE39rCETX7U3etjBYBLlcSQwz9YHS
	YBEHywtr1qTvT1pczoWCw/p+/5VJiHQXecqn+v0CZmM3fLUJjdEUOS62qaHYK/m5e/xxz1KOwYu
	aGbes5uu6tmx22Q436MVxAOEeVBygVz8l+RAvTsnV2CEYb16SmdfddP6Yy8qHyjV2srxo3Inkqw
	sZU4FUFtZ5Wv29WsK8U/t323mTD1YjJSkYq0e3LiWIO4xHG48QtTOGS+kbuDOulf8NvvB9KO3d5
	ZbNO6kXKo3oKeoUIdDRz5MvwYtNxNhtRYOAcv5yLpChOtYry+915UijUyyXNsM/FR6sGVoj8t7g
	1a8JW3xfN1tXnHhEr+WssMuI8D39PMcQa0QFQLl8VgxYpqQH0LjFGTzgfraeA==
X-Received: by 2002:a17:903:2447:b0:2d9:43f5:b462 with SMTP id d9443c01a7336-2ddb1b79df8mr144230985ad.5.1789988815140;
        Mon, 21 Sep 2026 04:06:55 -0700 (PDT)
Received: from [192.168.151.214] (222-228-113-186.aichi.fdn.vectant.ne.jp. [222.228.113.186])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17ba719sm31428165ad.56.2026.09.21.04.06.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 04:06:54 -0700 (PDT)
Message-ID: <17a74e90-27d1-4954-86a8-491267f00cb8@gmail.com>
Date: Mon, 21 Sep 2026 20:06:47 +0900
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Yoshifumi SHU <envzhu@gmail.com>
Subject: Re: [PATCH v2 00/14] ARM: deprecated platform removal
To: arnd@kernel.org
Cc: Frank.Li@nxp.com, aaro.koskinen@iki.fi, alexander.sverdlin@siemens.com,
 alexandre.belloni@bootlin.com, alexandre.torgue@foss.st.com,
 andreas@kemnade.info, andrew@lunn.ch, arnd@arndb.de,
 claudiu.beznea@tuxon.dev, conor+dt@kernel.org, david@kernel.org,
 devicetree@vger.kernel.org, enelsonmoore@gmail.com, festevam@gmail.com,
 geert@linux-m68k.org, gregory.clement@bootlin.com, imx@lists.linux.dev,
 kernel@pengutronix.de, khilman@baylibre.com, kmehltretter@gmail.com,
 kristoffer.ericson@gmail.com, krzk@kernel.org, linusw@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux@armlinux.org.uk,
 liviu.dudau@arm.com, lpieralisi@kernel.org, mcoquelin.stm32@gmail.com,
 nicolas.ferre@microchip.com, npitre@baylibre.com, robert.jarzmik@free.fr,
 robh@kernel.org, rogerq@kernel.org, s.hauer@pengutronix.de,
 sebastian.hesselbarth@gmail.com, shawnguo@kernel.org, soc@lists.linux.dev,
 stefan@agner.ch, sudeep.holla@kernel.org, tony@atomide.com, vz@mleia.com,
 thehajime@gmail.com
References: <20260914140821.1805449-1-arnd@kernel.org>
Content-Language: en-US
In-Reply-To: <20260914140821.1805449-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Arnd and all,

I would like to request that the core Arm Cortex-M support be retained, specifically for v8-M.

I'm heavily using Arm Cortex-M / NOMMU Linux for academic research.
In particular, I frequently run Linux on newer Arm v8-M (Cortex-M33/M55/M85) processors.
However, dropping CONFIG_CPU_V7M also removes support for these newer CPUs.
Because v8-M is highly compatible with the older v7-M (Cortex-M3/M4/M7), the v8-M support is tightly coupled with CONFIG_CPU_V7M, despite the name. 
The major differences are essentially CPU IDs and PMSAv8 MPU support.
So I need the majority of CONFIG_CPU_V7M to support Arm v8-M. 

Regarding platform support, I don't need Linux-side device drivers.
In my current setup, Linux runs in a virtualized environment hosted by an RTOS (like Zephyr) and accesses devices through virtio served by the RTOS.
I also understand that maintaining legacy MCU platform support is a significant burden.
Therefore, I don't object to removing the platform support, though the MPS platform remains convenient for bare-metal testing.

I am willing to help maintain this support, including modernizing the relevant code. I can regularly test kernels on real Armv8-M hardware.
If an active maintainer is required to keep the support, I am willing to take on that responsibility.
Please let me know how I can help keep the support.

Thanks,
Yoshifumi
