Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C643AEF52
	for <soc@lists.linux.dev>; Fri, 24 Apr 2026 11:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777029832; cv=none; b=lPkl+JynzH3nSk3sP/xIJJYxCCSSZv/kICZuIOhZ50J5TENPAQZf0wI2Hni2tfBkCRSWVUehKk+JnLOvwbbDDg6FGCkUBSKzQ/rOETeTskHxG3crMyMoYgVhnJSfvHaz4tENQN48pAONiwg9w3jO2VycbW9s5SXg94y5KKs8q4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777029832; c=relaxed/simple;
	bh=CRAdYzX9+jNsTYs4h8ctNWZTdaCBBbrpEXxcu4w9zCQ=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=lRgrZ7zfWGvhJrU/v4UdBzzj2gOTmQR1Cl8I9B8aGCTAl8hB7YbD1LwLLemEjXMJ+8x7AXyyQwQGcxKfGsiysy+n3nHSk19rwu0+BImXC0ZURz+zjFeu87sOJIN4Ui3W39FXMtif6zNT01kzBQh7dN6ki+I3F/QkGQqqDl89Hrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MjTm77wk; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MjTm77wk"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43eada6d900so7537382f8f.0
        for <soc@lists.linux.dev>; Fri, 24 Apr 2026 04:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777029828; x=1777634628; darn=lists.linux.dev;
        h=to:references:message-id:cc:date:in-reply-to:from:subject
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+t+DJdjmBiSqlx1/PpjPe0tKhCBDYlA3fqYW1n4w00o=;
        b=MjTm77wkUcZ2zmby0q7AzHACrENGkp+ZRQh80bTuh+roo03qPuibMeNcn7l60U2/WI
         kvQzqhGUBSxXDJAO0vpM6FfPNsIaiySdWcEB1eDdBYK46UbIV3p5/Q8lf8+GFDYq4kp2
         BzeuIVWYR5cvgm7gkrGJo7q8rToyNO/GUFHeH0y3tdLlsEXGYBqazBjL9EOPwxKtf3Bv
         uNrsuxixWOqZMvvvak0W9hghU0/HQ/QS4xPyUsnDlrNLLQWVI96CxO7GUX3BMFlpvLlc
         Ua7Z8nnQ61Fyd/1og+GvqQJ/sEdZNz3tLdR3U8SmIBXob9LNFiGWohzmmZ1ojwHZMCQd
         R32Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777029828; x=1777634628;
        h=to:references:message-id:cc:date:in-reply-to:from:subject
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+t+DJdjmBiSqlx1/PpjPe0tKhCBDYlA3fqYW1n4w00o=;
        b=Edk1t5JXUPjZcOLcVpZqs6oXTu0yvZa8xgeWEOfGPIo/ZEGAZjAs1ZN9yU+Fl9MNqg
         KiRPeAqgklTm4GnbUPL1eFptMGsCaZGY2yk3tLHMQkOa8MvOuNlXZnPpuQOVNmOgfX9P
         ko1BudS9Slof/qGr5xuuMGfzZ1jheb/JNq0AiyDFU/6BPqkG2cEBL9jDqh7aWW4faB06
         s53K+E10UuOKEZjHaVWNUeJq2RsJ6s/USPcVIScFfoo2gempJQY7wD5ztEBrhPAMQ9mk
         0wWTAQ9WmOulK9oUZZRVzxK/7/x/kqXrQ9hW11Q1cOcEst7TYsg6OJ6p77xdb1NI5LRq
         5G1g==
X-Forwarded-Encrypted: i=1; AFNElJ8M3OxUtucZctMc8QdcWPwXQFK+btIvRqnmyWXmCY0BUIMZzQd3fjai1+YL3UeIIpHnFnQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwCu8lR4gleS/9Y81VpCwMcyYZLBCx8rWISVNQ0XOVAlCfUNtiV
	I3bkhZZ7jB2gNDp+NAp9Pm8VtW7MAmFwnR+3BkE226Roho7w1Dt3WMxW
X-Gm-Gg: AeBDievathmZ9sS/4Ul/1u9qSfx0Uz5NWcI0bA05GIoZ26pWN1JvUUIJ9aV/J0Xhqjm
	Cxd2sqKW03WdjPj5T7Mhevz93GyaXPSj6oVAAXUoRALdDkUh7KBf5u4kEMr0o/nKmEFDg3Nv2oQ
	XTgEwqzss1JlWnZ0wmkOzw3LDIsavRbL1tXIbYlwu4nQsc6kIXLm223bQCZ5DJtV8dk6JX0+LRN
	fr48OO6ZqGchEfMcaEySHbGw2lCZ/7pd+OEUn8wT86ymUOywlaPN4OLHKRKIP+ScNeQRXroeYk5
	oxjpvW3bfRMhQdKP3U9xSURwbeXsidraEToIFOW/Cx+YypExyvZMGnOTwf+oG91Wt/qP01XDanM
	Ru5FKt77JRJ7fRqNQ9/tz8cCKdYxabj5HaM7Iw0AUyhSFsf11Bo+FErpVyVDATaDh1Yjf5Bq8pj
	/o/7EcQjRmnhCZKQNmynM6QuDd82g62iGDSdHiVnVnkjSW
