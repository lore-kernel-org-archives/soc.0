Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819722D627
	for <soc@lists.linux.dev>; Mon, 18 Nov 2024 03:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731902027; cv=none; b=dQWPCb7Y8wlacyIgBNc/3YGxkztzrTuQlC5EyjYbIQ9aFyodcGbahECVRn4t57CEDlag2s7DFmQBDRruH6YBc4QhCSFWleAh/2KzEzRYHVUQtmdW78+Kw9mgfy6u5f0fIxdqzf+u+j6Ird5Pm0MFdj9RxLaLDiluRPxlMJstJwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731902027; c=relaxed/simple;
	bh=757AscSd7zeiv7j6vKkam3CidywRcEO/KEooyL092no=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n3TD1+UoGfNCgnF/9diTNTuXq5iLFKNR/6zovIgPZztkhRKsNgbvraz2IuoUlPZvKrsTfIJy42zrB71dfIO1bdvDGZ8eWr5c9+sVvA1c/gA8n4NTI3gPl2WeMiNfx3KLLOZtel/lvYanb2pRPgFzgP1z48dJrceutL8oG5k7gD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zuRgBv6j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zuRgBv6j"
Received: by smtp.kernel.org (Postfix)
	id 1EC81C4CEDB; Mon, 18 Nov 2024 03:53:47 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 05175C4CECF
	for <soc@kernel.org>; Mon, 18 Nov 2024 03:53:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 05175C4CECF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7ee51d9ae30so1029844a12.1
        for <soc@kernel.org>; Sun, 17 Nov 2024 19:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731902025; x=1732506825; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iziczI7ZYYRzrx5DXDLTU2aWQXZX8V3J+sI1zP/uoWY=;
        b=zuRgBv6j62J02KofVYjEMJKssR77/bGhNzqXA/F6Upiw8vY9yVHOq5gAiwvdoeis7R
         6T/Gvs5GfbJUya77ZDe3FUksCW5mbv0sUHXwHDAqHmeRTynWS45Qts6ujErcdFgosbUV
         LEJ3bTAUxI9XP2ONZP5FBU9hlucysvLna4zdQogYJq6siNnwZjv1pnGfpFhinn3rRe2U
         cCyNkuewxvkfPlaCE44DJCeZxq2K8+qOtcu6ufnRzb3y3wBXcjlw3gDopcetm8A2kAM4
         +qx+rrXon5smNa0LlpI9UWFIv9ddRHthapvzKcFkdSejhlBgBJqax1zZvHIIdNDMNqQL
         E7ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731902025; x=1732506825;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iziczI7ZYYRzrx5DXDLTU2aWQXZX8V3J+sI1zP/uoWY=;
        b=kwyw5L5m0C9JaOJ3igbNh4D5Irh/fHSvLd3cPDf7kY/rfIwArknScBLGuxI8uhmaJo
         u/5CxrKb95Zx5dNDslozaGjQDP+BjPRea33l3ZMi3P8fN06qY4etw66rdcqrlUdIaEJO
         KTk0Y1R/LwwCGLa1UNZzI4XXnEdag+S68k+CYw36uV216y0BLdGwQVmIJxjm5IFHwt8D
         LS9M+zurXrJWkrUPtcnIAZZ+fpnfIGrrVQ8B2UotDA0TR1hEcC4/ztMccjgJC7LxBISF
         s2hwEAszjQHTOpCb6c+xzd/rco2YrDtnclvgA3t3eipee8N2mVH95KzyyGxLY121KDm+
         5eGg==
X-Forwarded-Encrypted: i=1; AJvYcCXIc+8QtXtr37iekfMMNd+KcMyCGF9+df3SpisLtyVMOqFS6guB7eEminCZ/nZjHtFBwYU=@kernel.org
X-Gm-Message-State: AOJu0Yzod5mh1JO11LApK76v9Iw9XaZ57U4v+Co167PPldCrzpQ5kmbo
	gG7HFwrVWpo/wAY71TncMi3l8dTCUfKCbgyi69QVyG9DjdmwhtSNfosOjjHffmw=
X-Google-Smtp-Source: AGHT+IGYl9W0UXIVLMASe6ljQEHSvMFAGPTR22VIIByVAeNekYNbpUP8Pv6DHUaufX/uZNV/YdmOCg==
X-Received: by 2002:a05:6a20:840d:b0:1d9:3acf:8bdc with SMTP id adf61e73a8af0-1dc90c05eafmr19652857637.46.1731902025266;
        Sun, 17 Nov 2024 19:53:45 -0800 (PST)
Received: from localhost ([122.172.86.146])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7247711e005sm5159648b3a.72.2024.11.17.19.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Nov 2024 19:53:44 -0800 (PST)
Date: Mon, 18 Nov 2024 09:23:42 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm: dts: spear13xx: Remove unused and undocumented
 "pl022,slave-tx-disable" property
Message-ID: <20241118035342.ej5pxzrn2lildyzk@vireshk-i7>
References: <20241115193835.3623725-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241115193835.3623725-1-robh@kernel.org>

On 15-11-24, 13:38, Rob Herring (Arm) wrote:
> Remove "pl022,slave-tx-disable" property which is both unused in the kernel
> and undocumented. Most likely they are leftovers from downstream.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  arch/arm/boot/dts/st/spear1310-evb.dts | 2 --
>  arch/arm/boot/dts/st/spear1340-evb.dts | 2 --
>  2 files changed, 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/st/spear1310-evb.dts b/arch/arm/boot/dts/st/spear1310-evb.dts
> index 18191a87f07c..ad216571ba57 100644
> --- a/arch/arm/boot/dts/st/spear1310-evb.dts
> +++ b/arch/arm/boot/dts/st/spear1310-evb.dts
> @@ -353,7 +353,6 @@ stmpe610@0 {
>  					spi-max-frequency = <1000000>;
>  					spi-cpha;
>  					pl022,interface = <0>;
> -					pl022,slave-tx-disable;
>  					pl022,com-mode = <0>;
>  					pl022,rx-level-trig = <0>;
>  					pl022,tx-level-trig = <0>;
> @@ -385,7 +384,6 @@ flash@1 {
>  					spi-cpol;
>  					spi-cpha;
>  					pl022,interface = <0>;
> -					pl022,slave-tx-disable;
>  					pl022,com-mode = <0x2>;
>  					pl022,rx-level-trig = <0>;
>  					pl022,tx-level-trig = <0>;
> diff --git a/arch/arm/boot/dts/st/spear1340-evb.dts b/arch/arm/boot/dts/st/spear1340-evb.dts
> index cea624fc745c..9b515b21a633 100644
> --- a/arch/arm/boot/dts/st/spear1340-evb.dts
> +++ b/arch/arm/boot/dts/st/spear1340-evb.dts
> @@ -446,7 +446,6 @@ flash@0 {
>  					spi-cpol;
>  					spi-cpha;
>  					pl022,interface = <0>;
> -					pl022,slave-tx-disable;
>  					pl022,com-mode = <0x2>;
>  					pl022,rx-level-trig = <0>;
>  					pl022,tx-level-trig = <0>;
> @@ -461,7 +460,6 @@ stmpe610@1 {
>  					spi-cpha;
>  					reg = <1>;
>  					pl022,interface = <0>;
> -					pl022,slave-tx-disable;
>  					pl022,com-mode = <0>;
>  					pl022,rx-level-trig = <0>;
>  					pl022,tx-level-trig = <0>;

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
