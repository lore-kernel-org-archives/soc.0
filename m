Received: from mail-ej2-f39.google.com (mail-ej2-f39.google.com [74.125.228.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660FC4E73C2
	for <soc@lists.linux.dev>; Fri, 18 Sep 2026 11:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.167
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789731393; cv=pass; b=UbHR2OxuoCoV4uwomT8iRetys9KrIx3xkM9xyHeF2wc+Gb5ZRh7ZBuUf3Vh5hupMT7ZMWk9m3qz9BIf/rWeNdPtqPJW6yN6T/bFpzSImKn96B54nvTUfMYB1xFib91U+CYDC7gZ/8YLIO7+a/U1gktj2CbvmVNVNkDVBihhKdbI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789731393; c=relaxed/simple;
	bh=SM+WZSPeuzqNNHXbABDFo7m2xf8ZGs0pqFt1fmpcd8c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jzURpRmHo9N8/IY1aehin+5N+5b8bLUiZvFGAwCGQMPliKb0nf+5tDXvKO2+vXycpD6Jz8E2BSAZVrZd1rhXhS1I0+r4Pf7eLR2ZvWNrmdhCJQAKiMld4KdyzJdDpqP6qAHkE1/iNoW5HV4YBLSmL2TdQYHnrbCPTkqTKnq2ZhQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E3yiZY0j; arc=pass smtp.client-ip=74.125.228.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E3yiZY0j"
Received: by mail-ej2-f39.google.com with SMTP id a640c23a62f3a-c2940ef15c1so79154766b.1
        for <soc@lists.linux.dev>; Fri, 18 Sep 2026 04:36:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789731389; cv=none;
        d=google.com; s=arc-20260327;
        b=Idr4LLQs5bjb1M06VdjY5SfYmY8Hb/Bc2ah99q0PpjjTt3OYnV0CsSoi/zkjTH3GDW
         OYM+woWIERGHJFrIXESxlFaR5VjZ+11VmW4hgZYIwz1OMCVr56shsnvlk0u8KcteF9IJ
         kPeuKmg/lwXwTmWTX6UCw9fOdFhE5udgl740aGOfN76Oig6p7lmHnA8IWTYyfydt54jM
         qLBJTnDrZbuugRTVr6SzIg1liA5IenC84Lr+rpfAjZO8yJ/Hoi8C0ZV6l/rkgdJHrZit
         ve4zKiPVpIT79gKZYhFKUV57C6sUa/bHjW4wioRezBw5r89w6Qyco5KqjozAT8S3aGAw
         OdYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HGJXKehN7uzhcfBB0KBhZiEIw68JYp4Edf9oro8cdRI=;
        fh=LG6u262vgm8NiBLDx4GGD7B44RSQWqOy4jH1rjSyIqo=;
        b=RX0HXxPUd6xxy/ncM930mlHtOb4TilSYCE2jIlMXtXwnPG+jeGQPO5v+Wz1jq445Hb
         qAP683WN4gkKyUMgvJ1QaKYPmn0kP6NNQEfKjDB8/2v1NSgxWnM6fk/szEDEvbaC00qH
         +6qHSWHZ0N+9mKlbLUWZ6DoHLRKbmttk0ZjBwxHq7lK6+rikVuLsYxznqt088pmO+DCS
         eKEaWB/M9AzXAzwiaq0TSB3HXPs7lJLEdxY7zH7Yx2L9YrjRMuVv5OxcY4G8EoJijKV0
         /xY7y/pYJVGcVpnagzghaqrjmaoimnVXI3VNiAUQUcnv+FjpzpXKJBSA8zPpCKBPOadl
         fM6A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789731389; x=1790336189; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HGJXKehN7uzhcfBB0KBhZiEIw68JYp4Edf9oro8cdRI=;
        b=E3yiZY0j2Y1+Z0cm2NyW8DVmUQCU6RF86Tbewou7BHXJyKPOuk51vw/l5ZasWc1Q1P
         ckbgHP0+LxQDx0hDg/m9tB0oCUppjWI/61nSOSdNTwRjRH8IOYxT2ZPB+jPMBNHS4K/W
         7vpgIpFEeatIwkQ1DI2zdh7aA7ebNAAYJWd8wGjFurre7s7oxYJkUoweosGL0H9Ot1UV
         hbQp7ypavSr8zWHQAw5tkhCik1lkTLyrtt1pjG0OGFMGuA7BWAXqzosQTJfSgl0Psgme
         5nPCQ6zYGXf+SgM0u/6F1OFwAvH1ePRTp7MoYil9PafP3n25+EQGQRyeLAtT98mhNqj0
         ySHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789731389; x=1790336189;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HGJXKehN7uzhcfBB0KBhZiEIw68JYp4Edf9oro8cdRI=;
        b=1IP2Y298Xaw8uTZWjvp5ProH9O8B5M/BQ+ejASzfLc+eB+F8P+B3STNpk8OuUBZDfk
         ooORuZP/wfODctgdX9OVJYkY533k8JmqQTj5Kg2BTFQ1slOXlJkOKuxBuLsOsDFweRVU
         9jKPi8e+lH4LaT6n0j2U94fCffGdySQhfE5ZulgzypZ04HJlUpoCCliSoCsbLSvfVgYq
         30nZbl48SPQN3m7gkU9qSLZX7RDrCiYvNEMoc1v9NQVeIDpuGbR5RehN5CzDgAXAHBx0
         O9wxEyGqidtEzFSIZbn5fifdJzKUOXM9THsFG4Rdfp8Y/j0s11woEdvVJPPBptSvk6V9
         WXcA==
X-Forwarded-Encrypted: i=1; AKwUvBwdc44MNe9JGqPworcB48hT2U5dtKvblZsVNiAxxns+tLKThCdCMyLt1SNHW/NqkHYQSbI=@lists.linux.dev
X-Gm-Message-State: AFuF++n6G3v7Qa5TKb6z1XQXOdl9edV7zgtBGFYwvE7eadeNLXqBTf6V
	UbKN+heSN2oe59VF9U2sO4MmVx7Zw8koVIP+T5JkE5xdxy1CZIvKFPcXPEnkPOZxRQ2evDuB/dW
	KOoW0KO5h/OQ8CAzDqOkRYOf0Pr/1OZo=
X-Gm-Gg: AYBFou10ksSkPUQLo3YhXbcTN0rvBF5OzuhDcTuM7J3H9XBwu/aRXnCOIWkTVicEj2a
	J1kI9k0D1ew9eBd+F4RDGdoK8gYWy+MLBudLN8Yhj5ljexz5uc3J5AbFeMmEyrapLluVnI2IIIX
	1VwMwtR8CGRwiHLTzpO/llORVIQH5EQAUEkbvbR2wD1GB6W+qrKpA2+ve6Rk3PrdAjg5WcJf3F8
	rOcupmpQjkw8t//v1TXF+E45xNyQd/bBdqap53t09PL7wZVDYe1vNPOKe1pJLwLE5q4GEF7eoSv
	pEAAilN/rjepFmSnqftw8U4QPf2xbraS9QpXbqnUen2R25njZlsDhNJkg31bugH3hI2DzD4eGX2
	lhb7Eo7pnCekb+F+G3XDKscdY5m5l9Ul5kA4MJ9ZSEw==
X-Received: by 2002:a17:907:948f:b0:c29:5d41:dfe8 with SMTP id
 a640c23a62f3a-c2a1582698fmr217595066b.43.1789731389390; Fri, 18 Sep 2026
 04:36:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260917-tonyk-syscall_table-v7-0-f4cd8f8e3265@igalia.com> <20260917-tonyk-syscall_table-v7-11-f4cd8f8e3265@igalia.com>
In-Reply-To: <20260917-tonyk-syscall_table-v7-11-f4cd8f8e3265@igalia.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Fri, 18 Sep 2026 13:36:17 +0200
X-Gm-Features: AcwNN1W0uIsrBudlRZeSpl5_CSJhjtWRK4S-OK-90sOk1QFHdqx3jezfZnvgjR0
Message-ID: <CA+=Fv5To=fUfD+9OtAcNJcaquBy+xv6oNUFES6sVwpOKzH8qgw@mail.gmail.com>
Subject: Re: [PATCH v7 11/13] alpha: Define entry point for
 set_mempolicy_home_node syscall
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

On Fri, Sep 18, 2026 at 1:47=E2=80=AFAM Andr=C3=A9 Almeida <andrealmeid@iga=
lia.com> wrote:
>
> Instead of explicitly defining set_mempolicy_home_node as sys_ni_sycall i=
n
> the syscall table, define it as the real syscall entry point,
> sys_set_mempolicy_home_node. As per commit fdb7d9b7acd0 ("alpha: remove
> DISCONTIGMEM and NUMA"), alpha doesn't have NUMA support, so none of the
> mempolicy sycalls will ever be compiled for alpha, resulting in the
> COND_SYSCALL() fallback being used to result in the sys_ni_syscall.
>
> There's no function change here, but this step helps to unify the syscall
> tables and create a common table to rule them all.
>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> ---
>  arch/alpha/kernel/syscalls/syscall.tbl | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/alpha/kernel/syscalls/syscall.tbl b/arch/alpha/kernel/s=
yscalls/syscall.tbl
> index 52e3538cc7df..8fc4701a6328 100644
> --- a/arch/alpha/kernel/syscalls/syscall.tbl
> +++ b/arch/alpha/kernel/syscalls/syscall.tbl
> @@ -489,7 +489,7 @@
>  # 557 reserved for memfd_secret
>  558    common  process_mrelease                sys_process_mrelease
>  559    common  futex_waitv                     sys_futex_waitv
> -560    common  set_mempolicy_home_node         sys_ni_syscall
> +560    common  set_mempolicy_home_node         sys_set_mempolicy_home_no=
de
>  561    common  cachestat                       sys_cachestat
>  562    common  fchmodat2                       sys_fchmodat2
>  563    common  map_shadow_stack                sys_map_shadow_stack
>
> --
> 2.55.0
>
>

Looks good to me.

Acked-by: Magnus Lindholm <linmag7@gmail.com>
