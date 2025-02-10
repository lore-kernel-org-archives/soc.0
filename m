Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49AE2F2A
	for <soc@lists.linux.dev>; Mon, 10 Feb 2025 05:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739164408; cv=none; b=hXgQd/cF3CCKsJc7tI8Bxu+XJSNG27hMaz9sMyIZiD9N2FWCsciET6s0FkBuqAf871h4S/oe+ilmZTWqcdXQWWNFy4/4kbIdyBfAJ14NFV7MCk1W9W+uqkkIqMLsyQajpCt1/lYSp7a83BTIFlEGkzdXfTbdUPtGgxXE9zUwuc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739164408; c=relaxed/simple;
	bh=Yy3r4PsA3UNf/B+n+73OC53paIxgA1UuvmEBApzbu6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mHMfmRhi0bVBcc03huTD3sp07CPUv8NDAjS6j33UzVU/SH1KxmNBjcqip505m5xPO/5vJEl4ucJusaekwjMZ5OE9cWQZqOiy8zYBf8ymEj/JRnuAsgvtwLWX9swjadeE1uGP5itaXKWyIFuFt6CbNKcVDUJve/P1HMLZvNyZ158=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L7UMhtJZ; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L7UMhtJZ"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6dd01781b56so48752906d6.0
        for <soc@lists.linux.dev>; Sun, 09 Feb 2025 21:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739164405; x=1739769205; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=agclTjP7fEfHE9ZbA7+HDdh1UA82ZmbjCh5m/2fX0Tk=;
        b=L7UMhtJZolDPHIn8Qoi1LNAP1GGKXY/T1J3tMUEgnTIKjcWewHi6MA7dN2eLCTMMYa
         HnBydgAf9Ks/MDQE0Dxhhtp8FC2Ky35twCWyTpvOXVdXTSsY1LveGUL8dPzb55hFwTpY
         ILlGE7CbDIjNzW1iV4nzk0VJDGLAHTBixaTl2Wsz7fxzUE07hbPm9lBxf/FTlnEiwt4s
         foqc9eH3KcVP+cSnVuGXJB+nhSOXLAUyjOokqOHYt6b8ZldiRC8gtvc7lrdonH5Vo/ji
         eZ9mPuKrr0GO1o430KhzATQPgyIS5/T2QHLEBI24t/xUdep3wL1A9gOgxXduAq9hf/rb
         Z/1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739164405; x=1739769205;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=agclTjP7fEfHE9ZbA7+HDdh1UA82ZmbjCh5m/2fX0Tk=;
        b=H/4VobUnmbbJySIQ3LVbmMWG2HvIjQrwof6j97KK39GFoLex1/2USnZO9N9U52TbF6
         qiwlSou2Pg+Bu0oDxK8GSNbv9jecKzHSwIHOPcZujA9IUzR36bp3cGjwBjib3M9YF0pr
         73WxoH5+T5cmyfo84UqtDksf9ohi1J6583p6ywO2oL4UBw8+znT0iGcxV61tc1VT2Hly
         hqP6IFs13x+9VsVUJ2MeYs2HeyOcWHgBA3ACq2qi8FjDLfwDJDvETGPO+dVSlQNLbfFG
         v+/cvwsIFo5HVApnIzJOgvlhVUg5n4q09cCU1bhiAQDn8LMRMulSVkbLE0/oZkQbGT9p
         c0pw==
X-Forwarded-Encrypted: i=1; AJvYcCWhPKKIgHEB3K9KP9L1epLU+vdJpQzl6MsGcQl1axuKxkh6AdW5vawP6yGJ8yRywU6yFhQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy36kHR3SSN4MLRpqO5Y/8H7mrLl1Q5wlaCdJn8s4YL1jrGS9Y2
	/E3pu9Q8UVmXxziNYYxZUSo1bvMM09vO3a2PaniyClOVIMOoBl//
X-Gm-Gg: ASbGncupmAXXk5FxgugSp4mvPURzH6uzEB/2meaNwxi3F2VxQQCWAv5KFpSokLSSTgP
	ZOHQswmSl7SNzo0h2HSC+b+RdZmIIPxpiHmTnzWZJBZnEX/05PU/BjmciI6xciO3YcFEwcoXlcE
	NLeavP8Vcu5drAT1gJEDhqVf2QNcATV0f2KiyM1zmN3owCsGC+fpBw7x+bK34McCv5MNHfJL/7N
	F1rPerEsX2ftUnHBXUnPqrD8V8cG8EBLz2sfEGnx/twSJhmigOmowZFop10Q6oc/TY=
X-Google-Smtp-Source: AGHT+IFb5+9bUDyZ2/KMakoA1ZjQWacjX2m04FzqnilqR+JO1e76blKltvPbpM5FBk/hlumRWhF7cQ==
X-Received: by 2002:ad4:5d6c:0:b0:6d8:d79c:1cbd with SMTP id 6a1803df08f44-6e4455fa8bdmr169993666d6.15.1739164404767;
        Sun, 09 Feb 2025 21:13:24 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e44715a9cfsm34485256d6.104.2025.02.09.21.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 21:13:24 -0800 (PST)
Date: Mon, 10 Feb 2025 13:13:19 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, soc@lists.linux.dev
Cc: Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@outlook.com>, linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, Haylen Chu <heylenay@outlook.com>, 
	linux-arm-kernel@lists.infradead.org, Sebastian Reichel <sre@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Subject: Re: [PATCH 08/10] riscv/arm64: dts: cv18xx: Add sysctl and reset
 nodes
Message-ID: <h73zitljaig7nrccd3f23i655imswv54tf667dhq3dord7rxsr@unqncqlorvc6>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
 <20250209220646.1090868-9-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209220646.1090868-9-alexander.sverdlin@gmail.com>

On Sun, Feb 09, 2025 at 11:06:33PM +0100, Alexander Sverdlin wrote:
> Add reset controller node and required sysctl nodes.
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---
>  arch/riscv/boot/dts/sophgo/cv18xx-periph.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/sophgo/cv18xx-periph.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx-periph.dtsi
> index 53834b0658b2..d793b6db4ed1 100644
> --- a/arch/riscv/boot/dts/sophgo/cv18xx-periph.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv18xx-periph.dtsi
> @@ -309,5 +309,21 @@ dmac: dma-controller@4330000 {
>  			snps,data-width = <4>;
>  			status = "disabled";
>  		};
> +

> +		rtcsys_ctrl: syscon@5025000 {
> +			compatible = "sophgo,cv1800-rtcsys-ctrl", "syscon";
> +			reg = <0x05025000 0x1000>;
> +		};
> +
> +		rtcsys_core: syscon@5026000 {
> +			compatible = "sophgo,cv1800-rtcsys-core", "syscon";
> +			reg = <0x05026000 0x1000>;
> +		};
> +
> +		soc-reset {
> +			compatible = "sophgo,cv1800-reset";
> +			sophgo,rtcsys-ctrl = <&rtcsys_ctrl>;
> +			sophgo,rtcsys-core = <&rtcsys_core>;
> +		};

I think these node is not suitable for riscv. It should use SBI SRST
extension to restart.

Regards,
Inochi
