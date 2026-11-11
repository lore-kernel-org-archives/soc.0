Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794382999;
	b=JupG3EkQHkRB2Jb2qg0rolyTKEfHN9+zG3n16NrtXM386/2X3ir9NZllV52Y1AkMvKmz
	 WfGsKeH7CGMm+79CMQ0TcykE8FGRVRh1zAc20H2nJWyyfr8Tme8CcZzkfQp6Y+I1bmP+y
	 WVprX/SwmLLZiwkrFIJfllEv7P3szMKHEOmJOmXBQ2vzLDoGgp9yj5I1xsQigtKsK4+lD
	 kqz8fmjsNBbNF22TlC0hoXzyOLMMWpY8JR5r5Ag3WWepyANuwKjP9BIqDirXg6IIw4Zz8
	 QUcVPmPtjQDf6TQ+cjzd6N9GTGZNe10Of5bN48poyD1KWofYO0uDq7cV9m1t75LsKxQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794382999;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=27U7oUdIa14bzFyO20wq2H7dyWDMznLD1QtfCXJzapQ=;
	b=l7KcBXu+IeFPJYR9yR/J8LyISqYOPsSzb23XxqkbQKk2O0BQRT2Bvuhr/gdGqHNldWcv
	 WeHj5SZARZOikhNjeHha3HEzs8h7n9C69BaSPOI8cRqWPLnGm0Fd/qXBwBCat6FuhMb4/
	 oV+BqPy5YlzQyRNDScQy9ormuyf8FpTYR0Kp+SXxEXmSwLsCZFTFIMdrvT0Loz+BPrbZh
	 yAIql7Rl6kudFjfWQguWpiJvcX28w6BUKdzlXUtV9jqKzMrs8WSPpOilkC+8NO5R6U9Cv
	 AHci6KDPR4wO7Daes1w/5PWCUTC+g1y9hptwYQ2XwWlXTwQLBgZzC+BccC0unMdO3WQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rWvzKCSh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEAA606A33D
	for <soc@lists.linux.dev>; Wed, 11 Nov 2026 07:43:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AEAA606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rWvzKCSh
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b757029223so1832837a12.0
        for <soc@lists.linux.dev>; Tue, 10 Nov 2026 23:43:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794382997; cv=none;
        d=google.com; s=arc-20260327;
        b=DqHRiBaMNGXHVTOZXsz1otLCKJ920WO3raiR50P+2Z6M7BVi/++BY0de3qol8iZril
         teM9ZoTpNyI+rMMGrWlOw0HE8taJJqY08fNQuvb19LKQN/+M2I2rQoRXw6T8RTc9h2Jx
         8SZBGfWO79qEilBOURYIIDHmfMArK0vPqvCVVik5GKs6g36tTfCUAxH4bie5llVL7mxo
         sjZfks3hFH4j4j/lkviCZWE9fmwqfsNyIfCDFO5uZWkpFmmUrPT9RNlG+m358jQ7VT9l
         Q9v/WK3XSdj6BTHasGhxIPoVGTXCixUK1HCB3h1fafQQl10u/Ktberku9TfBvDzOXLP6
         MlmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=27U7oUdIa14bzFyO20wq2H7dyWDMznLD1QtfCXJzapQ=;
        fh=Y5mplo/Eegvv1qjPhMiC1cfGrLXbl9rVUNd7CkjlVcU=;
        b=SGv6LNjuPYlib4q2wLy5S1n1qVeE15K23FyZ/16ayp6NYMrHwNrn88Lzih/a62iHtw
         tSLmvlSNSq5T0g55P4LKxdCeyZWW0F5FWtNGRaAfc7Fj7gltsLHRBpuqh5cs/A5Z7ak5
         KYu9FJm3LDtjJkd7MYauGF3n16xUz18Cee81/MJ7gRiwJ876v2bq5I2/Nyw3QLzucCpU
         sZFmKhDy7HriAXeNcCQt5gpgZcK0CkgotYKTvJ8tAL4Dj0/0ymZnT+v13sdyexFqegEH
         NdynOq/T8oyv+Uh8N8ffXZMQSe+nw6UtF3EWbzzn8NUJl7wa9zFyh+nd4Dc9QwuNQxLq
         bwGA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794382997; x=1794987797; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=27U7oUdIa14bzFyO20wq2H7dyWDMznLD1QtfCXJzapQ=;
        b=rWvzKCShAYmA5d8bKUuKQAAUYkxEa48S7Frcx+5j7thi2lttRqL1KxuN/ogR+vwqQl
         4EWOKL7PtXyw2A0+BooZnJ+T9MVAXFydmioIklJF6A4Ol3v75NdOlUOCCwcGYAap33Ro
         99XaidJBQBYrYh6ZYBJsQ5TO/VLp9w8VEUnscAFvLm6/LF3516XOAxdi3dkFBXCqZoT6
         pfSrH/PDsf/rDYddnUAvlelMJVUNYI9t5Nos52m64loXu+wotrqPVfLIve6T31iqcm71
         oYjubrViyH1/mlVIeH2943cEwRitFIdJAwvBmHKkFmoIktgE0Q1vTtQl7JAjISHiX9vQ
         StHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794382997; x=1794987797;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=27U7oUdIa14bzFyO20wq2H7dyWDMznLD1QtfCXJzapQ=;
        b=qIMQq0KAHHTLOifeV2+BL3kSK4br4QC5AdA1dP2/GxMddOp3Ym0sfFH1IM0lKyyV9b
         wnjUbhtzpE/0NyqIuz7inOixtkmr+DghWpJnRdKS8nN123KY8G4+3gjGgEWCFCm1VHC+
         jNvrpWRe925RmsOdF7Ju1BSu1FSuDZnH7+QNmn0nJCzXmzUAxYo1aRSTEGAyCkTzjXP3
         kahnJNGEPbBH1M3Y0l/we7drxdcss5KBsWiC8/qaKEGRpIC81U+Nb6ghZRyTFsr0gHqT
         wtV5Svx4+zsHRBqxDLzaiuDB7IttTInyGLe3kcVshO85la2IVabUn9kifZTYpBLEl0nh
         t5GA==
