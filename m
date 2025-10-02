Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC9230E0EF
	for <soc@lists.linux.dev>; Thu,  2 Oct 2025 11:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759405422; cv=none; b=EkEhVjEuxMNuXQJlKsma8Ufi0kdMtD0/XAIk8il3U4emKng/u98MOIzDKoMa6lVKq66oimcE4A53UUpH4ZvbymiW4PLv4Mr3nOMNwDqM3yT+Vm5lpGDZzSsV2XI51XPVFRQwKTui9ZEv/5NoayCgZcAMVUvwOW65ibCUTfsxYS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759405422; c=relaxed/simple;
	bh=mQfFH9dlJp1wY8DjH+FxPFbokocVbPKCKSkod2iQXeo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LZ1knNqsz0wRyIgEjM8hq1JJuqEw6I3EiLy41GEM0sBrPX6K81QkoxG2IuWMZafg/VymkPu04fZCdgZ4jGCpcqy3zECrjfkTUqqooFIvpKVIjQgkSfOq5rdvuwFp23Feh5Su6ip/bcJgc2SPfnkCaGIc4eNxbxHnod/CWs+M1j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bmgm7kCN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bmgm7kCN"
Received: by smtp.kernel.org (Postfix)
	id DA9D1C4CEFB; Thu,  2 Oct 2025 11:43:41 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EC4D0C4CEF4
	for <soc@kernel.org>; Thu,  2 Oct 2025 11:43:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EC4D0C4CEF4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-32ecc50f573so106367a91.1
        for <soc@kernel.org>; Thu, 02 Oct 2025 04:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759405420; x=1760010220; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fPGwrtnmwO7ynHj83uEKbgoWVEyH11Eo31+uKIXnVKM=;
        b=Bmgm7kCNTvuMHR/IoMN+swuihyGYB1FsC/0Bv1C3DtqbAN2z6c3fBrCMTp3W9wczLx
         gcgGZDf6wqC+XR/yNFkZ6uiUvgUMmha9byVN/ltfxC0MSVHAPUkF5NVwMKE7D8/3k0Eq
         oRnDT0QXCIEf3z71E25fwxxzs9XCXgvnJw6lwxyi8AURlUnclwKntOlUsVd9ENXTOLKd
         N0ff6MRJ2ut0dwZv5jaW7JC4kGWkhFwodvPHPpQJn1SQ+2Xa86jIfMbOVhiH496fxBF2
         CVBM0QtN/OfhHePLt9qyKhnVGih6PVrvSaPq3Sf6gp3414mRXk8kmtjoeJbx9VbJhcPb
         9FWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759405420; x=1760010220;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fPGwrtnmwO7ynHj83uEKbgoWVEyH11Eo31+uKIXnVKM=;
        b=qeCdOkFGYpls5cVXVnH75By1hDTp8Bq9qDqx/jAoE3RCRPOv6mYI/W8zHH2hLzuv42
         7lvWIMsiNGxCqVXssKAP2rDFjxBr4xtOyVluacQ/vvdUlKGhdr1yj3KQT73oqSZ/XuBI
         Hu7BFPnPymt+bpNnGzS4ryPU61X7kbwHGe0oKb1L1pTLvi/4u3Zrx+6tA9KtS2TetRoF
         k0FC+aaMIX5JeYOzzWxxvrW8kXQVO4djklPXyw0eGT2tkZmRoA0NMzC6q4evMvYzptOA
         5GS4+qbHzjN9+pngLVjWkZCpg0o0eXuCgW8n17rxIIJBEZA23s7nbBANQP16Ii8Kh89F
         mCKg==
X-Forwarded-Encrypted: i=1; AJvYcCU/V158owDVajk61VuyHU/ATogdM6DqfZ9iO0Om5MMkTmyFMfiLr2CzEXnnZ+pCY66LoZk=@kernel.org
X-Gm-Message-State: AOJu0YySXoDKoj40HNVSdCPaWAbjEQq+vpU2fWDgjVyyJ5dZmJ7fkHt/
	6+XiIBGSe/h6HJN0OnkMLViSVBpi0hjajXXvASVCCxHbnPjQc8fyqI1xhM75qMSl5l8vp08QVt3
	311F+iXrU37L9kTBSNVJZhlo451AfMTXOMrBg/LBRRw==
X-Gm-Gg: ASbGncs2k4SCSLiMLZoMSkXB2kK6faRlzv/C1ua5/6TzUYxWUWWGClTQDvoi+R/FFZJ
	rPGjTWS3GGkhA5ua/TOmqLaKYOfDZVXrbuh2CMB70EhDSKwUqxwH9JnhZjXBEXm20+YkkO7dPmG
	feWPh70VeGYPk5PvK2rhq9roBWtcElr9hflJPZcC1/aMNhKxCQQKIjT+v2PKUsPI9WLmBILEJX3
	iTYojoHUuNnxSMiMlvIguYmovB7KN22HA==
X-Google-Smtp-Source: AGHT+IHcS+PZDBFklSeMqhkIhlvfggeUxgT2umZ0JZAsg1sGRTLRThuGm8GszRQtZPIo4KSErXn2dh0dbaFyqtNReGs=
X-Received: by 2002:a17:90b:380a:b0:32e:914b:f709 with SMTP id
 98e67ed59e1d1-339a6f3eeadmr4428470a91.6.1759405420125; Thu, 02 Oct 2025
 04:43:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <aN5bct_vDSzAfcnu@sirena.org.uk>
In-Reply-To: <aN5bct_vDSzAfcnu@sirena.org.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 2 Oct 2025 20:43:28 +0900
X-Gm-Features: AS18NWDE982m00ruoRWCyOyxgNeTryWjfEhQfE9Z51q2R5vXRcc3l_Serfgwv0Q
Message-ID: <CAGE=qrp_vRvbnVCJ-OQQ3qspEEKqMUoDbGHpimYRBHH0NRig9Q@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the fixes tree
To: Mark Brown <broonie@kernel.org>
Cc: SeonGu Kang <ksk4725@coasia.com>, Ravi Patel <ravi.patel@samsung.com>, soc@kernel.org, 
	Linus Torvads <torvalds@linux-foundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 2 Oct 2025 at 20:01, Mark Brown <broonie@kernel.org> wrote:
>
> Hi all,
>
> Today's build of Linus' tree (arm64 defconfig) failed like this:
>
> In file included from /tmp/next/build/arch/arm64/boot/dts/exynos/axis/artpec8-grizzly.dts:12:
> /tmp/next/build/arch/arm64/boot/dts/exynos/axis/artpec8.dtsi:12:10: fatal error: dt-bindings/clock/axis,artpec8-clk.h: No such file or directory
>    12 | #include <dt-bindings/clock/axis,artpec8-clk.h>
>       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[5]: *** [/tmp/next/build/scripts/Makefile.dtbs:132: arch/arm64/boot/dts/exynos/axis/artpec8-grizzly.dtb] Error 1
>
> Caused by commit
>
>    b176376991772 ("arm64: dts: axis: Add ARTPEC-8 Grizzly dts support")

 Thanks for the report, I already got message from Linus about it.

This will be "fixed" (not bisectable...)  by clk pull from Stephen.

I'll try to add some more tests for such cases to my CI (because
Samsung won't... ), but it's already a very busy machine. What I
wonder is that this branch was in next for two months and LKP didn't
catch it. Maybe Intel LKP cannot be fully relied on anymore?

It seems it's second missing allmodconfig from LKP this cycle (another
build failure reported by Linus for other pull request).
