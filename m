Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CFF39DBFA
	for <soc@lists.linux.dev>; Wed, 13 May 2026 21:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778707254; cv=none; b=lP/b89+nI8FMEghBwMZAYn/5+gnTJ57nGj4TIkr1qcNmpG2WW1n+GKDziXkhRbUEIILPu+xSb1fP88iU/2nsIx7GR6B0GkN47RkTaq/GgabvDznql8fz0744fwRSjkcAyI7XbFeO5Tt+6AeA/Ux6QNKyD8O0xuXn3iP3kiuX3DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778707254; c=relaxed/simple;
	bh=5oQq8kIT4eqPwApduvc+ykLqNLL5qs2qPdsyuxy8b9k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tIOBsm+Zei9wnVmRUUYhTFuR7an36Mp2EM+ZzosZlv1MpB7O32zmfDh8nUSdMWY8nhrdVGJpYK+gZDF1h3L/Hy9FyitruMB6OLW4vKqKyXU6IjN8E+VqZfFxXhnw6dpMBCeWQ5NkOfTVlGR5eWLFAT6OdY2ZgFCHsD/+RKvUnBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SHXLm8jh; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SHXLm8jh"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-44e1ebb3122so3859185f8f.2
        for <soc@lists.linux.dev>; Wed, 13 May 2026 14:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778707251; x=1779312051; darn=lists.linux.dev;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=c6CUfOFr6m5QaenhIZhXMv7jaj13ID72rQAvFIcjDlo=;
        b=SHXLm8jhw76HCJgH+4cpm5kVO4kW0eiNDPN3n71gRtKLPZoAceEDpBuMYv/weLiIk8
         rrytsbdXuYXzc6mlW2/MoOObMLalBjjaZF5BaRysJD5nHAXQUb2vcbHFnVxrjRQiUKJ+
         zHJR3YCuxIGgytAGT56Ft0xx6Bps5pSPxNqde+uFmtPR6fpOa2V/d6pmLoJnEzv/X7sc
         HAPaO8W2ZNFVsTMlP7P9XSYMzUOVL2ptEHWQpus/usKgjKl7fNEG8cja3Tfn2gDvZ+iB
         mE2if7tsSpZhpR0K9pqmd+DStA4HSxCV2NFoSqgSu5uQy2P6kR3Q3LyHhEHpspUpJ/Gr
         DS9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778707251; x=1779312051;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c6CUfOFr6m5QaenhIZhXMv7jaj13ID72rQAvFIcjDlo=;
        b=AYGTXCowtovQQ84VZ/ruLAgVzoJX/o2yokoD/TOg/vOA+6g7iTCrukBduffGLZKhdG
         ALiYUdvblGrZB7G8hE3ROkxXgcw9xMeKeuT/t4by2pOb/XIhnTLr06ssAXRqo1WoC3G4
         9YNFaX2cEtNFA7ve4kFyT6spoZFU5dAKVx5gSocLvYlBF26apOSeLQGlEVhPC0UgIE7/
         yhtfUMYbsx4UkDsae1jD12RufKpcpOu2HSF5uJf5BraHS7Qlsyil4RjY8GBmuufmPemJ
         fP/n9wU2gIfNu8bKulCMqrApKzMbBW7vME8I05x49yHbwcpMAOPwiT+Bco0iPDXnnVuS
         htWA==
X-Gm-Message-State: AOJu0YyNni//x8GxzMDJQuvLiHhVyUjLhDoQs1z+05jN6vurxXuAIMWK
	TiblAR4UjF9TbThmsKiW1zvogB3ZapzYmdgP6ASkegs5NHfZu4uC89taLEhw2hTC
X-Gm-Gg: Acq92OEsXMRJtv9j9X4S0fuE8uqtROWGtCdmjouxHA6OhW1Ra0oVebEvIVGMFr+oPhj
	4pUbgNAzQ2UljPe4aWZLFk0gX0PItpPEzkDHAl9Q+7vNx0m890MpLVTcMBoVzY3+qm11MtfeLoA
	FAwPa3MpjgAK37PseZKftj+rp89LwMQBHNtfT5exfVi2ns5K/N2ZFtw+p1pyofwF1pj9ObU8kDQ
	3affHGFTXJPb9utnuv2AgAByXzJU2hcINYMCzo7Io4q/S27hfiqUFBSvtr11e89vwureoUJmRB8
	hGGX5/+DHT6xInf59uZQhp1ZOkuzAfzQHfuvhiw+XwxQ25N6E1xiEeyTaC8uyOR5rMJBZr3SmIM
	yMaZpzabznfmv9zovxrRyQvcd865Uvo4dUveLDS5scpBR9G1NbKKIjvrgCMKj+yWiSs8Ur0O5qn
	nlilOvJu1CQ4wwgkXLfslCTnddn1Lcaf0=
