Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120FE8F49
	for <soc@lists.linux.dev>; Mon, 10 Feb 2025 05:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739165617; cv=none; b=MAeMfoTIyjQXbV1s4VPACQ7aFIML1Yifh7x9YK9AyoP09siSAiORPZowsONv3qUQJsOsIdY21D7LR/shrCvgpnPn7hVEE+k1ozyCaXIWf3T1I7MNW5ozQp+pBLf3Hn04wFNoO4ISxfW30p54ZTTxd5yJr4y895Gz3uCYprE25kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739165617; c=relaxed/simple;
	bh=BwJR/EZwNEsC8VKwj5lIILIBNa8OeA5xqpRWM56IWRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L4BuvySLDCeroYMaPVY9MafoQQYEEC5feQo9RGlnyi57qrQgumXvi2Ce+Butlynupv6wDAAaqtEAK6O03vCJmFOJIVzcROotCXKbMILSnEMyJYFE31b9pZbgHu//i183ACjme2aIvnaURrv/vPUOL0e0tjOp6a03IrEMwGgdTfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jJFGP827; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jJFGP827"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6e4565be0e0so15380646d6.3
        for <soc@lists.linux.dev>; Sun, 09 Feb 2025 21:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739165615; x=1739770415; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QcxcTXxA+rFMlTOa3pgLfmdjd6Gb7RSOSP8Ix0+TbY4=;
        b=jJFGP827x/5cRGNutmCdwy9HUIXgvMc+XneSoCTiOpgz53R78pya4UkCaZzBZmmDkR
         AHTpnMgKMDhfA9KXtlU9SHM71/hd9xLbCXth+SawVRYsb0WoYQtAwVGIzgcWxUHr63Y5
         nk15xq6wadcpQxhqOjfwb///nXiqof6kDSCWhcGEEYWpe7tIJR1BCicH69JwLfWepPgo
         MyE34lgbS31pKmufIz8cj/Vks70iRlci74T0i8nsPPHCIUpAk1GM6wW1P+nr3EJVPgm9
         D4nZFHZQH7UMIgR0z1qFxgX2wbxJJ7a1cduBZn0k6LeG7w10JnDGqPfa/E7j4iYmWuPB
         n76Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739165615; x=1739770415;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QcxcTXxA+rFMlTOa3pgLfmdjd6Gb7RSOSP8Ix0+TbY4=;
        b=WEwZBL3FCT1vsjZXW2ieckyt1p7I32D/Rmj1SyN09BlAyHgobo/WkGUFpsFMKveciG
         Njk9K+WudctH9XOiug3vh14qx8BCgmdXysmm58aUhpiokKa7a/h4BM5s0aNj9AViYlfu
         px9BSN5YdGm0owDX4wDWO5/C/AvP2Rlx4fehXmiW44RQJ2oIVnFZQeDPHVhtOhLb8xoH
         TicEVS93jLrdkvg4GCvGpVqbl4sBQpVvpOl89CqGFmUuT+6nzph+6XHff4d+c3K3on3j
         VaPNx4HV+uMZ2ifOFQZa+8YnbnPedwSRptSha0PtxaiRaCqg+3w6IGIIMicMk8B/VrJ/
         UY0A==
X-Gm-Message-State: AOJu0YwDoIqJaOPjb/L3HL3Pl36r062Tc7M/Hroo3HKhOLDUCS/28Eu9
	DXPetzOezZk8Xd2t7vwjYk6BMfPtKy3tnBoqsS8OdcVdrWUzwA+x
X-Gm-Gg: ASbGncu9QhRTQJdjUuT1X5wQxbgl5xO8/cjABGyif89yqhKywEIBu0nZR3brewY7eiQ
	rPNayr/b0v9LZNWeuPlsTJo48gCqXWSs9VlKlsYweSq2MjDjT9asWXxg2uAv8XL1rIgs07yYOaJ
	ll5qiG/eqf6Dgk3vwtsgWXLeWck6Sy9+dP1aZd7yMcBMth5JLQhIMcdDceosQBgMtuEShM5jIJ+
	YynPVToLJ4gjbCooO6Rq5VZRz0+un1NT6BKYCvTu9lZTGpF6UjSemS68+p8V7IObR0=
X-Google-Smtp-Source: AGHT+IHOrT53o+O66ja4z7uaRdoPjEYG77YMak440BC7vH/+FiPz/BQZLFVDeZD1BTKSAYp8R+3oaQ==
X-Received: by 2002:a05:6214:194d:b0:6d8:a258:68bb with SMTP id 6a1803df08f44-6e4455d8759mr131696556d6.6.1739165614939;
        Sun, 09 Feb 2025 21:33:34 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e448819f8asm32926166d6.121.2025.02.09.21.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 21:33:34 -0800 (PST)
Date: Mon, 10 Feb 2025 13:33:29 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Yixun Lan <dlan@gentoo.org>
Cc: soc@lists.linux.dev, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@outlook.com>, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Sebastian Reichel <sre@kernel.org>, devicetree@vger.kernel.org, 
	Haylen Chu <heylenay@outlook.com>, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org, Inochi Amaoto <inochiama@gmail.com>
Subject: Re: [PATCH 00/10] arm64 support for Milk-V Duo Module 01 EVB
Message-ID: <eoeyutuu4mrpsu7snkk5ll6kmm4344qsgbnncss6gerlcvvea7@usuf5v7w5ffp>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>

> It would probably make sense that the whole series would go into SOC tree,
> even though technically nothing prevents the reboot/reset driver to come
> in PM/reset tree. If everything would come together, `reboot` command would
> work out of the box.
> 
> [1] https://milkv.io/docs/duo/getting-started/duo-module-01
> [2] https://github.com/milkv-duo/duo-buildroot-sdk-v2/releases/
> [3] https://github.com/sophgo/sophgo-doc/releases/download/sg2000-trm-v1.01/sg2000_trm_en.pdf
> 

This reboot implentment across the RTC and 8051 domain, which is
still a big problem to be upstreamed. This should be designed 
carefully and needs further discussion. Adding these two syscon
compatiable may be not a good idea and cause some problem. I invite
Yixun to this talk and he may give some useful suggestions.

At last, I prefer this goes to an separate patch series, and
implement with rtc device.

Regards,
Inochi
