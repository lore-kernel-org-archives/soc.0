Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A231A371CEA
	for <soc@lists.linux.dev>; Wed, 13 May 2026 21:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778707202; cv=none; b=Z6SS31/Iczr+JcvMPoGnR5dp2gPsbI56ZtHszzs0NZyVg0azP2pirGVMsUvF/ocbAPpzOzt+8Th6GuYQqPYCYZkFTLJG4dClq206U/eYO04bsTQYuXtotAwN+o2xENcpTp1W/X2PrsZdrdOFrn+C79xXV/Oz3RzWGGq/YvHGtZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778707202; c=relaxed/simple;
	bh=r4w9zc09PQJBoygP+23zOkTwB/br6h9TrJNRApu0YdE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NFDJegXKDiWPV8bNLOUemySFyeLeRRyFml4BThPbsObPG0wIDRJyLZVmZgKVuAGUE1k1rbm3m3yOwPm1MOqphMTWggcCxhzwZ+RVqzdKzT+2rgtg9VX+CZZ0DeGuNOnJMdCxkr6/uXQVixra4LVxHnL8b4c5rSRXDl39FHLGbTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d+yhnXNC; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d+yhnXNC"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso49568995e9.0
        for <soc@lists.linux.dev>; Wed, 13 May 2026 14:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778707199; x=1779311999; darn=lists.linux.dev;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hKRfueAUrzjkM91UBXn5M20nwzcmhT+lP/g5iDeet9o=;
        b=d+yhnXNCCJUCx2CRvbuDqxCEZn3368swtQsHxsqbT6nXjrX2fqIqvl+fnBcx26k3bq
         sjQMFdQuyvz8h6WLnTA3hoIcvXiS6vLkc8hqKBNmb9Ws8vVrWffJuU/d6XNwtgqocA+m
         YcXsO1KVPkETfV3SXN/I6j2Qf4kyKKwuxT43wZj5S1sHp3UP5haW/rOVPgWv0lH35K/y
         kEBT7tZY/dcrFr+1LUWTqeo+oCa5bBYh64EhZfu7v3enWRy3kDOuchj8twde4vhJXrXb
         xnpr4+ZMpMiCJOiIp+9s/9/UbKDOmeAkPWnZFLiHV58UTCyRBUed3HSj5aaUZwb4pKHL
         +pgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778707199; x=1779311999;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hKRfueAUrzjkM91UBXn5M20nwzcmhT+lP/g5iDeet9o=;
        b=XjagfvqYQssJCow0hPSy+t303nXUnbR1SLIAAgizAMq2Bty5cn3knmXLFPxjQ3+f3T
         1mhVo2FcL0hmTPNuvJJZmLvBXYdn+o3CJ/uPce2cPot80TaDqzVOz/x3rgbit2nzOrvm
         iNzAdhd32WyhCiuuCY6RlTbQwp7VlvPIlXQ0z0TbBrPhaKlzGx87zqVdn9eQb4PzYONr
         GqMAXqh9AN7vEq/AAqbKS/TOzX6MigPA3IOikxhSgqCaHK6XEPps4DYNTJ4TUZ+5dQ2T
         XDa+FMULKkxzvUt98GY6BAVNszVQ4bL9YGKAGLOSiw+8PjYAAQKbBjz9BBkUseCNfl74
         /kQw==
X-Gm-Message-State: AOJu0YyVqoYeWgEJ0dx2MclWYAz9tTvOxw5rIO1o+JiTLWV4hEf3rTsw
	zupB+LkFnBR1tYYQEb5JUz/reYXWXu5tU02DPLNlkwY4PSW08We9q6zs2SNgv8W/
X-Gm-Gg: Acq92OH8ZP6YXGgnSPsFGyuwtAd/jpNe410cb1gZWliSev098EveRykzO6WCjUz5kWE
	rnrNw+Yil9GvpobPBa7IbgYkMz1FXbt0CNblkWN8H7Z7EWIYmLvlKtejDPsljY2WqZe9wvtVPc+
	lU86Ovzm8kdz7q1rt7bjjatf4kvceLZeaBUfilpNSMbIcLcRUhNlrryA+CKoVQzlsbyBaO35iXG
	X5PZH2PKJy1Mddb4fsEkiqBZwb1aDLxeThhXcPV3utM1vH8uBoZoFa7PLAxGXQlrJ8CTWdZ6M9w
	dmxo4L7CzwzDoiVZlHfAZyJmX2QSG5b/UEpzlkyVBtdIAcsK8L6YL6iJwH9esxYll6CnWCLb6Hd
	64jZr2HZtQ/TCILeNEnfpvxz3GD+wkU53ICq3vyrE6AzG0Mik3MHDrl9hnC68c6YOcDe9hvirIC
	9600Uy76Sm4ynuEJwBCWOLxRaUQmgGffk=
X-Received: by 2002:a05:600c:c4ac:b0:488:936a:6220 with SMTP id 5b1f17b1804b1-48fc9a3a9c1mr75541035e9.21.1778707198978;
        Wed, 13 May 2026 14:19:58 -0700 (PDT)
