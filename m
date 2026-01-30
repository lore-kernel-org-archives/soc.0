Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B7C23BCF7
	for <soc@lists.linux.dev>; Fri, 30 Jan 2026 09:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769764073; cv=none; b=XcPSvGhG1b6gUaAoVV2l6mM8s0Xr50QudoGAyNNnZs3i75BQIkAsaIE/uVfThbXkC7Lolx8a5KoPK57WhLJHZv2suiGRVRMGQuXh3w07wQO5VE7iuOSPS0Agj4WEc7zgnBaptRYry2I3TaVz14tYZlzQIlnXCB+Es6ljv923hVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769764073; c=relaxed/simple;
	bh=0B1Yalln+iXJXHDKO9R4SMtlHYiY3yHrwjpbwjLBBb4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T0S3gp8PYuRW9VscwIfZ0opr2Vo6tZHcvkC+nvCPN4sPM6cYg40TJXx+n27Qo2NY3qunXIArufsvAMu2tVQOye8B6eJsRK3ho/g1XNaPZqd0Yi+M+4Vm0TilKn8LmcltW2uDXSD1AVRVY/IJK3g7l7sXrUpFFbQpqL1wkc2xit0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E8+l+iHo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E8+l+iHo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76A7CC2BC86
	for <soc@lists.linux.dev>; Fri, 30 Jan 2026 09:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769764073;
	bh=0B1Yalln+iXJXHDKO9R4SMtlHYiY3yHrwjpbwjLBBb4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=E8+l+iHoDTbixe8W59bagjiZmxPTN1z+UFIT6QTnOPcYMAomeybQCsbbOwdMY3JdT
	 4FKx79MdT1ytHNajGtl7UGEhkIulK5N3f/JYk3KjWf2QPnS4DBwdu3wLCwQOAid/n/
	 06ZFcLeabOwIRN/E1Gm8Bn7H3wN4LoUXjKMpaSRnYNkjLU9ETiz9MK7trOcB0QYWP4
	 ccvPSfJjwqARC6xkSDr2J7S9c+PI6g4LfpxYQrQsZAXdpVDu4Zpc0FWVpHqCJtn7PU
	 T/9pLTGZEdATcX7YBW7RrJAe2FHnpi4rrUJrsSpvgOOgkhtC68WV+seKB1h8N0zhey
	 58+c7dBovIFhA==
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-64965ee303dso1845312d50.0
        for <soc@lists.linux.dev>; Fri, 30 Jan 2026 01:07:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUfwBNgmicRW1tqefa+ZOAez38nB8erXJeNVAGHaYJ7LlIN7c1pWF5UZ3FIoUvxnFQ2BlE=@lists.linux.dev
X-Gm-Message-State: AOJu0YyUQUPXqE644HbzXkzNWXtPorr6ocBYgEBq+jJTMfQ6CtNivjPA
	psxsElZk2aqtid1e9ioXtDQ9vxb0GKFWdyY7S4x4fW1nLTabyWG0/hQQ+vE8Go8bY5zp4Q3fa4Z
	Qw5LK5wiG/g05U/oogSm4jS7gPpnZTM8=
X-Received: by 2002:a05:690e:190c:b0:649:1d22:6c2f with SMTP id
 956f58d0204a3-649a8471a4fmr1591289d50.47.1769764072816; Fri, 30 Jan 2026
 01:07:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260128203455.38569-1-stefandoesinger@gmail.com> <20260128203455.38569-2-stefandoesinger@gmail.com>
In-Reply-To: <20260128203455.38569-2-stefandoesinger@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 30 Jan 2026 10:07:41 +0100
X-Gmail-Original-Message-ID: <CAD++jLn+ipz62Miki7VZNa_QestDNMtzmFK_zdLcY4deCweG8w@mail.gmail.com>
X-Gm-Features: AZwV_QgIqRkRaJIYIk5yozVO51jXZD7E-SQ96a4egvzgryd6Jyh30pFArwQRnZw
Message-ID: <CAD++jLn+ipz62Miki7VZNa_QestDNMtzmFK_zdLcY4deCweG8w@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/7] ARM: zte: Add zx297520v3 platform support.
To: =?UTF-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
	linus.walleij@linaro.org, Jun Nie <jun.nie@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Drew Fustini <fustini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stefan,

thanks for your patch!

On Wed, Jan 28, 2026 at 9:35=E2=80=AFPM Stefan D=C3=B6singer
<stefandoesinger@gmail.com> wrote:

> This SoC is used in low end LTE-to-WiFi routers, for example some D-Link
> DWR 932 revisions, ZTE K10, ZLT S10 4G, but also models that are branded
> and sold by ISPs themselves. They are widespread in Africa, China,
> Russia and Eastern Europe.
>
> This SoC is a relative of the zx296702 and zx296718 that had some
> upstream support until commit 89d4f98ae90d ("ARM: remove zte zx
> platform"). My eventual goal is to enable OpenWRT to run on these
> devices.

This is a noble goal.

> +Zx297520v3 SoCs use a 64 bit capable Cortex-A53 CPU and GICv3, although =
they
> +run in aarch32 mode only. The CPU has support EL3, but no hypervisor (EL=
2) and
> +it seems to lack VFP and NEON.

The practice to run 32bit kernels on 64bit capable hardware has been
pushed back in the past. When you say "they run aarch32 mode only" this
sounds like a choice, not a mandatory demand from the hardware, i.e.
it *could* run in 64bit mode.

We can see why the vendor does this because the board has only 64MB
of memory, and 64bit code is known to take up more memory.

What we recommend is usually to run a 64bit kernel with a 32bit userspace,
so the userspace still isn't too demanding in memory.

Have you been able to try this?

If it seems hard we might need to bring people in who can help with
enabling 64bit mode for the kernel.

I think Arnd might have pointers to previous conversations on the topic.

Yours,
Linus Walleij
