Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E83377A92
	for <soc@lists.linux.dev>; Sat, 26 Sep 2026 19:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790450977; cv=none; b=ZbkAsklh9vcStia3bfy6OdJWfU6PnppAinn1qOTtgHZ2n2OJaJ10scJ1gSPa6r/3dPHaX81/KZnC5RRizuZ6FMDPtG3+KfJQwK0RlmUd4joJb7edmDVvF/YcMCnUELWl3iICO+CGbFTSe1wnI4OeRIemFArfOmMvG12uf4/5J4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790450977; c=relaxed/simple;
	bh=1ebgJkP09GKvWRwvK5F2YFranzNOE8JKc24FCxtrAac=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=tI4Jz2nLz//tq6OCIVUCIKSeEjEmWxAttTgc4qocuO791yRsvb19i2xXdw8vDsxF3eOGrAyxw5XObW5uD/QNAF01r1ceU9SdZHgxvKmghNbgKx833hhzZZ8LoAapaTUPfO0zZkUshnQRnBGqaLfeDicEps56JiA3o5S6oERkh1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nbxb1bxA; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nbxb1bxA"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccafb751so909615a91.2
        for <soc@lists.linux.dev>; Sat, 26 Sep 2026 12:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790450976; x=1791055776; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RII7KH71ddmT/n6y6BydIJU7a3otHfuo1n/mYhsl0VA=;
        b=Nbxb1bxAUyXRrrYdhlNPhFgBMWW8zcLTp9xzS2TNiLG5pfuG81VjqioJa12Qgc9gJL
         LUjuF7Y991eBPbbbwF1LL8O3PvKS04ZWwP1xwkjhWJskAw/IQF/EzaXD/WLsdKyQmX3h
         YXqbtxiuCB7bqyMYvBv8e2a0OmrvHiA4Nxce8soPgFBQol4zxKXWBRZXlcEq/F0EUrF9
         HadfN1y+R1mCAPVM5SEA2immHOa5y7ImygsH60er5bF0+hNpFpKR6T+3SNYJ2iBbCXvJ
         x20hY9boMzz798HTjMEB+PS298sc5Kug7PH1si6JmHAJBGrJBVlO4b5EJRiodHeoM6F7
         MMZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790450976; x=1791055776;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RII7KH71ddmT/n6y6BydIJU7a3otHfuo1n/mYhsl0VA=;
        b=xD3npkJJjYAgKgX1PEAGswjCxk17gIuKEpEVm6+F/2K5mxHRNjy6vWf/5FbHDOg+5q
         aoqDp9D+gjaY4GsCuyXnecvMO1w3ZU3MRF7zUBlomtSIto30uyLbHa2jz3jB1yi/m4IN
         pByaC0eCBdUTRmxALMeiHomBzTFqCcwtKiCglEOUu3uii4L6j+npuj3moZmBXgPyaEcu
         GakpnWKJxFn/XZfLY1lWhW9755Z5B3NdtXebXK97rS5Q1i4zbYER5yslo65ZncOgC2+j
         ceNyO6Q5Qnx2M5zVMrtfZcI1vCuNsra6UTaec4hb6WYeWDOErRlkxudN5aon+09iSef1
         obzA==
X-Forwarded-Encrypted: i=1; AKwUvBwkEU4gBW6q9cTNNcDwk9oNiPHcD+PvGmf0hUz1J0JMzFkRi+yzh7bcl9cKu4ue5Z/kxgc=@lists.linux.dev
X-Gm-Message-State: AFq9FYL5A8Bg6fzlAOUpx48QupNHQOw858wn0lhym9gKUm6fX56WYwbU
	BlE01QyUuzy9pLAFde+CHsnEvdg+W0EhdK2wo89wQKlrF3JtFF+CiHWS
