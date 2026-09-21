Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4799C4A8FE9
	for <soc@lists.linux.dev>; Mon, 21 Sep 2026 16:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790006794; cv=none; b=bRWyv3KJil6rMXpNwL70UFrTJLxi/mSQFNw83hmj/nnOFepHXsYLnm0DjsddBNRgxMtOjrABDBE6aGEQZGPCkNa7xXOfivkfG4JO5BHJ67M0FzmRZYJK5BS6axTAdFO9TbpXIMvhO7hITfATwBA/upmraDdpDW1tWj9CJ8wFCiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790006794; c=relaxed/simple;
	bh=UOTeQSx76a9v/ZV3YujOIEiYlAr7+SRsnm3/O5Z68jU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LHRj5271k2xtjOOFjQ9J+JZkeEFLGTPhnunUkPkc9704gx9iL3tAtjevNtjGGnQOu1nXiPJyBJFvOgJmCRsixbXnNc3qqJCQJkjnRDWL5mQrCKy8UI9ki6aJXRuWqGe45+xtZHuxVHtlpqX/WlSwgSwNEaCf7rWiG5uACw/gSew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=XCz5vmtd; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="XCz5vmtd"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-8674704dab1so4404101b3a.2
        for <soc@lists.linux.dev>; Mon, 21 Sep 2026 09:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790006791; x=1790611591; darn=lists.linux.dev;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UOTeQSx76a9v/ZV3YujOIEiYlAr7+SRsnm3/O5Z68jU=;
        b=XCz5vmtdMmQkPRaBnXYrRooZ+MmrLmgjo0HD/PrkILtcZwCEDxqUaZ1s8MWNYM5tjp
         GQUF6+v2dfCitDwv9IrF1eHw+PwjImviG2ojj3URPiGo02KEi74Jjo0Vkq+59F7HIy03
         CgSb8v3z4zQocCK/9fEN9DCiUeq9vCWu7IW5ydJodzjCr9k8DxZwT6pPyPuTUfLZD9s8
         msSs2jj7btc7nbeh2mLn7ePEwPSu8SEub/K8xdaETcxgS9GMoZJqshgBSmp2mKIv4fkS
         dngwHH/tGOPAhZ+3w3HhUPPVwtZvU/UzsqHLBZ0NT5ZqOrmEN6CWbGB+GSjMAetwMG+C
         xlTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790006791; x=1790611591;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UOTeQSx76a9v/ZV3YujOIEiYlAr7+SRsnm3/O5Z68jU=;
        b=HbVwIl/3vhoItL6UyKWlWNVPb45qzXRuiuUeR6KYtZ9cHo/iB8vKatoorIcm9JP8qD
         Bp/gyRHZKl0cl7+lbmad1pXgM6G2w3CVDftMSjxIhx/VrYinT8RbkWenJWtzaApBAxcg
         lJ7w4LI4eEaaJO6eo009bLGXlgde+U6lGSP2hAjSDrrTl0gg3mm4qrJIOZ7XgNdCdb2i
         Pk/CF7NZ2HTSiWcpRsUONol7p8vJOF6vexL/cN27aKDPYDiwNMa66xEQIfX80F7+hmGe
         9I88GbEILGqpUP3qnODbZ2VGkk+GfgIje/dtOW8kxZmORtbctN9EREK2ZJI/KUIvC1Te
         ETzA==
X-Forwarded-Encrypted: i=1; AKwUvBx+FXXj+8+5AfqgWQugynMrEFUZUZ/9hdFCFL/Whuzvyx0pLBo2zJLfQ52AAvMfLoA12z4=@lists.linux.dev
X-Gm-Message-State: AFuF++nzcNySMfaE3B7xUI2WIBNreuSREvT+V4YRUyOB6ZdiX0St3Kde
	hXBgf35COgmyKZIHncp787egffqhY/5LgfMiRSKoDhv/2yJmIFXZYeG4NaxKD4Q6oh0=
X-Gm-Gg: AYBFou10IBMUj7pRfU+zMW9oLqJ/7FF0sDp3KKSZ8+l1fyUb+Pk2ea6qQLDA2H3sh40
	QzF9oBNVXMIfBVmGre4fGjkSYDnM3yN/39d67LkgJ3VAbogNAJORAKTo+XZs5zF/2wUBT7e+S4K
	Ogi5Fk7Q3b3GEGsJZ8Cmw5bRaG7CE+UaQwH3/r/OCZzK4TeUMr+5WR/L+hOQBJe9ctyC38lrf8O
	wSWHKwV3ylqhlZoq7MN35BM+2euvpz3JJvJsXBlR+Kl9A9rUFPr31VzRMXQYUm6tLVYHJ8nNxSy
	Fc+ZcaLHwT115uUZrYNTiXdJkS5WCUbsdKddsLphXiyRBOjn8TjeN8NgMB/neImOTk1cDqGtsjk
	WY1LWSZLhLzIJRnzqB/T/0c+Bu0hHaAoSQxUVQw1ScErU/Fogeb/Na7dJS9JqtLCKMy4hQP9txl
	wCShpRo1n6MmdUGp7ZwRNRlGPLyzQn7xHYPBFn/CVJkBDqbYtpeqLx52PzkguGLdMrBZo=
X-Received: by 2002:a05:6a00:ac8:b0:878:34d7:6a30 with SMTP id d2e1a72fcca58-87834d76f20mr8319100b3a.36.1790006791257;
        Mon, 21 Sep 2026 09:06:31 -0700 (PDT)
Received: from localhost ([71.212.197.238])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-877a95f915csm3487490b3a.29.2026.09.21.09.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 09:06:30 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Arnd Bergmann <arnd@kernel.org>, soc@lists.linux.dev
Cc: Arnd Bergmann <arnd@arndb.de>, Andreas Kemnade <andreas@kemnade.info>,
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, Paul
 Walmsley <paul@pwsan.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Helge
 Deller <deller@gmx.de>, Tero Kristo <kristo@kernel.org>, Stephen Boyd
 <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, Aaro
 Koskinen <aaro.koskinen@iki.fi>
Subject: Re: [PATCH v2 06/14] ARM: omap2: remove omap24xx support
In-Reply-To: <20260914140821.1805449-7-arnd@kernel.org>
References: <20260914140821.1805449-1-arnd@kernel.org>
 <20260914140821.1805449-7-arnd@kernel.org>
Date: Mon, 21 Sep 2026 09:06:30 -0700
Message-ID: <7htsnid1x5.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Arnd Bergmann <arnd@kernel.org> writes:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The omap24xx SoC platform was used in the Nokia N800 and N810 tablets
> released on 2007 and was among the first ARMv6 CPUs in products that
> made it into products.
>
> Unfortunately the early ARM1136r0 CPU cores had a number of quirks that
> caused a disproportionate amount of work to keep them compatible with
> later ARMv6K/v7/v8 implementations.
>
> Drop the support for this SoC in order to allow removing ARM1136r0.
>
> Cc: Andreas Kemnade <andreas@kemnade.info>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Roger Quadros <rogerq@kernel.org>
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: Paul Walmsley <paul@pwsan.com>
> Cc: Herbert Xu <herbert@gondor.apana.org.au>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Tero Kristo <kristo@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-omap@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Cc: linux-mtd@lists.infradead.org
> Cc: linux-fbdev@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-clk@vger.kernel.org
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de> # omapfb
> Acked-by: Aaro Koskinen <aaro.koskinen@iki.fi>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Kevin Hilman <khilman@baylibre.com>
