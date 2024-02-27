Return-Path: <SRS0=npkv=KE=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1788FC54798
	for <soc@archiver.kernel.org>; Tue, 27 Feb 2024 13:19:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D3627C43394; Tue, 27 Feb 2024 13:19:33 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1155AC433F1;
	Tue, 27 Feb 2024 13:19:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1155AC433F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-564372fb762so6092658a12.0;
        Tue, 27 Feb 2024 05:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709039971; x=1709644771; darn=kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+sVEWnHCtjfx1pduFCApW3G/u4C393hL6iFNK9oD5AM=;
        b=VyxYjKY7v2nr8UdfZLRF19cIl13akHsZ2GVUnHT28sdB9WtAAL3x1UPbYV09BxQsW5
         SROxmd+mim3ph7YFmDPscKfiXCPTW8JDtVYkjMCY7bGvfdwu8NqO+53JEzpLWVNgXuEQ
         Wd8/wERZfMTTy6WxBAy3W2CN+vq0a9U+UZ9kJrj//aBoeqeHMcAxUlJJZLKuCx+E3Lkk
         WpjKl0/AdkHAq2BmTeOFf3ZMPIBVhZm69yolTI/+r8zijwoNh9OlKAKy1qIeHoNlfUwM
         k2t7aOOi20P3Z/DgzCrxn0VmNxMJ4M4x4genfYc7fu2pYKPDy7Ch6cE9fRLqE/yU1l4y
         EmDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709039971; x=1709644771;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+sVEWnHCtjfx1pduFCApW3G/u4C393hL6iFNK9oD5AM=;
        b=m7SW6aBcwkA7RiJ22GGhfWNkNPwmbK5dQQbUw1Pb7IaHm5q9V+lFw/LmSdm1m/2bCP
         w9xFoSrBNOShYyglWXZslRGg5F9GIAd4xBjYEXhykevoRpmfy+ofs3u2fMhQv4SeYK4f
         XzfRl0un8aDEe8Gw8CXa8Y5UE9rJSMjWufrIN7+O8kH3FOOYLtflT+VWfv/+PMN+atrA
         ynkTiCIT9z/7+bT5JRkVVvSssmj37uu2UUTNuyPzGqhaTS7bPP35lLCvcxv+WVonBXcv
         kxS5HWbbL5jAEYVmxe4EAk2gUJQMeI4ESnplVUOdw91+XNTyVRIwaZYnyqRJQBBTWw5i
         iW7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWSawQi6y8AYUgp173RodRWt+xoHS3rUfmndA13uKa3gf2Xuj+Xfd2AKQhOXvrAMaJMR2lY0sHqpuhiC2RSuh2sHCojWwdGzDLAsz/0gIY=
X-Gm-Message-State: AOJu0YzZowRVjVS4gU40vBaXnRJhqpPfjnqQ3djToVELCcCYCkceou2t
	twvhJglBvokMI8R6q0sq7EdLmzeHkDxUPQOJYWO3134tLlMwefmj
X-Google-Smtp-Source: AGHT+IG2KIGf2F5Kr6AZj3iQCE3Cyo78/KJKKN6Yl8bLrEHIRGCG9zdhpJ4y5EtqjSwGhVBc6CmUFw==
X-Received: by 2002:a05:6402:1646:b0:566:2ee3:4993 with SMTP id s6-20020a056402164600b005662ee34993mr1499869edx.26.1709039970865;
        Tue, 27 Feb 2024 05:19:30 -0800 (PST)
