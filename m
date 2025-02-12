Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130C54C85
	for <soc@lists.linux.dev>; Wed, 12 Feb 2025 00:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739320205; cv=none; b=qOHgc7WZQxF914LhIfGM1N+WZdlnOpXemZFGGm/lgxKBnJSwnRlIcZv5KYtuKN/eVGWuDQpEIC0iRATcogMyDuLBZNLp9UrosxjQ5b+eGI2Txxc3sGs0IMzv1vJ3+S9Wi626g3ZEtx3HsQK0c3dvDfjyZvxrqv8dATtCXKEsbrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739320205; c=relaxed/simple;
	bh=5n6CIWZ3CxVNLsrtCbvzjAs6RrZHUz2LGcyMe8T5d/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XVfjcAFc06Vw20teHxFLfnA/jBdVFqlnw9Zo/NVqKG+6gsUpe+C9oUafGJxoC7Ys/pYlkLdBrEwvO+g062CmzIJEKKx25aY2vGWKqAtlveac1N6KHqZF5PscXXSNGa801Te+mwJWW9NC9drkjKxUxb2PRAVYfsND38UjY3UF2c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KuBIwb/p; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KuBIwb/p"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4718757cd8aso28686151cf.3
        for <soc@lists.linux.dev>; Tue, 11 Feb 2025 16:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739320203; x=1739925003; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PMXY+b7w1R2zK37gr/dvT3WG1zO8cthqCAH7UbMiDus=;
        b=KuBIwb/pCCVNlx37v8KeFMOsYeDMP2T0aVn+elviSfRkuAtrIE8H6pNrsyfHSEHsnS
         6TseaJq88y2ylhbm7u/nyUmjh653cb8w1YVTAUI50nNv8ehoQxdrvmvG4yF1SNMk7QCi
         dX4l8dxd/01Q0If6EnaRsc2QvKMRwgIo4M36TLW611kGUO6kMmo/ReNS2H9LTPzpapZ/
         DMYPDcC0CRmnAYqAAHqidFFDksQ7EWlZt+cJOTcVIsMy7kt3Sr9jJ5vHouMLEms8+Tm8
         AYyWWYZrHQfyCThVCEn+f3HAdIfdWta0UJ9EF8Gjyb8v9CHj59VmSSmKDvlmsIV4Qp0r
         ehmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739320203; x=1739925003;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PMXY+b7w1R2zK37gr/dvT3WG1zO8cthqCAH7UbMiDus=;
        b=HX41/qO4dUDZ3HienFvLr4T2Z7Mnn+vtC8mLLFiqa91oPzaWVLAD0Woxi6BR7c+Duz
         MPg0H/RIyRvHkfFGSlbSqpgf3CJJ4NllHTMZjYzOfr8pBA+kxNezNIaanFF/4v/R/CS4
         o3uF+PCK9zSC9a6BScSJae1DBpJhMLTeCnUK4WFAzucKkZgu0Jxpk3do7TPO9tTBewyE
         gsnFyxI4VZTrL/JsxtAjmdZ8llSyFirNTpYoskuWbmdgY2fKVc3FAER/xrwsTkNX8Xq3
         AkW61aZjID7uuzVM1QZ3cMdIaJBYqn6mZ0PKuWqNBBYpgdxh/ODuHKmPAhkHF4pOnoBw
         vGnw==
X-Gm-Message-State: AOJu0YzZcms0tdUXPlBzT7FfEoUlvwLy5Ilv9IdN5xBKHQbSmjy6t7bJ
	6Irdym/1ncQWKiFst3+0fBzAojSLmX5l82bAVcRNSwcZqvrNkEi1
