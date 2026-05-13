Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468E839DBFA
	for <soc@lists.linux.dev>; Wed, 13 May 2026 21:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778707304; cv=none; b=Lj/LbK2Zmg1T/LDBAKwsX6thC+L9tJ6cpjI24GOSVcHX59F3piDa0WyKyqgPSQYjR6YhpoaSBKKnqFygwGi08R0pcfqrl9biSK9KN6CiCxyQA0vg7IlCbXdSwgIHsnIgyi+Wgr8puCJ6xSx4fo/L/I6CIs0SNghH2jQpfsQAewg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778707304; c=relaxed/simple;
	bh=stkleaRX0wmq9j/Ur9c9IcpaImjjRCnccmBs5dokhMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VjSgD9gmb9/7YLOR0rqiizZS1QCtMJ+WnU8TZd0+kA3isnchRejyd9SsQk8rVGDHZvAxr/aneFKNB+aMeZhu4yBsCmoQtzirBU+cMqArWmgJiFs1/u/Jh13VOdcgMjA9hOPzbOk8YprwAGYobaLKXxItTBKbrpN12BHM4TYzHT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y5IjyiMO; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y5IjyiMO"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so49282245e9.1
        for <soc@lists.linux.dev>; Wed, 13 May 2026 14:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778707302; x=1779312102; darn=lists.linux.dev;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oY/vS2daxSQ4cPcucEnR8WY5HPYVG/uWJIbqHtbQwE0=;
        b=Y5IjyiMOOfXX21oa6g38Z5luA3aJ0NIt2djUyVO0WHByZWmDjMAqDjycyh3DGfJn97
         jprxKq4Vf4fg5ATrKp/JkESk0R4ollcFAzs0wxPbSwnrbtAb1JCoIectDZwVFdRAG94y
         ByRx+61v2mZJfYQHZOr1UeL03wxP3xLWuZbzZZP1Dptuk8Y9DQvU/hTUq122vhGQZikb
         qQ9RMA8BO6PwBl4kb8gU3MS4rKToPvegljEkraXbNgi5kWhjWVPEDlpjSAamr48j4kfP
         kLhGm/UloUbx5RQ4aqBIGJc0dePorxXwfxBL0cHzeNOKvPoo9v3fBgvhfYZ2wdmQgDnB
         wNlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778707302; x=1779312102;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oY/vS2daxSQ4cPcucEnR8WY5HPYVG/uWJIbqHtbQwE0=;
        b=ete8QsKszRs+l7nu9Aeqv0UimeCIWaDhJ3dmUkdpf9t5uu0u8ECnD0qr0aexoFduq8
         UIylgzKh6iNaFEyG2D7+x13MQLWTP4Qdwzq3+dU2MPLPwA2HsPnVjAeqrAP5qoEajnbU
         j/MPLNTmtML9fBuECtTjy4QFNaRmOpiddL1gLcr7WnUZAhcx8vXfzjnwvzSO0TDFFTGZ
         6OHPp0PB9s8StdHjaMaLQS3BaSJNS88F4/Qkc1ha2AwKpHObN+UuX2lGwxa4kc6vrl1H
         NqdkbP0r8HhzUjT2pF9AMtMC31V9DhIjHP6qNPGRX5d464ivpx+ogMIgn0ye58njWaCu
         AWcQ==
X-Gm-Message-State: AOJu0Yxq6D2ObOnYERERegIkHqNCQFICwkm+rBAZNnqNWz1Du6IdY+oS
	zuztwAJtMBGpfwZcbnCP3Nb8AHRxRI+WGFFtm0BNCpeKwYsfsGOCEXIPYpT6uNY2
X-Gm-Gg: Acq92OHwrrt7/oN77sJRUiqNytuM9T012FwYtNmtsU8BXD0F2+kDn3Jc3tPQFnB0xVP
	688s/ksa3aQ7AMzG2Ry5G9j7hUvPn6OX6SdqJzk1UJfPvI4BKBl3qiZlS+jmxNwEqEJj4fjs3sv
	umRuh/E5Lg5A49FvzxA//aXXTjRE3VXcJAoSamR/ZLykDeQXpRD6jq+/zBDAZT+SgvH+3KvR9dC
	jAmazdf5+iKm6XCBgRZdVVqEfDOoApbrnSXSZKD0y+5rNWZF6jQBKqzutxsnc0QxnQtppOPwzLv
	VPYS65q3SrFqkEtbvGN17b7/vYTpDxJtXEKe/sC3ayCOQ0GyZBpW9kGQBGx2ZuU6HmZ30a1g02s
	JbDxbe4mznlW7zI5eGgEPX/U05p1+6vy0FtJNmrGcShnaAkApA7kxUaoCoLU26yXYSlkI8LFA4R
	YWog5g7L7TnCBxtbJUyGkUeTMunMvRr+4RLw==
