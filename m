Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DF724336D
	for <soc@lists.linux.dev>; Wed, 25 Mar 2026 07:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774422485; cv=none; b=Z0IoqbpDLfdR4JALEWpnF7O5YH6Yg4DN9FWF5mwKsDrEXTVCgBn5/YDcRUP+IgyNDcyv1No3L/fFAXF3yoHYI8S3zykEiRtIPF96X+cWl1Te+RgIwLflUFJjfEBqtbzvx6xaK3hrCDpRQkJ4l8hkpjGIqN97dss/a8XJcehp4rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774422485; c=relaxed/simple;
	bh=lWhMCgGwZqY405F2HVxzFZrIU7/we6NJ0xph2yEOyQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h/ryhd+2mId2MiYE1/UjbGk/tgHWW5wI/sRFHMoyKRC5kOJHeee3jHfyh8+TEvN7BaBLyxYvHjp6sY5VsX1+9HXNGjjEXXuzAdmLVR2IRxgilNA8zNNwi/7WsDtkrpARCSxHKiarRrtk9DN7XNP/xttFA6/XY5ujnRxGuyKod/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jMOgM3Ic; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jMOgM3Ic"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-35a1d4a095bso422283a91.0
        for <soc@lists.linux.dev>; Wed, 25 Mar 2026 00:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774422483; x=1775027283; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+KMORzaHZIt/O0p0OreFRdLlztvWKjQgycAj/ZTHugc=;
        b=jMOgM3Icv/nP/EIFww4FKIGHl9g3DLTlUswX9LiPbjlI2D4AYLPfmOTN2mABcJG6Fb
         iTw1qaisJXNp1tK1y1NZznXGMXDpkHO+4r0HWoxHiYPDIyDKKkkmD1msIoorl1clCFet
         ziC0flSU5cDK6zHK6MtPYKzkT1+4smv6niQtLnIAtwdp08o85cbSB6eycXfUrIC0pjRk
         uXU8bBYUlAfNtJM3g1456b61NR9zvydzre0YHPbAzBTc7zpDc2ZObrDgWih0+AMCXeDP
         ENpNMA4Ne0OWj2EinFgH5QUfnXO51nQBbPQvv+fATgWY/TkkFbQ0OH2PoaF4fy+7Cwo5
         irAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774422483; x=1775027283;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+KMORzaHZIt/O0p0OreFRdLlztvWKjQgycAj/ZTHugc=;
        b=VOiZV/Dhj8tf7eLepLYZsfrQ+vqUaQwB9QpVXpy0HCYSs0Sd2QLS1CSiE8gV17eQg1
         PLVza412V7U6AJ5GKegcdULQcKs/rtcukWfkBj3be7maKkzcETsB2qTqwiBZGwy4hvMn
         6ewqu6S2Q82qguKZqzebMcwoevVu/n4zFZIF2xMg02oY7JeOjif1smQpl2OfH//rO4ni
         /t/R3+i2LxpedEqvIHYiPAVd7nvcNt9zy8VrgJIBq5U/g1NiUAzU2AB144GE3lre8Dr0
         KYQlrQf/FWB30X4NgHIHsfEw9u6Pzw+XOTm1lIviV8ar0XpJw3dOsMxEf9jWcBHscwdO
         8ywQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2idUTtKODUGzMTNmaPnmwD22VI7OEWsiDheb4jhSV1rHvJnQwNhDMNlyTdfuNhVlcE5c=@lists.linux.dev
X-Gm-Message-State: AOJu0YxDHVm3u5qFweVHlkOW+D0s14uFMZIqORkMadtNW4D05vQmUr9w
	DTnFj1/Rv5brqmI83Hqgy6aWE1fW8kuXV9Q5oDOW4QmT5EWeSfZgDkgfYhlBCUsMoRSUO4RPVhg
	WUgYr
X-Gm-Gg: ATEYQzwXvQqMhUt3E5ntSYLZ93GeuA2BjwliJ7lnGKsV22FNS6TzY7JPpblrXWuaVH0
	eZJJNkdgCt7ZW3PoftU8pLcCV5DJXiEEBzFyB66lMQ2jxzE8390IxK5U3ZV/rtQXz3V1y249DfK
	RrjFYFIPeeBSSNWqg3FZSLAoOXEsIZ/AQvbl1QcFdsbJTobXt6glYUPqKgJM5Y4n5wLaZr/45Xa
	bb8aN8bMRWmAVU7InjO2WUlSdnDsWeF9EnUyJVJwkiCBSUGNe+K/b6qwDzHjQaqOz/vQYantgkn
	oIpg6gzR+TnWmt87cN0kgbDxh/iYY5kbIbU3L8Yud21+IdENkracKkgCN5h+NviuGvfN1lM+/EH
	Tlpo8T82asAtvlzzhOtwjy3eaYi+IBnKcOHfrhN35BiXS9UiIsSs3fEwF15d0JARffdnrjf59aZ
	+6P9U85oBKi+mqzlw7eEnsFu+L
X-Received: by 2002:a17:90b:1dcd:b0:35c:69c:2a12 with SMTP id 98e67ed59e1d1-35c0cffc5eemr2303037a91.0.1774422483131;
        Wed, 25 Mar 2026 00:08:03 -0700 (PDT)
Received: from localhost ([122.172.81.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c0ea4807dsm442644a91.10.2026.03.25.00.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 00:08:02 -0700 (PDT)
Date: Wed, 25 Mar 2026 12:37:59 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Cc: vireshk@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: spear: fix resource leak in clk_register_vco_pll()
Message-ID: <brk43cgzeibwism24x5ub2uz5f3uveuljibgnztl4zrtd6jke6@lb7nipf5dq6m>
References: <20260325062204.169648-1-lihaoxiang@isrc.iscas.ac.cn>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325062204.169648-1-lihaoxiang@isrc.iscas.ac.cn>

On 25-03-26, 14:22, Haoxiang Li wrote:
> Add a goto label in clk_register_vco_pll(), unregister vco_clk
> if tpll_clk is failed to be registered.
> 
> Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
> ---
>  drivers/clk/spear/clk-vco-pll.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/spear/clk-vco-pll.c b/drivers/clk/spear/clk-vco-pll.c
> index 723a6eb67754..ceb82723fa8c 100644
> --- a/drivers/clk/spear/clk-vco-pll.c
> +++ b/drivers/clk/spear/clk-vco-pll.c
> @@ -343,13 +343,15 @@ struct clk *clk_register_vco_pll(const char *vco_name, const char *pll_name,
>  
>  	tpll_clk = clk_register(NULL, &pll->hw);
>  	if (IS_ERR_OR_NULL(tpll_clk))
> -		goto free_pll;
> +		goto unregister_clk;
>  
>  	if (pll_clk)
>  		*pll_clk = tpll_clk;
>  
>  	return vco_clk;
>  
> +unregister_clk:
> +	clk_unregister(vco_clk);
>  free_pll:
>  	kfree(pll);
>  free_vco:

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
