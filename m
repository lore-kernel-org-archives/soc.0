Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794383492;
	b=W+eEficY3lYdGOmsAVjfLVZ7PKrwmE1bTOt8oBCvXD34D4/Bog7aehPb/NnK5Ds5tyGA
	 sSX7d87Akz88UqqwLRkG2TfvCFvHwsqmDIaCbhVz4yFpSN3YZyhGjvHTUPhiuA4ww2MlO
	 B3iM/y+j6OxhqWpA46r01GPESHhjCosLH+u3hqTwNWuAzVs/8bYuvi05RW6txilwVImNa
	 0Hy/EF+iOTc4h8gDTA1gyrlZ76MI2fVVGwXRMrzLRCABQoiBIkAqQbQ1Pjl5+fxEuAt+c
	 enMOLWOvWEb8zkzBi+pWHR5/26wtUBCMz7zL5R0qBRh8N0Hwr4l4oipwSAnbl3JisYQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794383492;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=LFEMjHMawTmVswvfRrvWbFxJOe74UcDMeDcBfOcyoV4=;
	b=Ci5Ap2hCXa2lWtnvzb0luX1hBJ6h7aqzMqSyepK/KbKHuUMnTxTiWGF2bSEiOaDPSELJ
	 hnNoLMGO6E+93zRcTFaKc5xpa13rmYPmj246Xo+FLiYqJk+1pKY+I2jEVphIa3ZnIVutt
	 Rzpytr43Fu/7YxLGlYXcPKAzK0bCWZeK+22yUzZsWITRRA1r8OomLKzm5mNrwT868ax4F
	 H1nH6Ke5mpmJVW8rEs8egwGq6bogIhlaTSUjPgi1N6USB6UoLE6IyX3Ukm5D4lr8egsVe
	 F6UmFJBPyjCLbIjUewnlgcwpdymZMHemAHxHgZnOS91TdLOd2mZp/7n+8VAg2lBgsLQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="D/+Rff47";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F18606A32A
	for <soc@lists.linux.dev>; Wed, 11 Nov 2026 07:51:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47F18606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D/+Rff47
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c506094fd93so163281366b.1
        for <soc@lists.linux.dev>; Tue, 10 Nov 2026 23:51:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794383490; cv=none;
        d=google.com; s=arc-20260327;
        b=Yp41Xdm3VWtdR0Vjk11QQsr0B53qk3iPjKcXyVyFrMV7ge54+8KivuCvNztEKHF+uz
         mJI6/cM1UyjuLcpv9NPYYxDSQbW2I/LO5WZmIJongGJL3yEVWIBqNm695FBr3P+gc9BR
         DMs3Ci6qZ7bLNNhWmMBBbJ+GXzqd6wols1AO9sGLVjqExODq2u3BbZfqVHzp/jFB9Ux0
         lBS7YWv0QMFjQ5RYOh3CPuOhxtrp52qCNgM5KCZFG5pWjmrrgJs7SRfKbINEJbhb9Yv9
         jmYmP6IyBojqQK3aAstuerLM2uQg7RGcS30suTb7CgoJeXbADNs0WvTjcbv2VFzmYNIv
         tocA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LFEMjHMawTmVswvfRrvWbFxJOe74UcDMeDcBfOcyoV4=;
        fh=xcTEv0sPMQs8TE81XoksuMypkoE2sM4T05w1HI3IGeU=;
        b=izXNEZKrK2tF0U+rUxBC4g5L+kDuk5HwiFALL1hRDEiQRP7qX6ebPxmCoqKmth/KPV
         z6WlsZrObZOBugdC5OjRGlw29mS1tAKX33ybbncR0fAgKgA/yD6yjZkNY18FfEsQMlZy
         E2aIUT9P45qUZIpe7bXhfp5DYCXep7mqJjTnfwJvclhMWCgmL4/UUDgdqbNTB9HPrMhl
         jZP0B/Sn6IptxbH1neVd1pumg2IRI52GJN6hYgny6Ap5g++wXLFcS1rxz5T0JDXs+VSB
         1O2KXY8ocZ9SpkEXgoZHPRs/wYoWyp2/B6vs3GJwMYacGiTkBKIg0HspCA4oqNtWGmnm
         e2BQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794383490; x=1794988290; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LFEMjHMawTmVswvfRrvWbFxJOe74UcDMeDcBfOcyoV4=;
        b=D/+Rff47tP3Kb0bgJpoxjlljW9j7Bda/qJwFkFp3HwVrBh9jRgeDJ4QafM/Mi14lNk
         VLjG79CX25P+g4VvM+mDybtm0EfMWc976+8XTUs6KSjLDDyah6i85wOtC/aCQy5aGaO0
         1nC5EqwWwOrv4PAC/3mI3qH4TV4D9wsuShgfNK/OpG+ht/vgAyheK+SqUZTy7XrVQR1l
         zS4oJizpvF5ytyg37FFVpjPgDbq6rD8fXH3WxJTM0v1iD8UWK9Ht59tf7QOxjRDYxRcS
         rS6QeW7AhEgWTnKfpn47DyMvTmVLbNaLGRuA9ed7A5yd/fwK3/CDAL3RrBGcvzXcCUMG
         jmpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794383490; x=1794988290;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LFEMjHMawTmVswvfRrvWbFxJOe74UcDMeDcBfOcyoV4=;
        b=p5RferQ7ycUA+Ev0sicTw9l5DRNwOugjnyBuypXDVwz+SVFJg1qlguKSbCOCB+J3/M
         rsr7Wx764wa0sDshcx9zcyckuiuRayCuc5gWL5d4spEVgAWbKbl2uNxVAhrA/Gh8cyu+
         M11JBaaExjVsorUwr4ogBWCmTp9wLgev2VR2SgPn7fVPUnq8dclOcBRa9YWPpdHza/2o
         1L5rTPhMju67VjivQ9mYjHtY/PupLlJdxDWLvUfkOpQ1F8ycTQBX12TSuJSukYk3JQxB
         pNUdFcOatFoMAdnOZ2wR1WWsdFqLbC/tzys5oidBBtH1LTaghFEtXBkNctqa0nA7yRaZ
         Zi0g==
