Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524FA304BB8
	for <soc@lists.linux.dev>; Mon,  2 Feb 2026 17:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770053923; cv=none; b=hwUUnrS3uLyNpyMSZmkctOwH7hoDrzwOdwVZukYytAGCDIpYyVr+Yh34HW3u3fHHkt4+M0cv990KRk/kkFmbpnEP5/CSfCgDbgcAqPQLkmO/+3IFwJfKr8OkqfFrzXgCyhCJdrzsGMVJcyG4KED2rFF6Fcu2jRMWcVobnTpymt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770053923; c=relaxed/simple;
	bh=FNaZywdV0xBaS8Xb0STRBySFYMmYW0gUfv06+Gp6u3k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e3w4IjBf1R88c650zGVnUuvrx9FLEmXi7TL61483kIh9RGhC/h9vW4CNA8UQKo4p6/BMXhG4N0T9ILCs4lPX4DehZxbnDNy2fFXIbtkW2lZCSUy9uKLrFcVItYcYdJrqEv9uVHzlfHR5n5EbFmxkALtJd7R35NZB7bJQhAdz450=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gAmMbIit; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gAmMbIit"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4801eb2c0a5so46122225e9.3
        for <soc@lists.linux.dev>; Mon, 02 Feb 2026 09:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770053921; x=1770658721; darn=lists.linux.dev;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=s0gyTF7HDQLKl/NQKBiqUu7tUq7oC19o2sx5CsrD/90=;
        b=gAmMbIitMzyQA8oZa8sPbM8tUN06V9E1rfwX9XHxmEnnC8V6wwViwkO2gryZnRUFSi
         E8WTcMKxJvx8AUQJHFsCDtOa9k9XM3WB9C1K3nlcpGyxnrFhiuKrjnEo96G6o6HrCb/5
         24MxSGmilFx6ctN4eZltHnTcLelJRZZBIE+weilo6jRzMIGpzKs83u6I3QLnutoCJ20M
         R3rHVyMkoPkm44BrCBI5m6LdaR6IKCFX7YScx6v7whtyasaPWQU+POrC8WhN+Gql8+UA
         y4eFav8GJeBAKsCS2ZuYpNyO8BcshqDJ+qVCg2aQNP/StLGgnXXHjcWvgheUGquAHXdY
         gymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770053921; x=1770658721;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s0gyTF7HDQLKl/NQKBiqUu7tUq7oC19o2sx5CsrD/90=;
        b=JJmrqzDFXy8gSPSjV6H9q1TsuXwK1nu39YzEj1yjn48VO291YxcTYs9598RNydTjVM
         k1XhPLGdy6sSjAVNOf0dQnw9L2c6iBIGwbQDlEhFggL8uF15lBwbylBET5Elxpx3hGs0
         kDQpVsPSgv7fVhagrBqobZKdedOYCiRd/h01LC1RpjKIdFzAh28KpXKgMNeVmr25JRnk
         HFCrjC7u+HjPLWLr/+n+Dh7iA0gV0RsJjNqUsAPWwEyMX93vgCCk/MUpQplWOsygcejK
         hXHG8yRW+CN5SsyyYH6gOf8DOm7Mt4dbcbUfbZDRM4FtsmqngiteXLQt5cEV5LHInqV8
         E7yg==
X-Forwarded-Encrypted: i=1; AJvYcCXjmylPlJeGR7XeZCKfeha3PN5M/GsejPp6v5QVdXJnO1LWQxfmLVuKw2GeyI9NHzs2rGY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxqg8QRFEzg804E1K+ufrhJSMU7AD/8p7/xeB4cgthMn6rJdZoE
	7v2sLmD99ufLTyO8GgRP2w2XgWyauLxQN2jvimv7zK/09MW9tuUJHzW5
X-Gm-Gg: AZuq6aKBB3qxO0Wdjcvu+ekX/DhsnXAZhzZrxCxdKm62GCaQiI6wmMZdy3EWEx2H9/D
	1ihHTya8yYEleoYzqskot1BJyhnPMqDOzJcnkjt8LfooPUSDGaoSFeCJbozBPI/ouybRA4OiV9R
	Bm4xroPoG5XzgR7Tocgv9i+5CklmHKag5e8VXFtrDGZ38LIjEmJPtd5z7rh4/YtgJd+uquYRWzT
	J7N7pryXeblTvSSNudflzGmIvHJmN3sTkomLBvgCAyMONTJ3NcG57/90D2fXu2QvBoRAbG74NFN
	6iujofGbx6a+Lxtx/WGpDAikmTmsDt/6dWwf3KeoAXmn5RKoC6K8dGpWFhvtVYLZA00Y0RuAF+S
	F/Tp5QPncjT9aDlZnKch4+p+On0abccvn3nc/hcxTkBURbAR/bq3yQ4RAa6t6JcCqt1LyPr/luS
	NC6dpdF/3hF36sQHDvbCrABlrt
