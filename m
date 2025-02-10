Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C8E23642A
	for <soc@lists.linux.dev>; Mon, 10 Feb 2025 14:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739197017; cv=none; b=tCe/t0VuZsD18oOfkz2lJZ8jki84wUpz4rp5IRmfZA42AINn+rwRL8U1o3453QiHvPMxpFpO8CUi6zlHPVRvOFqgmWnI7F5PgHar8Yam2MMJvRjpsgrSwsZ30gPHsjhVZmqJp9OqK4iBKwEg4R08t2OVMz5zq+al5EpfreiuArc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739197017; c=relaxed/simple;
	bh=2yxORkU0BwHhsffL3ulJIkwpSZLMqKG329zUxbYPPkQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rYyV4s0dRUyKA+q4vHasKxhHPkQd1Q1zwazFWaJZp7W76o+6lYsHU6VJQwN0wwMB9iLaoAJVsV2LvH8X4sa5a25IJeENjYkskpbKFMm+CK1o7hiaKe71BwMAMtRq9stkS0ETxA0VqUscsc6NslNU7TrGIKME+lx73ot2XNFOB+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OqxNs7ae; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OqxNs7ae"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-436281c8a38so29165185e9.3
        for <soc@lists.linux.dev>; Mon, 10 Feb 2025 06:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739197013; x=1739801813; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2yxORkU0BwHhsffL3ulJIkwpSZLMqKG329zUxbYPPkQ=;
        b=OqxNs7ae+c+gL5yH7amJ5JmvKAairHLOFK0rP8PPDo48vs4Kuj04JOPjU7B7cpkEKS
         WB0v1zEMC0wdP5sPvjLNSHkP+Qh0/x0PrPuJLjoGPmonSUArVhy5rRqeUCIfTt4q324n
         J/gAl8gDNsXdn7JWKv53wvOdXUyZV1Mp5+peHB96bza0NcUlqmwnxWeN+4wgyUsCHCBd
         i+EodpaAhDdmCf2rcTBHOpYbELqc1yM6Tcao0osOt0FWL1NLv6e1seVGsWRPnPNp9t0j
         Y2m0iaEWqpqEPB2J6T2ph0u17hA2UeSARizrGPJXq4n7fNQsjImqvmc/9xHvpih14IR8
         y0jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739197013; x=1739801813;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2yxORkU0BwHhsffL3ulJIkwpSZLMqKG329zUxbYPPkQ=;
        b=r431aJ+1yEPyI+6EhZ7GgTriaZ6ZVyx7ITO1qzbv/y+Fg8I+XR8zQgfDU+bfz6bMdQ
         xQz4Pmbbu0yeWbgYWW1YwLO3SKccBOyLx4VRBKytJb8xv4C7F965Kk8OS0zjruQ7i9AA
         kfiD1R9/iFPhd+jyx2ptSQZCpWFEPa8RjN368upG+GtWG1Cs6iJTDLCFVZJ7URHttPDR
         f2KJeoNqnlBxtnfL4sPAxq3JuCVDl2xlHbG1j/5wQr890a1+Qav77dakDMCDcpPmVZcm
         q6QyZq4Q7KMxaCvy1NTnn2WMLciC0DrSsEaL/cFI+c8XKoOpjWjCCxhqWs45M8iIbrMm
         3img==
X-Forwarded-Encrypted: i=1; AJvYcCXWwnsItfJrmGg/BvDWK+yP7oh9N1Rcnnmb2ai0ik+AoumP1BFgh9C6M+EbxWUGf7GDslI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyFUcg2dOv8GtcIlMz/JQL64YrHbzDp/ndQY0sIkXavRvXqdEIZ
	Eh/F+uhRQdb0ee0m5XNnvzXQcqsFZaTR2mpdmcbizKusPdP23TNA
X-Gm-Gg: ASbGnctqHRF5H2orBNsZUsMBcVcYxGL/OWt7OZ7us0BV9cxZT01hfUrm3cmFK4dXVFU
	mt+y0ltqCFCwtix8uSh9Sb6X5IQVFTWKcXECKObLwEPF04HzDdHQZHMAs5oyxHPCmjYAlYjDD8l
	d+7ivG6xvjhT7DPXdR/2JMEk36a+R+BSk3dbH6JkfqVBNCX3iAunTfivymoXTNobu01wKxtbHTN
	TMHT6t92x6KgMW5UY9bNB/PaZGs3Bziiv+PJIEzML7Iwfe5+l8vOMQncW1QlDGiRMlL/XSp0HE0
	i/Xx1WoHpfc4Qj4z/1qrZjrwacJaLCEx
X-Google-Smtp-Source: AGHT+IHNOu5fBQbgxx/H3Ub0lE217C3Rg7B6vLrKoEEdX+bR5RhSjkNikHnqhQxwOe47XQ6szqa9EA==
X-Received: by 2002:a05:600c:1913:b0:434:faa9:5266 with SMTP id 5b1f17b1804b1-43924991f73mr111581495e9.13.1739197012751;
        Mon, 10 Feb 2025 06:16:52 -0800 (PST)
Received: from giga-mm.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390db110dfsm186220095e9.36.2025.02.10.06.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 06:16:52 -0800 (PST)
Message-ID: <5e08940e72d4669eac3d4090fec84c8a1ecb17c3.camel@gmail.com>
Subject: Re: [PATCH 03/10] arm64: dts: sophgo: Add initial SG2000 SoC device
 tree
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, soc@lists.linux.dev
Cc: Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
 <inochiama@outlook.com>, 	linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Haylen Chu	 <heylenay@outlook.com>,
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann	 <arnd@arndb.de>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>
Date: Mon, 10 Feb 2025 15:16:50 +0100
In-Reply-To: <g7gruyv5rczuqybblnxy7myh2rakk2dmldy3ks247evjb6k3zj@ffkzilxgp3gy>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
	 <20250209220646.1090868-4-alexander.sverdlin@gmail.com>
	 <g7gruyv5rczuqybblnxy7myh2rakk2dmldy3ks247evjb6k3zj@ffkzilxgp3gy>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi Inochi,

On Mon, 2025-02-10 at 13:05 +0800, Inochi Amaoto wrote:
> > Add initial device tree for the SG2000 SoC by SOPHGO (from ARM64 PoV).
> >=20
> > Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
>=20
> Can you add a riscv version of the this file too? This also applies
> to patch 4 and 5

this would require binary Sophgo RiscV toolchain, which was the whole
point of my ARM64 BSP. So, while I could add RiscV counterparts, they
would be completely untested.

On the macro level that how I see the current state of upstream affairs:

RiscV:
There are necessary upstream packages available required to boot, but
there is no upstream toolchain to build them.

ARM64:
There is an upstream toolchain, but the published U-Boot is being
linked with ATF binaries -- I was planning to come up with pure
U-Boot BSP for this, without binary blobs.

--=20
Alexander Sverdlin.

