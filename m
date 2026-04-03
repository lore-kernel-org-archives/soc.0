Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06DF2F90C5
	for <soc@lists.linux.dev>; Fri,  3 Apr 2026 16:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775232065; cv=none; b=RnYasgefolLnGBiv+Seyw+dEI/bwv7p3fpOUCJJWibWUtA7h85Pcdl6uJMQfcyYKhSP/0C0NNrCWfJSCSftahXA3Pw20gHxDTNyw9qY8EpGme0Fxzbbr/liPELDpz3etu/Au6HxJ10HrkGr/0RHzz4yRBuipQAE3wjZc4WhTUpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775232065; c=relaxed/simple;
	bh=Ki0zC6Bm1xXEyI31URywRK+42h15Mdjh7I6Tmw5o5l0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=j7M5ROEiTAg8q5a7DuN4/j6Nx+rEQZQSByw1jAgxG8nIJEHNXM2j1pr/GbdzvIOnoRKk6sDbJONomwqWDNMg66agJgvEwDDrJ31NHRM49lOBLtdjxRPI14XHEZA3hHst3GZjt7IgkWrHDb0S8ZQl7V3EMNgyhKCGGDKCvek0jwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=H+kT7DKz; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="H+kT7DKz"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-82cec955160so1442413b3a.0
        for <soc@lists.linux.dev>; Fri, 03 Apr 2026 09:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775232063; x=1775836863; darn=lists.linux.dev;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=hVAFddO7rkVjUEFxW/6GAQN4GzyoLvVdv8+D4JuOi9Y=;
        b=H+kT7DKz/7EiXRgl7FbpAvMXGEDbIzI7N88iWI/VpGZFsF3v3EyXNTq4xFJpcWyHV2
         HGBELDB9zfYKPvxkOxffj79m2pYYzyWt0wrCyFkkNkvxVOuJ0Ja6htQzAZYOgFGNiIQg
         64s/d8jWR4DYFXd806V5Eih8B2De3jQtsEozIO0iM5PGqhnsYrex7YnB26mXb86JEx21
         csxb/CyoGN76a9YgPuVtsflcio+HE28C2i0xIzRgkQhXorEDe9ftEZNWpvOgjsnh32Kw
         NPxrLL/jeM0iKmh0J19OaS1eJV3hs88VnWYJltIXVHbc4pAXJuEFQDrGE4l2xAI2pptJ
         vodw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775232063; x=1775836863;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hVAFddO7rkVjUEFxW/6GAQN4GzyoLvVdv8+D4JuOi9Y=;
        b=kp09Xc1/6zv/YKDYQBHfhanEPY2EXePanNI5kp2C1KQNKEdyTyay6132ErMzpWuR8k
         jhikba28UILhPT/1M2Ut4rMxabIG8e2savlG3V0cqJRvlshLPG+/DU7+hBBFSlvilBtI
         AoYT5vzldIyvGqz/RdYtJGDNSqLAyFQXoby1ZQ7E9Qv7xLmHmoJp0fCzQhtUyqwJo1st
         wg9QbeE3d6hnKsiVvpxroUDKFFRyL/9ovwHyiX4s9GMb6qvKgX1IfqB+5q5SosszFAUH
         934xQbwLORrmkvDbqCQ6j+ftx5EC+SVUQtAB/4tTCNFI8kxfZXGEViEmjciYkvog8onL
         MTow==
X-Forwarded-Encrypted: i=1; AJvYcCUpFGKfRJlWjOSkrOivV06lqVd3l6U+QjimagLBzyGVcw0+KzxFueWB8LOkmPPqAo9BTYc=@lists.linux.dev
X-Gm-Message-State: AOJu0YyNWr3xEzY2GpqCCrz5kx1N4BLdDK6tA1YEj5YhkpRLR0Z0RuYp
	8QOqmwJrWqGPgYJtQ5DdqwpRyT1+ZbUaO0qDtdr+GaHg/vTd5qRMnyiHYZcGwKTambA=
X-Gm-Gg: AeBDievTriB29pXKquqG2dK5WH8S/hOJE7OresghQIFOYtKuyYkMSDw0ajxZpCz9U12
	NnRY+Ln4Qx462vhCjloHBVgsjU0qfnnTrnnmaw4k1517YjENFGmUaK/HwS9r5cX93jfzFgRU7K4
	WcRXw37YpxyYdQMFT3zQEFrGQSWf9nvL3oJwLTyA58krGIcSxV0VKOLl6A2K6WgGbcnRw8xymFM
	0O2M7pQ2zkrJF+jQEgniuVvIdHQS735O0ona5IYqKh69l2RbdT9iGbWpdVnjaQBlK7bCckbgQTp
	+m41GsYF4WdUBdetjH23AqbV2P9WcERCgv16DwsWlyaXbRe9ba71HtfQazkSTn81lqW6NqUW/Gw
	E4+EYg7ijjo4EehFRKqUqT0BmtygDIS0MxmEP1CLi4zGg/UYwVQehQGRKcIRQlTXn/oY1dK8C2F
	6+G8f4oElB9dUqjsIEiB4=
X-Received: by 2002:a05:6a00:3d49:b0:829:7553:afbe with SMTP id d2e1a72fcca58-82d0dbe6401mr3671936b3a.57.1775232063072;
        Fri, 03 Apr 2026 09:01:03 -0700 (PDT)
Received: from localhost ([97.126.187.42])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b3ccc8sm8256712b3a.19.2026.04.03.09.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 09:01:02 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Arnd Bergmann <arnd@arndb.de>, soc@lists.linux.dev
Cc: Linux-OMAP <linux-omap@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] ARM: dts: updates for ti/omap for v7.1
In-Reply-To: <83d0c8d8-fcde-4407-bb09-c2ae0e0e142d@app.fastmail.com>
References: <7hqzoytlms.fsf@baylibre.com>
 <83d0c8d8-fcde-4407-bb09-c2ae0e0e142d@app.fastmail.com>
Date: Fri, 03 Apr 2026 09:01:02 -0700
Message-ID: <7hwlyorq2p.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

"Arnd Bergmann" <arnd@arndb.de> writes:

> On Wed, Apr 1, 2026, at 23:29, Kevin Hilman wrote:
>>
>> ----------------------------------------------------------------
>> ARM: dts: updates for ti/omap for v7.1
>>
>
> Hi Kevin,
>
> I applied this one, but I noticed two problems:
>
> There is no long form changelog text, please add
> more information about what is in the branch in
> the future. I've added a short paragraph while
> applying.

Sorry about that, and thanks for fixing it up.

>> +-
>>  arch/arm/boot/dts/ti/omap/omap4-samsung-espresso-common.dtsi     | 744 
>> +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>  arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dts           | 101 
>> +++++++++++++++++++++
>>  arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dts            |  70 
>> +++++++++++++++
>>  arch/arm/boot/dts/ti/omap/omap5-l4.dtsi                          |   2 
>
> Something went wrong with the overly long lines here.

Hmm, not sure what happened there.

Thanks,

Kevin