X-Received: by 2002:a05:6000:2681:b0:45a:e3dd:5869 with SMTP id ffacd0b85a97d-45c5a782769mr8034411f8f.30.1778707251033;
        Wed, 13 May 2026 14:20:51 -0700 (PDT)
Received: from strix.localnet ([197.250.51.99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e768acesm2043639f8f.7.2026.05.13.14.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 14:20:50 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: soc@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: dts: zte: Add ZTE zx297520v3 for 7.2
Date: Thu, 14 May 2026 00:20:47 +0300
Message-ID: <24423793.6Emhk5qWAg@strix>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2757041.Lt9SDvczpP";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart2757041.Lt9SDvczpP
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: soc@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: dts: zte: Add ZTE zx297520v3 for 7.2
Date: Thu, 14 May 2026 00:20:47 +0300
Message-ID: <24423793.6Emhk5qWAg@strix>
MIME-Version: 1.0

Dear SoC Maintainers,

This pull request adds a device tree board binding for zx297520v3 boards an=
d one initial board (D-Link DWR-932M) that is based on it.

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://gitlab.com/stefandoesinger/zx297520-kernel.git tags/zx29-dts-for-=
7.2

for you to fetch changes up to 7d1f68e87b7302d0bd22c001e6c0511d0e827875:

  ARM: dts: zte: Add D-Link DWR-932M support (2026-05-14 00:02:39 +0300)

=2D---------------------------------------------------------------
ARM: dts: zte: zx297520v3 device tree for 7.2

This pull request adds board bindings and DTS files for ZTE zx297520v3
boards as well as one initial device (D-Link DWR 932M) based on this
board.

=2D---------------------------------------------------------------
Stefan D=C3=B6singer (2):
      dt-bindings: arm: zte: Add D-Link DWR932M board based on zx297520v3 S=
oC
      ARM: dts: zte: Add D-Link DWR-932M support

 Documentation/devicetree/bindings/arm/zte.yaml     |  26 +++++++++++++++++=
+++++++++
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/zte/Makefile                     |   3 +++
 arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dts |  22 +++++++++++++++++=
+++++
 arch/arm/boot/dts/zte/zx297520v3.dtsi              | 103 +++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++
 5 files changed, 155 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/zte.yaml
 create mode 100644 arch/arm/boot/dts/zte/Makefile
 create mode 100644 arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dts
 create mode 100644 arch/arm/boot/dts/zte/zx297520v3.dtsi

--nextPart2757041.Lt9SDvczpP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmoE6y8bFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoi7Y8P/joGHGNInyk+RNFqvL/e
+IJF0lxox84rWCRSd1I/moOfx8Zf4RoKczJKezdkxcrsBVsSCFrsVnf7FK/7AyDD
xTiCwIWn5b9mio9O3ttZZuzoqCswkTQb3Y8GqGGBOlbxnUxXTZ02VTnVll2GsD6U
m5tVt04snVWqNgqbHUWijYqAWcOjb1u19EKQVkosZf4gUSkrTI0oUjspAlH/pX0w
/xeIFIm7s3iDZS3oc87Kn1l2Uv15rsxzu+3fXK3ryl04pAH4u0Y8GXvSyRzAcjpS
HoZLNVgCSLZQJ4/1JBeQutogy/QGW6iXIGIu6Mh3AOowLTsLz1/vgeiSnigb6sK6
IN1R3uWsUa7dZqx9Fyq1EU1s/VhIftR6scIBrFDhp/TeHybE4K/bYaPLU1tulXWx
cPcPxhBD8nDunSZt9kA88sNEmuLfrDrBmHsg7rgJo6QMpatbC+FkimUbJzov/Rkg
9lR7G3nMDCnTOl0UMIi7kIuFJou1Uz3jkBT+JgvUGF0wAwA3KLVgdKL3YikvxLS/
TnRMOiEcY+9TTJ38kgLvZ4DM63r1WLQvqkiVLOE1QrXVsEUdVWzIHnGe4bfeKAuy
Q8gDz7frqtuf9tsKdUFeL5hsEpUcwVqL+/C4JxHrO5nZb8ok/0UZnO+vAjjWuQ0/
L9op5zjIsWaMns8FchMCAwYL
=8csp
-----END PGP SIGNATURE-----

--nextPart2757041.Lt9SDvczpP--