Received: from strix.localnet ([197.250.51.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fdb27173bsm880045e9.6.2026.05.13.14.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 14:19:58 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: soc@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: zte: Add zx297520v3 platform support
Date: Thu, 14 May 2026 00:19:49 +0300
Message-ID: <2114249.usQuhbGJ8B@strix>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3665866.QJadu78ljV";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart3665866.QJadu78ljV
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: soc@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: zte: Add zx297520v3 platform support
Date: Thu, 14 May 2026 00:19:49 +0300
Message-ID: <2114249.usQuhbGJ8B@strix>
MIME-Version: 1.0

Dear SoC maintainers,

Here is my pull request for adding initial support for ZTE's zx297520v3 SoC=
=2E=20
The code has been reviewed on the linux-arm-kernel mailing list. My ultimat=
e=20
goal is to run OpenWRT on these devices.

This SoC is used in low end LTE-to-WiFi routers, for example some D-Link
DWR 932 revisions, ZTE K10, ZLT S10 4G, but also models that are branded
and sold by ISPs themselves. They are widespread in Africa, China,
Russia and Eastern Europe.

This SoC is a relative of the zx296702 and zx296718 that had some
upstream support until commit 89d4f98ae90d ("ARM: remove zte zx
platform").

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://gitlab.com/stefandoesinger/zx297520-kernel.git tags/zx29-plat-for=
=2D7.2

for you to fetch changes up to 220ae5d36dba278003d265aabd080ffa78553f5a:

  ARM: zte: Add zx297520v3 platform support (2026-05-13 23:59:56 +0300)

=2D---------------------------------------------------------------
ARM: zte: Add zx297520v3 platform support

This SoC is used in low end LTE-to-WiFi routers, for example some D-Link
DWR 932 revisions, ZTE K10, ZLT S10 4G, but also models that are branded
and sold by ISPs themselves. They are widespread in Africa, China,
Russia and Eastern Europe.

This SoC is a relative of the zx296702 and zx296718 that had some
upstream support until commit 89d4f98ae90d ("ARM: remove zte zx
platform").

=2D---------------------------------------------------------------
Stefan D=C3=B6singer (1):
      ARM: zte: Add zx297520v3 platform support

 Documentation/arch/arm/index.rst          |   2 ++
 Documentation/arch/arm/zte/index.rst      |  10 ++++++++++
 Documentation/arch/arm/zte/zx297520v3.rst | 167 ++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS                               |   9 +++++++++
 arch/arm/Kconfig                          |   2 ++
 arch/arm/Makefile                         |   1 +
 arch/arm/mach-zte/Kconfig                 |  29 ++++++++++++++++++++++++++=
+++
 arch/arm/mach-zte/Makefile                |   2 ++
 arch/arm/mach-zte/zx297520v3.c            |  16 ++++++++++++++++
 9 files changed, 238 insertions(+)
 create mode 100644 Documentation/arch/arm/zte/index.rst
 create mode 100644 Documentation/arch/arm/zte/zx297520v3.rst
 create mode 100644 arch/arm/mach-zte/Kconfig
 create mode 100644 arch/arm/mach-zte/Makefile
 create mode 100644 arch/arm/mach-zte/zx297520v3.c

--nextPart3665866.QJadu78ljV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmoE6vYbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoim08P/ApwP43M9rvjPpQtOX3y
hEdyhSxQh9uD+ufuHlnRAJFqDfbbWyLhpUTrcM4f0rAqG58Y9kX33rI/7RjtGdCV
6aSKGkSSVoBqzcKiaw0sSXBCM5QsI2eol594JZg3RT16Ya2JqMk+2HvZRfHlBCB4
sjEHBxgRePcE8x+qiU3fUb2RnaXvSadYgeEGkNR+sMupssDpeJg5/lBfRxC1E4dS
ya9b+rR7T9CIWyszDfdWEN2RL6bkOvp2KDeAuxGl4q590KqFDdFSo27JYFWX1rsK
WTySaMzEVKHjkfi44KJkWYde0xZ3CegrBOPiCCXhaEwtihr0JuNihDb+KJmP6dzf
NBmAjWSAqs9Dwk/5StZL+se5DWavSxeooqT4SckJEVfCCuo2D8/hYuYapXwgkg9N
NCZFUM6ax6ETX1FaFX4UsY3KeQIKQuZIo29+q9NAuV9uXJO1RkMOQRJGD18hnaPW
mrHwSkKGXTRbMiVsgRae+OeFcfosMo8xvgZNfhtZNlR1G+ReOtKV/ScihoiyD5Qq
f6AN3YZOsXFw5nqg72CRlopxCvy17zI+cCu8sDLzmgSIRNeGrKPGqRnJz7lkxjI6
s2l1kqDIoa7GxiaF9/XLWMgnuHorll288PfR3kF/n3qX+8kDrQNrwoESwCserg6Z
BWwBBeprQ9CREOxSmbKKZg8f
=lAHd
-----END PGP SIGNATURE-----

--nextPart3665866.QJadu78ljV--



