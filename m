Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6B427F017
	for <soc@lists.linux.dev>; Tue,  4 Aug 2026 04:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785817283; cv=none; b=jTmAs0RG2DwqALrE8gbMg+9a3P0BOob9sG1rfHnXAwl5Q3HpJjaiw8FKYXAC48BjYO/3V+BCUlMdNd7J0/qFWrzSQBT4JF673lxadY3vGEoY23CKq1EOzIXJiN/JMSYAxuZHwEQTBKeKmSfhqt5GSlwpTTpgjUM2pQDYx/XV3/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785817283; c=relaxed/simple;
	bh=N1U4YH2rA30TenjPpOvIQ7i8FHYyt9DTIYZxboCCGto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qXgCDzgWKUTFVWJzYhUgtv+XuJiv3EAqlKWTIwo4Pkgxt5ScRm/hP3ugVcq5Upl/jvHXBq4i0zacGlF+Nq3IbpMe9D5s1aTV/s0J6xSFrV92vo10I6OOFLjyxBiDU54Zkh1+FTRZALlKfjuu92GpH+TzjJy/Bvr318p2xdKPZJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S+P8GOe8; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S+P8GOe8"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38fdeaed181so1593883a91.1
        for <soc@lists.linux.dev>; Mon, 03 Aug 2026 21:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785817282; x=1786422082; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SNaVEJ1HZqqSb/BWjpBmAcESh4gvUlmp0T6zod8QVBo=;
        b=S+P8GOe8j0uuK+rLIOBz6rXXBFxfToJzg0Z/px/YxVwskyNZFtSMQNrcTq6h5RHDlU
         dcqbb5itoA1vOdDHtQXZ9hIl5eSPxgb7QNHGk2v8iFScRVV1BjW3v+4Z6H/46UXwUIAX
         P3wPYN65kp2QBECYYIfH2IgrZ2Cj3Ho209wXcF0j2uQTPmX6z1dUg6jbvBVsRsc1APCq
         msMSmDDvhdq6MPt+J7c4VMfd3VV90NXic13Ey1h1HKcDEfwdp1l3ZZxj4ZU80upkDwjt
         6JYTUi0TPacsrXkuwiydpj3/Bk75CNWIZRdQQiSudSGStx/7jxwebK7DY169DRkkir9b
         devg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785817282; x=1786422082;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SNaVEJ1HZqqSb/BWjpBmAcESh4gvUlmp0T6zod8QVBo=;
        b=YXXVE3a3egJijdcdXXYFUllRLcmHALLV8vlTpAxbjAlFCskkBcuroTGlS9/5Gym/tr
         hrF6rnVs5WPfMp8wMXaWFYEqIxNqLYWqT7MVzQUOmr3Vo4/b2KHHd0jO/8V8liFRyGFa
         hrdrr9amz7j69BGjv+2xmOarWUFYxuXEckhYT+l49s9NKlmrXaJfp8IG6bgG2zR2lvxj
         eSEKE067EepJLCItx3YHykT+m5tjxwuFPacIrQniS2H7VKNk59oDQnfWZVYcJ0ROgh/D
         HLKng6qsdGqH9HoS9tPbX7GsgbOmzW6Ng8ECrsFms/2Lj0ohs/oQs+jXmCV5ZdRvQ4aW
         7Qrw==
X-Forwarded-Encrypted: i=1; AHgh+Rp/XVhdGyQu3uN4qN3a3AeevMlVGL18azz2pcmK0KBYNS+ykcUlgXUQs7FgzKP53ychVFM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7MDTNYXzVkagEWm81WKUbTp4IzWMT1qPNF3d3as3Uh4SDrs3L
	sOiKcP24SZqzVKaIyAuHd3R+EXdGLRcvwDVv1jP7/zBo+/29tme9bHCq+5lgDR8A6cU=
X-Gm-Gg: AR+sD13/KUDok5+lweO1KVR6by24N7RR4/0eLl1IupYTsgJVJ3eKl4qTCfAJ7cXq5Yc
	7ZZYdlcpMzjvIIZ102VnUgPK6PpQhqpSOOx3MmYRBDM5bSCvFwEQuT5Ydh77+mHpimpzhAUR78M
	hAe6AqAFTUwy4IQlzg3vTuH39CpsRq9q8mulA3xGOEMO/SlECMUwIx2wEXM8si2JmWucy9aUe/J
	mq0h0+E4dgq8HE7d8jjA7vrcIKmYT/QFb3XKMQg6b++X5A2gHX8E2qnrv7oQE9WU05dS4fWUfMn
	dWLQwl06R/qxVHLzSl4MHv9WeKOgnws8R26HwGK6ekk/6QJJexOe8v1RO13m7yOYaxGG2u5bz/0
	EcNJ3w3uKlOTaokZ3VftLqDYzI4QpSsAqOOERHsHjo43aW0ZUagRPcru2qiaagyGhOfwA/xJVtq
	CjP0XXNBCnFif9MK0MZHIWd4Hx4YoVnW/YRXzjyi6oPteJ77LM6i3N67c6aodH
X-Received: by 2002:a17:90b:4a09:b0:38d:ecfe:41aa with SMTP id 98e67ed59e1d1-38fbc60c7femr11264577a91.43.1785817281575;
        Mon, 03 Aug 2026 21:21:21 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e47dsm64394331eec.3.2026.08.03.21.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 21:21:20 -0700 (PDT)
Date: Tue, 4 Aug 2026 09:51:17 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, Manivannan Sadhasivam <mani@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Viresh Kumar <vireshk@kernel.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	openbmc@lists.ozlabs.org, linux-arm-msm@vger.kernel.org, soc@lists.linux.dev
Subject: Re: [PATCH] pinctrl: Use IRQ trigger mask helpers
Message-ID: <mre6ggyfjxo5dgvtrp3nsrbxngenw4r2eb6nygi4ybs5zsefyq@kcu6u33q3ien>
References: <20260802-b4b4-irq-trigger-mask-pinctrl-v1-1-1c398ab53d28@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260802-b4b4-irq-trigger-mask-pinctrl-v1-1-1c398ab53d28@oss.qualcomm.com>

On 02-08-26, 19:35, Maulik Shah wrote:
> diff --git a/drivers/pinctrl/spear/pinctrl-plgpio.c b/drivers/pinctrl/spear/pinctrl-plgpio.c
> index 1ec22010a3f9..5fcbea32089d 100644
> --- a/drivers/pinctrl/spear/pinctrl-plgpio.c
> +++ b/drivers/pinctrl/spear/pinctrl-plgpio.c
> @@ -339,7 +339,7 @@ static int plgpio_irq_set_type(struct irq_data *d, unsigned trigger)
>  	if (plgpio->regs.eit == -1)
>  		supported_type = IRQ_TYPE_LEVEL_HIGH;
>  	else
> -		supported_type = IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING;
> +		supported_type = IRQ_TYPE_EDGE_BOTH;
>  
>  	if (!(trigger & supported_type))
>  		return -EINVAL;

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
