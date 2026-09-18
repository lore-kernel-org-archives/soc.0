Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8A64DAFBA
	for <soc@lists.linux.dev>; Fri, 18 Sep 2026 10:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789729047; cv=pass; b=mReurASF3+krCvgau5IO7Oc28HGSU2n+woegJKL4RTWQk3ig/wXuWdp2KWbDLnspsrQIm6ASq4NVPoDauiYnIqRG+xg5qmLU53fhNrSQCnIEuXtpWme04VaKwgQNTvvBJB0AOe1Lz0dR1hAFXUh4dkfUP3fE3a72kEYqu3n+8yk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789729047; c=relaxed/simple;
	bh=6iYGIhTpi7LuKPSoQodSj4LWWam1JDnzz7YKjGx7zA8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EYNS9tll5uf7eNk8LsQyhtouLL0SzfTigj5DqFNP+EkEZ2NmbiKJVknDVoCFtmSaZHFHgvqCFIFW0Azc5WT7iHxmP21BBPqIfNwopRGr1mSm5DpHPzZHeFD6SGdMFe3frjeplGS8icjzl3pgZfBrOPFqa17kw6doHHKcc1An+lU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iri73tMR; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iri73tMR"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c29703cb470so92711166b.0
        for <soc@lists.linux.dev>; Fri, 18 Sep 2026 03:57:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789729041; cv=none;
        d=google.com; s=arc-20260327;
        b=n+u1Hyb1ApiLo7Z5VrGRY/g3nj2L+iUq1Nhib67ojQ+XucBcvXKmQXMEzFTMa3OR61
         vy15YTQrPghToFxhKAaRwuDy3L/LyrgR2HWR8GTC7PaEUqlhcrGjx4kJTIsm08kDg+TD
         TY+JWbT1PplDFyr0SUEqjvAhbZv3LYc6yJ4KWoFSYVskpLCaw1L/mZK9IT2nQXiLIhyo
         GADEKNmDKH8dNCTiMB5VKI8CaBaw0vHIZjxxdg5cYkIdg5JUFGXi20CX8rIk30zC5cP/
         OPpPjh1u4eMknRN9MSwBC6OTnNigIhjuVVoRKXErze7SR50LO920RaOn3ybTc+M145bF
         4Vcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=STfWB7GvLQfZTNQp3BOqhn0t82awjzhOdLfYzJJuSYw=;
        fh=EuMgkXmasSWgAwWjTKcxISdQoBDkM08+8xOlBZSOXSM=;
        b=DMgGJKqJTDjPivJjH1ukDeHULzUBDXmMB+jeYiQo1c7QAwxgdrrNsTYqZWKwrbBj3v
         RETth0ObK8IOe4HL87FYR0DFQyW2DMbY8qBDI030CPfTCbxlFUrzM6nqbJjVvjoEfJih
         h2Nawn42WHJvEW7vVH54GnOn6xoRFy/60hOHo8WL5+I9w5OVklGznhrskkzrTdoN+k3F
         kZ/aM0jj4YpnGjYd/bwCjuKybZ7sA78HtBBlvyC5nZWHRD2VqvhJHGqVAW/C4YFe0qYd
         sh/inOQJr1c2thG1oSe3mBj8i5JgEQ8dVZPe3b1VzMFW0YMhfpQLjzyR4fSHzvCphTiN
         nUyA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789729041; x=1790333841; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=STfWB7GvLQfZTNQp3BOqhn0t82awjzhOdLfYzJJuSYw=;
        b=iri73tMR2Hqz2AG6fUKbTymMmKKHvHA5GFwZTQJ7Xb61KflWmLQ153EMkxcKZhmg+W
         FdDTvF9oDw6t+9eDhGDj7csnI5Qaq7pNJ2Jh+n2StwdWdkcwhK1hRTjm4qNtoHXHJ0f+
         ztctFrhFL80GbOmkYjORjKrirlIPUqim/1T4OFBpma5FZdRMUDB3+MGPhZepP+0Lw0H8
         tdE36YAa720+9F8ls9gcXORuvJB+ywXTtT+rj6cqPUJG1orqX/5MCLjP5irS6F8XZeXj
         I28rBKV05iOwZf9DfdJpndkkYBcptJ9G3/Pif2ymoFYt+peWpkcw8Gtp8EmEUntV+Lep
         zrrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789729041; x=1790333841;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=STfWB7GvLQfZTNQp3BOqhn0t82awjzhOdLfYzJJuSYw=;
        b=t6O0yjxBOO/ZQmepBH1rpX7WaCdwyLO9K+I0ZlwNvTDp/zlmk/W4usVOxafSeNFqhV
         sWGXdQbv/CXLiAd/OhNodR0lJ72sj4EYikxWSkvHQTsIOhxnvtv4nxh+lyLSZRy3zqg/
         w6mE+KEyIvVpMdGnOYFX0571OwcbEojTPuBHGfH4jLHrqrNeteaqzOONjyd5JJPDVBTv
         Md7x2Uoeot8Kl2/V1fWO1jSxMzZegnWBWItYs5jTzu7HwafLjZdeuduFa6NxAHHI7z4c
         Qlrst41pQCs1bENrKsm9dQOfia5yz4kyX+IAlPEhaUQyjslePaV6IM6XGyWBtCitcWvc
         aecQ==
