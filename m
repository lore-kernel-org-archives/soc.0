Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C821F3BBB
	for <soc@lists.linux.dev>; Mon, 10 Feb 2025 12:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739189436; cv=none; b=jVk/OJftZIYKz+vR+D7kJUIL8q5gLDo9+BYxQLfiJ/pUEnJMZhyczOtVtA06u3gQeuDwaryYHD+vzjcrsanCJEZOiDwpOXA1q3asEwwF1I9CqEBSdF7MT91L24Pmx+ahj4pZlt1XSjViM5NsGEN5EQ4Hu948LSAD5hYQ+1+2ADA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739189436; c=relaxed/simple;
	bh=iVV5fItADhSdmSptdzySm7drerIykRqZzWFXa7Bk090=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MJCU1FXqWG2m1HteRu69TSrC/cP0X2gjr5GxSf828AJhAoEBjooWMQtZyJHP4S4fBbO/ejQg/ELTaORWprzMNdJ+Jg2oFD9sKDlWFvZ1RgvRYDyANXCkI6PjHQIij+xfQkFDoLmk/P7vLtIC/0D8xHJq00drpxgukQiPbih9N1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h9gJ4rLw; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h9gJ4rLw"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ab7d583d2afso14423166b.0
        for <soc@lists.linux.dev>; Mon, 10 Feb 2025 04:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739189433; x=1739794233; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iVV5fItADhSdmSptdzySm7drerIykRqZzWFXa7Bk090=;
        b=h9gJ4rLw+CeZgOrGfM7w6i2VigHUTHzl1snWy9DFg5P4Wt4CMJ0IqILWfJx62PMnPM
         UKp+/amAOS69HlhEGS+JoMkT7k7YTuzBosk/MYZT55z+3otVI64+NxIVqlVz+JS5qPyk
         X3myn1yXWescMt6VALj6Ka1rYQu6KiudcNyMFigrUsA116KVnd4aQwtW5AIHX7SF05t7
         fGgw30Q8PAlkdHQMgDFyWUsJjF/SisMseQuMF09ZRC7GGKTYQ4y9XSY5HxFrCfRv0EPb
         ah/3BmfhrGqBEGegvNe2SO+Ec7WhgBWMw6uZhMQKdkKEOO2ERfoqyCRYv+9YBbbExWjt
         LtoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739189433; x=1739794233;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iVV5fItADhSdmSptdzySm7drerIykRqZzWFXa7Bk090=;
        b=uv0BHwGxG4fgIFeUuxCzLfqL73l6E8ZERsspowzBNvEwRwPFQvrjtabEYdyAaOK1gD
         ph2XOQSGO3k82gKShGTKNQcg5sZMM2n+fXhvOdzCcnp1pRs3AlA82W1xxdBqwexzSi3d
         +aq++wjE0Fzz2YITWR2aR3nlm4EzaSaKA1l6oDTxVf9lIIWgI1TD+BEogAHMmShxUzKY
         B4SmmKh5prdO3/QxOq7DLT5GpV+EWukxdoSD/9SQ6o7LS8AsBPvKDxn0DDqLYo7LIOYe
         g9TI1ZA2lYSiJiiII8395v94xkS9T/BVAHgPVR+jPBGrm+B+4FJT39qsM5KmFFQpse5z
         8BlQ==
X-Gm-Message-State: AOJu0YyZINLY5HiwG9KZJICM9rFzAHheVZNp/cRn3+y3eRbqBNUOL1X4
	+foC7CLE1Y17UO0i/9mf2XYjGwVnbqx/mTuLRP2aTgMkbilu9qdF
X-Gm-Gg: ASbGncukorcgZ9bEtm3TbtZ0NZnLanvSY+NXQfZdvI8z/bhTcjdBNwcdWQazC+sWLnL
	E7ryoLIEIojkLEid5FTrTsw6BA/AfOYwZTfOxSOaRzmqX8XeGOI5f3CULU4ZF0dPOtPNBPKpbiF
	bg5woDGq0Ka1rICTJF3ZrP/PQEdvtLU/515fgPpaNYQZH3QUzz72XrvzzO5nejiGNbNySljr30M
	IdEhqQxs3sEtdATDpc9bbsoWd1IeL3Kz4xrl7AzfUSq1i51q5R+mRXoBxKx7FeiNUgfGM1ESQUq
	o1dE2yaNfORJvi49NmUDQiI4XDedAST/
X-Google-Smtp-Source: AGHT+IG0r7IUI08jzz62jmBNjDxyMCWdSH4iEcWJL4NhmxdTXJTTGmJz9BnjUWRrDIT9Op9nqTWxqw==
X-Received: by 2002:a17:907:740e:b0:ab7:c41b:a25a with SMTP id a640c23a62f3a-ab7c41ba2e1mr201449966b.6.1739189432773;
        Mon, 10 Feb 2025 04:10:32 -0800 (PST)
Received: from giga-mm.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7b12d5f49sm364727266b.73.2025.02.10.04.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 04:10:32 -0800 (PST)
Message-ID: <783a005a5e81796d572558ec083ff08b5adb34df.camel@gmail.com>
Subject: Re: [PATCH 00/10] arm64 support for Milk-V Duo Module 01 EVB
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, Yixun Lan <dlan@gentoo.org>
Cc: soc@lists.linux.dev, Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
	 <inochiama@outlook.com>, Lee Jones <lee@kernel.org>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel	 <p.zabel@pengutronix.de>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Paul Walmsley <paul.walmsley@sifive.com>,  Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Sebastian
 Reichel <sre@kernel.org>, 	devicetree@vger.kernel.org, Haylen Chu
 <heylenay@outlook.com>, 	linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, 	linux-pm@vger.kernel.org
Date: Mon, 10 Feb 2025 13:10:30 +0100
In-Reply-To: <eoeyutuu4mrpsu7snkk5ll6kmm4344qsgbnncss6gerlcvvea7@usuf5v7w5ffp>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
	 <eoeyutuu4mrpsu7snkk5ll6kmm4344qsgbnncss6gerlcvvea7@usuf5v7w5ffp>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Thanks for quick feedback Inochi!

On Mon, 2025-02-10 at 13:33 +0800, Inochi Amaoto wrote:
> > It would probably make sense that the whole series would go into SOC tr=
ee,
> > even though technically nothing prevents the reboot/reset driver to com=
e
> > in PM/reset tree. If everything would come together, `reboot` command w=
ould
> > work out of the box.
> >=20
> > [1] https://milkv.io/docs/duo/getting-started/duo-module-01
> > [2] https://github.com/milkv-duo/duo-buildroot-sdk-v2/releases/
> > [3] https://github.com/sophgo/sophgo-doc/releases/download/sg2000-trm-v=
1.01/sg2000_trm_en.pdf
> >=20
>=20
> This reboot implentment across the RTC and 8051 domain, which is
> still a big problem to be upstreamed. This should be designed=20

Could you please elaborate on the "big problem"?
Does the binary-distributed ATF perform some other type of reset in WARM ca=
se?
(COLD is just mirorred based on TRM).

> carefully and needs further discussion. Adding these two syscon
> compatiable may be not a good idea and cause some problem. I invite
> Yixun to this talk and he may give some useful suggestions.
>=20
> At last, I prefer this goes to an separate patch series, and
> implement with rtc device.

Sure, I can split the reboot story from the series...

--=20
Alexander Sverdlin.

