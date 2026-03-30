Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2382376496
	for <soc@lists.linux.dev>; Mon, 30 Mar 2026 07:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774855098; cv=none; b=Q8aU9mcBIfbluvtuvmIwlNmKQsbbNGESYxkbyxbIz8X9WxuDNlkrgveoKAxZ8qzuVJjeGTLLWS+Nz+QfevUfV5H5aLT/ZF8GEFUzLP0184vvzCU+ip4grjKVgWghqNK4AISGX6XJOySvrL97vJjrzX67iIiJ4L6pVGrjKhKFtbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774855098; c=relaxed/simple;
	bh=h6fkI4F2Z20kN9B9QXjQ+evk+vdNQDvCzuT6cAe75bw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rR2iLsBnYyAj0TX5TMMeWfvix1+jWkWj0pSzNmda8ZK51KdB5Osy8lx2+uurwsKfz9ojY2oq5hXOcCyJY/Vb24nvcHvInSnJEmUJ3Ng/kdSJObj3bH4d3Fm/cO9ICCuNTNoC/nyIFVena/hVXqMMq1GjmzVcee4BHvCg9ZPJ7+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rb7LB3Ii; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rb7LB3Ii"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-35d90833cacso1133174a91.2
        for <soc@lists.linux.dev>; Mon, 30 Mar 2026 00:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774855096; x=1775459896; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9l0DICorx9e3YtEUL9sxg4iXIgZ/t1UyQoc1s5iSxOA=;
        b=Rb7LB3Ii9QPLDrgSJ8tRUiZCQvA1svxdXup7ictLDApDjDmnwFp76VtZB3AyeepCm9
         myJ+YcL2gCDZEzoJOT/lD6JwK1Tj37MmFvye+mAThdlCv5kx8oJhMg/ssyAzDrsirmT/
         IfZj/YW9WC+lVVZCl5Tt5m/sF9KY/OwIQTiSbyQIW+Mr8904hF69rtsqwpbmZFEPLS62
         dxP2thG671PS4B8BGlnOCYGrfvyMpA4DHf18TnBOsKHQR1997DQnxGcQ1ExJDoIgG9mW
         p1CWgTDvdWPSQTe10uYlp1uO5A3WCGTh1GETmbwGm/RhQMxDrq1wrqJi/fajyEbbuYG8
         QqFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774855096; x=1775459896;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9l0DICorx9e3YtEUL9sxg4iXIgZ/t1UyQoc1s5iSxOA=;
        b=XPGxoInTOwf1gMBDjRlLQxLKJ4igXFybCJOiybnaOLf6R/0spmW4exk3+gva9fbQHq
         61DxX+gvXM2gMXAq9gn0VcclPp1a+gPEyxtNxWUphj2Fjh792zQWGCMhZVor54azOh70
         CT8hYex67D8tIX+gIVA4HkE7Vin7QaS5OtsVGTdlpcE2DQeUE9epErlZSjnYM+ie/KJ8
         s0Z4h8TpYtyvAoxGwXOT8ATITTXCSAIDgi7cMcjxiSki0Jr8er4l8Pr41y7+tFzl+t/g
         DDzpSJjwPZPZVmFsd1PU3TnEzypaDIOc5isICtjBM6HFkysKzMKhRPv9vq3iD4QwBXCj
         47lg==
X-Forwarded-Encrypted: i=1; AJvYcCXZweiUJiejgX+xG/j3OjlH0aUbmMnCDsjC73UkCPI6La7SiFOI3j2eWuPmeaqw/BYRVds=@lists.linux.dev
X-Gm-Message-State: AOJu0YxlJieazon4rXSFeuKn6cmWzh6hXT5NoGEPR6XHyd8yuUQXDpbt
	ezeqHj7oy9r/gvG3gsCqKERhFcMZN9kEehgkTY/V99gTN+BTYzOBN/RI1kyu2UCLjj4=
X-Gm-Gg: ATEYQzxNEews4XmiJm1F+s/t+DoB9h+qc2QdhRzVc7l4ebJRt+ofbw8Y8sFZXl6LDXE
	BzyM/dg/jSKYDBpQwbI9Hi3+W0IuMKJtrXGgFs85846Mk+9Sx7woFk13UGlpbttIt0nIAG+hqq1
	IkLEC0DQLvgbC+w910kyCWEhrQvkdVeS7amDUGDjUonbC0NYKZRDG5cTsoA9EC6Sh7fkwjUtskc
	LOHWB4ItLGEWVt9YFIl853td2y6DBlchCeHj3bQWmmcl4700hbi5wIC6WyNzjW5SHQ9pRAmyz8e
	2ftGmAHQe+toyHeHwwY8I8D5Cmkhg6vz6763+hUqjXeVZdae9b8Gw/2d3XwNlGjgmjAt4fGXuDA
	23Zj8pva5zncw8iB/+4cGjJVH/6pOTNm0djE/zYeL2CsV/khBqeTnY+0+8o9Eld6cW3zLIesUYh
	/mP9nvQa0C5FO3/wdwi4dCUY4/
X-Received: by 2002:a17:90a:d403:b0:35d:a3b4:2f0d with SMTP id 98e67ed59e1d1-35da3b43086mr3290718a91.6.1774855096016;
        Mon, 30 Mar 2026 00:18:16 -0700 (PDT)
Received: from localhost ([122.172.81.200])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76916baab6sm5415873a12.2.2026.03.30.00.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 00:18:15 -0700 (PDT)
Date: Mon, 30 Mar 2026 12:48:12 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Gopi Krishna Menon <krishnagopi487@gmail.com>
Cc: rafael@kernel.org, daniel.lezcano@kernel.org, rui.zhang@intel.com, 
	lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org, vireshk@kernel.org, 
	conor+dt@kernel.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
	daniel.baluta@nxp.com, simona.toaca@nxp.com, d-gole@ti.com, m-chawdhry@ti.com
Subject: Re: [PATCH v3 0/2] dt-bindings: thermal: st,thermal-spear1340:
 convert to dtschema
Message-ID: <sepwwys3izddmyokbkwdgqxzta2oceu54u62dj5mif4c2am7ku@vn4ewcicx2vf>
References: <20260329123449.309814-1-krishnagopi487@gmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260329123449.309814-1-krishnagopi487@gmail.com>

On 29-03-26, 18:04, Gopi Krishna Menon wrote:
> This patch series converts SPEAr Thermal Sensor bindings to DT schema
> and removes the thermal_flags property from spear13xx.dtsi.
> 
> Changes since v2:
> - Reword the commit message and subject to correct explanation in patch 2
> - No changes in patch 1
> Changes since v1:
> - Changed unevaluatedProperties to additionalProperties in the binding
> - Reword the commit message and subject in the second patch
> 
> Note:
> * This patch is part of the GSoC2026 application process for device tree bindings conversions
> * https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings
> 
> Gopi Krishna Menon (2):
>   dt-bindings: thermal: st,thermal-spear1340: convert to dtschema
>   ARM: dts: st: spear: remove undocumented thermal_flags property
> 
>  .../bindings/thermal/spear-thermal.txt        | 14 --------
>  .../thermal/st,thermal-spear1340.yaml         | 36 +++++++++++++++++++
>  arch/arm/boot/dts/st/spear13xx.dtsi           |  1 -
>  3 files changed, 36 insertions(+), 15 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/thermal/spear-thermal.txt
>  create mode 100644 Documentation/devicetree/bindings/thermal/st,thermal-spear1340.yaml

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
