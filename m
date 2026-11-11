Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794382814;
	b=5jqE6a1aUlejcVdyzePpM2n80Dx5MLB4F5qV6QsC2rIAMf8+U0mY5vYjbG7jzLj+kGrK
	 50bhvQAy6WGm+9IxOGcs0sPbk7PVlxm5lVZoTHUo9fnRzOhIux/JjAPdHeAzkNc0GL7r/
	 uxSWPS7qa0H7ggIWRLV8RvROuCq0lMHKIbBNMUN8ZIA0kATnvozFUn7tb/uzcllS/FdjN
	 MDH1mdiWJeNGrlm4rZidYuL84VeOZPia0X3t5U+SjRaRJR7qTPyXxQETRdFktUYSr5sg0
	 0Bo6FWOZDse/HjliRYYMA6pbAjStiET5rjtBezBPjeoQEfOod7oh9wW3j+Ndc16ZKQQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794382814;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UE+ZO+LDbUQkJMK6amSVRY89ivr6MWd0ox+os4xr0eo=;
	b=vZwE38Ra6ey3WpEdF4cJypmCw+SWGJivOTZRoNnI+cF5zkaNvGkkd3HveDqVWgHESdwk
	 hcBl6llDjlJCxJb3JjfAgDSkU0JiuVIHa0q+K7Mdpx+SnpOLcn0PZIpnTDNmeu9nkS6cM
	 9wGKaRNUWbG+r2iZhZiLi68kXThaIRHna5K6z00ZaMdRXg5u2++mVBi75ShyGfYnvyp3G
	 88aKuYBKD+AoJe56Ixp95nkYGJ1wWXYyvli0guHREZlm9Bo/FR4oXehnfQxQZ+RToS4cW
	 2cvvUSCUBQy1C6wFrJ/qktMlZGDTiAcIw1en3DlM+HPceNWRLpxMXhTGnW6EkYZLKcg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bIbp2Ggw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32EA606A321
	for <soc@lists.linux.dev>; Wed, 11 Nov 2026 07:40:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C32EA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bIbp2Ggw
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b7221c0f2cso2275869a12.3
        for <soc@lists.linux.dev>; Tue, 10 Nov 2026 23:40:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794382812; cv=none;
        d=google.com; s=arc-20260327;
        b=c88uMdyGYrHLIdOBrKQ08FB406n9WYsXWSPgVjWIKO+KDViMXgoAj+tHMNncaif/7w
         71qAS8JAOD8ZjaEBs4mMiD84cK9kV3eRf18HWh1eQimccrnBwq9IeRLmIDPbvVXX/7gK
         fOUtBxv6MuYRc3H3xldfLD62fIMBAPCsy8uV2JFDMM79Du082tWXbchv1v0FlgkfG/pl
         MZZDkpkAMf1kBiC/P/TeLWsf8++JMvaRt//2qFINhmPeh6NO3VlDx5yG3ny2ytYHJnlP
         6KfNzxyk/E6Zx7ID/pBnHgrizGXqJUXC/vPEMuGeTAVNiwdQRqiOoVMbjVBLyjaeNQTQ
         R9zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UE+ZO+LDbUQkJMK6amSVRY89ivr6MWd0ox+os4xr0eo=;
        fh=13OwFheM5wMoZnGVX+zqOGJinPkHWtQUJA7KUriKOLU=;
        b=TMhzp0j3133WnWkfiCEq2xwmB3CpXCO1p6OcdbjTivhvpXGkLV+GL+0I9Qnwnc4jUQ
         SLIno/A6x+EugxfeH23I8R5Clwv5LcJ4lScYrw/y/RtZzExvLc0jJ6ha/aswNKe3MFG8
         k4/xiDsjoC80SuRW12noyvtjmCdmLQSJ4wopEmGvdTj/KddyKpNXoyW0UcZungV6ybip
         jJFCLLfSuopziVNo9TDGQt8Jki6B96t+ezb5YFZ4OM81+ULjE9zv5cybdMR807r5JgGj
         D/Guw0Kq7Xr//Wsg1VjnMWTXqN/C/FPnAbWbnXuEnby+7qkaFy/dB7vfSDPY/aROrGIQ
         ZcuA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794382812; x=1794987612; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UE+ZO+LDbUQkJMK6amSVRY89ivr6MWd0ox+os4xr0eo=;
        b=bIbp2GgwW1tgqwKJ7eG881gVr0ZKuCe4N5yauUPN7CtVuTwVWaTmEkQlgk/nsz2tbE
         2dL0zO92WwSwvea/mfyKaExrqORHoD9lMx05E6ZIr3LtPOs2x9sR97+Q59VP7LEMCNKy
         AmjiJD8wFC0OWSmbNfXudkg9yngqO1gmwDXAXO/UL9EXoxRtTJyOmL1+xy8UBtNckA7L
         4yYwRWRAsNQPGljeCjKAcdgHmOSdKTYeTj7KrgqvTmNC9wdlmYoxbJyOO3bRxtdovMlv
         X3A7XnR+gZWtaNz7osuwzIcLDkSgHQroxnnh+3T66GRRtE6Yj+8k8BnushMIVGfIypI1
         whOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794382812; x=1794987612;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UE+ZO+LDbUQkJMK6amSVRY89ivr6MWd0ox+os4xr0eo=;
        b=Vl3sDd+xZ5tPsdPe1ElJ9ZKa/0hwb9/VhyXAQjMyaG+T3WU17ym82hExvLOXgc7B0U
         EZQWQ8tjGp52eSTuic+8/FWAFh6wSyozO4nJ0w3njFLeMCUYvFay3rWu8BWOz3t0OFH3
         /9siHcY0HFfEDxa5qDWjeuv5OKk5CDwcRVPJW8w84ym1anZZMka7W3eKkcYdbtiD/Qd2
         Ek4lsF/meWonO0FBQha5zktuwEEb4iARj/86xJapSl2K9AeVgkCEBXwa/o9LI4+rLH02
         uOwx7QUAGs+202kASx9qlRBsh7ihN7kcklbmH2L2ynurKy5ODNOp6kMMvuw2rtuJcK9x
         6dAg==