X-Forwarded-Encrypted: i=1; AL+hErGrIZ3t4G6e3juNP7LevL4qhYT+6aFwNXd9XDdQALlb/SSEtsVYlE8wpug3GRV5JoCfXHw=@lists.linux.dev
X-Gm-Message-State: APuU4Z8sQsulW0U+tSjxZiAomRe8QifsZv1M/c9mMfdNZuRAGnQQWgeJ
	Hn6cdTUMS3Nn4sydFlqy5byVdQHl8c0+84SJ8557EJ+ZVIG/TscuH6cTvBuz6dOg6c2DD7oWKjy
	RNbzK9cdnvu0Y/7o6JWamWC57lsQP6xeHc1n1TbI=
X-Gm-Gg: AYBFou1S63KhyuHAm8hoG2u8YGKYgjLBbGnWBx9jJJhikn861cAg2BFreVjR36n7gR8
	jOQ2Kb2dPG1I5sJQiTsbHxiO4rCCGoExkoND6oZ6SL4WWhaXCjo1ONHwIw4i9tYHkwooQ4wwFgZ
	x7wc6FOoWeM7Fa+FcOI9uswQ7dcNhqp1zccnox15bSkHncd0oGkYxVYwlYC1PCjl3Yz7slLkEgQ
	9g7Z7A9ZsjcF25W8PqO37VBYOodp+2EKENfmYQ9jFBiNa016KD+1+H4/Ps3gGhWTyfrwAnbFyjK
	npZbXHhH3taqBk8jJ4CkzqxR6/sDy6/eEGZzsSGfLai9rWgKO/JgIStVnJa84nfuofQhbUERjjB
	iXtC0+ntSJg/2MRDouz6in9RPjw7BTaEkf1TBkl/4eXKoDowsWzqc6XM2A9xtJsXyZ5giQg==
X-Received: by 2002:aa7:c1c4:0:b0:6b5:90b9:e1f4 with SMTP id
 4fb4d7f45d1cf-6b7773edf4bmr819135a12.15.1794382997169; Tue, 10 Nov 2026
 23:43:17 -0800 (PST)
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261105-tonyk-syscall_table-v9-0-8d1275885d9c@igalia.com> <20261105-tonyk-syscall_table-v9-11-8d1275885d9c@igalia.com>
In-Reply-To: <20261105-tonyk-syscall_table-v9-11-8d1275885d9c@igalia.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 11 Nov 2026 08:43:04 +0100
X-Gm-Features: AclHuK-WWcZzAuRTugYoSHBXz8aDMS8vLzO87BtuVYEGxCZ10b0uUmgcqCUEPe8
Message-ID: <CA+=Fv5Tm4-DV9KEKxO11ta84EvqigB-KDemhOML1hx9zoxx0cA@mail.gmail.com>
Subject: Re: [PATCH v9 11/15] alpha: Remove alpha_ prefix from custom syscall entries
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Arnd Bergmanon <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, kernel-dev@igalia.com, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-alpha@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	soc@lists.linux.dev, linux-mips@vger.kernel.org, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9

On Thu, Nov 5, 2026 at 9:26=E2=80=AFPM Andr=C3=A9 Almeida <andrealmeid@igal=
ia.com> wrote:
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
> Changes from v7:
> - Fix __clone3 entry
> ---
>  arch/alpha/kernel/entry.S              | 8 ++++----
>  arch/alpha/kernel/syscalls/syscall.tbl | 8 ++++----
>  2 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/arch/alpha/kernel/entry.S b/arch/alpha/kernel/entry.S
> index 790389a15c3c..25d05f45512d 100644
> --- a/arch/alpha/kernel/entry.S
> +++ b/arch/alpha/kernel/entry.S
> @@ -729,9 +729,9 @@ ret_from_kernel_thread:
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
> @@ -746,7 +746,7 @@ alpha_\name:
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
> index 8fc4701a6328..59eb066a40bf 100644
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
> +545    common  clone3                          __sys__clone3
>  546    common  close_range                     sys_close_range
>  547    common  openat2                         sys_openat2
>  548    common  pidfd_getfd                     sys_pidfd_getfd
>
> --
> 2.56.0
>
>

This conflicts with my Alpha for-next:

  https://git.kernel.org/pub/scm/linux/kernel/git/lindholm/alpha.git
  branch: for-next

Commit d38895ba9330 ("alpha: dispatch system calls from C") removes
the fork_like assembly wrappers and changes the table entries to
sys_fork, sys_vfork, sys_clone and sys_clone3.

Consequently, this rename is no longer needed when integrating your
series on top of that branch. I skipped this patch for my integration
test and retained those existing entries.

My for-next is registered with linux-next, so this is an interaction
we should account for when the trees are combined.

Thanks,
Magnus
