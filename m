Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3EEA291C3D
	for <soc@lists.linux.dev>; Mon,  7 Jul 2025 09:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751881869; cv=none; b=N22rDnNK0VC7k3jPZDTVs5VwxlENQCf5q3pJrxNQUvJAzBdhbPj4XcnmFAp1OieDEgDZQxbDyhKJ3Hgw/yUs0BBiu72hNxCkkjGhd5HLWb6bYwrvjhIpMO0Q3mwbfCpCMAJJTc6tJzXQiFfH2RcQ3W0NVG8hyU/5KSTMVgJjuzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751881869; c=relaxed/simple;
	bh=+HetFi1ExroIsOoN5/lcGI2lk74GVglG+0Rv3wYS/5E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZsPJKuyKvEE96Z86lwfkJoSU1GPjri1J8JYTbc8qHJMIx0ceTlKRUvQLrTMnNrIYQHRtg/kKKQDTB4q1ZXw7k00uuBSdfn7eKuzm4C4VeP80TFNqp7qNCbl6DA/zJXfy22t8rPZxbRTbjEbAE0mgCOnUWbPOL5RWgNrcwsQphM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jCs+h/kL; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jCs+h/kL"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a4f379662cso2591988f8f.0
        for <soc@lists.linux.dev>; Mon, 07 Jul 2025 02:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751881866; x=1752486666; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gVjxdqHTuMJYD+Ho2g5ihe5EvWRJ3OhfB9FF+ZiWNvg=;
        b=jCs+h/kLCOWR2yF2THlmp0pj6cuq2OvzKzUNj8Dma6XSyFXapM5beBZAQwEWv/FO7d
         WTSFZnq+/tRHMkmCdPM0sjDzEckQTfi1KOyghOf1CIzr1x6QafbkYjKfPuskbnpQYwvh
         0cOz7E0KS9gBz5nmYJZ/WvpzvIWbUefD2jwh6l8tzfEQsk6KSD7L458QdYWDoD3nbj49
         PBdbbAgwdzfOEWES+FgJlum1nCG4M2i93KTBquZp8rA9uSiKUxrdFWQBet302jmlAWlM
         97Oz2+CB6hjDfU5+UFRl3xDkIoWiwuo5sEhUmIr/N6IY4lpi1TMkIvB0vj0yI1kB0fE2
         muug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751881866; x=1752486666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gVjxdqHTuMJYD+Ho2g5ihe5EvWRJ3OhfB9FF+ZiWNvg=;
        b=Xp0qD1UpB6td021D/TkQtEwdTYxSAiFaP0OtbdYLv+kk1y2vCtpX64NyRVMTKHox32
         8QN6YAOx7Fg7xzYA8+0F0LaSusPjMgFQerLpPCfx80i/SxJ5G64C3uoCAca5+KdjquJm
         Dxlk3nqNLB18iD1cjzLN2lGFd06HRbcGcGSwfvJkWO16fJ5AyZmxV1jFLUIZMPplgCt8
         zglZBwQGUia0Pc77WHWqBxlxZ8vKI58n0UFGYIbyylTLJ5Pl9g7vkUqLenXKehn0KfVJ
         /Cyn80GRtTIFMsDe+JcCWLW8TW58vZTrnasi/94Sjkem3m1AUtLbFoglpscxv8XgBxLT
         2wDg==
X-Forwarded-Encrypted: i=1; AJvYcCVve80NKJDoC42RXzKHpj8ydP+a4UPBFr4gy4wjR0d7qdlJJgqwpe3xM3fPvZamI2yXk+I=@lists.linux.dev
X-Gm-Message-State: AOJu0YxrEgRQxtVNEHKDT8o9k1oMNzFB/pABL/LqcnFamuDLp3AQNUzu
	JkZzMovtZls6atj1vzUwn7fkGzZQ/qbADsF6RL0tfXUSDBDAzRm4oKYLUsmSZGlKIKPJ3Spsj/t
	50fsI7zCL77YmsCZ7jjHk73BOGpwck0o=
X-Gm-Gg: ASbGncvTFe29zln8YkN1kXwMysq06ejzd53+La4iFQAeOShwb0d7I9Vk/qII+pR2Mo9
	9jxNW949mBrZspvQCe6MAXAE7RsobOe/wScKGdMbdzZj9gwVXVfhBSjfac8BJNcUllfgLcc10rS
	t/J53csGz9R8KRXf5rErZ80b8T2BcT8vlB6a5yiuTUic4nDQ==
X-Google-Smtp-Source: AGHT+IHaemfV7Yc8MYTOKmXHmjBgPc678uQXZOdUIfyot5vgXXAe6u2p/8rl0gl5MOdA1YcH9Rs+GNziSjER+UHyVSs=
X-Received: by 2002:a05:6000:1449:b0:3b3:9c75:a4fb with SMTP id
 ffacd0b85a97d-3b497029621mr9832614f8f.33.1751881865712; Mon, 07 Jul 2025
 02:51:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250704081451.2011407-1-ben717@andestech.com> <20250704081451.2011407-2-ben717@andestech.com>
In-Reply-To: <20250704081451.2011407-2-ben717@andestech.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 7 Jul 2025 10:50:38 +0100
X-Gm-Features: Ac12FXx7rJuxVDh4Pe2HacJlhHB6J3LpsyU6J4KL8NZ4EBGUAf2JV3T_SbkKDpM
Message-ID: <CA+V-a8unFMmA2NdwuofTL1fx8vVHtD8Y9QbW2ec8B656DK6AAw@mail.gmail.com>
Subject: Re: [PATCH 1/8] riscv: add Andes SoC family Kconfig support
To: Ben Zong-You Xie <ben717@andestech.com>
Cc: arnd@arndb.de, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, tglx@linutronix.de, daniel.lezcano@linaro.org, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	soc@lists.linux.dev, tim609@andestech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ben,

Thank you for the patch.

On Fri, Jul 4, 2025 at 10:02=E2=80=AFAM Ben Zong-You Xie <ben717@andestech.=
com> wrote:
>
> The first SoC in the Andes series is QiLai. It includes a high-performanc=
e
> quad-core RISC-V AX45MP cluster and one NX27V vector processor.
>
> For further information, refer to [1].
>
> [1] https://www.andestech.com/en/products-solutions/andeshape-platforms/q=
ilai-chip/
>
> Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
> ---
>  arch/riscv/Kconfig.errata | 2 +-
>  arch/riscv/Kconfig.socs   | 9 +++++++++
>  2 files changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
> index e318119d570d..be76883704a6 100644
> --- a/arch/riscv/Kconfig.errata
> +++ b/arch/riscv/Kconfig.errata
> @@ -12,7 +12,7 @@ config ERRATA_ANDES
>
>  config ERRATA_ANDES_CMO
>         bool "Apply Andes cache management errata"
> -       depends on ERRATA_ANDES && ARCH_R9A07G043
> +       depends on ERRATA_ANDES && (ARCH_R9A07G043 || ARCH_ANDES)
>         select RISCV_DMA_NONCOHERENT
>         default y
>         help
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index a9c3d2f6debc..1bf5637f2601 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -1,5 +1,14 @@
>  menu "SoC selection"
>
> +config ARCH_ANDES
> +       bool "Andes SoCs"
> +       depends on MMU && !XIP_KERNEL
> +       select ERRATA_ANDES
> +       select ERRATA_ANDES_CMO
> +       select AX45MP_L2_CACHE
Do all the Andes SoCs require all the above three configs? (If not I
would add it based on the SoC which requires it.)

Cheers,
Prabhakar
