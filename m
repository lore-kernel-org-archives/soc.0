Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6025F4DAF85
	for <soc@lists.linux.dev>; Fri, 18 Sep 2026 10:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789728912; cv=pass; b=kreUYVlk4h/6MWzwGBYE+4/DEwRndtVtsxYDetgVDePHGMB/oKUhTkOCpUpv9ZLLc9UqcatjtYlQPwMW0C+sVraJH9wJPXnYGsPT0bcRNModb2Ii8gIqIyIDbx0eOKb7XuPfA8/6iKM/XloBj8RrvxpeaXLctRsFGVgFwjJXuzM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789728912; c=relaxed/simple;
	bh=0QFLY2cyWzIGxwHrQ7HwSGwbi9sjKL2DXLzkJTDdzU8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qVfRUBob6z8Xu74/ieTflI9bEX6kxMEZAgm/qwUsnDWQ2a0MUSFftvGCPBsTKRaOAX5zt/IrTFlPTFCGMSXmymHWB9Y1faU0haMpD6pWpZjmdtbyTQBWaM0ZIFU+RWcXBWn/Pef+EN/u1GDA3xFIG/KmdrsVa2jD8BgSkdmfcz4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pO+fCtJK; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pO+fCtJK"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f6c7a4aso67513466b.0
        for <soc@lists.linux.dev>; Fri, 18 Sep 2026 03:55:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789728907; cv=none;
        d=google.com; s=arc-20260327;
        b=iDRqx69N69zDwwSgoucruHmLAYsPDBGnZUpTB2wNWCpXCr3oNC/lj2XNZOSR+wFJb+
         7EpahSbyq6YreMMY/vIQikdlBvqVJ3kclABeYlhICqgghF44D3Y7kIUx4PJJ1uBrStgD
         SHJjX3awNaHHUT83Xgy21y1TJ3k0vTQsXDZaFjwRwtTuRWp7oDoSVudY36bqY/7ujRsE
         tficFCRnr6DSInDdiUjzoIJLxTszGVeSY6aJIoLqYaAie9ZmTd/oTapuUQAHVFiT+zKG
         UyiReuCtok15l9nUxRc2pEQF4Z5n9F2cnHGTPDZKW9EKrIWMsSxN17xsEdMAw6OLMEhr
         6YJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c9KFaw0r3zy7as/jjFJHUlbx8sYj2YFXt4OlbArB54Y=;
        fh=jS4E5k9Ow8kMh/LQclrGxedVnN5RBhcTdUYSJ6Vu7Q8=;
        b=pW4QP/6cr8NvUPZdFGudy/oasRGuOkC1vp5pFvTNmqBqC+829qbc0tnqH8kR5/k+BG
         +fV3/cInDglCWw92FwZzlLIm1M7zVLlVxenm8m8lOzLc3fL/3fhIG3ABhKdSfZnHNJM1
         3S6H74r6XJPtC9aa7VOBhUM2mGI2VRby0zwZIiSnJnI6JvUBsrrOjqRK6jjgfpXV6R2O
         MjK3WqA3w+UV4PXLGKmQmfUW38k/nzDdaOAXp0OUTko50qdJeunszqcCmT718Ex65TDM
         DLtu8CVkzFWqp2yJ/4oXt9uhYxSxiHIp403aF8/D6Clr1VC1u7gp47OUAfSwqOcw2Jxy
         4XXw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789728907; x=1790333707; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c9KFaw0r3zy7as/jjFJHUlbx8sYj2YFXt4OlbArB54Y=;
        b=pO+fCtJKm1uX04V+6TfeNtwxSrJIHEYR/wttcIukxZgrhPhF6GFXmuVM6ZOV2+H/wL
         LOdE9nWtH7hPmbMAMEUVeuZT2tSkyqnuPbQmuolDITho6Gl1FPwenBVhV6uLCfM9UE0p
         Cz334aIct1VXhuIk+AMGOQLExDlyJ6GORXCw5TZCTpWLi/1tGkZQioWXcznUD+W19+9F
         In4LAUht3YD/2uWda7x2ILNdXA4LG0li+AK0AYBN4ilS+uiGddGpPNv0Ky9M0NSfmK5S
         O6BV6/HNl9w/O5Oz6qtBzM0MjkD1gTnX2KlheBslXxJzaAo9LDT0teVkzqnuTmH/3qWj
         hhOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789728907; x=1790333707;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c9KFaw0r3zy7as/jjFJHUlbx8sYj2YFXt4OlbArB54Y=;
        b=2Am0oys3YsKQoayn+Bky2x4OHHVbQKPy/xI8tEgqMLS66spVhRVVcxnZhHnifKOr/8
         tyy8rSJo0WNswYO5AYMV6jRLwu1qGvs44DcGtv8Y+iHZZOjp+6gDIuM0uGCtAflk/Kjw
         herOW7+0ezNyFYTsYwmcrXFOd9gKPu99SHmc5iqgEQv6Pr1CeifwAfLh+v4PXCRSvmew
         ujCKZIJ8j2kXfEiJ3lwTFCSEIgGs4UnenN1RuJou6q09WMMomH7T66yH9SW9OrE50Upv
         hvEQNuhMBeeXMPjU8SK1OH4iBjV2fT3Kny1Mj4IKFzqpACWpHHK3TAvvqtM8nt40Ac2S
         4S9Q==
