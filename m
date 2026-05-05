Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72ABA33507D
	for <soc@lists.linux.dev>; Tue,  5 May 2026 09:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777974738; cv=none; b=pDgCFjGEukJnX9U7eOCpgJRPKs7firt+/JQIXM28x/dpe7YMG9WuNLU0TtxEPD6xMo+gJuf1fClJsJ2mhC0L9Q0KnVTAsq5Um5/z7OdOx3Memt8TgegM2gE7T0vHDAt3CoJW+qIPt9qBS9VwQBLAzIcb8RRuxBpz+epwEMkUzDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777974738; c=relaxed/simple;
	bh=cpIFIXhpqMMG5+sMrNERuIyu7U4UcLZK/Q47PKcgdqo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oBnQ8cx3wPf9OhA+H2+6BCUETSQDo2qHbcVtCwHjRSVdB9iGZ2Rxvo//meCKzcjjuXrTlMPa0o4kayGW0CAQ4eNFMny0YksYDBK8A0ZPkYRthpTZtoyZRV8/gNlMtcYWTILxqMg3m0BfFJBgUpLIeOHP9iGtfp3k6+P9nLm2HF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fNRi7nTu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fNRi7nTu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 107F2C2BCFC
	for <soc@lists.linux.dev>; Tue,  5 May 2026 09:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777974738;
	bh=cpIFIXhpqMMG5+sMrNERuIyu7U4UcLZK/Q47PKcgdqo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fNRi7nTupnxh5eSmRIio74kd+u5Vi2OF5cS7v9YWXVI+NRSd+RWC3uNy5BSPWBKv/
	 105hKSvTQf+T+t6rdNCbl+rFx7Y+wzmdmYyzThe4DjSW12WGRSGCJbWS4L7CXTX14m
	 IU5WL2Pb8lzVuInCq2azdC77srFCZLlqlDzFQgDUuiV4cs2oGADWARj2V7JQ0b19Ut
	 Ha3K7JWCbfDa7nYL5hL3tj4VlQ09B+jhQEv8VqbJdQCDxPho8ymzkz5i0dWEgPFvgW
	 DTl2uHiUMoKq/H31oePPEYOBUnn3pTQbTX1nUfHm2FXUK6hocVlleKmRVRz1bjjKOb
	 J/cJfwnoc1CxA==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a525aedb24so5649748e87.2
        for <soc@lists.linux.dev>; Tue, 05 May 2026 02:52:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+2+p9Y7FvVYMJmWjqw4K5PTrPd6B1hbEK/+12QKf7bCEY8153SjPaRpD/XGRforUEOhDk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzHrA6T+1b7zD7PHKqkEB7/TrdhEfUzlNRm9YxqVfbHOuYusrbd
	1G7DwGnpYAW+jneVUDqq39aTQZbsDWnNN6/5vQ1sAwjVtiWlTLbevckKaBqSkbfrdZfNxmMO8MR
	s7FU5x1fFr0+Af/InoMofNhkIQBTry7U=
X-Received: by 2002:a05:6512:33c1:b0:5a8:63e1:af06 with SMTP id
 2adb3069b0e04-5a87f1dae3emr1048945e87.23.1777974736749; Tue, 05 May 2026
 02:52:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260429-defconfig-v2-0-e4ed4186028b@oss.qualcomm.com> <20260429-defconfig-v2-5-e4ed4186028b@oss.qualcomm.com>
In-Reply-To: <20260429-defconfig-v2-5-e4ed4186028b@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 5 May 2026 11:52:05 +0200
X-Gmail-Original-Message-ID: <CAD++jLkjOzfP5MLB0wuOUouM3keE1osBEJ+PWC84dwtd6h4SOg@mail.gmail.com>
X-Gm-Features: AVHnY4IFYFYkhZ8oq3rAOzmlf9lv-MvlXK4ZwfeKAdZXsIKlgyz53yxEXQ0V6No
Message-ID: <CAD++jLkjOzfP5MLB0wuOUouM3keE1osBEJ+PWC84dwtd6h4SOg@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] arm64: defconfig: Switch Ethernet drivers to modules
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Drew Fustini <fustini@kernel.org>, soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 29, 2026 at 8:50=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Development of Linux kernel progressed over last 10 years and it is easy
> to generate now initramfs for building own kernel, e.g. with Yocto or
> mkosi.  Therefore for a few years of reviews on mailing lists, all new
> options enabled in arm64 defconfig were with assumption of having
> initramfs which can load bare minimum of modules to mount filesystem
> from network or disk.  Basically network driver as built-in is not
> anymore essential to boot the system, so switch almost all Ethernet
> drivers to modules to save on kernel image size.
>
> Similarly 9P network filesystem for QEMU, especially that testing kernel
> unuder QEMU does not have any size or build process constraints and can
> use initramfs with -initrd argument.  Note that having network drivers
> does not break NFS root, because whatever loading method, e.g. TFTP,
> which brought the kernel image can bring also the initramfs with network
> adapters (and I have been using such method for years for my Samsung
> boards).
>
> Notable exceptions / diff explanations:
>
> 1. Mark I2C as built-in, used by CONFIG_IGB as a module.
>
> 2. CONFIG_BCM4908_ENET and CONFIG_BCMASP appear in the diff, because
>    they were default=3Dy (via ARCH_BCMBCA or ARCH_BCM_IPROC).
>
> 3. CONFIG_HNS3_HCLGE and CONFIG_HNS3_ENET are removed, because they are
>    default=3Dm.
>
> Moving code to modules has positive impact on kernel image size, thus
> boot time of all users not using above drivers and ability to flash
> fixed-size boot partitions.
>
> Old Image size: 41.2 MiB (Image.gz: 14.8 MiB)
> New Image size: 39.1 MiB (Image.gz: 13.8 MiB)
>
> bloat-o-meter of vmlinux:
> add/remove: 3/6972 grow/shrink: 6/45 up/down: 66659/-2333659 (-2267000)
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

OK it's probably the right thing to do, no reaction from the netdev
people so let's go.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