Received: from localhost (p200300e41f222300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f22:2300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id n4-20020a509344000000b00565a9c11987sm791962eda.76.2024.02.27.05.19.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Feb 2024 05:19:30 -0800 (PST)
Content-Type: multipart/signed;
 boundary=4204c71fdc6aae8d369f5c112ca50bae35e50ea7afdce5785f0b598d6323;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Mime-Version: 1.0
Date: Tue, 27 Feb 2024 14:19:29 +0100
Message-Id: <CZFW3VGPIM2S.17UDYEGTTEXBL@gmail.com>
Cc: "Jon Hunter" <jonathanh@nvidia.com>, <linux-tegra@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [GIT PULL] arm64: tegra: Device tree fixes for v6.8
From: "Thierry Reding" <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: "Thierry Reding" <thierry.reding@gmail.com>, <arm@kernel.org>,
 <soc@kernel.org>
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20240226144536.1525704-1-thierry.reding@gmail.com>
In-Reply-To: <20240226144536.1525704-1-thierry.reding@gmail.com>

--4204c71fdc6aae8d369f5c112ca50bae35e50ea7afdce5785f0b598d6323
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Feb 26, 2024 at 3:45 PM CET, Thierry Reding wrote:
> Hi ARM SoC maintainers,
>
> The following changes since commit 841c35169323cd833294798e58b9bf63fa4fa1=
de:
>
>   Linux 6.8-rc4 (2024-02-11 12:18:13 -0800)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegr=
a-for-6.8-arm64-dt
>
> for you to fetch changes up to ff6bd76f4d997642ef390bffe42e93d6f7be87d3:
>
>   arm64: tegra: Fix Tegra234 MGBE power-domains (2024-02-22 17:58:59 +010=
0)
>
> Thanks,
> Thierry
>
> ----------------------------------------------------------------
> arm64: tegra: Device tree fixes for v6.8
>
> This contains two fixes to make the MGBE Ethernet devices found on
> Tegra234 work properly.
>
> ----------------------------------------------------------------
> Jon Hunter (1):
>       arm64: tegra: Fix Tegra234 MGBE power-domains
>
> Thierry Reding (1):
>       arm64: tegra: Set the correct PHY mode for MGBE
>
>  arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts | 2 +-
>  arch/arm64/boot/dts/nvidia/tegra234.dtsi                      | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)

Sorry guys, I didn't spot this on the list and thought I hadn't sent
this out so I sent it a second time. Please ignore this, it's the exact
same PR as the one from last week.

Thierry

--4204c71fdc6aae8d369f5c112ca50bae35e50ea7afdce5785f0b598d6323
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmXd4WIACgkQ3SOs138+
s6FqkQ/7BSvxk6B7SGLvYEO4J19S+kyW0VABxRDERWP8QXQ+8ep9F9G9qGlSBprG
itDRAfo3kn1ALOCBATDF2C786D2at6HWYg25LJn9uxaZS4avW3xQlEiux6AVFbiT
13IOEh+OwKm8ooXZgnqnDgNeTdgdJYL1VPr589qQvYb1WBHU745IQeieeT17wYz7
TE3QWBNu8yjiBOCDBXFNrQvR3nFgAQqqImb46R7rVfjL1YYDiZxlTxol2nGZQZiZ
PJZM4ifCet5kv1ZqkWhsYi7Ga2R5qQX+W60imfIK0sobLeD1cpVEQmhmwZrFf/D0
x11d/Dn2+5leMzdsKtIvR3P/5vLAFwQNc3NGxMulpBnVyHW2BUwYaX7X1elesztY
FHZdLgRFPN8MQvWvbOsn9twtrr/jsmrtCgXBGkUMLx1Eun6bugVivCIzT6tJ9100
Xn5oMQC3H6bisrews0xx3RFnkCCcCGxb/hwFfm3uiikwBO7AnoHlFnNyvNFf+jBi
wMky2btSWGA2DAjAgQ2IMIHQLSrpI7IL6ilyTdw8nWvJWh5XtNEA8KOaHaxoyRCT
lnQ5wZT+PwaCEyPHaa7v1bkgkVVU+dYycziXZBEKjRNPQW0xa/m83wGkFEeIvZBG
wJXeJAEk5JyQlU55ip7dJ2jkLavJRYzoilD0vOfumgzm8qs5SdU=
=XMA/
-----END PGP SIGNATURE-----

--4204c71fdc6aae8d369f5c112ca50bae35e50ea7afdce5785f0b598d6323--
