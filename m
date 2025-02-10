Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BFCA264638
	for <soc@lists.linux.dev>; Mon, 10 Feb 2025 20:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739220908; cv=none; b=rAXZtGyo/295YFWLY73N2KvB6DgfGARFQavk6sUmiu9yRfD/VR5S6jCEGKs+oDKhFLf1PYKu+Ojru81J/zB0b8ShBooF/UAEsY97BZW1iQHwtjkRqsCXusBzPOOXwqGFJEtkegsrn3Az2NzPl0HoY5tU6ROlSFlM12AU2EWOFN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739220908; c=relaxed/simple;
	bh=WpjZBk1tco5NPGp1mA5Zogy2Y/Xj4BgJWgEyk1N9n9c=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=a4OYFkhSZtJw3lzl4NTU2OEHFJLVLF3kAWOOeiW1X2tZSbCDHYO20Lk984Un7idWcFlfZ9rXHKYxH/xuB1BdANFotzJri9xVwyBqC2D7XgNNB7UX+t8L40yT42f6RwafFwquvx6x0xzg+NGFsR05ZocKwYssFcuD6qzv6rZRfok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ez1EYpJr; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ez1EYpJr"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ab7ca64da5dso197276666b.0
        for <soc@lists.linux.dev>; Mon, 10 Feb 2025 12:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739220904; x=1739825704; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WpjZBk1tco5NPGp1mA5Zogy2Y/Xj4BgJWgEyk1N9n9c=;
        b=ez1EYpJrU33VYTW9HLWhCKUH/Tih2N2ih98q7D66wZN17ojfCiVoVoZsxCjOasRqOY
         rjQlUHATgH3k9R2uvNr6GOOjnLR9kTaD+HcwkO+bsvj49pjjcI5QZ8MpW1I3Ld9uQ53Q
         Kh02C5aY2uBssZTaHa9kcmc+YJmlBfFLpw6PWWJ9YisZ0X8HKNUs6sWjm3WbvcRo3aLQ
         fv7eB8XmRluqRx/2YQUDGz71DbH/Y90AbDOcDcVS41P6Jcafurx3ojr8Hz+1oIMbKg5L
         zJqPxGR5g98BiSHAwxV/t/LG/5LGw2UukGjKDNDOLmkNBcfM521Oug1pfKYMYJ/DrmkD
         WiiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739220904; x=1739825704;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WpjZBk1tco5NPGp1mA5Zogy2Y/Xj4BgJWgEyk1N9n9c=;
        b=psLDb4/68u0ZjpoHcgApQmkTVScGBSQ8iCI1x0WVm6hPPX4XNMTymiO/CFYqqE6cZS
         lvZ0DOGQuK5s5+HZQdEpP/wQOJcg/GWjmZVCAE3FTKnAsd5CLyu0dz7X4wR2rsBEM6wO
         x2TMEgoLRzO+wkp9uecx5kPs9mK1UQ6eg0M7aozaCrp8i9l8tWKc6IKts59lozRNCWTa
         +GRBcwikf1ll4f0wTyFaStFmcBlkmplqvpNlDgCfCPX+kw/onLRbmmoZ5g2aRZ56KaFU
         5A/YuILJIjewhplLWRaRirNnIEmy5AkbIIVy3+4Hjj3+o/XrY87C/ufyN5czS3yQSCim
         ArYw==
X-Gm-Message-State: AOJu0YyxAzrB9Wv+w/Ra+r06vhvKfrWcjVdAk6/8EVUt4nFfkHwj/Gi9
	8Qrnv2bUOANWdHwta+xelE1B0GyzuoxxWpCBKfEyl1ZaBl2yh6vW
X-Gm-Gg: ASbGncs1A9vOJ8Lzfy0RYT09LTcdDR5OaXuSR33d7Wo0yF3/NvdgPqD1k1GhtlrT1Fa
	3uTJPa+3WIUMy+pv/mIp4CS1RqvJbpfDlQeBwn5CC7T/ygYngf4L6pptyyhrf6DeBWOBqx8Pqkt
	2lv1ywcS6DGiYn0B/7KlKOEolVGMqt7NzbQ1YGBpRbHxQBjPA018ywEX5g1xYm6oQrSJfQREOiV
	/GnnisZuRYCa28PN6BkRhey3XvV92osLQufQxX97CBgu16U5F+zzxuNG9Gtayrts81yymebYt4u
	gjJGHO1bggO9DdhIHAPE8fy/SgJUpDh9
X-Google-Smtp-Source: AGHT+IFJYUVYcZgeTbbOIf2IE2QjryPq2pdJRg1RIOBNc7TQaHZymLDKrGCSZgTlknghtW+yN9uTHw==
X-Received: by 2002:a17:906:c109:b0:ab7:b9b5:60ff with SMTP id a640c23a62f3a-ab7daf01893mr82813066b.2.1739220903984;
        Mon, 10 Feb 2025 12:55:03 -0800 (PST)
Received: from giga-mm.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7cc737d81sm179019066b.176.2025.02.10.12.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 12:55:03 -0800 (PST)
Message-ID: <77c0db160bcaa7c2a68c04a0d33a561b2834f764.camel@gmail.com>
Subject: Re: [PATCH 00/10] arm64 support for Milk-V Duo Module 01 EVB
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, Yixun Lan <dlan@gentoo.org>
Cc: soc@lists.linux.dev, Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
	 <inochiama@outlook.com>, Lee Jones <lee@kernel.org>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel	 <p.zabel@pengutronix.de>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Paul Walmsley <paul.walmsley@sifive.com>,  Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Sebastian
 Reichel <sre@kernel.org>, 	devicetree@vger.kernel.org, Haylen Chu
 <heylenay@outlook.com>, 	linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, 	linux-pm@vger.kernel.org
Date: Mon, 10 Feb 2025 21:55:01 +0100
In-Reply-To: <eoeyutuu4mrpsu7snkk5ll6kmm4344qsgbnncss6gerlcvvea7@usuf5v7w5ffp>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
	 <eoeyutuu4mrpsu7snkk5ll6kmm4344qsgbnncss6gerlcvvea7@usuf5v7w5ffp>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi Inochi!

On Mon, 2025-02-10 at 13:33 +0800, Inochi Amaoto wrote:
> > It would probably make sense that the whole series would go into SOC tr=
ee,
> > even though technically nothing prevents the reboot/reset driver to com=
e
> > in PM/reset tree. If everything would come together, `reboot` command w=
ould
> > work out of the box.
> >=20
> > [1] https://milkv.io/docs/duo/getting-started/duo-module-01
> > [2] https://github.com/milkv-duo/duo-buildroot-sdk-v2/releases/
> > [3] https://github.com/sophgo/sophgo-doc/releases/download/sg2000-trm-v=
1.01/sg2000_trm_en.pdf
> >=20
>=20
> This reboot implentment across the RTC and 8051 domain, which is
> still a big problem to be upstreamed. This should be designed=20

Now I've got it. The problem is not in the reboot procedure, but
rather how to model this thing in the DT, because of all these
unrelated functions brought into two HW address spaces...

> carefully and needs further discussion. Adding these two syscon
> compatiable may be not a good idea and cause some problem. I invite
> Yixun to this talk and he may give some useful suggestions.
>=20
> At last, I prefer this goes to an separate patch series, and
> implement with rtc device.

--=20
Alexander Sverdlin.