X-Forwarded-Encrypted: i=1; AL+hErHMSyALZ/a3Wu5gWEbHTcZ9ErOhFfPrXhDYyMEnLrnjLduTXSF5H2Vh5CNhqShO/+ll49A=@lists.linux.dev
X-Gm-Message-State: APuU4Z8UR6T2Ap8Ii0Hr7iHUzswHJiNXQK3h8nu7iv2l3T3quMAsYbBT
	8nQfz3YrT8OFYuktOznbWY3mgNikZrYyAWgq1Jp3pzUN39OXcrvaUwITrrZa6WJZgOAGlBuO3eA
	aTH5GvcXYNwRA2pZtEKJZpCKTflySG9I=
X-Gm-Gg: AYBFou2ciQIwxhguA5zdTOth21BeqbIRas4ggWDY77zvMU9i++UwfG3tsbhcZZCelZB
	iiSXM9mA6xEeeRJb3exs1DWnoNR+Ctw3eV74C60SOHlzl/DfGlk/g39gh9AVGaoFKJFxWTQyocN
	+FDoTR424jsZX5qsbRsPHIAihusqN2Ty7llg4MmUqcjeusVG88iZuE+i69yQ0SHXzM2CWwNj8lr
	V6hxZaE25dsDlgATgp/XBcCdptC+xFHG+m/5rq71PTTAinGzJhROjCPL0XTRztRYuomCQAnYgwR
	5aPdcwIP8Emhiy+AnMIi7I8gxYJQCLXvFsk2BzobHhgA9ocBD5V5PAOHYN5hfolzpPKvcQ6OjS+
	cTXtuKWZFbUaog1oQLdtln250s9XNvKE2JMa7JDUIXs7hgL3H6GubtoO0f/KKMjo91vZlDg==
X-Received: by 2002:a05:6402:a614:b0:6b4:2aa6:2bf7 with SMTP id
 4fb4d7f45d1cf-6b7773fba00mr814626a12.17.1794382812113; Tue, 10 Nov 2026
 23:40:12 -0800 (PST)
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261105-tonyk-syscall_table-v9-0-8d1275885d9c@igalia.com> <20261105-tonyk-syscall_table-v9-10-8d1275885d9c@igalia.com>
In-Reply-To: <20261105-tonyk-syscall_table-v9-10-8d1275885d9c@igalia.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 11 Nov 2026 08:40:00 +0100
X-Gm-Features: AclHuK-efo-IN8C0PeBM3H51GRM-qrC5WxHB8slQK0l-tYnt6GeST1OC-lb_0Yw
Message-ID: <CA+=Fv5RNznnVyh4AM_ZTdwyK4iv-8TEO5Ejx0_81sf5CTeoGgw@mail.gmail.com>
Subject: Re: [PATCH v9 10/15] alpha: Define entry point for
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

Hi Andr=C3=A9

On Thu, Nov 5, 2026 at 9:06=E2=80=AFPM Andr=C3=A9 Almeida <andrealmeid@igal=
ia.com> wrote:
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
> Acked-by: Magnus Lindholm <linmag7@gmail.com>
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
> 2.56.0
>

My Acked-by already in this patch still stands.

I tested the series against my Alpha for-next, with the integration
adjustments described in my replies to patches 11 and 12. Full GENERIC
SMP and DP264 UP builds passed.

The generated dispatch table changes syscall 560 to
sys_set_mempolicy_home_node as intended. Alpha has no NUMA support,
so this still resolves to the sys_ni_syscall fallback.

Thanks,
Magnus