X-Received: by 2002:a05:600c:674a:b0:48f:d620:c27f with SMTP id 5b1f17b1804b1-48fd63382e6mr14712735e9.4.1778707301674;
        Wed, 13 May 2026 14:21:41 -0700 (PDT)
Received: from strix.localnet ([197.250.51.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fdb2c7f93sm397205e9.10.2026.05.13.14.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 14:21:40 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: soc@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] arm: zte: defconfig: zx297520v3 defconfig for 7.2
Date: Thu, 14 May 2026 00:21:38 +0300
Message-ID: <4560997.ejJDZkT8p0@strix>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2326700.Mh6RI2rZIc";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart2326700.Mh6RI2rZIc
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: soc@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] arm: zte: defconfig: zx297520v3 defconfig for 7.2
Date: Thu, 14 May 2026 00:21:38 +0300
Message-ID: <4560997.ejJDZkT8p0@strix>
MIME-Version: 1.0

Hi,

This final pull request adds a defconfig file for zx297520v3 boards. The ra=
tionale behind the defconfig is that this board is too underpowered for mul=
ti_v7_defconfig and quite odd - it is a Cortex A53 without an FPU running i=
n 32 bit mode.

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://gitlab.com/stefandoesinger/zx297520-kernel.git tags/zx29-defconfi=
g-for-7.2

for you to fetch changes up to 9afbe04564c59a217c7d1142ce685c4bd951a8d9:

  ARM: zte: defconfig: Add a zx29 defconfig file (2026-05-14 00:04:05 +0300)

=2D---------------------------------------------------------------
ARM: zte: defconfig: zx29 defconfig file for 7.2

The rationale behind the defconfig is that this board is too
underpowered for multi_v7_defconfig and quite odd - it is a Cortex A53
without an FPU running in 32 bit mode.

=2D---------------------------------------------------------------
Stefan D=C3=B6singer (1):
      ARM: zte: defconfig: Add a zx29 defconfig file

 arch/arm/configs/zx29_defconfig | 53 +++++++++++++++++++++++++++++++++++++=
++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 arch/arm/configs/zx29_defconfig

--nextPart2326700.Mh6RI2rZIc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmoE62IbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoiUZYP/RKXKXjbgpwOWDArhVWi
//t4GeM8XeJHbToNdPs0zddnNDKrUc9m6qRUXS9YrfGKjfEg7w+vUDI96b3rTO9J
T7vCqFgicHppfdwwLZKaL9E8tSh4U0Vna5CJV77+dgo2+Ai2X1+wxuN/TNLvciqQ
ZCQo839bDPf86DzbwZlHQwZgmjdLHQYr6VgBhX5tDRh2CJcF8Qd8CNKY//bWLwbl
brw6G5cd+EThYutYI5qhWY+18I8wEjuZ9kASBL4u2BKSGVbws4kHfF742GnVo7q4
4BM45A3vGKiHXaf8rTjUoOCZkTiHgCdTx6wxBDBjDWPuk08B6E0T0aDIrzxU72JS
vvgI7lV/Co2tghBDehKTTQh+2zOd2pm//F99FPtr6uLXQUPqncssVXYWeFc6gmiY
6X8G3RkqIuzKbSTsOaGpQjQ1dvCj83x/OhOdwfv9dKNxqS192PsCNZLw/0XSENMb
vk0LMmB4g/ZbetafsQi0nOG45snB5OQVhgWlHC7SQACrVT2LsySgKykis2S9o8n2
SSyjmX+poC6edxjzo1mLQYIlE3nj/5vN+xc4qCaJX0pwkCeOZClaSFUTLdqIzn5e
g5lb2PXHa1rY5A4NcEeS2JCXQgEdVflMeJunuDZkCiQJUijqzUlZ92PycU/tWgIe
QQaezFYYHW6sWXf72RUdaXwO
=l8wl
-----END PGP SIGNATURE-----

--nextPart2326700.Mh6RI2rZIc--



