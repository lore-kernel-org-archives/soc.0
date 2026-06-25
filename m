Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068473603D9
	for <soc@lists.linux.dev>; Thu, 25 Jun 2026 09:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782380466; cv=none; b=tjj6Pu6suNGE8qtv6v/DNgvpT+hju3DeKjX3Ce6+DEAwsm5BCfRhSxbbkh5SVYSkAH9uAbgITRKtgvspvv0Lbax0S/gcfCpJZvshuA8moXPpVU4FxsgKBjKRW4wOqGvJBjhci2KxYhq0C8DNkgZ8b4UMZ6YsM9P/fjxjfU8t31U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782380466; c=relaxed/simple;
	bh=01TQELyIGZMIZ6ifnSQh3g6j84rp/OerX7AwLUwHD48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sQiYsH+9HYkXzGokR0LHPPPE/sXsz7kUD4BpcSNF0MPx6aXzPoPd4W8jNL4g0rSob8LpwAVY9w0GGgVz0+5ruUN7zinhnAOHAm3n5xVqljORrIHk5DS8oVDPYT/CfXW/fZs+ckbEO+TgVXWxLStClfkOu4UlwRjvp6NqsUNnvBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BpjLZ4O8; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BpjLZ4O8"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-30b6dad2382so3653302eec.0
        for <soc@lists.linux.dev>; Thu, 25 Jun 2026 02:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782380464; x=1782985264; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l7XIr/SVC6sMz8goU/VKpbT2rVvzknx033F8HOJiudg=;
        b=BpjLZ4O8heacWu1DGsAu8cw4GFfvAUH/VRLqmuWnMJMkNHQjd1yOEeDKMLw6F/de4V
         Y9r7Mk3cPlUqVFft9kEYzKkeawJjGbRzk4BfTdW5kgRsQi6lKZwNZH2hQnVEeSVnLtMW
         0yZhB5RMSOWTmikwscmRSvSJlhdBXiBYM05xKZvSfcRDvVQNlSDFIvjYuyBdnH+89Ucj
         HZl3Gai4gaA1uYNmQBwJE3kSWPw7LK1dmTjURAXt6/udHyyEIwisguUZtqNDU6hwXV2q
         kppOgwhzqRtQv4mmCXoL/BoqcS+Bl/kbRvsT5BnFk2FWdLFyVXDTETCdOJD22iUhJERo
         6v+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782380464; x=1782985264;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l7XIr/SVC6sMz8goU/VKpbT2rVvzknx033F8HOJiudg=;
        b=D9LfqJTf1+wUU3KB73KtfTvUQs2xqS5F0UgmLEROExMXtTpziU2et/C31t2+ll6ZkV
         7W9wu8yTKbD/++X8w+br4xUvgDvuHGKEkrNXfz63CSTuRUhzyD7vTuxYN0vExRed98RF
         nHakXBTaROgmAe63M51bELxvcrPLxDS28auVoqw6esuChcswGF12YlRK6wQIjrPZY6Rm
         X7HtVa/KL/7ixB22VcEJ9xlvzM7MEkT59hsGNljb9DfgRSi9OUhlxMrRgbvt6bh7wHGr
         U7DMwsEkrTFyERsUCQMIQVQPU2IdqM2SdADMpxzCHXIEW7/Xsv0OUwxMMB3gU+vmIAlr
         b8gQ==
X-Forwarded-Encrypted: i=1; AHgh+RrUoDr71F8DvPEufpMYTwheTMpdKkVMOkYUYzwnR4/SIa3nXA4celbhgsOIWZUIj+SzVDA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyPmBN6Iqnygr8/LWzhOynhV5PeL2VzSCYV6CeONB4oHWiTkqZ1
	EW94p6ImBcBLJqnEaXW1fqdk5+tSYBttUBYi4KShg6C2uDEjIziB7I23bFtUWaHnK2o=
X-Gm-Gg: AfdE7clzEhhCXwN4htMFVn5V6+UTikwDe+0jWs8Wj1HLB5c9uSpF7hHbdSHtqzFTKCL
	959s9kUu/SrSLsYxvyGi0FMvggjcVB6JonHBZhLHJFk9RXn0ztMKIkAC4UQk7IRC1usXLqrPWOJ
	/ryMap5ZQhmOvltomYfevrOOKs1mqMYWt6tpPL2CEMNyhlrrhMVMgPhpYOI3IKUVGmpyt4HK+qz
	FLRqaijz8KOLOOZKYqcHKUYu1m7brHWKTs8Q36MF/axKLPMBg3tMTxFw1+z7ERjaUJG8GQgC7U/
	x/MQAQ2tq82Sqn1aaArD1wiuepxHPnjkosumVZIF7/uuxEt+Cebt83aJ2UhKIaOf+CRpaX9rCbU
	JyEFpysfIAUCyo6TiMMJv69Ces41fM+wDXxl7eh2MzLYc/4wwFwipWSThTqFQ0qBVDeD1jjb5SO
	feYJ8Z9bGn/fdt
X-Received: by 2002:a05:7301:9f01:b0:2ea:b85c:153d with SMTP id 5a478bee46e88-30c84d435f3mr1984449eec.27.1782380463873;
        Thu, 25 Jun 2026 02:41:03 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c52eed6sm6731893eec.9.2026.06.25.02.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 02:41:03 -0700 (PDT)
Date: Thu, 25 Jun 2026 15:11:00 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Viresh Kumar <vireshk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: st: spear13xx: Drop unused/incorrect usbh0_id
 and usbh1_id
Message-ID: <eckh7zm6qgtnlo6itbq6w5s5hvss2b6pbp23lyoaqpfzixghvb@skswhqwiwoy7>
References: <20260625091355.107054-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260625091355.107054-2-krzysztof.kozlowski@oss.qualcomm.com>

On 25-06-26, 11:13, Krzysztof Kozlowski wrote:
> "usbh0_id" and "usbh1_id" properties were never documented and never
> used by Linux drivers, thus should be safe to drop to fix dtbs_check
> warnings like:
> 
>   st/spear1310-evb.dtb: usb@e4800000 (st,spear600-ehci): Unevaluated properties are not allowed ('usbh0_id' was unexpected)
>   st/spear1310-evb.dtb: usb@e5800000 (st,spear600-ehci): Unevaluated properties are not allowed ('usbh1_id' was unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/arm/boot/dts/st/spear13xx.dtsi | 4 ----
>  1 file changed, 4 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