X-Gm-Gg: AYBFou2JHqtanZX5tkSpDgI2iSFvkRmaH9J6Pd5QR6JDTW7/GoXuIcjjDhfq3NaXMXF
	rRnaQJ/03So4uWSVuxZ3xcft4ZNiVPPw3B9FfO2ZMFxmo6SLwLpg/1sqScRYUwlX07SMmeVMSI0
	2gqIQ519Z3VCB/M8Zq0nsUbUwqmfmOjv1MKNA+vIE9YCISQ34pVQFZB4mixIgldBffA9YQ0aOvF
	tuMWaP5fOF3u4R9iPsGy0737Ap/D4HE1n0p7I7lcRHCB37+l4mlG7WqXQzB8vi5Qaqy0YmUn8Jt
	HiB/QeoESkbe8Fl34HduEEeGtVo0OCEPXctj8MoZP0hSJa5itmIBwuUcFKdF8XsK8N5frPwWOYm
	heVxkPQ/pc9juGq1l7uBPOqetbYijGMfmHKY/lWoentbtMR5xh8YqETPr3Eran624zzdQyMCbHe
	a9KOLpetfr6FpiP9XWZR98v8rlCduZreu+5VXtRn4QEOU9XnEL//TFs1Od7biqwYQxP+wQFVBCQ
	oijWsN07vNuNtAr3J2r9HlFHUuGqaH9utdI/1LO2A0=
X-Received: by 2002:a17:90a:e7d2:b0:3a0:eb54:2e60 with SMTP id 98e67ed59e1d1-3a0eb543751mr1574379a91.31.1790450976021;
        Sat, 26 Sep 2026 12:29:36 -0700 (PDT)
Received: from [192.168.11.3] (215.96.231.218.rev.ocx2915.net. [218.231.96.215])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0ba31f408sm3564492a91.3.2026.09.26.12.29.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2026 12:29:35 -0700 (PDT)
Message-ID: <df064f9e-ad54-43fb-9b25-9e2869506732@gmail.com>
Date: Sun, 27 Sep 2026 04:29:26 +0900
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Yoshifumi SHU <envzhu@gmail.com>
Subject: Re: [PATCH v2 00/14] ARM: deprecated platform removal
To: Linus Walleij <linusw@kernel.org>
Cc: arnd@kernel.org, Frank.Li@nxp.com, aaro.koskinen@iki.fi,
 alexander.sverdlin@siemens.com, alexandre.belloni@bootlin.com,
 alexandre.torgue@foss.st.com, andreas@kemnade.info, andrew@lunn.ch,
 arnd@arndb.de, claudiu.beznea@tuxon.dev, conor+dt@kernel.org,
 david@kernel.org, devicetree@vger.kernel.org, enelsonmoore@gmail.com,
 festevam@gmail.com, geert@linux-m68k.org, gregory.clement@bootlin.com,
 imx@lists.linux.dev, kernel@pengutronix.de, khilman@baylibre.com,
 kmehltretter@gmail.com, kristoffer.ericson@gmail.com, krzk@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux@armlinux.org.uk,
 liviu.dudau@arm.com, lpieralisi@kernel.org, mcoquelin.stm32@gmail.com,
 nicolas.ferre@microchip.com, npitre@baylibre.com, robert.jarzmik@free.fr,
 robh@kernel.org, rogerq@kernel.org, s.hauer@pengutronix.de,
 sebastian.hesselbarth@gmail.com, shawnguo@kernel.org, soc@lists.linux.dev,
 stefan@agner.ch, sudeep.holla@kernel.org, tony@atomide.com, vz@mleia.com,
 thehajime@gmail.com
References: <20260914140821.1805449-1-arnd@kernel.org>
 <17a74e90-27d1-4954-86a8-491267f00cb8@gmail.com>
 <CAD++jL=VJsnk-GzAvR4oR8oKJayQzq9Oes+ZW7K=iHGrQ1jh0w@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAD++jL=VJsnk-GzAvR4oR8oKJayQzq9Oes+ZW7K=iHGrQ1jh0w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2026/09/25 22:30, Linus Walleij wrote:
> All right, now we're talking! Could you test and review this patch:
> https://lore.kernel.org/linux-arm-kernel/20260910-arm-generic-irq-entry-v7-1-v3-1-5fd90f6859e1@kernel.org/

Thanks! I'll take a closer look at the patch and the discussion thread.

> I do avoid touching the v7m path and it worked last time I tested
> it  (on an STM32) but I'd like to see your take on it, AFAICT generic
> entry is not really possible (easily) on v7m because of the
> pendable service call mechanism but maybe we can think of a
> really complicated solution? ;)

I have experience wrestling with a PendSV-related problem in an RTOS kernel,
so I believe I can contribute to that part!

Best regards,
Yoshifumi SHU