X-Received: by 2002:a05:6000:240e:b0:439:ae2a:755e with SMTP id ffacd0b85a97d-43fe3e0b606mr48159269f8f.23.1777029828055;
        Fri, 24 Apr 2026 04:23:48 -0700 (PDT)
Received: from smtpclient.apple ([197.250.51.46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cb1365sm63645843f8f.7.2026.04.24.04.23.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 Apr 2026 04:23:47 -0700 (PDT)
Content-Type: multipart/signed;
	boundary="Apple-Mail=_EE2E18C8-0A52-4302-9DA1-BBDF2F1ACD26";
	protocol="application/pgp-signature";
	micalg=pgp-sha256
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.500.181\))
Subject: Re: [PATCH v5 1/8] ARM: zte: Add zx297520v3 platform support
From: =?utf-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
In-Reply-To: <CAD++jL=am0f+sgBSFYQCdcFOvFWgPETn_pSgVdzETJ3_yUNqgw@mail.gmail.com>
Date: Fri, 24 Apr 2026 14:23:29 +0300
Cc: Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Russell King <linux@armlinux.org.uk>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Drew Fustini <fustini@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org,
 soc@lists.linux.dev,
 linux-serial@vger.kernel.org
Message-Id: <BF5EABA2-3168-48A2-AE2D-D8EE2CF88E9F@gmail.com>
References: <20260421-send-v5-0-ace038e63515@gmail.com>
 <20260421-send-v5-1-ace038e63515@gmail.com>
 <CAD++jL=am0f+sgBSFYQCdcFOvFWgPETn_pSgVdzETJ3_yUNqgw@mail.gmail.com>
To: Linus Walleij <linusw@kernel.org>
X-Mailer: Apple Mail (2.3864.500.181)


--Apple-Mail=_EE2E18C8-0A52-4302-9DA1-BBDF2F1ACD26
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> Am 24.04.2026 um 10:06 schrieb Linus Walleij <linusw@kernel.org>:
>=20
> On Tue, Apr 21, 2026 at 10:24=E2=80=AFPM Stefan D=C3=B6singer
> <stefandoesinger@gmail.com> wrote:
>=20
>> This SoC is used in low end LTE-to-WiFi routers, for example some =
D-Link
>> DWR 932 revisions, ZTE K10, ZLT S10 4G, but also models that are =
branded
>> and sold by ISPs themselves. They are widespread in Africa, China,
>> Russia and Eastern Europe.
>>=20
>> This SoC is a relative of the zx296702 and zx296718 that had some
>> upstream support until commit 89d4f98ae90d ("ARM: remove zte zx
>> platform"). My eventual goal is to enable OpenWRT to run on these
>> devices.
>>=20
>> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>
>=20
> Didn't I review this already? I don't remember, anyway:
> Reviewed-by: Linus Walleij <linusw@kernel.org>

Yes, you did, but the previous version, and after I sent this one.

And if I understand the b4 docs correctly, the Reviewed-by tags are sort =
of handled client side: I have to tell b4 to fetch trailers, and then it =
will add it when I send my v6 with Krzysztof's request to squash =
patches.


--Apple-Mail=_EE2E18C8-0A52-4302-9DA1-BBDF2F1ACD26
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmnrUrEACgkQPRO8yFRP
GiKRrQ//d0i3JtN4eqnwGJS0KDoAetBNQXiNUwHJGszPaUlMzi1beDOdsTFk7Who
t8GNv9VvwjuR7Agxy+B9vNltnZanU6djJKQhm1+Qd7AvlC86ueKD2tGZUxpmuipl
37Poxi+E1zUTG68RTaJz1p0utLhaZkiCjVJzmTQgJJq3mAfYp8ycFI29IgdGHJCN
612a3nSFm1l6vz8a+qSX9kQG1UnTYQjsavu1ACxQp9Kk1Xga1G+atLgfXTTY3Aav
LjzHpAl+B0szQ84Zb05ZpJ1jiZYnMrDrIlNu1hv9/PTddXHyL2ISI+0um5OCvJ6n
61iXnVpyJlrscV1Iqs23VwxKx+y3rnV1JIlf/j4n1nwkJ5LQLxRWuYUpmK71uwKt
8WtiK3AD9VxnQvfVtAn2ltUaCLeeE+pZpSwnOvI31AOrwwZQ3ckSqkYRYVwnxVZZ
hkYMk1IfqjRPdMgMjyAqKEPZ5hOqYC5eqd68uM0HAXpYnUT/FNxGw/+sV7oX3qyY
eVho0WqhoeBEAezLTQ+GeCNlLirDpHwT2Y8NHYxSTlIQuwhwClwRPjdXCyS9adcF
eCz32rEZFS75z0LG701LB+MlMhblYEkGiAm3DEsFo4778ft7kfWC5N3GJLbu31SX
1/xC0sqkBY5zF5gvLXwtw0kEniW7PzEgc3oc2N3T37x4mk/WGfo=
=+4QJ
-----END PGP SIGNATURE-----

--Apple-Mail=_EE2E18C8-0A52-4302-9DA1-BBDF2F1ACD26--