X-Forwarded-Encrypted: i=1; AKwUvBzu47xe6RkXe1PcgqtAaW3UWWb+KDVjO8f1jKf3Lo48p698UgD2AhNb6HgLz3Zhn5hGKPk=@lists.linux.dev
X-Gm-Message-State: AFuF++l7c+lQfjlMalU4+1aKFROcXZ8rrudnaDElvRkwZdDAsBvWos5l
	b6i2R62CN7sb4452ctpPbHFmwgo1Pkh4++NdEro4Cv1diwFnoiZ738/IYdjIcmAwlU8gelLpPVn
	8gDvSZPpSEOepb291y4IQ7ZLmJkT4ZXs=
X-Gm-Gg: AYBFou1Wzz3BnBn5NVzFK29X0iykmRFZ6ODRhkMSDM+7RvVq8y9YrdrQZBwPEeJ4nyr
	PNzHLcJpF6e3752E2rgxFYWfKW31Yet57Ng9S4ugWfHTH9s/sB9B8ux5Wu21Ol/rgShF/zleYXK
	l3fPJUr9M8z1VaLhHFdpJMmhC550oYqXixxCKGDjPNhelpUgaLqe/K24pQLw1eNSo93aBI52QKw
	1mzsZpplQCQ+hnKhhPcVlKAtXWuuuIOE5AaJLX0gIAhavbMo+dEoPwRE0jXCuOxiEjj579ka+US
	syYiy9hKKQg8pGsekD8Q5PMg/XCSkwshxAIfPD2rMNYhIRxQlgZqAj8CFZkoOLIki60VJKbQEyz
	/QYOvS4ULlwREl3142+1DbY3X3CVIfkcAL1TUmXtnVefPZP8cP0sM
X-Received: by 2002:a17:907:d0a:b0:c28:ec7c:27ae with SMTP id
 a640c23a62f3a-c2a15aecddfmr221737866b.25.1789728906928; Fri, 18 Sep 2026
 03:55:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260917-tonyk-syscall_table-v7-0-f4cd8f8e3265@igalia.com> <20260917-tonyk-syscall_table-v7-12-f4cd8f8e3265@igalia.com>
In-Reply-To: <20260917-tonyk-syscall_table-v7-12-f4cd8f8e3265@igalia.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Fri, 18 Sep 2026 12:54:55 +0200
X-Gm-Features: AcwNN1XYBCc8XytQv7lpPsMdlPdL7ChQXyccU8FUv6otEOv13o1h6_2iRPXOShM
Message-ID: <CA+=Fv5Q+sOLmT0Wf3OGdKw=mBt_EoS8ZQDF3wwGrm2-2vnOYgg@mail.gmail.com>
Subject: Re: [PATCH v7 12/13] alpha: Remove alpha_ prefix from custom syscall entries
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Arnd Bergmanon <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, kernel-dev@igalia.com, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-alpha@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	soc@lists.linux.dev, linux-mips@vger.kernel.org, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9,