X-Forwarded-Encrypted: i=1; AL+hErEcJvX/OOj9pMH6cRUcOAfv+UbxhWXXjDMKRSpTomClUejCbbKABVBbkx/+Te0XxaNVq8s=@lists.linux.dev
X-Gm-Message-State: APuU4Z+cPbugCKWGT8GHBIeHOKcvCv7658utkE5Oo8QGPmhjEgo0oOnR
	MWdtV65iQIuwV2A7c/iXns/CEOjpy0KHtGG2MnNYgG9WYbLHv+5mnv1E51iTtHzYjthbKxc6n/6
	yyHOfIdI5PjnTeD6LZEakuLLxG/6sJq0=
X-Gm-Gg: AYBFou0o2Vww6m2eNSpfpnUM5+d+PVujbGPRh0UKLd23/Me9POWDzGFdQxo8+lEXFli
	+ZuQ1q654MJCn8hu+ux+845ZcbwiPllMaEqiox0sXxgP6SMj45tBVZzizWLvgBZ5p4E5alwONOQ
	qhy2AXpDh9D2IsZ1jZQGDpfhtFsnSKE2ykb75kdb7rOIQDRtwBZUkj3KVj+6Ojr1cy6w75leUlq
	tz7gaTlVgeIT51nWoc9ER8CeuLRvezNWB/Eh0ULGtiCfC4VEfyKQXvpkyas7nlZTx0nAWLDSau7
	ij28W4TPCDWvhmUS1VwlC9+fXC8Xr1n/a86pwp3o7nTaN5IS2fENe92j9wKqaj4BStS9XswgJVH
	8UO72YRu2k5tvUvAgO8YlVDcZcxeJWLmnRqM3YGuOSNye0ZSUaflhsL5yzG6baTZPSM0CuA==
X-Received: by 2002:a17:906:f596:b0:c33:923b:ad66 with SMTP id
 a640c23a62f3a-c5066d0bb14mr114825966b.43.1794383490428; Tue, 10 Nov 2026
 23:51:30 -0800 (PST)
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261105-tonyk-syscall_table-v9-0-8d1275885d9c@igalia.com> <20261105-tonyk-syscall_table-v9-12-8d1275885d9c@igalia.com>
In-Reply-To: <20261105-tonyk-syscall_table-v9-12-8d1275885d9c@igalia.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 11 Nov 2026 08:51:18 +0100
X-Gm-Features: AclHuK9CC8htHdABEClpUnIw4kUNRCRbcWaYA_peZjxEX-MI6234hqDvVucRruU
Message-ID: <CA+=Fv5QBnNipJH5SKKV0iiPc1CQz+6f8dGzsRoKt1riMNxxOOg@mail.gmail.com>
Subject: Re: [PATCH v9 12/15] alpha: Use the common syscall table
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

On Thu, Nov 5, 2026 at 9:06=E2=80=AFPM Andr=C3=A9 Almeida <andrealmeid@igal=
ia.com> wrote:
>
> Remove some of the duplicated code by using the common syscall number
> table.
>
> Tested-by: Magnus Lindholm <linmag7@gmail.com>
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
> index 59eb066a40bf..7066a3920899 100644
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
> -545    common  clone3                          __sys__clone3
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
> 2.56.0
>

This also needs an adjustment when combined with my Alpha for-next:

  https://git.kernel.org/pub/scm/linux/kernel/git/lindholm/alpha.git
  branch: for-next

Following d38895ba9330 ("alpha: dispatch system calls from C"), Alpha
uses sys_clone3 directly. The ABI selection should therefore be:

  abis :=3D common,clone3

rather than common,__clone3. The removal of the old table entries
also conflicts because the clone3 entry has changed.

For testing, I skipped patch 11, removed the entries from 534 onward
as intended here, and selected common,clone3.

With those adjustments, full GENERIC SMP and DP264 UP builds passed
using GCC 14.2.1. The generated syscall numbers are unchanged.
Comparing the native dispatch entries shows only patch 10's intended
change at syscall 560; clone3 remains sys_clone3.

The only build warning was the previously observed saved_config
COMMON-symbol warning. I have not runtime-tested this combination.

Thanks,
Magnus
