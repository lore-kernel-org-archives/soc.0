Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442471F12FF
	for <soc@lists.linux.dev>; Tue, 11 Feb 2025 09:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739265739; cv=none; b=m+dnyXihczQ4sF+/+tle7ibXqV23+mgrkM4TilIY/h0NtHewSnXwK9LvyLiGl0o/HQHPpf0vyxjP7gSnrkg0gTlhz67+QI4OyYgxiw40jF5qqjLFNI+9rWrcglqrKHE3dPJjDWDi0Jjm4WYIskYwPJtQV4WS+5rK1bXmE6kRBfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739265739; c=relaxed/simple;
	bh=Y5en7ULaxh0ueBzxiG7JRZbLMPLncLvcjivpdbNNNvY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=F32CtohNPs7rTr8TkFsQErx30JIjxbRiAgJv57GKVmVPLEVdrdhSiNA1adIGnlJ4gRBv+cKA7D6h+YbqZoljklhvtvVjVvFADaHblTfKGdqbyiGxVIJ27J6J9AwaGiqB3cNSFq+zJamB7D/yFjupb0z1lvI91YQYS9uWWS/a0Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GijQbM28; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GijQbM28"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-38dcb97e8a3so3235279f8f.3
        for <soc@lists.linux.dev>; Tue, 11 Feb 2025 01:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739265736; x=1739870536; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hxKXnlOOBqsBwwrNI1x2D/yzjPQCMqMA1f8yAIfnnZg=;
        b=GijQbM282jNMjxgYs/rsO4avSJzQQ8g1egtX68Fi7Zkd8hX7M6WsA2bmPueWFy9jRe
         wY2crgei07nD72+uNha0hHaMyJnxGMcTJzKdXWPDRujZGenmYD3LcXu3fpKT3RC8hQT9
         193jvoz3mWwgN+joPZCHOsqt1TO3bv4pHcGWoLkbHC3OBQCdFTfpemRc+RjkGoUC6lZR
         9jYL88V/hlW0acmIcQZ0bVdRDTgx3PeEvacrOR9EO5UvgCZqPzqb8VUmyM+fFPcfUz6l
         cSOxGqmNdBb8O80KlAK35vUCYtGaQ4rf0W4ltW9E2Im3s48CZKhOYuuF1ATh0GdjM44k
         IieQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739265736; x=1739870536;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hxKXnlOOBqsBwwrNI1x2D/yzjPQCMqMA1f8yAIfnnZg=;
        b=pFlbxWedZMaVScTElgduXWrWC7S2o3dl3lecetuolvB+ts4XIYIZvYv/cIwtTEOmKf
         nIEBzVQ0KJ+a4eMlUltBma8z/Ps8yuo6oJO/HfRUsVStlD97zx6qAxwF+yTTNSO9Q0oc
         JhChFGbhWLQfE/QUARbdKJVg/mr3TygcfVFDAlugTTdyGsF0sdr2Zd10CREQY9uRzrxC
         pUsoU+dC6xef7q8n/7Y01pY7KXgnYanV8Gc/3gKKl1vS7S4EPsMXWEAGgA3YMGmn9oRi
         BJkgTmKMOXFZcTBkyVHCDiR9lYHhk3UcJhDBwy5JlQZPrGytKd4pNk88R2IZ1UCnWoDy
         Hz8w==
X-Forwarded-Encrypted: i=1; AJvYcCUCV+OSILeo9G/hGt7G+xvsoxUtRSlggpMWZHlOqk7EeBov+TNUIaix7TemeHU0/MWj5+Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YwIOvHeS7XSSwE2YVmYydRsaNVizcIrb2khv+xGGjYaU35s1H/j
	w9gzprFYnf8WPy57OK7gmoeLAqMsa7rvXfjUX2hp+8lISLl5LAiZ
X-Gm-Gg: ASbGncu/tjZGaa0jHflyxlaW2MWVK7e/PAqfClm80FiX8iNlhArTQ39uQVHTkdmYprq
	57Xawc6dasSpzQK0YwBUzRTEsPVXqgMqL0wY07jnz5DJ+Y5/H4MiOYCdLRjJvRPA3xZ39++wcQA
	bQpMEfi3IbjbEWsRpFYzU1rTV8sd7IlmQH8otMOi8gCM6r1kUUmqLqcg4OY7zzw4Gj1t0+RzKs2
	GXNqWp0HbvHqSPvUFV743AN6ekP0KjbJTAtAaWeD6dBt+KOFogXgaYxOtZ7C7ddG+NdsUhyXt9F
	k77/LZTrFN43kH2naoC9mzmkhw57+dX1
X-Google-Smtp-Source: AGHT+IFinbmenD29Rw/0Uw611+rQ/E82ABxvNPKgQBCneBqnOXKQlDtW2JU9WvLJiNHkyHeRBhYRgA==
X-Received: by 2002:a5d:5f54:0:b0:38d:dffc:c144 with SMTP id ffacd0b85a97d-38ddffcc651mr5300952f8f.55.1739265736486;
        Tue, 11 Feb 2025 01:22:16 -0800 (PST)
Received: from giga-mm.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4394f3b8846sm8075945e9.1.2025.02.11.01.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 01:22:16 -0800 (PST)
Message-ID: <6b3cbd15b62a45b44cae2013fec11eb2c5504fa3.camel@gmail.com>
Subject: Re: [PATCH 03/10] arm64: dts: sophgo: Add initial SG2000 SoC device
 tree
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, soc@lists.linux.dev
Cc: Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
 <inochiama@outlook.com>, 	linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Haylen Chu	 <heylenay@outlook.com>,
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann	 <arnd@arndb.de>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>
Date: Tue, 11 Feb 2025 10:22:13 +0100
In-Reply-To: <bf8f3ea1-6fb5-40d1-a823-b3bc272a2257@kernel.org>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
	 <20250209220646.1090868-4-alexander.sverdlin@gmail.com>
	 <0d5484d1-be83-4f38-befd-94d458b3aaa8@kernel.org>
	 <03ff407fe68e46df4844e5dd244e7c609331af71.camel@gmail.com>
	 <bf8f3ea1-6fb5-40d1-a823-b3bc272a2257@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi Krzysztof!

On Tue, 2025-02-11 at 09:07 +0100, Krzysztof Kozlowski wrote:
> > > > +&clk {
> > > > +	compatible =3D "sophgo,sg2000-clk";
> > >=20
> > >=20
> > > That's discouraged practice. If you need to define compatible, it mea=
ns
> > > the block is not shared between designs and must not be in common DTS=
I.
> >=20
> > That doesn't come from my series, that's how original cv18xx.dtsi has b=
een
>=20
> You can change the other file to match real hardware. But if original
> cv18xx.dtsi has incorrect or imprecise compatible, I wonder how does it
> work....

cv18xx.dtsi doesn't have any "compatible". They define it for every SoC ind=
ividually.
So it's same MMIO window, different compatible. Looking into the driver I c=
an tell
that even the register map is the same, but they expose (and pre-enable) di=
fferent
subsets on different SoCs.

--=20
Alexander Sverdlin.

