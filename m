Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9C38C0B
	for <soc@lists.linux.dev>; Mon, 10 Feb 2025 05:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739164546; cv=none; b=mhIe5Wso6N9EGomG6QN6bf9K8TRNzLU5rThqcyYbqK+zelGk7aVQMLZgsT+hT9bTOb4G1+UwN1McFDK3Aht3t86wFbdYp5v/Mkl7F69WRQAsuB4iqDW8epLIbuQ2gGMgVE/haG+lFVPY47OoG2YTPLtC+BVqe8hX01KAkWh9bIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739164546; c=relaxed/simple;
	bh=I49Os3Hg9shTQO+uWcYWYApq7iweL8ZgvJcrf7gXHx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L00vMQ13+pMyJW4XC+IMxbbZaXL1x/LZlg4JiGlyJ4mgcQ1DiHFrBrE2AFmFmN3TwK90niAr9ZZcTqoRZVH5AHrr6LiBzllDAfsbYLgAAwMsXQtab6pFDLGZ09T3gWk+yofTCzdjsVfyo4pIvq26/s2LFqramuygoDKx0o2NPY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OeqZ6M9E; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OeqZ6M9E"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7c05f7d9ac0so55898785a.0
        for <soc@lists.linux.dev>; Sun, 09 Feb 2025 21:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739164544; x=1739769344; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L9DLRZ0qU+2ZbcBORnSXjCBvtxIqhUuc8Y7yicFr4ec=;
        b=OeqZ6M9EZEqYCGVneCGkEUsUjq5fObTJO/+AVvxfprFYOjbVdblDCcKUHjrfS5OMgy
         W2AZ6UfV/APHspHIf2wy+pJXabJUQZzK1ZZ3ckkLm8l6Kt+WNqKpWT6FgjlEZ0h1OgkU
         PJrcnMRZkIUfRHt0CiXUVoHlLKb3x3o4rsdyHnsKla/Na6OU1xdFTB5UKuTlGO/y5hXm
         ZsI+a73v8kySh6uXVY1ffx0GaX7jHWj+aKaNmqVW+tE+IqFqG+uN/XLXkb16GJav2wM6
         k7cJWXGgEpuM66Z7qBSK4J9oNwXm4v9JEYIACoYHzaJrmSBTg7OQA/MNlGuQnGeazCGc
         B5LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739164544; x=1739769344;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L9DLRZ0qU+2ZbcBORnSXjCBvtxIqhUuc8Y7yicFr4ec=;
        b=bukZugR7ztR7eAYUyLI3RPgYKtJfL4jl4qPoBgjK05EDLBgQ6MGp7Z0m8LHAwUWnqU
         lSlwiVK/YOfzJe2+36S7bcnpLwqSi+IXnG/rsOAat3tWIGYUMd4wXkcwt7z+ndX4r4go
         T4SDk17c1PzrmDyflUudApzMWwSZkX6V7wlweMwueS9tXJOlr/w7+aW5pR7Prmeb8ADi
         9zKF7cS0IGKRXEOdKsWFwDw9rE+vjg2VJz6NKlQct/xMcUFUTV5Tn1O1BFzdcuiH94f6
         RKYfN/8dhcnrjtMlzBWE1I2K1VmTlAfFp86Khp3lBGZA9aR9AwlTJtmCM9BA2YasYtIU
         LO2g==
X-Forwarded-Encrypted: i=1; AJvYcCUF+UT+qeYXBy8bpmlzqTcphk/mX4QnZcMI7YnvMu+ynyU9tDutCvDX8E/VngRTXmQutjs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7RJjVcDzs7Iwz67xlb9VWBUeUTbVpI1A1L6O20zFPCmwlRvEF
	lRBX/hEWMQ9BcyJj/ZiAAoEJ/nIZjzQnm6BmQ5aYkrZY9xgj0EXY
X-Gm-Gg: ASbGncs9XMe3OTB+Dd/gA8dHmlviCneZcIOhbp8l6GPdguZ3Dfd5FCThlXAQRlzcZxD
	traXpdhO0p1X+RjbKJ3yk7gtLcXacBvkf8KEc3XGbikfCng9WhanHMJQRMmqfNba8rnje0Zl26a
	CRS+2FTM648cSPc2SW9Pu+FpQu1ApzTxXB3WRelK1we9LkggTBLTzEHzNt6vLGloO8S4ldOrRB/
	YdM9lM9sl2MuTJMb5xit124wC3Vb9nmKPb16RcaLXh5NAJ15sxJuksUmT1ET+zDxc8=
X-Google-Smtp-Source: AGHT+IGPRpX+BzWoRnQ2ghPlZC6fPh5J0DAxWKcAyO1DOBNAeBgJVLAvp3g9A/FBncSgBfpNJ8wavg==
X-Received: by 2002:a05:620a:261b:b0:7c0:5aa5:87e with SMTP id af79cd13be357-7c05aa50a21mr661627785a.44.1739164544167;
        Sun, 09 Feb 2025 21:15:44 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c041e13863sm484740485a.60.2025.02.09.21.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 21:15:43 -0800 (PST)
Date: Mon, 10 Feb 2025 13:15:38 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, soc@lists.linux.dev
Cc: Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@outlook.com>, linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, Haylen Chu <heylenay@outlook.com>, 
	linux-arm-kernel@lists.infradead.org, Sebastian Reichel <sre@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Subject: Re: [PATCH 06/10] dt-bindings: mfd: syscon: Add Cvitek CV18xx rtcsys
 core and ctrl compatible
Message-ID: <uhvm34h2edevntc6uw3u5qiuiwfaolf6iqlhuutfkqs42ievdg@abkygsjiajcy>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
 <20250209220646.1090868-7-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209220646.1090868-7-alexander.sverdlin@gmail.com>

On Sun, Feb 09, 2025 at 11:06:31PM +0100, Alexander Sverdlin wrote:
> These syscon blocks will be used for CV18xx reset driver.
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
> index 4d67ff26d445..5a0b102d1bd9 100644
> --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
> +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
> @@ -108,6 +108,8 @@ select:
>            - rockchip,rk3576-qos
>            - rockchip,rk3588-qos
>            - rockchip,rv1126-qos
> +          - sophgo,cv1800-rtcsys-core
> +          - sophgo,cv1800-rtcsys-ctrl
>            - st,spear1340-misc
>            - stericsson,nomadik-pmu
>            - starfive,jh7100-sysmain
> @@ -207,6 +209,8 @@ properties:
>            - rockchip,rk3576-qos
>            - rockchip,rk3588-qos
>            - rockchip,rv1126-qos
> +          - sophgo,cv1800-rtcsys-core
> +          - sophgo,cv1800-rtcsys-ctrl
>            - st,spear1340-misc
>            - stericsson,nomadik-pmu
>            - starfive,jh7100-sysmain
> -- 
> 2.48.1
> 

No cv1800, use cv1800b as the base one.

Regards,
Inochi
