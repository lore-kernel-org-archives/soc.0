Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793300814;
	b=CFxT/Nfj7e2l0VEI6HqVMLNDgYxVguqcqYVaITGgxRFBn70kJ3zasOys+Lzd0kZ2UBTy
	 fo6KYn+gnpli5qJgBdXTbTYiZiUhainw4/dYIsO61r3qVOsk9PL9cpJBfkGhOpNAInMss
	 YeNhDFp/bdbqtHHRHivUMREfBfemhDxIzrsLomr8BfE/kRH1dZQl0HVR56igU9KR+pP1N
	 SjM40kAlnf9VdOH1mHS8kC2lDDYHvVmDnr0C9nJc6YasscKZnhoF+rQ8J3mzeh4W0OBZs
	 j8jLQqP9GVrA3/khZr0cpdzpAHXzDQPpN4Z6Gjjhr06v20sRWY/hJisdAoKdCqmSaKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793300814;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=EP9nzlx+H2sk50SyAzN5S+n1xSKA5s/U/jjen9Qb6t8=;
	b=JzvfnpldwyJ4VSG8bnVZ8ta62z4BgK1L8GcBZjzHuJjIVJ20EjQJi1YFStRzFLa/TtDD
	 ap5umhzZtRowmLCACx3+WOXhgwQDCJay8zqg22nIR/Qlo1CPq02dAVnShMDkxjS6xTNC0
	 Sxds562N3vRItlazLFtWrv1iDxDvprKIo/xPGtjvSdnuBY0fLUAcntQylNaH9gM0+0jDy
	 yvx82Zfa9JA9x9eB9GePS6ZHjzIADHxhR+nlSJucYPgEOJCP7y+0TZPt3Mtk9Y7iV4Qez
	 4plUXfVQyknDzH3VUZunkz/i1q06CFml5bGXsr9QVsGk7cSP/kKLmOwIub4QMmNh2Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RLdTQWZd;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994D3606A320
	for <soc@lists.linux.dev>; Thu, 29 Oct 2026 19:06:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 994D3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RLdTQWZd
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-188406bb948so2249238c88.1
        for <soc@lists.linux.dev>; Thu, 29 Oct 2026 12:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793300813; x=1793905613; darn=lists.linux.dev;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EP9nzlx+H2sk50SyAzN5S+n1xSKA5s/U/jjen9Qb6t8=;
        b=RLdTQWZdh/8H0IZ01MixcZQYSE7+inga4LCWWfki+U1Hkx5699IZSvgPEN3zEG1kU/
         essVUuOejMJEE/Cp0CgsA7ZpiHXS11Ipl0bveYMAPB7/8WL/tyd6EQhLsGWoQcJWEKuR
         ufpFcrbiJbSM9vnBRiY8ifyYxMqlerPKQ9HeertGoN9MQ3NJAY1Pc5vWk/t0kkZh9O69
         EGNDJXEBzRadlDpKJnAX14U+KqJqDUEdYZOVEJ/RZ1AMTo0H5cBAbOdOTsmxq7c/1HND
         6LMieE/2RjIM/W3UtRQIFaHuwUDACT0J/Hm+xb093u5at4++ioozHdOQcB5UbTd0Vn3D
         Nuug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793300813; x=1793905613;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EP9nzlx+H2sk50SyAzN5S+n1xSKA5s/U/jjen9Qb6t8=;
        b=HN1OZ28D2UdmEpw1oFnL7/gkB7tUHLNkYpyWIMAy575Y6YnvqMojuuOR/p5MtxjPa5
         Tlxum1cgVq4TDMd45ml67dNN2NZKBz1ncLAgd2Z5xll7UHsitdio0kN49dybRbTEXun4
         Kpxs9VUGys1reSnQvLfWKRYnNV3zwPw1/7SVC0uoKwmPFbEoYG315AZHDSJ2G9Z3Ocf7
         +MzhIWbjGm/HtWNcxPsNIcd5cE6LWWeUT70W4HYIZ6RcYY8eDxXR4y0ChJFTyBqEy94O
         eygiY0zC3MJHV5fvycywEUIbavt2xfvClJp5Ox8Jgwn7dTTmFHF5aNCaPHkSMfqmFtpd
         gZzQ==
