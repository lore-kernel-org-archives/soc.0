Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5264D2F6FB4
	for <soc@lists.linux.dev>; Thu, 17 Jul 2025 15:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752764757; cv=none; b=SDQKBv1vpiN9U0L9sWmDWlTdPnRGPKqnuWNWDpxOU6PhUDHiP4NKx6V3YFhaehtjqSTnXlOD6R2JfyD4CSDNuU5ObnjFbJKgTDcluylcJyB5Y91L+YuPSpZrokqZ7tJX9xCwsnpOxafK8PFabYFJVRvz+2p+TV84YyXi3ebvjv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752764757; c=relaxed/simple;
	bh=PiEt0WUNVAcC4VA3CIqOQac/Mlmo+xQ0LJdAMNjG2IU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wvr1RLudQmqEf0jv61g+7gimJERTnhXqUjiMDS1myD7GGAqL7DJ5i27bNcaVfzX3dxUiBPqLWxKyngLfabyWmwbgUMROqr8bl3xyVQQ79pxVeumSPz3+xIF7HUXkAavfufMNrKwj94To30bb839lGGs6x4HfykvXH+HPHRftj6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PakBZkh3; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PakBZkh3"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b31e076f714so1564348a12.0
        for <soc@lists.linux.dev>; Thu, 17 Jul 2025 08:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752764755; x=1753369555; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GRGgDk68DjbbOF0Mf8ErVPDVdO2Wa0CpF/l7W27oV/0=;
        b=PakBZkh36zPWGwXb26tFAXknv49Ly6lKL0nsaUC/WeMdm/aGKfVFHo0PEJjMn+z6VC
         YKwbc1weyDTJT+mtSWQyuc24Yv0V8fvsiGezAgEItKOSohpGNAyOWgVJYXeqDAwOwqmR
         3ENqAn1PanczZAPn4bSVGCOhqqQkJczNhbaCFi70yd4Xe1M9eAnYa7TECc1Uh9eY3KNf
         f9kmvexSVcA5b+x7K3nqVJkIr/gHgYRLYwTGOQxzrVMQfphikx1ig3YR6NilgVU112uq
         DANz9CKbe5T6hachXUv9khGEtltVWB3HC7FkiLupA0otyNx2vpZ6loL+0ELA42qF7FI5
         I3Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752764755; x=1753369555;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GRGgDk68DjbbOF0Mf8ErVPDVdO2Wa0CpF/l7W27oV/0=;
        b=LBC1nWo1D7zsJIAKETOgBOJZ489jT55upoXfEM7GFBIF6gS0QOPohKrt83XQl3rJpH
         gEJOrAVqIyL3mMzkOMJQf08/UCurYFwbeDGjNv+rUBG/LGvbUGjAqUaw9xcxO2CjtUJA
         QbsrjgRM2T4dpUxhF4bdgQNm8/0ZDCQqf/MgDtjgwgHdGw93ndDIN18Jxgf02XXmpAAV
         s9R+zRFdmO/lHuUedM2dbzsdW4mRcHYBPrgSTxLoHHhtahCYGdzkeOAUBBI32GyeAHa+
         BmyIxQY8g1PPwYWgXZ+B58cD9sSuFq7bevhcysXnic1psa5JISc6Hv0v0X7Q1tPqHz/H
         gZqA==
X-Forwarded-Encrypted: i=1; AJvYcCXRDuSmxbycS+B/e+0OZfxb/XAaS4ATLktraUCqIR1ec8BcVLnoBSAdko6NkEMeHj2mPKs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0AThGWhVJCHeF8NYRdcFKoKn6NMgE88XNRcUZnQ9M4IOPI8kD
	t0YytehzhlDvVLFvWixco/Rq20VBfhnBNoSbjVyX3PLOe3sL13xPXMY2ZhmFKNFCcqdI/KAAUTL
	McKGi
X-Gm-Gg: ASbGncuoWiIB4NXdjVC5nGJPl82qYxn7zRCISqD4ALIVFPt9JbATcHqpFH8i8e+tZcV
	MnhGdnBXfUcatnME4hhWwHlYRsNQpd6/PlHA8YPOjE9gcLRGaP6DeiP/nXaEq3Fk78i3bSyqNsY
	++ha9HZjHHZh5C0C1w4NSYXITyZz7K0i/2HJLPatQAealigSFqCOQ4xhZFKlYFNiryv81ucIbpx
	wqBtOYzIcEWluj89uVaQI865HuC0ROXfobb39Zvq3GrnUvhaAcNQVAt1+2pNQigKDkz9IMTf025
	VylCCup7V66nj1aYSRzOH4ctgrH5DtKzfSzF2uBZRygQDQ4rouK85vyX/Tt5CedEXyU+cQen/ku
	U+0Uh3SiUZGfG3G3/6CQ6MnQ=
X-Google-Smtp-Source: AGHT+IHlh4bBfrPfyZ+HtoQSqJqUSTaWT2KGepkcnD7iDpNKpIyWaajI2q3Ei5DglAzRDFNmmwxtvg==
X-Received: by 2002:a17:90b:2804:b0:312:dbcd:b93d with SMTP id 98e67ed59e1d1-31cc045a7b9mr187971a91.14.1752764755374;
        Thu, 17 Jul 2025 08:05:55 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c9f2874f9sm3475334a91.24.2025.07.17.08.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 08:05:54 -0700 (PDT)
Date: Thu, 17 Jul 2025 20:35:52 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Viresh Kumar <vireshk@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: st: spear: Use generic "ethernet" as node name
Message-ID: <20250717150552.6kj6xqksc2xxpxli@vireshk-i7>
References: <20250717142245.92492-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250717142245.92492-2-krzysztof.kozlowski@linaro.org>

On 17-07-25, 16:22, Krzysztof Kozlowski wrote:
> Common name for Ethernet controllers is "ethernet", not "eth", also
> recommended by Devicetree specification in "Generic Names
> Recommendation".  Verified lack of impact using dtx_diff.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm/boot/dts/st/spear1310-evb.dts | 2 +-
>  arch/arm/boot/dts/st/spear1310.dtsi    | 8 ++++----
>  arch/arm/boot/dts/st/spear1340-evb.dts | 2 +-
>  arch/arm/boot/dts/st/spear13xx.dtsi    | 2 +-
>  arch/arm/boot/dts/st/spear300-evb.dts  | 2 +-
>  arch/arm/boot/dts/st/spear310-evb.dts  | 2 +-
>  arch/arm/boot/dts/st/spear320-evb.dts  | 2 +-
>  arch/arm/boot/dts/st/spear3xx.dtsi     | 2 +-
>  8 files changed, 11 insertions(+), 11 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
