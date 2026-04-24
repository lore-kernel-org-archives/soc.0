Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD2135CB67
	for <soc@lists.linux.dev>; Fri, 24 Apr 2026 06:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777013612; cv=none; b=C4RmtJrdor5fNbnq0zlY0TwmGfUWFZB/XFzIi0kdFfdPJ8SgcwE8EtnBM+GFjkD9/1pGSyWOaKexfsZyv5IOKKIlg5zCegrfP4duIecyCnzH1DCdbUdp133ug72t0n0p/OGyEjr3e8EAkWimQDRC74GS9KD1k3JKGl2sL1OnfI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777013612; c=relaxed/simple;
	bh=O9NzlQQCp2/Kz+bplGJMXt4VJTj4U2GDwY0IpQNPIeQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fHMiX/BrgyL3u6MotawOJ9Ma+YFsjjTNs7dExuTY0qy2pkPRUesJGI+UqL8A75dZthcODEFZmCoZyqL7YTuuk0U9IHASjlkjoCHQYOXSEEj1gAgtjAfNcedmeVFyDKJmTjZ+NwteAe4yYPlrqG08sEVjTOAC53ITlDb6qqDZ1UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=luxb1u+i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="luxb1u+i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2322EC2BCB7
	for <soc@lists.linux.dev>; Fri, 24 Apr 2026 06:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777013612;
	bh=O9NzlQQCp2/Kz+bplGJMXt4VJTj4U2GDwY0IpQNPIeQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=luxb1u+ihyxw77l+0A8AA4fqxfm9u1cc7/YW/X8qrFtd8S75yfDrsGjnriq97C3uK
	 jl5xQKsLohN8BojQJEVuqkP7ctt3WYQfiZqp+E2mHh5PXIwgW3aiEGm8yINsE8QCAS
	 egfBXH84YOnMq3t9YcJZKva5xO4/vZ0sMe+Zp9QtC/4YUu5PR4weJH1p3zTsxpNPc2
	 /mnecJ9paJI2Ot6EB+KSR3lBu58Y1n5Vlp7jYZV3n0SX+pVGRxGOb6woLT4W0ehtLx
	 XgxHCA49zURcHpmsdjOVrZqk++/T3rJKllKVkr6aj+E+Sn7pa5OrKWKbXV/rkXPOpU
	 ev9TaGcTnsztw==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a40d02b58bso6548687e87.3
        for <soc@lists.linux.dev>; Thu, 23 Apr 2026 23:53:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9QaeNwwkQZSPvR9Yj78BVGtH/UGHo/wh3+tJXMqYhm0x/7JWXbrPhS+IyBIvuB4NmjyHM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyw6S1fVDZXCRZdwnalOlVUF9Dud73z+Ng79t91pRHeW2o0fZPU
	LtAojOzzk+DO81eaI0D4tcyD9ZOmlfO/laXEUnTVshgcs0aKjMo9qGCklEtlmq3GY2J8RqCZYRD
	5UpSEep1AZycneKnK1/eEOqxtePIojE8=
X-Received: by 2002:a05:6512:10cf:b0:5a3:d3ac:505e with SMTP id
 2adb3069b0e04-5a4172ea112mr10436248e87.44.1777013610857; Thu, 23 Apr 2026
 23:53:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260412-defconfig-v1-0-a46918286451@oss.qualcomm.com> <20260412-defconfig-v1-5-a46918286451@oss.qualcomm.com>
In-Reply-To: <20260412-defconfig-v1-5-a46918286451@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 24 Apr 2026 08:53:19 +0200
X-Gmail-Original-Message-ID: <CAD++jLkVFN-hY0Wr-FiSy4d6re7t1yD072poR3GLnNn=MjrTrw@mail.gmail.com>
X-Gm-Features: AQROBzBBtLlzpRpalYLcrA4a14M4muyMnfCsBUW0DrgWQITZYcQtALrF9zTBrd0
Message-ID: <CAD++jLkVFN-hY0Wr-FiSy4d6re7t1yD072poR3GLnNn=MjrTrw@mail.gmail.com>
Subject: Re: [PATCH 5/6] arm64: defconfig: Drop AMD XGBE Ethernet driver
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Drew Fustini <fustini@kernel.org>, soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 12, 2026 at 6:21=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> AMD XGBE Ethernet driver was enabled for KVM/QEMU, but QEMU dropped
> support for it in v10.2.  Driver probably is not used on any other
> arm64 platforms, at least ones not being used for development with
> defconfig.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