X-Forwarded-Encrypted: i=1; AKwUvByc4WvGzhkLXruZGASniXV2vwKEDtLAJ5f1MhmUdgnRZGChGqA4N2zm5WqrKhAXGz84QIE=@lists.linux.dev
X-Gm-Message-State: AFuF++kt3RoE26kwChNNpyf/yHVdh85dcrcSvXdMd3O4QzbyTSi3Qvww
	488NK+O+LirFIyGhJb56ZtPiqk5yAgBn5DA2ck+TgrTF2xQ8g9Ju4sCCw3ulISYf8jisGUDpCTE
	U8EYsyarhkzBZn7LaBQwhpqQs+gzCcmo=
X-Gm-Gg: AYBFou1IfIz2I176LxudtxJCLz+B8Yc85d6U5CZ4PS1sUHx7y3e8RJdb4vFDZblB7pG
	5QDLZLiuVm/FEzibmLMstYg1GqRwNcp/vS6RdlEY2tw6D5MwXdHqi38pJ0tI0BLi/NTvwp6+Nfi
	BiDin3V3t1qKndJB73HV5DLWx5Zb/AsaBnqt3bFlDwI/dX2AlBVUnjxy9VG1cKI4Cahe50J4vNz
	haEnqPI9cxlJqdkkZsDy5Pqsk0zh84OwkYqmjbYcZRAmwOFZdLtXov+cX02z1+fHLHGRGPdAFgb
	fGgRluhL2mGvnWopeIIyaHhSqGhvbVYDo2vbmzgAyHJcLgdxJPFSr9qV+pSHT/tlkbFvLO+d0vX
	Ujn+OgngtyDZcmCFMQJ36D1k878P5xzVWtjRcTASL70SpsnKE0g/0
X-Received: by 2002:a17:907:3e9f:b0:c29:f5d8:9c6f with SMTP id
 a640c23a62f3a-c2a15802e80mr221037366b.30.1789729041100; Fri, 18 Sep 2026
 03:57:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260917-tonyk-syscall_table-v7-0-f4cd8f8e3265@igalia.com> <20260917-tonyk-syscall_table-v7-13-f4cd8f8e3265@igalia.com>