X-Received: by 2002:a05:600c:4ed0:b0:479:1ac2:f9b8 with SMTP id 5b1f17b1804b1-482db481b45mr150644815e9.21.1770053920464;
        Mon, 02 Feb 2026 09:38:40 -0800 (PST)
Received: from strix.localnet ([197.250.227.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131cf4asm46449032f8f.28.2026.02.02.09.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 09:38:39 -0800 (PST)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Jun Nie <jun.nie@linaro.org>, linux-arm-kernel@lists.infradead.org,
 soc@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>,
 Drew Fustini <fustini@kernel.org>
Subject: Re: [RFC PATCH v2 1/7] ARM: zte: Add zx297520v3 platform support.
Date: Mon, 02 Feb 2026 20:38:29 +0300
Message-ID: <6235462.lOV4Wx5bFT@strix>
In-Reply-To:
 <CAD++jLn6WCnqcoRwrGv3X3tqx=weBdobu-QJ-jdSxOSPVjN_eA@mail.gmail.com>
References:
 <20260128203455.38569-1-stefandoesinger@gmail.com> <1848649.VLH7GnMWUR@strix>
 <CAD++jLn6WCnqcoRwrGv3X3tqx=weBdobu-QJ-jdSxOSPVjN_eA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5074665.31r3eYUQgx";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart5074665.31r3eYUQgx
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Linus Walleij <linusw@kernel.org>
Date: Mon, 02 Feb 2026 20:38:29 +0300
Message-ID: <6235462.lOV4Wx5bFT@strix>
MIME-Version: 1.0

Am Montag, 2. Februar 2026, 12:09:03 Ostafrikanische Zeit schrieben Sie:
> Hi Stefan,

> I don't have any other ideas than to proceed with a 32bit port.

Yeah that's what I'll do.

Thanks for the help to everyone, I think I have enough guidance to disappear 
into my hacking cave for a while. I also received some feedback from people 
with different versions of this hardware, and as expected some things are 
working and some aren't. I'll probably spend the next few weeks or months 
trying to understand those devices better and submit my patches once they are 
ready for closer review. Since this is an evening hobby (and learning) project 
it might take a while.

Cheers,
Stefan

--nextPart5074665.31r3eYUQgx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmmA4RUbFIAAAAAABAAO
bWFudTIsMi41KzEuMTEsMiwyAAoJED0TvMhUTxoiLuUQAJovSVKo6Frb2L0eYfZz
03MBUuJUxhKyn71lRHcK6teYCVDmZZDFRCwXMRcT3fYBJDOGJ/zaOwJDLv2w8ESM
+wARokuTJbP/k8qXwdrmOUUxSHhMbBz9lJvdh/NRjeCHmHCHDHBYImVa7DVV57kX
u6zrA0I8xfQSXBDHCclxw7/EPDRWIqiYBIzsgqmBmS/ATTMgoyxu6kIOR8ct22kZ
rXamZq5xuurxqehTGANVVs/CgugpIR1WMVaUPSMDfEnikvDghScKrOKdLQZ2Oe5a
htFXLUIHneqnCgiXWh5xriMgdN38rAKJ8VzmeoUCR/BlFANqmmZ90eTvjH1oFIfM
qU4nciXrKMZomoexrNcDPzm8lqYa5EYcuhdF0mjtVzDhQUQzFIyW3UYDIL4caqTe
ic92sLHT9HXScWnlF+3ZLOUOS0MEAzI/ub4pqezCSEL+r2mRUVIdnPCBvjUgeVuX
TtGlfjpVQCcKJRcK9p5k8sA1q3GAS1Taq3g3SzdQAOjVavhGWBiFMxgrsJpbNV83
VCbPfkArHwVxle/v7Xouxg61VFbs5axc9cBDpvSWLVntgeFgGnYFKhM+jY1Q8Pow
p8pH3XACwwcVZO0/Bfob8yMj8n0l+MvfalbEG4ANTFot0Lf61cM24wx+oXf2aOVN
bgabrZ2+eRfAeyyvSGFmLdfv
=3Xo1
-----END PGP SIGNATURE-----

--nextPart5074665.31r3eYUQgx--