X-Gm-Gg: ASbGncsm+BsSaLSW/0TecrlSGaUiNnp1C4HH/yyIRpRp6enSliUf2NNGTgaT8vNDXzF
	mWH9PQ1K3TNOByTvmFxk2ctYTNeE6BDMr3JhS0pybmz3FGcp3kq2IkAIEHr9MtWhu40+GZHzVF6
	EPwsofi9lfZx4QWDFc+k9hecvuuDYUtTU7crrITBDXT9wLp9JuSTJO1Y+PFdZal6BzKYq18J8pZ
	NtvF2eTfUo+XoFNwdO+3Q7taODWvypCG9+3dRFMwRqpuOrTJaepjy79RlgubQMfnJE=
X-Google-Smtp-Source: AGHT+IEycbQbC8PQDQpHssIWlJbqaUfQDH5H7e9AlKziotBrsNh5hQbOfp7wttz1fsHAHfvTcMGspQ==
X-Received: by 2002:a05:622a:1b91:b0:471:ae33:b362 with SMTP id d75a77b69052e-471afed77b9mr13923621cf.40.1739320202786;
        Tue, 11 Feb 2025 16:30:02 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-47153bec10esm67114951cf.74.2025.02.11.16.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 16:30:01 -0800 (PST)
Date: Wed, 12 Feb 2025 08:29:54 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Yixun Lan <dlan@gentoo.org>
Cc: soc@lists.linux.dev, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@outlook.com>, Lee Jones <lee@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, Haylen Chu <heylenay@outlook.com>, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 00/10] arm64 support for Milk-V Duo Module 01 EVB
Message-ID: <prrsy34bv6xskxu7afgmpdwc7lefdh7l2gtm2ejzcwk74zh6lr@23x3llxy662z>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
 <eoeyutuu4mrpsu7snkk5ll6kmm4344qsgbnncss6gerlcvvea7@usuf5v7w5ffp>
 <77c0db160bcaa7c2a68c04a0d33a561b2834f764.camel@gmail.com>
 <ccadcdf720d6b1055165f1404fafca9b1c6c54f7.camel@gmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ccadcdf720d6b1055165f1404fafca9b1c6c54f7.camel@gmail.com>

On Tue, Feb 11, 2025 at 08:37:01PM +0100, Alexander Sverdlin wrote:
> Hi Inochi!
> 
> On Mon, 2025-02-10 at 21:55 +0100, Alexander Sverdlin wrote:
> > > > It would probably make sense that the whole series would go into SOC tree,
> > > > even though technically nothing prevents the reboot/reset driver to come
> > > > in PM/reset tree. If everything would come together, `reboot` command would
> > > > work out of the box.
> > > > 
> > > > [1] https://milkv.io/docs/duo/getting-started/duo-module-01
> > > > [2] https://github.com/milkv-duo/duo-buildroot-sdk-v2/releases/
> > > > [3] https://github.com/sophgo/sophgo-doc/releases/download/sg2000-trm-v1.01/sg2000_trm_en.pdf
> > > > 
> > > 
> > > This reboot implentment across the RTC and 8051 domain, which is
> > > still a big problem to be upstreamed. This should be designed 
> > 
> > Now I've got it. The problem is not in the reboot procedure, but
> > rather how to model this thing in the DT, because of all these
> > unrelated functions brought into two HW address spaces...
> > 
> > > carefully and needs further discussion. Adding these two syscon
> > > compatiable may be not a good idea and cause some problem. I invite
> > > Yixun to this talk and he may give some useful suggestions.
> > > 
> > > At last, I prefer this goes to an separate patch series, and
> > > implement with rtc device.
> 
> Thanks for your hints!
> I've completely missed the RTC driver in progress [1].
> I will provide a patch registering the reboot handler on top of the driver
> as soon as it's accepted.
> 
> [1] https://patchwork.ozlabs.org/project/rtc-linux/patch/20240428060848.706573-3-qiujingbao.dlmu@gmail.com/
> 

As far as I know the RTC patch is no longer maintained. Maybe you can
pick it up?
The patch states can be found on:
https://github.com/sophgo/linux/wiki

Regards,
Inochi