In-Reply-To: <20260917-tonyk-syscall_table-v7-13-f4cd8f8e3265@igalia.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Fri, 18 Sep 2026 12:57:09 +0200
X-Gm-Features: AcwNN1XuAITXWKYUHlzEkxHeHjQM9QwjDHbUkRpVnBkp7VsqOue8wy8fg51lcyo
Message-ID: <CA+=Fv5Rx6Ccmxi2a2YmiMgc0Z7TaWvx8=27jpFE-k3Kfn8Q-ug@mail.gmail.com>
Subject: Re: [PATCH v7 13/13] alpha: Use the common syscall table
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
> Remove some of the duplicated code by using the common syscall number
> table.
>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> ---
>  arch/alpha/kernel/syscalls/Makefile    | 14 +++++++---
>  arch/alpha/kernel/syscalls/syscall.tbl | 49 ----------------------------=
------
>  arch/alpha/kernel/systbls.S            |  1 +
>  3 files changed, 11 insertions(+), 53 deletions(-)
>
> diff --git a/arch/alpha/kernel/syscalls/Makefile b/arch/alpha/kernel/sysc=
alls/Makefile
> index b265e4bc16c2..03099daff6b9 100644
> --- a/arch/alpha/kernel/syscalls/Makefile
> +++ b/arch/alpha/kernel/syscalls/Makefile
> @@ -7,17 +7,23 @@ $(shell mkdir -p $(uapi) $(kapi))
>  syscall :=3D $(src)/syscall.tbl
>  syshdr :=3D $(srctree)/scripts/syscallhdr.sh
>  systbl :=3D $(srctree)/scripts/syscalltbl.sh
> +systbl_common :=3D $(srctree)/scripts/syscall_common.tbl
> +abis :=3D common,__clone3
>
>  quiet_cmd_syshdr =3D SYSHDR  $@
> -      cmd_syshdr =3D $(CONFIG_SHELL) $(syshdr) --emit-nr $< $@
> +      cmd_syshdr =3D $(CONFIG_SHELL) $(syshdr) --emit-nr \
> +                  --common-tbl $(systbl_common) --common-offset 110 \
> +                  --abis $(abis) $< $@
>
>  quiet_cmd_systbl =3D SYSTBL  $@
> -      cmd_systbl =3D $(CONFIG_SHELL) $(systbl) $< $@
> +      cmd_systbl =3D $(CONFIG_SHELL) $(systbl) \
> +                  --common-tbl $(systbl_common) --common-offset 110 \
> +                  --abis $(abis) $< $@
>
> -$(uapi)/unistd_32.h: $(syscall) $(syshdr) FORCE
> +$(uapi)/unistd_32.h: $(syscall) $(systbl_common) $(syshdr) FORCE
>         $(call if_changed,syshdr)
>
> -$(kapi)/syscall_table.h: $(syscall) $(systbl) FORCE
> +$(kapi)/syscall_table.h: $(syscall) $(systbl_common) $(systbl) FORCE
>         $(call if_changed,systbl)
>
>  uapisyshdr-y           +=3D unistd_32.h
> diff --git a/arch/alpha/kernel/syscalls/syscall.tbl b/arch/alpha/kernel/s=
yscalls/syscall.tbl
> index a41276634923..7066a3920899 100644
> --- a/arch/alpha/kernel/syscalls/syscall.tbl
> +++ b/arch/alpha/kernel/syscalls/syscall.tbl
> @@ -463,52 +463,3 @@
>  532    common  getppid                         sys_getppid
>  # all other architectures have common numbers for new syscall, alpha
>  # is the exception.
> -534    common  pidfd_send_signal               sys_pidfd_send_signal
> -535    common  io_uring_setup                  sys_io_uring_setup
> -536    common  io_uring_enter                  sys_io_uring_enter
> -537    common  io_uring_register               sys_io_uring_register
> -538    common  open_tree                       sys_open_tree
> -539    common  move_mount                      sys_move_mount
> -540    common  fsopen                          sys_fsopen
> -541    common  fsconfig                        sys_fsconfig
> -542    common  fsmount                         sys_fsmount
> -543    common  fspick                          sys_fspick
> -544    common  pidfd_open                      sys_pidfd_open
> -545    common  clone3                          __clone3
> -546    common  close_range                     sys_close_range
> -547    common  openat2                         sys_openat2
> -548    common  pidfd_getfd                     sys_pidfd_getfd
> -549    common  faccessat2                      sys_faccessat2
> -550    common  process_madvise                 sys_process_madvise
> -551    common  epoll_pwait2                    sys_epoll_pwait2
> -552    common  mount_setattr                   sys_mount_setattr
> -553    common  quotactl_fd                     sys_quotactl_fd
> -554    common  landlock_create_ruleset         sys_landlock_create_rules=
et
> -555    common  landlock_add_rule               sys_landlock_add_rule
> -556    common  landlock_restrict_self          sys_landlock_restrict_sel=
f
> -# 557 reserved for memfd_secret
> -558    common  process_mrelease                sys_process_mrelease
> -559    common  futex_waitv                     sys_futex_waitv
> -560    common  set_mempolicy_home_node         sys_set_mempolicy_home_no=
de
> -561    common  cachestat                       sys_cachestat
> -562    common  fchmodat2                       sys_fchmodat2
> -563    common  map_shadow_stack                sys_map_shadow_stack
> -564    common  futex_wake                      sys_futex_wake
> -565    common  futex_wait                      sys_futex_wait
> -566    common  futex_requeue                   sys_futex_requeue
> -567    common  statmount                       sys_statmount
> -568    common  listmount                       sys_listmount
> -569    common  lsm_get_self_attr               sys_lsm_get_self_attr
> -570    common  lsm_set_self_attr               sys_lsm_set_self_attr
> -571    common  lsm_list_modules                sys_lsm_list_modules
> -572    common  mseal                           sys_mseal
> -573    common  setxattrat                      sys_setxattrat
> -574    common  getxattrat                      sys_getxattrat
> -575    common  listxattrat                     sys_listxattrat
> -576    common  removexattrat                   sys_removexattrat
> -577    common  open_tree_attr                  sys_open_tree_attr
> -578    common  file_getattr                    sys_file_getattr
> -579    common  file_setattr                    sys_file_setattr
> -580    common  listns                          sys_listns
> -581    common  rseq_slice_yield                sys_rseq_slice_yield
> -582    common  fchroot                         sys_fchroot
> diff --git a/arch/alpha/kernel/systbls.S b/arch/alpha/kernel/systbls.S
> index 68f3e4f329eb..9a67d29f7818 100644
> --- a/arch/alpha/kernel/systbls.S
> +++ b/arch/alpha/kernel/systbls.S
> @@ -7,6 +7,7 @@
>
>  #include <asm/unistd.h>
>
> +#define __SYSCALL_WITH_COMPAT(nr, native, compat)        __SYSCALL(nr, n=
ative)
>  #define __SYSCALL(nr, entry) .quad entry
>         .data
>         .align 3
>
> --
> 2.55.0
>
>

I tested the full series on my Alpha for-next branch, which also contains
the Alpha GENERIC_ENTRY enablement.

With patch 13 applied the kernel builds and links successfully and boots
normally on my UP2000+.

The issue I mentioned on patch 12 is hidden by this patch, since the
common table correctly selects __sys_clone3 for the __clone3 ABI.
Other than that issue in patch 12, I haven't found any Alpha-specific
problems with the conversion.

Tested-by: Magnus Lindholm <linmag7@gmail.com>
