Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B802E92D7
	for <soc@lists.linux.dev>; Tue, 22 Jul 2025 12:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753186908; cv=none; b=KniPmwIW7AFw7mBuH3i2jzhtv2IfP2Nj2fKbhnl/Du/1SFe0O6+6gjgPAxCN6opIBFRJos5t6mk8U8efRYj3rpPCPc/AxplRFRoSpeFx0eEOQZZQVEcfC4pktLVrBP+IlO5f3zLPzuSY5p0cnl+bJDWhtQFItWeWy27lnh1BpFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753186908; c=relaxed/simple;
	bh=r4A0j98fX4E+4Q/9RTrnc/Om1DtxQKVU6EuU44MAwOs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XYaIIhcNIXA0VxSX655OBRXoeyUS5E9l2vPgNHkxFtaSSmqfdUz/rN7sYMe6oAzO0395qQIv+kkK0xURKGQf59Kin9gBDKIUxD7mG1bPDVUrme79YrhDlbp8PK1A+rdiJyHABpd8K96AHWSzT6brG5lblp00s/KBDNMwxmMzcXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LeQV1vdH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LeQV1vdH"
Received: by smtp.kernel.org (Postfix)
	id BBCB9C4CEFB; Tue, 22 Jul 2025 12:21:48 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F3417C4CEF1;
	Tue, 22 Jul 2025 12:21:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F3417C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4550709f2c1so41289145e9.3;
        Tue, 22 Jul 2025 05:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753186905; x=1753791705; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ad0eWcS05AQtec3r1PLfGkWoKzWnCdTiBnJpsCLhEdY=;
        b=LeQV1vdHr4ht+cIPRdYEa+VLI7LoPCbjT+wZxwg8MKQbW9Nipl6P6p41HXyfSRV4Vq
         wnrLeL4EJyM61qH+uhY6HnfWbIZZxxPCFu6x2XehA1SROQjNyLwcY+anm7iNKm57AzZz
         RQaJ1NCNzkIAFpOW4bSDNOavnh7TTPUEwG2Xr9XtbFB5uMw/u3hQJrYJaH0zDCYuitBs
         5ybFR4RUfhq3JvOkbBCAS4io+mvgjhQpNQhB+dLo4JoyhFgvBr4Eim/Axx+pb6ubugBo
         1zghtSG/QXcVky4A1Ra9Jp91UPMiOKhcbSJDPXTcJLEh+/Jhwbdef8G0MIMwz17QLUBg
         NGVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753186905; x=1753791705;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ad0eWcS05AQtec3r1PLfGkWoKzWnCdTiBnJpsCLhEdY=;
        b=YiMp0yWn3L2pIRC7HrGrit1HkhCMJZWqLLAzzYxxwL30WPPd0XiBwz1YsqudZtolHi
         NyMrT4dyauQ/Q7sUT6XoePNGWuRTL25hSN+7/9CMzlLIvBD3gCYzz5uPYiJoZQhzbA5i
         Sou5+L7H0elVLdBQhldWX+GXP3JJdKhIIAitfAT6wJSt+MZwuuUUt4TLe+/soWy58HT9
         aniGEhnKzzibaEjX4cCKFMiAI29Qg1N3arO7i43ZUndNDwMO3NvZLAg9mNQ1S895HjdS
         CxvYX5GjdtZg3BIjQ7VnwPV9Y7WIzAchyQ4O9rv/TV+xCWHzJJ7tbxXqzCAY7MZKd4Ps
         kX5g==
X-Forwarded-Encrypted: i=1; AJvYcCUAz5ZXYg/aI8mAzxE5W1M/uhPCMwFAXhYPW6om6N+LSEge1tepul3TTxV1+9/vvD/9iWY=@kernel.org
X-Gm-Message-State: AOJu0YyfoxN3tlVt8Vhp5561LhWIyTHfSSueYr8PBGEFcwjfNl2v+2Ku
	00tV56nx2oJLct9DND1iKsepFpccYXfXnLI2uHUcvj9T4DHWjG9n9RmjKMZjAg==