On Fri, Sep 18, 2026 at 1:48=E2=80=AFAM Andr=C3=A9 Almeida <andrealmeid@iga=
lia.com> wrote:
>
> Some architectures need special entry points for some syscalls (like
> clone3). The current approach is, instead of having a special name like
> arch_syscall, to name if as __syscall. This is enough to different the
> common entry point to the architecture specific entry point.
>
> Change alpha special syscall entries to do the same. This makes easier to
> join the syscall tables. Leave alpha_syscall_zero because this syscall on=
ly
> exists in alpha anyway.
>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> ---
>  arch/alpha/kernel/entry.S              | 8 ++++----
>  arch/alpha/kernel/syscalls/syscall.tbl | 8 ++++----
>  2 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/arch/alpha/kernel/entry.S b/arch/alpha/kernel/entry.S
> index 9f2608de2544..8a85fcf117cb 100644
> --- a/arch/alpha/kernel/entry.S
> +++ b/arch/alpha/kernel/entry.S
> @@ -879,9 +879,9 @@ ret_from_kernel_thread:
>
>  .macro fork_like name
>         .align  4
> -       .globl  alpha_\name
> -       .ent    alpha_\name
> -alpha_\name:
> +       .globl  __sys_\name
> +       .ent    __sys_\name
> +__sys_\name:
>         .prologue 0
>         bsr     $1, do_switch_stack
>         // NB: if anyone adds preemption, this block will need to be prot=
ected
> @@ -896,7 +896,7 @@ alpha_\name:
>         ldq     $26, 56($sp)
>         lda     $sp, SWITCH_STACK_SIZE($sp)
>         ret
> -.end   alpha_\name
> +.end   __sys_\name
>  .endm
>
>  fork_like fork
> diff --git a/arch/alpha/kernel/syscalls/syscall.tbl b/arch/alpha/kernel/s=
yscalls/syscall.tbl
> index 8fc4701a6328..a41276634923 100644
> --- a/arch/alpha/kernel/syscalls/syscall.tbl
> +++ b/arch/alpha/kernel/syscalls/syscall.tbl
> @@ -9,7 +9,7 @@
>  #
>  0      common  osf_syscall                     alpha_syscall_zero
>  1      common  exit                            sys_exit
> -2      common  fork                            alpha_fork
> +2      common  fork                            __sys_fork
>  3      common  read                            sys_read
>  4      common  write                           sys_write
>  5      common  osf_old_open                    sys_ni_syscall
> @@ -72,7 +72,7 @@
>  63     common  getpgrp                         sys_getpgrp
>  64     common  getpagesize                     sys_getpagesize
>  65     common  osf_mremap                      sys_ni_syscall
> -66     common  vfork                           alpha_vfork
> +66     common  vfork                           __sys_vfork
>  67     common  stat                            sys_newstat
>  68     common  lstat                           sys_newlstat
>  69     common  osf_sbrk                        sys_ni_syscall
> @@ -242,7 +242,7 @@
>  309    common  get_kernel_syms                 sys_ni_syscall
>  310    common  syslog                          sys_syslog
>  311    common  reboot                          sys_reboot
> -312    common  clone                           alpha_clone
> +312    common  clone                           __sys_clone
>  313    common  uselib                          sys_uselib
>  314    common  mlock                           sys_mlock
>  315    common  munlock                         sys_munlock
> @@ -474,7 +474,7 @@
>  542    common  fsmount                         sys_fsmount
>  543    common  fspick                          sys_fspick
>  544    common  pidfd_open                      sys_pidfd_open
> -545    common  clone3                          alpha_clone3
> +545    common  clone3                          __clone3
>  546    common  close_range                     sys_close_range
>  547    common  openat2                         sys_openat2
>  548    common  pidfd_getfd                     sys_pidfd_getfd
>
> --
> 2.55.0
>
>

The fork_like macro now defines __sys_clone3, but the syscall table
entry is changed from alpha_clone3 to __clone3.

This should be __sys_clone3, like the other custom entry points.

I also confirmed this by building the tree at this patch, before applying
patch 13:

LD      .tmp_vmlinux1
alpha-unknown-linux-gnu-ld: arch/alpha/kernel/systbls.o:
in function `sys_call_table':
(.data+0x1108): undefined reference to `__clone3'

Patch 13 hides the issue because the common table uses __clone3 as the
ABI tag but correctly selects __sys_clone3 as the syscall entry point.

Magnus
