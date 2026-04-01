Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C8E46AEDF
	for <soc@lists.linux.dev>; Wed,  1 Apr 2026 17:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775064813; cv=none; b=OIiq5uCmX5UzyTzu5FhXOSw+oiicF7V43BPQQmTfSAuEAibYNiL4+zv/Q2aNr5nG5LM2veNq/SinYCgArW/tCnJHUG6XskAadV79pr4r4gslW1b5GEd+ajW91Pu5Wu7j5ygnlkmAoI515DFVUM3alqGygbqFzX4/j78pvFllIdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775064813; c=relaxed/simple;
	bh=9h3k+SWXPgCXh3URQw2m2EnXgwEp8fqiTGDr5MkY+Cs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GKLpaqjp037L7fWKnQQmMLQ4ZKVdlkX4eJPgqLIkrOKb9Jbjw6eavlI8baegsKf0LzchHQoBmIg2GAryycrzcD+HcqMU9QjzSEHfM2YPVM3v98AE+VkamSrjYz2ZNblP0KMmkYOV+9OA0MJI0GIWgWE1ro07YFIz8c4GU2egjBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=KuHX7Ltf; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="KuHX7Ltf"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2b24fdac394so38879285ad.3
        for <soc@lists.linux.dev>; Wed, 01 Apr 2026 10:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1775064811; x=1775669611; darn=lists.linux.dev;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=wUGrmWIs1eqe1Uc4sRH3g6ZJwCj+Y/CkFLvTuPn+h5I=;
        b=KuHX7LtfoF9rY2pzdceABIcIKQ7v0tLpnIN4O5ExUzJtLBOk5HbhPZlYACxBNCz9BF
         N0rVpGge2tsmKS6OECJiPf7PzARAMFQ+cOmJ/eccwZxOePzqaefGILn1I0Dxbq9hM2l8
         X7oHu+wADF8YalBDbd4c1UF+8rcSGB+drvNbnAAbUZo2ghha6j6hzwgguFyqdypGxPDN
         oc7R8RmO2li1GzGphWRjywRyTyF+t6Ep6cCeG0Pcb+LuB19SVuAljqScVDXN+d4a11ND
         iYuyMuMS4pwFNjouMEab8kHDPVN3FYvA3MsyT+r28gplbJj1zIqmmBHspvqPFNjK06Yi
         uldg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775064811; x=1775669611;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wUGrmWIs1eqe1Uc4sRH3g6ZJwCj+Y/CkFLvTuPn+h5I=;
        b=PSHxTR9Y0V6N1s+GIqUrxQ+h+6JRv2M2V6yjt5J9bz/dncSWoVEUDPvmcvTc2SRBU3
         lpYDkYBYvu5dcAqOTY3EZquUnndPuwk76rj4X0HP5rYM3A+uThZN6zUYTk0zygvVA166
         QhS2kIQi8q1AmRqNwFUn78wWTWQh+yg4RVA6IPRG3Tu5Qjgd6SWugRdArmCwC8pce8np
         zif40TjhTzkVjiLL5/IZ5WbYOeWOAz97cJyUeJYh5uIqR4kYnGcTwTITEBOKgUfEOEGe
         aI956zqDBhzuXu0QKng7/Rz6ObS9e3SK/1pYQwvpXwAphYuxzSDE7m/osa4BpHb1oOvD
         UGkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMkR7BxgohmPwgT9tF8KJvH3NTh1ma8VRLkIge/z91XhgLxyrPwHREzK2AcuPUhtL5/8M=@lists.linux.dev
X-Gm-Message-State: AOJu0YxOWz5hDzo4sF+EvYFaEPzDC+X/XVYOFid6pVwys6vX+rG7dC3y
	hg70Zm7stizvaKof/DMK4W4V+FEy9HgN/9gCU1Yd6+zonsZtA/78vxt9h1DbbOJ1sus=
X-Gm-Gg: ATEYQzyTAjcjwIVrIW13yeG2cezZbYqJuvtKG52tMRserOW3t2o5ThDZc868G4YnP07
	JlX637894aE6rqjWA9MqBVRuQqyz7cM0PYWHT3UqFcoyMFfsE6WSHsv3fH0B9UhLBFjbiht9kpa
	RXHueRjBBY4tavtZpIsswae6wT1n+1EuqtldMLv51e3siSt25sUYtU8i+Gy/3bCOY3EtLTi8L/E
	jLk8b+WgFiQPhFxbI6Qnz3+XwsHMz7jfZfIdZ0REiu+o9gLhsTVaM7JypjvU1zewmpwDwmQb5GS
	zIrevfl388kJB067AvQAPA8vPQZCOoDrVvpffDJplczMVVmZx86JNJh7KP2uZ8yA0nvrzpqWBuC
	mq7ZY5A2zLadqkLCfm62f+u+Zc5uoMxgXRrQ+IdI5Sn/Ey8/RZRIhxZ0Lnu+cS6TiidC2nK74a9
	uCLCOf7Ldazt0MC9wY3Y4=
X-Received: by 2002:a17:902:f54a:b0:2b0:6e12:bb21 with SMTP id d9443c01a7336-2b269d4af02mr44706185ad.41.1775064810785;
        Wed, 01 Apr 2026 10:33:30 -0700 (PDT)
Received: from localhost ([97.126.187.42])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749cbca2sm2974705ad.73.2026.04.01.10.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 10:33:30 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, linux@armlinux.org.uk,
 aaro.koskinen@iki.fi, jmkrzyszt@gmail.com, tony@atomide.com,
 andreas@kemnade.info, rogerq@kernel.org, arnd@arndb.de
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org, soc@lists.linux.dev,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, Thomas
 Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] arch/arm: Drop CONFIG_FIRMWARE_EDID from defconfig files
In-Reply-To: <20260401082533.214103-1-tzimmermann@suse.de>
References: <20260401082533.214103-1-tzimmermann@suse.de>
Date: Wed, 01 Apr 2026 10:33:29 -0700
Message-ID: <7hcy0ivb4m.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

> CONFIG_FIRMWARE_EDID=y depends on X86 or EFI_GENERIC_STUB. Neither is
> true here, so drop the lines from the defconfig files.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/configs/davinci_all_defconfig | 1 -
>  arch/arm/configs/omap1_defconfig       | 1 -
>  arch/arm/configs/omap2plus_defconfig   | 1 -

For omap*_defconfig:

Acked-by: Kevin Hilman (TI) <khilman@baylibre.com>

Kevin