X-Gm-Gg: ASbGnct89Fz4qgz1KZsJVBMGiGjg8payTEVyRIMT3vROC1pnlPJ1iFdoTq3oSQ4jkst
	ePe4XQ5/l5hzAiLcjEHWa3oRjm6hjN3WqVnIjskQMpX7H0TnurCkbR9EpsiUcScljscRs+6VfU7
	gmR/BsdoH9qGXp28Ip/djrZ0ljcyzYfvS9op10u1QFnF2fs5BaY1KM5kt3vlIBiODyivqHa2Ha1
	kJVB088Wm2PFp7n8N1nqnHK6iNdsNQcfqW9SFD+scnCF1VVP1Dktg4RcPLgpLgJqH9T35Eo5Eox
	SJRXxcci0MnxjdZET3hXybMhFZuDt2zwDD3I9YVvhSWrtiLYR4cGvC26QIya7o/1KYEgrPNt790
	NF0J130ST0ek6Dm/CWeEnIhhjrOeqeqwQfOLqY1mNUA6yaI5roxKjEqxNe3YYeqXDdey6zQUyoJ
	faQIF5SXlH
X-Google-Smtp-Source: AGHT+IGNcA3sbhxOlCqY/l1NPEPhYR5vIqHTTHrl6r+GnoE5v0L0OgDqGJHa+qfDhsDIJ6agL7cTFg==
X-Received: by 2002:a05:6000:40cd:b0:3b7:662b:705d with SMTP id ffacd0b85a97d-3b7662b7496mr910235f8f.48.1753186904968;
        Tue, 22 Jul 2025 05:21:44 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76455e57asm1897701f8f.21.2025.07.22.05.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 05:21:43 -0700 (PDT)
Date: Tue, 22 Jul 2025 14:21:41 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org, soc@kernel.org
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 7/8] arm64: tegra: Changes for v6.17-rc1
Message-ID: <izdiwbkuipbzunqot7zhillohtfcm32xrk5ydu54bamumfgkpx@p6ikuhkv3bkj>
References: <20250711220943.2389322-1-thierry.reding@gmail.com>
 <20250711220943.2389322-7-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fqns36t46xkf43gi"
Content-Disposition: inline
In-Reply-To: <20250711220943.2389322-7-thierry.reding@gmail.com>


--fqns36t46xkf43gi
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [GIT PULL 7/8] arm64: tegra: Changes for v6.17-rc1
MIME-Version: 1.0

On Sat, Jul 12, 2025 at 12:09:40AM +0200, Thierry Reding wrote:
> Hi ARM SoC maintainers,
>=20
> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd13544=
94:
>=20
>   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegr=
a-for-6.17-arm64-dt
>=20
> for you to fetch changes up to d01e4f1e7aa8833f549ac61a0bbcdc395533269b:
>=20
>   arm64: tegra: Add p3971-0089+p3834-0008 support (2025-07-11 16:57:47 +0=
200)

Hi Arnd,

it looks like you haven't pulled this yet, in which case, please hold
off for a little. There's a missing dependency on another branch, so I
need to redo this. I'll send an updated pull request ASAP.

Thanks,
Thierry

--fqns36t46xkf43gi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmh/glUACgkQ3SOs138+
s6ERKxAAmFMQZ/Cz4E1/SKyZNnC9aV8KA+fjrVHYHZzCnkwFSKmoC9NkwCWgbdrF
E1h3r1fxrb8nPtej1NiDuwnKhxs6aOsmtlRoBhcUGKO5PatgVWtjSgb1cCcIjdPk
rQnedQ0CYn/RHmB0lJbwST4jzqFL5FHGJ/90/XBA9AXGi0JqfWtzUeymAXk7RbpQ
YANpZwnoLtRNx/F7zEJRNXEA7pQR/5tizYVJoEREqJjS+wSpcNJzwA7d45wYmmkS
AnFmFNut+Uxt+UeY/DE7I8Xk+Lisex/EyirsiPsjRLWp4eYOOZIOlBqZjqIR99da
RqoOqIhXbuqYiZF2pI1RrJDQW4xlSoo922bQvr1EjmMKUZ+A8DyURYGkHxxxf95g
x+yjya0vWkFr5bZI4JoonbEXpBPkE/WJx84fnKH8t/M4xQaxtsWtdZTO9kpJxsGF
mzLtIpwdIxr5uXL07gwcoE/BjBxvmeCig1rqhTt0VL9RLFDAhe2eVLd9mEe5SkmO
2PIyCknJfDDbSpt5tDbzd+y5Zn0/hWfxbqZtD1KEg1QUGxncZc4/rc/s2fr2LQg/
SjlgViowGlhj/+o/QLBkyfp5hy5kK0ZjSi5rJsOC+iUefpXgLFhehwGbX/OPfI+R
qwtbt/DbrtWjMNS+/jCBZ0ZEMr4tIdFHnDVzCj0Wx9TzZokl1PQ=
=rtRy
-----END PGP SIGNATURE-----

--fqns36t46xkf43gi--
