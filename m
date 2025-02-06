Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1834813AD1C
	for <soc@lists.linux.dev>; Thu,  6 Feb 2025 00:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738802238; cv=none; b=QCS/qYpxgFUmiqygC9MOeXf3OBCFaCqR7Bg/KiS9Y5AiVH0Hh/Tspg1mzzn6IEiLos+A+b/hkCAZZKvmacF6HsUPil8lf2yenMIj7cBbAq824SzmPTinx99A9x40vxa90OqhJEAGQnHTMEomEvPcOmv5G4NFSclnANIg/2T5Z6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738802238; c=relaxed/simple;
	bh=9z/NlbEN8jSOw3hMYSM0ISuObqgiClju3/L+Fh35BN8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RSWLDrv5qzSvcdyCbM1vP6oGjD3RnRGAbkdUYYgJIrggLAFCgtwp4LaGBGCmZFNImdDfoio2u2KFvWo5j1K4CHohQSR63QBXl60Ix7LZd9r444jvXQ3DOmcXw0qU3ySO4HwHfUKNoKJwreJAOApprNB2QV+IFfv1Dn6qD0U111M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=F8b+mRRm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="F8b+mRRm"
Received: by smtp.kernel.org (Postfix)
	id 9CF0CC4CEDD; Thu,  6 Feb 2025 00:37:17 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B7E1EC4CED6
	for <soc@kernel.org>; Thu,  6 Feb 2025 00:37:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B7E1EC4CED6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2f4448bf96fso424394a91.0
        for <soc@kernel.org>; Wed, 05 Feb 2025 16:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738802235; x=1739407035; darn=kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7u4XADLr/C5eZ7qkGhMI8Yv7tVqEObjjFDJ5fXQvZww=;
        b=F8b+mRRmxfZ2avDmNvPSG2LNeGUf5o19LbaQyuINsYT6z4RuSJzfNB/z8tlM4NcSyg
         X8bQoNyfM8mwyYub7a6ENbyTn6lCEdcObwGCJFRVjFWWU4AaxE/mxGqRw8CxOmPRaj1R
         3J90y49KISGzBVCyDN79RF6zu9oPXKcVstMynmEKQ1jXvhoPprjUIK0g/3wgPOjaQZMN
         CmVaPnirMQ6C5hW1nAvMJMOLlp3OlQAUdR6xtpGiOPsgvfsEoXjO2HUhNXiCejF9zgaU
         EIBXNbQeXka/KHAFm4AjWF7JsKkM6n+wnq8arjEBqmzDCmecEgTv5BTJdRYPBlez4c/6
         j1TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738802235; x=1739407035;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7u4XADLr/C5eZ7qkGhMI8Yv7tVqEObjjFDJ5fXQvZww=;
        b=vQT0EMMb/EshRnIauTQxAHFd7uVwfY4C6FUnMepiARMIpPFz/w0fiLEprDbhVUptjY
         L08SJDBL2XVWeXXbkhyZ9OfOtQkHHy13P4l2f10CaYb4CPxkq4HZK98uNGjTZVKyE+Dp
         qllMRBftHB00Kq/5AhVYA3Xkt2nPHsHOAUcW8UarSsTe4Y6l5oQgWS2ULA/xBe2qwSc7
         z9qft24DCsP8vhT/kzU1TnVYKZProYVYOOhxuIAlWGNXpZKeJvyw7NQ0LK+7vySChcr9
         4TzxfIKkwROPKfOIiulrr0SuckXIwRmixj2LScm0qhYIO1XDnCUFi71CDsNxBhZcA4vV
         6Dpg==
X-Gm-Message-State: AOJu0YzdT3tirLhakkOyAITNGL2ugsU+bX8mQyhexn4y/j4Y87s4uAcd
	CFd4dInmsMMUMszj0OmAuyV+mEVqZSKOADmR1ceWpo2BvsTgpCExGgVTtuMZ6j0=
X-Gm-Gg: ASbGncssQ77Xeu2B+V6OKhFEcD7wfBnNy2Iw8mQU/FJUUmXZTedYpIXKlmxLByZvnEk
	CZybIhNXxJGDIHi+dJwuq+7a18qR1LLuD0LCibd7wqB8WdHHMkTCp2PLaD2DJj6jnkYdswYjhcD
	c9M8w+J3aveibEcV8SWp9oP2aXmbMKJj8v7RuKbYnXsmTA9PQ8ysJI7JgW4jm/Hp20Ea8Mxyzjq
	HVEuH51BhQONZwTR/cSyINmI3s6Pdnzvgx0euhwfVevBgA05JJLGQ8dplEZsghudUB8VJqKV5Wb
	aSzCkhfniNvNrA==
X-Google-Smtp-Source: AGHT+IECtRNllbLpK+x9JkKsoGM9WVGfThDVXSbLPfFhNXjo7Zhdyn7+h2ahM/Hfy/0Z08HwPXvJQg==
X-Received: by 2002:a05:6a00:1942:b0:728:9d19:d2ea with SMTP id d2e1a72fcca58-7303513cbe8mr7280503b3a.13.1738802234722;
        Wed, 05 Feb 2025 16:37:14 -0800 (PST)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048c15bb9sm61111b3a.122.2025.02.05.16.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 16:37:14 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Arnd Bergmann <arnd@kernel.org>
Cc: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>, 
 Tony Lindgren <tony@atomide.com>, Masahiro Yamada <masahiroy@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250205121151.289535-1-arnd@kernel.org>
References: <20250205121151.289535-1-arnd@kernel.org>
Subject: Re: [PATCH] ARM: OMAP1: select CONFIG_GENERIC_IRQ_CHIP
Message-Id: <173880223388.2488567.3141490107424057794.b4-ty@baylibre.com>
Date: Wed, 05 Feb 2025 16:37:13 -0800
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-94c79


On Wed, 05 Feb 2025 13:11:33 +0100, Arnd Bergmann wrote:
> When GENERIC_IRQ_CHIP is disabled, OMAP1 kernels fail to link:
> 
> arm-linux-gnueabi-ld: arch/arm/mach-omap1/irq.o: in function `omap1_init_irq':
> irq.c:(.init.text+0x1e8): undefined reference to `irq_alloc_generic_chip'
> arm-linux-gnueabi-ld: irq.c:(.init.text+0x228): undefined reference to `irq_setup_generic_chip'
> arm-linux-gnueabi-ld: irq.c:(.init.text+0x2a8): undefined reference to `irq_gc_set_wake'
> arm-linux-gnueabi-ld: irq.c:(.init.text+0x2b0): undefined reference to `irq_gc_mask_set_bit'
> arm-linux-gnueabi-ld: irq.c:(.init.text+0x2b4): undefined reference to `irq_gc_mask_clr_bit'
> 
> [...]

Applied, thanks!

[1/1] ARM: OMAP1: select CONFIG_GENERIC_IRQ_CHIP
      commit: c2a5f8c4f28ffea8c93d10e509c5a6e61172cdca

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