X-Forwarded-Encrypted: i=1; AKwUvByqDHsRx4lJ7/NwXIFI9/YAGkWLX24OJc1xzmGSZvMOhijl6Sm/Ot2+VH+zuR4u9NX+hXY=@lists.linux.dev
X-Gm-Message-State: AFq9FYLpxcfWrS6PoVVA4c2KA+i9bevhIvPIqUgeLq7h/+N3QjQ+QJ6x
	Vrt6mODXdRPh9SHk4miFIDUFH0BDTkPuLpnOc1xkrvClshWOCvgn8yzk
X-Gm-Gg: AYBFou0PiX7w2ah1OKlXEMCuimBIghYPrzdmK9wBNxU/xzaxSuBzIxGBr5tR1C/8DaN
	HwAOCQ5xh8YOEN20nW//QDIxZzosNpPzQxrh0/FMwBRm0qpLizAmU77POTfeh3ShaVzocLpjGnt
	S/nKU8YbxuCugyCz5mX9vWr/wTnROajBvD+IfKWhZMef9jkLdeoLeHsiVhk+a4VBTdkO3NaFkBE
	1MRgJJjLePrrUcwrqBS2Nbw9RvfxVk6tKTkJbFOpNl6op2o7OFYwKd/+15oxgt2Ef146oGekRZI
	k1f5eNcbqwrXTsJcnSkQ/UlIsvWnfocCIDOZeSZrxAmn6ECLM9XL9nw+wsKqnVrSvQw1Ulc6qHE
	4p3CRte5OskCc4raD+ImpkIgUAM+ryUMexyWRFIksPSCNuc1Vj2PAhEnUmiJX68liije2z38iyu
	k2J0jGhFQ+ANsfheZNMFbe6QvbQoMzZbBLT7lz39aGVhEr3+gRVLU4g/irlES6sc2gIBJJFeQXd
	W4naMS5Ak+gcFthIN5IRmwFc7GuvLlBvzvrG8uj9iifcfj0vdHRIvKOvrG5voMKq/qcZKQV+fuM
	M9Flzso62o5qTkY3yN3YIEEVcui3rTzT5Ew2oloT8NV+WdgMgN6HLAtiwDgbV1Genq4AhQ==
X-Received: by 2002:a05:7022:ea8b:b0:1a0:f970:4f5d with SMTP id a92af1059eb24-1a6ce4ea2a3mr7493584c88.17.1793300812571;
        Thu, 29 Oct 2026 12:06:52 -0700 (PDT)
Received: from localhost ([2a00:79e0:2ebe:8:8310:80a5:1043:3f70])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac192c2e9dsm766922c88.9.2026.10.29.12.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 12:06:51 -0700 (PDT)
Date: Thu, 29 Oct 2026 12:06:50 -0700
Message-ID: <a23c924469bdccf3417141c904713a6a@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Russell King <linux@armlinux.org.uk>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	soc@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 1/4] gpio: sa1100: register software node for GPIO controller
In-Reply-To: <8bc1c573-bd4f-4dfe-9d7b-8b17d386ada7@app.fastmail.com>
References: <20260706-sa1100-swnode-v1-0-332759bbd930@gmail.com> <20260706-sa1100-swnode-v1-1-332759bbd930@gmail.com> <2a561a27-a3bf-4cac-a4dc-bfbc5c859f45@roeck-us.net> <8bc1c573-bd4f-4dfe-9d7b-8b17d386ada7@app.fastmail.com>
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Arnd, Guenter,

On Thu, Oct 29, 2026 at 10:26:05AM +0100, Arnd Bergmann wrote:
> On Thu, Oct 29, 2026, at 05:23, Guenter Roeck wrote:
> > With this patch in the tree, the qemu "collie" emulation no longer works.
> > There is no console output.
...
> Hopefully Dmitry can spot an obvious fix for the regression, otherwise
> a revert is probably best so we can leave collie working in the LTS
> kernel and not spend much work on that.

sa1100_init_gpio() runs during init_IRQ(), before driver_init() sets up
swnode_kset, so software_node_register() crashed dereferencing a NULL
kset pointer before the console came up.

Only the GPIO IRQ setup needs to happen in init_IRQ(), so I posted a fix
deferring the software node and gpiochip registration to
postcore_initcall (verified with qemu collie):

https://lore.kernel.org/r/20261029-sa1100-swnode-fix-v1-1-112f4d83d191@gmail.com

Thanks.

-- 
Dmitry
